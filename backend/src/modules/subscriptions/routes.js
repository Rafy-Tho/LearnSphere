import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import subscriptionController from "./subscription.controller.js";
import {
  checkoutBodyValidator,
  planIdParamValidator,
} from "./validation.js";

const subscriptionsRoute = express.Router();

subscriptionsRoute.post(
  "/:planId/checkout",
  requireAuth,
  planIdParamValidator,
  checkoutBodyValidator,
  validateResult,
  subscriptionController.createStripeSession,
);

export default subscriptionsRoute;
