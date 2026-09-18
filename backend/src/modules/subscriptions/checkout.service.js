import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import environment from "../../config/environment.js";
import stripe from "../../config/stripe.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import checkoutOrderRepository from "./checkout-order.repository.js";
import couponRepository from "./coupon.repository.js";
import couponReservationRepository from "./coupon-reservation.repository.js";
import couponService from "./coupon.service.js";
import planRepository from "./plan.repository.js";
import subscriptionRepository from "./subscription.repository.js";

// Stripe Checkout sessions accept expires_at between 30 minutes and 24 hours.
const CHECKOUT_ORDER_TTL_MS = 30 * 60 * 1000;
const INVALID_COUPON_MESSAGE = "Coupon code is invalid or expired.";

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class CheckoutService {
  constructor({
    checkoutOrderRepository,
    couponReservationRepository,
    couponRepository,
    couponService,
    planRepository,
    subscriptionRepository,
    userRepository,
  }) {
    this.checkoutOrderRepository = checkoutOrderRepository;
    this.couponReservationRepository = couponReservationRepository;
    this.couponRepository = couponRepository;
    this.couponService = couponService;
    this.planRepository = planRepository;
    this.subscriptionRepository = subscriptionRepository;
    this.userRepository = userRepository;
  }

  async createCheckoutSession({ planId, userId, couponCode }) {
    const plan = await this.planRepository.findById(planId);
    if (!plan) {
      throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");
    }
    if (!plan.is_active) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Plan is not available");
    }

    const normalizedCode = couponCode
      ? this.couponService.normalizeCode(couponCode)
      : null;
    const coupon = normalizedCode
      ? await this.couponRepository.findByCode(normalizedCode)
      : null;

    // Lazy expiration keeps the unique active-subscription index clear and
    // releases any coupon capacity held by stale orders.
    await this.subscriptionRepository.expireOverdueSubscriptions({ userId });
    await withTransaction((client) => this.#expireOverdueOrders(userId, client));

    const activeSubscription =
      await this.subscriptionRepository.getActivePaidSubscription(userId);
    if (activeSubscription) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You already have an active subscription",
      );
    }

    // Reuse only when the purchase context matches. An unknown coupon code is
    // left for validation to reject rather than reusing a no-coupon order.
    if (!normalizedCode || coupon) {
      const reused = await this.#reuseOpenOrder({
        userId,
        planId,
        couponId: coupon?.id ?? null,
      });
      if (reused) return reused;
    }

    let subtotal = roundMoney(plan.price);
    let discount = 0;
    let currency = plan.currency || "usd";
    let couponRecord = null;

    if (normalizedCode) {
      const result = await this.couponService.validate({
        code: normalizedCode,
        plan,
        userId,
      });
      couponRecord = result.coupon;
      subtotal = result.subtotal;
      discount = result.discount;
      currency = result.currency;
    }

    const total = roundMoney(subtotal - discount);
    const expiresAt = new Date(Date.now() + CHECKOUT_ORDER_TTL_MS);

    let order;
    try {
      order = await this.#createOrderWithReservation({
        userId,
        plan,
        coupon: couponRecord,
        subtotal,
        discount,
        total,
        currency,
        expiresAt,
      });
    } catch (error) {
      // A concurrent duplicate request won the race (open-order context or
      // coupon reservation unique). Reuse its order when possible.
      if (error.code === "23505") {
        const existing = await this.#reuseOpenOrder({
          userId,
          planId,
          couponId: couponRecord?.id ?? null,
        });
        if (existing) return existing;
        throw new ApiError(
          StatusCode.CONFLICT,
          "A checkout for this plan is already in progress",
        );
      }
      throw error;
    }

    const session = await this.#createStripeSession({
      order,
      plan,
      coupon: couponRecord,
      userId,
      expiresAt,
    });

    await this.checkoutOrderRepository.attachCheckoutSession(order.id, session.id);

    return { order_id: order.id, session_url: session.url };
  }

  // Returns an existing open order's session when still valid. Expired or
  // unusable orders are cancelled and their reservations released.
  async #reuseOpenOrder({ userId, planId, couponId }) {
    const openOrder = await this.checkoutOrderRepository.findOpenForUser({
      userId,
      planId,
      couponId,
    });
    if (!openOrder) return null;

    if (openOrder.stripe_checkout_session_id) {
      try {
        const session = await stripe.checkout.sessions.retrieve(
          openOrder.stripe_checkout_session_id,
        );
        if (session && session.status === "open" && session.url) {
          return { order_id: openOrder.id, session_url: session.url };
        }
      } catch (error) {
        logger.warn("Could not retrieve existing checkout session", {
          orderId: openOrder.id,
          message: error.message,
        });
      }
    }

    await withTransaction(async (client) => {
      await this.checkoutOrderRepository.markStatus(
        openOrder.id,
        "CANCELLED",
        client,
      );
      await this.couponReservationRepository.releaseByOrderId(
        openOrder.id,
        client,
      );
    });
    return null;
  }

  async #createOrderWithReservation({
    userId,
    plan,
    coupon,
    subtotal,
    discount,
    total,
    currency,
    expiresAt,
  }) {
    return withTransaction(async (client) => {
      const order = await this.checkoutOrderRepository.createOrder(
        {
          userId,
          planId: plan.id,
          couponId: coupon?.id ?? null,
          planName: plan.name,
          durationDays: plan.duration_days,
          subtotal,
          discountAmount: discount,
          totalAmount: total,
          currency,
          expiresAt,
          status: "CREATED",
        },
        client,
      );

      if (coupon) {
        const reservation = await this.couponReservationRepository.reserve(
          {
            couponId: coupon.id,
            userId,
            checkoutOrderId: order.id,
            expiresAt,
          },
          client,
        );
        if (!reservation) {
          throw new ApiError(StatusCode.BAD_REQUEST, INVALID_COUPON_MESSAGE);
        }
      }

      return order;
    });
  }

  async #createStripeSession({ order, plan, coupon, userId, expiresAt }) {
    const user = await this.userRepository.findById(userId);

    try {
      return await stripe.checkout.sessions.create(
        {
          payment_method_types: ["card"],
          mode: "payment",
          customer_email: user?.email || undefined,
          expires_at: Math.floor(expiresAt.getTime() / 1000),
          line_items: [
            {
              price_data: {
                currency: order.currency,
                product_data: {
                  name: plan.name,
                  description: plan.description || undefined,
                },
                unit_amount: Math.round(Number(order.total_amount) * 100),
              },
              quantity: 1,
            },
          ],
          success_url: `${environment.CLIENT_URL_1}/payment-success?session_id={CHECKOUT_SESSION_ID}&planId=${plan.id}`,
          cancel_url: `${environment.CLIENT_URL_1}/payment-cancel?planId=${plan.id}`,
          metadata: {
            orderId: order.id,
            userId,
            planId: plan.id,
            couponCode: coupon?.code || "",
          },
        },
        { idempotencyKey: `checkout_order_${order.id}` },
      );
    } catch (error) {
      logger.error("Stripe checkout session failed", {
        orderId: order.id,
        message: error.message,
      });
      await withTransaction(async (client) => {
        await this.checkoutOrderRepository.markStatus(
          order.id,
          "FAILED",
          client,
        );
        await this.couponReservationRepository.releaseByOrderId(
          order.id,
          client,
        );
      });
      throw new ApiError(
        StatusCode.BAD_GATEWAY,
        "Could not start checkout. Please try again.",
      );
    }
  }

  async #expireOverdueOrders(userId, client) {
    const expired = await this.checkoutOrderRepository.expireOverdue({
      userId,
      client,
    });
    if (expired.length > 0) {
      await this.couponReservationRepository.releaseByOrderIds(
        expired.map((order) => order.id),
        client,
      );
    }
  }
}

export { CheckoutService };
export default new CheckoutService({
  checkoutOrderRepository,
  couponReservationRepository,
  couponRepository,
  couponService,
  planRepository,
  subscriptionRepository,
  userRepository,
});
