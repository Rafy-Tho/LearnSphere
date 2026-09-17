import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import subscriptionService from "./subscription.service.js";

class SubscriptionController {
  constructor({ subscriptionService }) {
    this.subscriptionService = subscriptionService;
  }

  getActiveSubscription = asyncHandler(async (req, res) => {
    const subscription = await this.subscriptionService.getMySubscription(
      req.session.user.id,
    );

    return sendSuccess(res, subscription || null, {
      message: "Subscription retrieved successfully",
    });
  });

  createStripeSession = asyncHandler(async (req, res) => {
    const checkoutSession = await this.subscriptionService.createStripeSession({
      planId: req.params.planId,
      userId: req.session.user.id,
      couponCode: req.body?.coupon_code,
    });

    return sendSuccess(res, checkoutSession, {
      message: "Checkout session created successfully",
    });
  });

  getUserSubscriptions = asyncHandler(async (req, res) => {
    const { subscriptions, pagination } =
      await this.subscriptionService.getUserSubscriptions(req.query);

    return sendSuccess(res, subscriptions, {
      message: "User subscriptions retrieved successfully",
      pagination,
    });
  });

  createUserSubscription = asyncHandler(async (req, res) => {
    const subscription = await this.subscriptionService.createUserSubscription(
      req.body,
    );

    return sendSuccess(res, subscription, {
      statusCode: StatusCode.CREATED,
      message: "User subscription created successfully",
    });
  });

  updateUserSubscription = asyncHandler(async (req, res) => {
    const subscription = await this.subscriptionService.updateUserSubscription(
      req.params.subscriptionId,
      req.body,
    );

    return sendSuccess(res, subscription, {
      message: "User subscription updated successfully",
    });
  });

  deleteUserSubscription = asyncHandler(async (req, res) => {
    await this.subscriptionService.deleteUserSubscription(
      req.params.subscriptionId,
    );

    return sendSuccess(res, null, {
      message: "User subscription deleted successfully",
    });
  });
}

export { SubscriptionController };
export default new SubscriptionController({ subscriptionService });
