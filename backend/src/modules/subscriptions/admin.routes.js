import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN } from "../../common/constants/constants.js";
import planController from "./plan.controller.js";
import subscriptionController from "./subscription.controller.js";
import paymentController from "./payment.controller.js";
import couponController from "./coupon.controller.js";
import refundController from "./refund.controller.js";
import billingStatsController from "./billing-stats.controller.js";
import {
  couponActiveValidator,
  createCouponValidator,
  createPlanValidator,
  createRefundValidator,
  createUserSubscriptionOverrideValidator,
  updateCouponValidator,
  updatePlanValidator,
} from "./admin.validation.js";
import {
  couponIdParamValidator,
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
  .patch(
    ...guard,
    planIdParamValidator,
    updatePlanValidator,
    validateResult,
    planController.updatePlan,
  )
  .delete(...guard, planIdParamValidator, validateResult, planController.deletePlan);

// Mounted at /api/v1/admin/subscriptions
export const adminSubscriptionsRoute = express.Router();
adminSubscriptionsRoute.route("/").get(...guard, subscriptionController.getUserSubscriptions);
adminSubscriptionsRoute
  .route("/override")
  .post(
    ...guard,
    createUserSubscriptionOverrideValidator,
    validateResult,
    subscriptionController.createUserSubscriptionOverride,
  );
adminSubscriptionsRoute
  .route("/:subscriptionId")
  .get(
    ...guard,
    userSubscriptionIdParamValidator,
    validateResult,
    subscriptionController.getUserSubscription,
  );

// Mounted at /api/v1/admin/payments
export const adminPaymentsRoute = express.Router();
adminPaymentsRoute.route("/").get(...guard, paymentController.getPayments);
adminPaymentsRoute
  .route("/:paymentId")
  .get(
    ...guard,
    paymentIdParamValidator,
    validateResult,
    paymentController.getPayment,
  );
adminPaymentsRoute
  .route("/:paymentId/refunds")
  .get(
    ...guard,
    paymentIdParamValidator,
    validateResult,
    refundController.getPaymentRefunds,
  )
  .post(
    ...guard,
    paymentIdParamValidator,
    createRefundValidator,
    validateResult,
    refundController.createPaymentRefund,
  );

// Mounted at /api/v1/admin/coupons
export const adminCouponsRoute = express.Router();
adminCouponsRoute
  .route("/")
  .get(...guard, couponController.getCoupons)
  .post(...guard, createCouponValidator, validateResult, couponController.createCoupon);
adminCouponsRoute
  .route("/:couponId")
  .patch(
    ...guard,
    couponIdParamValidator,
    updateCouponValidator,
    validateResult,
    couponController.updateCoupon,
  );
adminCouponsRoute
  .route("/:couponId/status")
  .patch(
    ...guard,
    couponIdParamValidator,
    couponActiveValidator,
    validateResult,
    couponController.setCouponActive,
  );
adminCouponsRoute
  .route("/:couponId/redemptions")
  .get(
    ...guard,
    couponIdParamValidator,
    validateResult,
    couponController.getRedemptions,
  );

// Mounted at /api/v1/admin/billing
export const adminBillingRoute = express.Router();
adminBillingRoute.route("/stats").get(...guard, billingStatsController.getStats);
