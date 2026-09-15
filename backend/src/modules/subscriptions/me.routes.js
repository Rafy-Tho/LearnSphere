import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import subscriptionController from "./subscription.controller.js";

const meSubscriptionRoute = express.Router();

meSubscriptionRoute.get(
  "/",
  requireAuth,
  subscriptionController.getActiveSubscription,
);

export default meSubscriptionRoute;
