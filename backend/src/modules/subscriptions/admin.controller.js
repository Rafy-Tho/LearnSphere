import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as subscriptionsService from "./service.js";

// --- Plans ---

export const getPlans = asyncHandler(async (req, res) => {
  const { data, pagination } = await subscriptionsService.getPlans(req.query);
  return sendSuccess(res, data, {
    message: "Plans retrieved successfully",
    pagination,
  });
});

export const createPlan = asyncHandler(async (req, res) => {
  const plan = await subscriptionsService.createPlan(req.body);
  return sendSuccess(res, plan, {
    statusCode: StatusCode.CREATED,
    message: "Plan created successfully",
  });
});

export const updatePlan = asyncHandler(async (req, res) => {
  const plan = await subscriptionsService.updatePlan(req.params.planId, req.body);
  return sendSuccess(res, plan, { message: "Plan updated successfully" });
});

export const deletePlan = asyncHandler(async (req, res) => {
  await subscriptionsService.deletePlan(req.params.planId);
  return sendSuccess(res, null, { message: "Plan deleted successfully" });
});

// --- User subscriptions ---

export const getUserSubscriptions = asyncHandler(async (req, res) => {
  const { data, pagination } = await subscriptionsService.getUserSubscriptions(
    req.query,
  );
  return sendSuccess(res, data, {
    message: "User subscriptions retrieved successfully",
    pagination,
  });
});

export const createUserSubscription = asyncHandler(async (req, res) => {
  const subscription = await subscriptionsService.createUserSubscription(
    req.body,
  );
  return sendSuccess(res, subscription, {
    statusCode: StatusCode.CREATED,
    message: "User subscription created successfully",
  });
});

export const updateUserSubscription = asyncHandler(async (req, res) => {
  const subscription = await subscriptionsService.updateUserSubscription(
    req.params.subscriptionId,
    req.body,
  );
  return sendSuccess(res, subscription, {
    message: "User subscription updated successfully",
  });
});

export const deleteUserSubscription = asyncHandler(async (req, res) => {
  await subscriptionsService.deleteUserSubscription(req.params.subscriptionId);
  return sendSuccess(res, null, {
    message: "User subscription deleted successfully",
  });
});

// --- Payments ---

export const getPayments = asyncHandler(async (req, res) => {
  const { data, pagination } = await subscriptionsService.getPayments(
    req.query,
  );
  return sendSuccess(res, data, {
    message: "Payments retrieved successfully",
    pagination,
  });
});

export const createPayment = asyncHandler(async (req, res) => {
  const payment = await subscriptionsService.createPayment(req.body);
  return sendSuccess(res, payment, {
    statusCode: StatusCode.CREATED,
    message: "Payment created successfully",
  });
});

export const updatePayment = asyncHandler(async (req, res) => {
  const payment = await subscriptionsService.updatePayment(
    req.params.paymentId,
    req.body,
  );
  return sendSuccess(res, payment, { message: "Payment updated successfully" });
});

export const deletePayment = asyncHandler(async (req, res) => {
  await subscriptionsService.deletePayment(req.params.paymentId);
  return sendSuccess(res, null, { message: "Payment deleted successfully" });
});
