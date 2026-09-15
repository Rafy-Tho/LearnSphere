import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { subscriptionIdParamValidator } from "./validation.js";

// Mounted under /api/v1/users
const paymentRoute = express.Router();

paymentRoute.post(
  "/payment-stripe/:subscriptionId",
  requireAuth,
  subscriptionIdParamValidator,
  validateResult,
  controller.createStripeSession,
);

export default paymentRoute;
