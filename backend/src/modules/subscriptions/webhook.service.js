import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import { withTransaction } from "../../config/database.js";
import stripe from "../../config/stripe.js";
import userRepository from "../users/repository.js";
import checkoutOrderRepository from "./checkout-order.repository.js";
import couponRepository from "./coupon.repository.js";
import couponReservationRepository from "./coupon-reservation.repository.js";
import paymentRepository from "./payment.repository.js";
import planRepository from "./plan.repository.js";
import refundRepository from "./refund.repository.js";
import subscriptionRepository from "./subscription.repository.js";
import webhookEventRepository from "./webhook-event.repository.js";
import {
  mapRefundStatus,
  syncPaymentRefundStatus,
} from "./refund-status.js";

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

class StripeWebhookService {
  constructor({
    checkoutOrderRepository,
    couponReservationRepository,
    subscriptionRepository,
    paymentRepository,
    planRepository,
    couponRepository,
    refundRepository,
    webhookEventRepository,
    userRepository,
    emailService,
  }) {
    this.checkoutOrderRepository = checkoutOrderRepository;
    this.couponReservationRepository = couponReservationRepository;
    this.subscriptionRepository = subscriptionRepository;
    this.paymentRepository = paymentRepository;
    this.planRepository = planRepository;
    this.couponRepository = couponRepository;
    this.refundRepository = refundRepository;
    this.webhookEventRepository = webhookEventRepository;
    this.userRepository = userRepository;
    this.emailService = emailService;
  }

  // Idempotent entry point. Returns { duplicate } and never processes the same
  // Stripe event twice.
  async handleEvent(event) {
    return withTransaction(async (client) => {
      const record = await this.webhookEventRepository.tryInsert(
        { stripeEventId: event.id, eventType: event.type },
        client,
      );

      if (!record) {
        logger.info("Stripe webhook duplicate ignored", { eventId: event.id });
        return { duplicate: true };
      }

      await this.dispatch(event, client);
      await this.webhookEventRepository.markProcessed(record.id, client);

      return { duplicate: false };
    });
  }

  async dispatch(event, client) {
    switch (event.type) {
      case "checkout.session.completed":
        return this.handleCheckoutCompleted(event.data.object, client);
      case "charge.refunded":
        return this.handleChargeRefunded(event.data.object, client);
      case "refund.created":
      case "refund.updated":
        return this.handleRefundUpsert(event.data.object, client);
      case "payment_intent.payment_failed":
        logger.warn("Stripe payment failed", {
          paymentIntentId: event.data.object?.id,
          reason: event.data.object?.last_payment_error?.message,
        });
        return null;
      default:
        return null;
    }
  }

