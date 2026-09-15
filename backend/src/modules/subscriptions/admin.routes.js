import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import { ADMIN } from "../../common/constants/constants.js";
import * as controller from "./admin.controller.js";
import {
  createPaymentValidator,
  createPlanValidator,
  createUserSubscriptionValidator,
  updatePaymentValidator,
  updatePlanValidator,
  updateUserSubscriptionValidator,
} from "./admin.validation.js";

const adminSubscriptionsRoute = express.Router();

adminSubscriptionsRoute.use(requireAuth, authorize(ADMIN));

// Plans
adminSubscriptionsRoute
  .route("/plans")
  .get(controller.getPlans)
  .post(createPlanValidator, validateResult, controller.createPlan);
adminSubscriptionsRoute
  .route("/plans/:id")
  .patch(updatePlanValidator, validateResult, controller.updatePlan)
  .delete(controller.deletePlan);

// User subscriptions
adminSubscriptionsRoute
  .route("/user-subscriptions")
  .get(controller.getUserSubscriptions)
  .post(createUserSubscriptionValidator, validateResult, controller.createUserSubscription);
adminSubscriptionsRoute
  .route("/user-subscriptions/:id")
  .patch(updateUserSubscriptionValidator, validateResult, controller.updateUserSubscription)
  .delete(controller.deleteUserSubscription);

// Payments
adminSubscriptionsRoute
  .route("/payments")
  .get(controller.getPayments)
  .post(createPaymentValidator, validateResult, controller.createPayment);
adminSubscriptionsRoute
  .route("/payments/:id")
  .patch(updatePaymentValidator, validateResult, controller.updatePayment)
  .delete(controller.deletePayment);

export default adminSubscriptionsRoute;
