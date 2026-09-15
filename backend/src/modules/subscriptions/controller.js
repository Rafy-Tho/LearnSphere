import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as subscriptionsService from "./service.js";

export const getSubscription = asyncHandler(async (req, res) => {
  const subscription = await subscriptionsService.getSubscription(req.params.id);

  return sendSuccess(res, subscription, {
    message: "Subscription retrieved successfully",
  });
});

export const getUserActiveSubscriptions = asyncHandler(async (req, res) => {
  const subscriptions = await subscriptionsService.getUserActiveSubscriptions(
    req.session.user.id,
  );

  return sendSuccess(res, subscriptions || null, {
    message: "Subscriptions retrieved successfully",
  });
});

export const createStripeSession = asyncHandler(async (req, res) => {
  const data = await subscriptionsService.createStripeSession({
    subscriptionId: req.params.subscriptionId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, data, {
    message: "Checkout session created successfully",
  });
});
