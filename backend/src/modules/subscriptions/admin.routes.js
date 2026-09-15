import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN } from "../../common/constants/constants.js";
import * as controller from "./admin.controller.js";

const adminSubscriptionsRoute = express.Router();

adminSubscriptionsRoute.use(requireAuth, authorize(ADMIN));

// Plans
adminSubscriptionsRoute.route("/plans").get(controller.getPlans).post(controller.createPlan);
adminSubscriptionsRoute
  .route("/plans/:id")
  .patch(controller.updatePlan)
  .delete(controller.deletePlan);

// User subscriptions
adminSubscriptionsRoute
  .route("/user-subscriptions")
  .get(controller.getUserSubscriptions)
  .post(controller.createUserSubscription);
adminSubscriptionsRoute
  .route("/user-subscriptions/:id")
  .patch(controller.updateUserSubscription)
  .delete(controller.deleteUserSubscription);

// Payments
adminSubscriptionsRoute
  .route("/payments")
  .get(controller.getPayments)
  .post(controller.createPayment);
adminSubscriptionsRoute
  .route("/payments/:id")
  .patch(controller.updatePayment)
  .delete(controller.deletePayment);

export default adminSubscriptionsRoute;
