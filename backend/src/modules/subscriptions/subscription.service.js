import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import checkoutService from "./checkout.service.js";
import paymentRepository from "./payment.repository.js";
import planRepository from "./plan.repository.js";
import subscriptionRepository from "./subscription.repository.js";

function daysRemaining(endDate) {
  if (!endDate) return 0;
  const ms = new Date(endDate).getTime() - Date.now();
  return ms > 0 ? Math.ceil(ms / (1000 * 60 * 60 * 24)) : 0;
}

class SubscriptionService {
  constructor({
    subscriptionRepository,
    planRepository,
    checkoutService,
    userRepository,
    paymentRepository,
  }) {
    this.subscriptionRepository = subscriptionRepository;
    this.planRepository = planRepository;
    this.checkoutService = checkoutService;
    this.userRepository = userRepository;
    this.paymentRepository = paymentRepository;
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
    // Lazy expiration: keep the persisted status consistent with end_date.
    await this.subscriptionRepository.expireOverdueSubscriptions({ userId });

    const active =
      await this.subscriptionRepository.getActivePaidSubscription(userId);

    if (active) {
      return {
        ...active,
        status: "ACTIVE",
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
      status: latest.subscription_status || "EXPIRED",
      has_subscription: true,
      is_active: false,
      days_remaining: 0,
    };
  }

  // Checkout creation lives in checkout.service.js. Delegated so subscription
  // state concerns stay separate from the checkout/Stripe workflow.
  async createStripeSession({ planId, userId, couponCode }) {
    return this.checkoutService.createCheckoutSession({
      planId,
      userId,
      couponCode,
    });
  }

  async getUserSubscriptions(query = {}) {
    const { page, limit, offset } = parsePagination(query, {
      defaultLimit: 20,
    });
    const filters = { status: query.status, search: query.search };

    const [subscriptions, total] = await Promise.all([
      this.subscriptionRepository.findAllUserSubscriptions({
        limit,
        offset,
        ...filters,
      }),
      this.subscriptionRepository.countUserSubscriptions(filters),
    ]);

    return {
      subscriptions,
      pagination: buildPagination({ total, page, limit }),
    };
  }

  async getUserSubscriptionDetail(subscriptionId) {
    const subscription =
      await this.subscriptionRepository.findUserSubscriptionById(
        subscriptionId,
      );
    if (!subscription) {
      throw new ApiError(StatusCode.NOT_FOUND, "User subscription not found");
    }

    const payments =
      await this.paymentRepository.findPaymentsBySubscription(subscriptionId);

    return { ...subscription, payments };
  }

  // Administrative override: provisions access without a payment. Kept separate
  // from the normal paid flow and always audited.
  async adminOverrideSubscription(
    { user_id, plan_id, start_date, end_date, reason },
    adminId,
  ) {
    if (!user_id || !plan_id) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "user_id and plan_id are required",
      );
    }

    const user = await this.userRepository.findById(user_id);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    const plan = await this.planRepository.findById(plan_id);
    if (!plan) throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");

    const startDate = start_date ? new Date(start_date) : new Date();
    const endDate = end_date
      ? new Date(end_date)
      : new Date(
          startDate.getTime() +
            Number(plan.duration_days) * 24 * 60 * 60 * 1000,
        );

    if (endDate <= startDate) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "end_date must be after start_date",
      );
    }

    const subscription = await withTransaction(async (client) => {
      await this.subscriptionRepository.expireOverdueSubscriptions({
        userId: user_id,
        client,
      });
      return this.subscriptionRepository.adminOverrideSubscription(
        {
          userId: user_id,
          planId: plan_id,
          startDate,
          endDate,
        },
        client,
      );
    });

    logger.audit("subscription.admin.override", {
      adminId,
      userId: user_id,
      planId: plan_id,
      subscriptionId: subscription?.id,
      reason: reason || null,
    });

    return subscription;
  }
}

export { SubscriptionService };
export default new SubscriptionService({
  subscriptionRepository,
  planRepository,
  checkoutService,
  userRepository,
  paymentRepository,
});
