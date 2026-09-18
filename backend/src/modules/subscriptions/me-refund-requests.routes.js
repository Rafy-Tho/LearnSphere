import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import refundRequestController from "./refund-request.controller.js";
import { refundRequestIdParamValidator } from "./validation.js";

const meRefundRequestsRoute = express.Router();

meRefundRequestsRoute.get(
  "/",
  requireAuth,
  refundRequestController.getMyRefundRequests,
);

meRefundRequestsRoute.get(
  "/:requestId",
  requireAuth,
  refundRequestIdParamValidator,
  validateResult,
  refundRequestController.getMyRefundRequest,
);

export default meRefundRequestsRoute;
