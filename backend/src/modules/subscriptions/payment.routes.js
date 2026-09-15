import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import * as controller from "./controller.js";

// Mounted under /api/v1/users
const paymentRoute = express.Router();

paymentRoute.post(
  "/payment-stripe/:subscriptionId",
  requireAuth,
  controller.createStripeSession,
);

export default paymentRoute;
