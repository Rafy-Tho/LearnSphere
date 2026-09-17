import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN } from "../../common/constants/constants.js";
import planController from "./plan.controller.js";
import subscriptionController from "./subscription.controller.js";
import paymentController from "./payment.controller.js";
import {
  createPaymentValidator,
  createPlanValidator,
  createUserSubscriptionValidator,
  updatePaymentValidator,
  updatePlanValidator,
  updateUserSubscriptionValidator,
} from "./admin.validation.js";
import {
  paymentIdParamValidator,
  planIdParamValidator,
  userSubscriptionIdParamValidator,
} from "./validation.js";

const guard = [requireAuth, authorize(ADMIN)];

// Mounted at /api/v1/admin/plans
export const adminPlansRoute = express.Router();
adminPlansRoute
  .route("/")
  .get(...guard, planController.getPlans)
  .post(...guard, createPlanValidator, validateResult, planController.createPlan);
adminPlansRoute
  .route("/:planId")
  .patch(...guard, updatePlanValidator, validateResult, planController.updatePlan)
  .delete(...guard, planIdParamValidator, validateResult, planController.deletePlan);

// Mounted at /api/v1/admin/subscriptions
export const adminSubscriptionsRoute = express.Router();
adminSubscriptionsRoute
  .route("/")
  .get(...guard, subscriptionController.getUserSubscriptions)
  .post(
    ...guard,
    createUserSubscriptionValidator,
    validateResult,
    subscriptionController.createUserSubscription,
  );
adminSubscriptionsRoute
  .route("/:subscriptionId")
  .patch(
    ...guard,
    updateUserSubscriptionValidator,
    validateResult,
    subscriptionController.updateUserSubscription,
  )
  .delete(
    ...guard,
    userSubscriptionIdParamValidator,
    validateResult,
    subscriptionController.deleteUserSubscription,
  );

// Mounted at /api/v1/admin/payments
export const adminPaymentsRoute = express.Router();
adminPaymentsRoute
  .route("/")
  .get(...guard, paymentController.getPayments)
  .post(
    ...guard,
    createPaymentValidator,
    validateResult,
    paymentController.createPayment,
  );
adminPaymentsRoute
  .route("/:paymentId")
  .patch(
    ...guard,
    updatePaymentValidator,
    validateResult,
    paymentController.updatePayment,
  )
  .delete(
    ...guard,
    paymentIdParamValidator,
    validateResult,
    paymentController.deletePayment,
  );
