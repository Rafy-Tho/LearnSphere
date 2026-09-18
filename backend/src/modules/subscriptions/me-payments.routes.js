import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import paymentController from "./payment.controller.js";
import refundRequestController from "./refund-request.controller.js";
import {
  createRefundRequestValidator,
  paymentIdParamValidator,
} from "./validation.js";

const mePaymentsRoute = express.Router();

mePaymentsRoute.get("/", requireAuth, paymentController.getMyPayments);

mePaymentsRoute.get(
  "/:paymentId",
  requireAuth,
  paymentIdParamValidator,
  validateResult,
  paymentController.getMyPayment,
);

mePaymentsRoute.get(
  "/:paymentId/refund-requests",
  requireAuth,
  paymentIdParamValidator,
  validateResult,
  refundRequestController.getPaymentRefundRequests,
);

mePaymentsRoute.post(
  "/:paymentId/refund-requests",
  requireAuth,
  paymentIdParamValidator,
  createRefundRequestValidator,
  validateResult,
  refundRequestController.createRefundRequest,
);

export default mePaymentsRoute;
