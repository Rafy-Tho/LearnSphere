import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import environment from "../../config/environment.js";
import stripe from "../../config/stripe.js";
import subscriptionRepository from "./subscription.repository.js";

class SubscriptionService {
  constructor({ subscriptionRepository }) {
    this.subscriptionRepository = subscriptionRepository;
  }

  async getActiveSubscription(userId) {
    return this.subscriptionRepository.getActivePaidSubscription(userId);
  }

  async createStripeSession({ planId, userId }) {
    const plan = await this.subscriptionRepository.findById(planId);
    if (!plan) {
      throw new ApiError(StatusCode.NOT_FOUND, "Plan not found");
    }

    const activeSubscription =
      await this.subscriptionRepository.getActivePaidSubscription(userId);
    if (activeSubscription) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "You already have an active subscription",
      );
    }

    await this.subscriptionRepository.setUserSubscriptionStatusToExpired(
      userId,
    );

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [
        {
          price_data: {
            currency: "usd",
            product_data: { name: plan.name },
            unit_amount: plan.price * 100,
          },
          quantity: 1,
        },
      ],
      success_url: `${environment.CLIENT_URL_1}/payment-success?session_id={CHECKOUT_SESSION_ID}&planId=${planId}`,
      cancel_url: `${environment.CLIENT_URL_1}/payment-cancel?planId=${planId}`,
      metadata: { userId, subscriptionId: planId },
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
export default new SubscriptionService({ subscriptionRepository });
