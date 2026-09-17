import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import environment from "../../config/environment.js";
import stripe from "../../config/stripe.js";
import userRepository from "../users/repository.js";
import couponService from "./coupon.service.js";
import planRepository from "./plan.repository.js";
import subscriptionRepository from "./subscription.repository.js";

function roundMoney(value) {
  return Math.round(Number(value) * 100) / 100;
}

function daysRemaining(endDate) {
  if (!endDate) return 0;
  const ms = new Date(endDate).getTime() - Date.now();
  return ms > 0 ? Math.ceil(ms / (1000 * 60 * 60 * 24)) : 0;
}

class SubscriptionService {
  constructor({
    subscriptionRepository,
    planRepository,
    couponService,
    userRepository,
  }) {
    this.subscriptionRepository = subscriptionRepository;
    this.planRepository = planRepository;
    this.couponService = couponService;
    this.userRepository = userRepository;
  }

  async getActiveSubscription(userId) {
    return this.subscriptionRepository.getActivePaidSubscription(userId);
  }

  async hasActiveSubscription(userId) {
    if (!userId) return false;
    const active =
      await this.subscriptionRepository.getActivePaidSubscription(userId);
    return Boolean(active);
  }

  async getMySubscription(userId) {
    const active =
      await this.subscriptionRepository.getActivePaidSubscription(userId);

    if (active) {
      return {
        ...active,
        has_subscription: true,
        is_active: true,
        days_remaining: daysRemaining(active.end_date),
      };
    }

    const latest =
      await this.subscriptionRepository.getLatestSubscription(userId);
    if (!latest) return null;

    return {
      ...latest,
      has_subscription: true,
      is_active: false,
      days_remaining: 0,
    };
  }

  async createStripeSession({ planId, userId, couponCode }) {
    const plan = await this.planRepository.findById(planId);
    if (!plan) {
      throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");
    }
    if (!plan.is_active) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Plan is not available");
    }

    const activeSubscription =
      await this.subscriptionRepository.getActivePaidSubscription(userId);
    if (activeSubscription) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You already have an active subscription",
      );
    }

    let coupon = null;
    let subtotal = roundMoney(plan.price);
    let discount = 0;
    let currency = plan.currency || "usd";

    if (couponCode) {
      const result = await this.couponService.validate({
        code: couponCode,
        plan,
        userId,
      });
      coupon = result.coupon;
      subtotal = result.subtotal;
      discount = result.discount;
      currency = result.currency;
    }

    const total = roundMoney(subtotal - discount);
    const unitAmount = Math.round(total * 100);
    const user = await this.userRepository.findById(userId);

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      customer_email: user?.email || undefined,
      line_items: [
        {
          price_data: {
            currency,
            product_data: {
              name: plan.name,
              description: plan.description || undefined,
            },
            unit_amount: unitAmount,
          },
          quantity: 1,
        },
      ],
      success_url: `${environment.CLIENT_URL_1}/payment-success?session_id={CHECKOUT_SESSION_ID}&planId=${planId}`,
      cancel_url: `${environment.CLIENT_URL_1}/payment-cancel?planId=${planId}`,
      metadata: {
        userId,
        planId,
        couponCode: coupon?.code || "",
        subtotal: String(subtotal),
        discount: String(discount),
        amount: String(total),
      },
    });

    return { session_url: session.url };
  }

  async getUserSubscriptions(query = {}) {
    const { page, limit, offset } = parsePagination(query, {
      defaultLimit: 20,
    });

    const [subscriptions, total] = await Promise.all([
      this.subscriptionRepository.findAllUserSubscriptions({ limit, offset }),
      this.subscriptionRepository.countUserSubscriptions(),
    ]);

    return {
      subscriptions,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async createUserSubscription({
    user_id,
    plan_id,
    start_date,
    end_date,
    status,
  }) {
    if (!user_id || !plan_id) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "user_id and plan_id are required",
      );
    }
    return this.subscriptionRepository.adminCreateUserSubscription({
      userId: user_id,
      planId: plan_id,
      startDate: start_date || new Date().toISOString(),
      endDate: end_date,
      status,
    });
  }

  async updateUserSubscription(subscriptionId, subscriptionData) {
    const existingSubscription =
      await this.subscriptionRepository.findUserSubscriptionById(
        subscriptionId,
      );
    if (!existingSubscription) {
      throw new ApiError(StatusCode.NOT_FOUND, "User subscription not found");
    }

    return this.subscriptionRepository.updateUserSubscription(subscriptionId, {
      userId: subscriptionData.user_id || existingSubscription.user_id,
      planId: subscriptionData.plan_id || existingSubscription.plan_id,
      startDate: subscriptionData.start_date || existingSubscription.start_date,
      endDate: subscriptionData.end_date || existingSubscription.end_date,
      status: subscriptionData.status || existingSubscription.status,
    });
  }

  async deleteUserSubscription(subscriptionId) {
    await this.subscriptionRepository.deleteUserSubscription(subscriptionId);
  }
}

export { SubscriptionService };
export default new SubscriptionService({
  subscriptionRepository,
  planRepository,
  couponService,
  userRepository,
});