  async handleCheckoutCompleted(session, client) {
    const metadata = session.metadata || {};
    const paymentIntentId = session.payment_intent;

    // Only provision on a paid checkout.
    if (session.payment_status && session.payment_status !== "paid") {
      return null;
    }

    const order = session.id
      ? await this.checkoutOrderRepository.findBySessionId(session.id, client)
      : null;

    if (order) {
      return this.#provisionFromOrder({
        order,
        paymentIntentId,
        client,
      });
    }

    // Fallback for Stripe sessions created before checkout_orders existed.
    return this.#provisionFromMetadata({ metadata, paymentIntentId, client });
  }

  // Recovers a paid checkout whose webhook was missed. Stripe remains the
  // source of truth: the session is fetched server-side and provisioned only
  // when Stripe reports it paid.
  async reconcileOrder(orderId) {
    const order = await this.checkoutOrderRepository.findById(orderId);
    if (!order) return { orderId, status: "NOT_FOUND" };
    if (order.status === "PAID") return { orderId, status: "ALREADY_PAID" };
    if (!order.stripe_checkout_session_id) {
      return { orderId, status: "NO_SESSION" };
    }

    const session = await stripe.checkout.sessions.retrieve(
      order.stripe_checkout_session_id,
    );
    if (session.payment_status !== "paid") {
      return { orderId, status: "UNPAID", stripeStatus: session.status };
    }

    await withTransaction(async (client) => {
      await this.#provisionFromOrder({
        order,
        paymentIntentId: session.payment_intent,
        client,
      });
    });

    return { orderId, status: "RECONCILED" };
  }

  async reconcileAll() {
    const orders = await this.checkoutOrderRepository.findReconcilable();
    const results = [];

    for (const order of orders) {
      try {
        results.push(await this.reconcileOrder(order.id));
      } catch (error) {
        logger.error("Checkout reconciliation failed", {
          orderId: order.id,
          message: error.message,
        });
        results.push({
          orderId: order.id,
          status: "FAILED",
          message: error.message,
        });
      }
    }

    return results;
  }

  // Order-snapshot provisioning. Delayed webhooks are handled: an EXPIRED or
  // CANCELLED order is still provisioned because Stripe confirmed payment.
  async #provisionFromOrder({ order, paymentIntentId, client }) {
    if (order.status === "PAID") return null;

    // Prevent duplicate PaymentIntent (e.g. an order replayed by Stripe).
    if (paymentIntentId) {
      const existingPayment = await this.paymentRepository.findPaymentByIntentId(
        paymentIntentId,
        client,
      );
      if (existingPayment) {
        await this.checkoutOrderRepository.attachPaymentIntent(
          order.id,
          paymentIntentId,
          client,
        );
        await this.checkoutOrderRepository.markPaid(order.id, client);
        return null;
      }
    }

    const userId = order.user_id;
    const startDate = new Date();
    const endDate = new Date(
      startDate.getTime() + Number(order.duration_days) * 24 * 60 * 60 * 1000,
    );

    // Expire any overdue ACTIVE rows so the unique active-subscription index
    // does not block provisioning a repurchase.
    await this.subscriptionRepository.expireOverdueSubscriptions({
      userId,
      client,
    });

    // One ACTIVE subscription per user. A second paid order (retried/duplicate
    // checkout) is recorded against the existing subscription for audit and
    // admin refund instead of creating another subscription.
    const existingActive =
      await this.subscriptionRepository.getActivePaidSubscription(userId, client);

    let userSubscription;
    if (existingActive) {
      userSubscription = { id: existingActive.subscription_id };
      logger.warn("Duplicate paid checkout for user with active subscription", {
        userId,
        orderId: order.id,
        subscriptionId: userSubscription.id,
      });
    } else {
      userSubscription =
        await this.subscriptionRepository.createUserSubscription(
          { userId, subscriptionPlanId: order.plan_id, endDate },
          client,
        );
      if (!userSubscription) {
        throw new Error("Failed to create user subscription");
      }
    }

    const payment = await this.paymentRepository.createPayment(
      {
        userSubscriptionId: userSubscription.id,
        subtotal: order.subtotal,
        discountAmount: order.discount_amount,
        amount: order.total_amount,
        currency: order.currency,
        couponId: order.coupon_id,
        paymentStatus: "COMPLETED",
        provider: "STRIPE",
        paymentMethod: "card",
        checkoutOrderId: order.id,
        stripePaymentIntentId: paymentIntentId,
        paidAt: new Date(),
      },
      client,
    );

    if (order.coupon_id) {
      if (existingActive) {
        // The coupon was already consumed by the first paid order; free the
        // duplicate order's reservation without recording a second redemption.
        await this.couponReservationRepository.releaseByOrderId(
          order.id,
          client,
        );
      } else {
        await this.#finalizeCoupon({ order, userId, payment, client });
      }
    }

    await this.checkoutOrderRepository.attachPaymentIntent(
      order.id,
      paymentIntentId,
      client,
    );
    await this.checkoutOrderRepository.markPaid(order.id, client);

    logger.audit("payment.completed", {
      userId,
      planId: order.plan_id,
      amount: order.total_amount,
      discount: order.discount_amount,
      couponId: order.coupon_id,
      orderId: order.id,
      duplicate: Boolean(existingActive),
    });

    await this.#sendConfirmationEmail({
      userId,
      planName: order.plan_name,
      amount: order.total_amount,
      startDate,
      endDate,
    });

    return userSubscription;
  }

  // Converts the reservation into a redemption. When the reservation was
  // already released (late webhook), redeems only if the coupon is still valid
  // and capacity remains; otherwise the already-charged snapshot is honored.
  async #finalizeCoupon({ order, userId, payment, client }) {
    const reservedCoupon =
      await this.couponReservationRepository.finalizeByOrderId(
        order.id,
        client,
      );

    if (reservedCoupon) {
      await this.couponRepository.createRedemption(
        {
          couponId: reservedCoupon.id,
          userId,
          paymentId: payment.id,
          discountAmount: order.discount_amount,
        },
        client,
      );
      return;
    }

    const redeemed = await this.couponRepository.tryIncrementRedemptionCount(
      order.coupon_id,
      client,
    );
    if (!redeemed) {
      logger.warn("Coupon could not be finalized for paid order", {
        orderId: order.id,
        couponId: order.coupon_id,
        paymentId: payment.id,
      });
      return;
    }

    await this.couponRepository.createRedemption(
      {
        couponId: order.coupon_id,
        userId,
        paymentId: payment.id,
        discountAmount: order.discount_amount,
      },
      client,
    );
  }

  // Legacy path for Stripe sessions created before checkout_orders existed.
  async #provisionFromMetadata({ metadata, paymentIntentId, client }) {
    const userId = metadata.userId;
    const planId = metadata.planId;

    if (paymentIntentId) {
      const existingPayment =
        await this.paymentRepository.findPaymentByIntentId(
          paymentIntentId,
          client,
        );
      if (existingPayment) return null;
    }

    const plan = await this.planRepository.findById(planId);
    if (!plan) throw new Error("Plan not found");

    const startDate = new Date();
    const endDate = new Date(startDate);
    endDate.setDate(endDate.getDate() + Number(plan.duration_days));

    const subtotal =
      metadata.subtotal != null ? Number(metadata.subtotal) : Number(plan.price);
    const discount = metadata.discount != null ? Number(metadata.discount) : 0;
    const amount =
      metadata.amount != null
        ? Number(metadata.amount)
        : roundMoney(subtotal - discount);
    const currency = plan.currency || "usd";

    await this.subscriptionRepository.expireOverdueSubscriptions({
      userId,
      client,
    });

    const userSubscription =
      await this.subscriptionRepository.createUserSubscription(
        { userId, subscriptionPlanId: planId, endDate },
        client,
      );
    if (!userSubscription) {
      throw new Error("Failed to create user subscription");
    }

    let couponId = null;
    if (metadata.couponCode) {
      const coupon = await this.couponRepository.findByCode(
        metadata.couponCode,
      );
      if (coupon) couponId = coupon.id;
    }

    const payment = await this.paymentRepository.createPayment(
      {
        userSubscriptionId: userSubscription.id,
        subtotal,
        discountAmount: discount,
        amount,
        currency,
        couponId,
        paymentStatus: "COMPLETED",
        provider: "STRIPE",
        paymentMethod: "card",
        stripePaymentIntentId: paymentIntentId,
        paidAt: new Date(),
      },
      client,
    );

    if (couponId && discount > 0) {
      await this.couponRepository.createRedemption(
        {
          couponId,
          userId,
          paymentId: payment.id,
          discountAmount: discount,
        },
        client,
      );
      await this.couponRepository.incrementRedemptionCount(couponId, client);
    }

    logger.audit("payment.completed", {
      userId,
      planId,
      amount,
      discount,
      couponId,
    });

    await this.#sendConfirmationEmail({
      userId,
      planName: plan.name,
      amount,
      startDate,
      endDate,
    });

    return userSubscription;
  }

  async #sendConfirmationEmail({ userId, planName, amount, startDate, endDate }) {
    const user = await this.userRepository.findById(userId);
    if (!user?.email) return;

    this.emailService
      .sendPaymentConfirmation(user.email, {
        planName,
        amount,
        startDate,
        endDate,
      })
      .catch((error) =>
        logger.error("Failed to send payment email", {
          message: error.message,
        }),
      );
  }

  async handleChargeRefunded(charge, client) {
    const payment = await this.paymentRepository.findPaymentByIntentId(
      charge.payment_intent,
      client,
    );
    if (!payment) {
      logger.error("Refund for unknown payment", {
        paymentIntentId: charge.payment_intent,
      });
      return null;
    }

    const refunds = Array.isArray(charge.refunds?.data)
      ? charge.refunds.data
      : [];

    for (const refund of refunds) {
      const status = mapRefundStatus(refund.status);
      await this.refundRepository.upsertByStripeRefundId(
        {
          paymentId: payment.id,
          amount: Number(refund.amount || 0) / 100,
          currency: refund.currency || payment.currency || "usd",
          status,
          stripeRefundId: refund.id,
          reason: refund.reason || null,
          refundedAt:
            status === "SUCCEEDED" && refund.created
              ? new Date(refund.created * 1000)
              : null,
        },
        client,
      );
    }

    return this.#syncRefundStatus(payment, client);
  }

  async handleRefundUpsert(refund, client) {
    const payment = await this.paymentRepository.findPaymentByIntentId(
      refund.payment_intent,
      client,
    );
    if (!payment) {
      logger.error("Refund for unknown payment", {
        paymentIntentId: refund.payment_intent,
      });
      return null;
    }

    const status = mapRefundStatus(refund.status);
    const refundedAt =
      status === "SUCCEEDED" && refund.created
        ? new Date(refund.created * 1000)
        : null;

    await this.refundRepository.upsertByStripeRefundId(
      {
        paymentId: payment.id,
        amount: Number(refund.amount || 0) / 100,
        currency: refund.currency || payment.currency || "usd",
        status,
        stripeRefundId: refund.id,
        reason: refund.reason || null,
        refundedAt,
      },
      client,
    );

    return this.#syncRefundStatus(payment, client);
  }

  #syncRefundStatus(payment, client) {
    return syncPaymentRefundStatus({
      paymentRepository: this.paymentRepository,
      refundRepository: this.refundRepository,
      payment,
      client,
    });
  }
}

export { StripeWebhookService };
export default new StripeWebhookService({
  checkoutOrderRepository,
  couponReservationRepository,
  subscriptionRepository,
  paymentRepository,
  planRepository,
  couponRepository,
  refundRepository,
  webhookEventRepository,
  userRepository,
  emailService,
});
