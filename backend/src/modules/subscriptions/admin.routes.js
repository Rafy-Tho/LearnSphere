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
  paymentIdParamValidator,
  planIdParamValidator,
  updatePaymentValidator,
  updatePlanValidator,
  updateUserSubscriptionValidator,
  userSubscriptionIdParamValidator,
} from "./admin.validation.js";

const guard = [requireAuth, authorize(ADMIN)];

// Mounted at /api/v1/admin/plans
export const adminPlansRoute = express.Router();
adminPlansRoute
  .route("/")
  .get(...guard, controller.getPlans)
  .post(...guard, createPlanValidator, validateResult, controller.createPlan);
adminPlansRoute
  .route("/:planId")
  .patch(...guard, updatePlanValidator, validateResult, controller.updatePlan)
  .delete(...guard, planIdParamValidator, validateResult, controller.deletePlan);

// Mounted at /api/v1/admin/subscriptions
export const adminSubscriptionsRoute = express.Router();
adminSubscriptionsRoute
  .route("/")
  .get(...guard, controller.getUserSubscriptions)
  .post(
    ...guard,
    createUserSubscriptionValidator,
    validateResult,
    controller.createUserSubscription,
  );
adminSubscriptionsRoute
  .route("/:subscriptionId")
  .patch(
    ...guard,
    updateUserSubscriptionValidator,
    validateResult,
    controller.updateUserSubscription,
  )
  .delete(
    ...guard,
    userSubscriptionIdParamValidator,
    validateResult,
    controller.deleteUserSubscription,
  );

// Mounted at /api/v1/admin/payments
export const adminPaymentsRoute = express.Router();
adminPaymentsRoute
  .route("/")
  .get(...guard, controller.getPayments)
  .post(
    ...guard,
    createPaymentValidator,
    validateResult,
    controller.createPayment,
  );
adminPaymentsRoute
  .route("/:paymentId")
  .patch(
    ...guard,
    updatePaymentValidator,
    validateResult,
    controller.updatePayment,
  )
  .delete(
    ...guard,
    paymentIdParamValidator,
    validateResult,
    controller.deletePayment,
  );
