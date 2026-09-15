import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as subscriptionsService from "./service.js";

export const getPlan = asyncHandler(async (req, res) => {
  const plan = await subscriptionsService.getPlan(req.params.planId);

  return sendSuccess(res, plan, {
    message: "Plan retrieved successfully",
  });
});

export const getUserActiveSubscriptions = asyncHandler(async (req, res) => {
  const subscriptions = await subscriptionsService.getUserActiveSubscriptions(
    req.session.user.id,
  );

  return sendSuccess(res, subscriptions || null, {
    message: "Subscription retrieved successfully",
  });
});

export const createStripeSession = asyncHandler(async (req, res) => {
  const data = await subscriptionsService.createStripeSession({
    planId: req.params.planId,
    userId: req.session.user.id,
  });

  return sendSuccess(res, data, {
    message: "Checkout session created successfully",
  });
});
