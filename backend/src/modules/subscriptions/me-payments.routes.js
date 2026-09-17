import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import paymentController from "./payment.controller.js";
import { paymentIdParamValidator } from "./validation.js";

const mePaymentsRoute = express.Router();

mePaymentsRoute.get("/", requireAuth, paymentController.getMyPayments);

mePaymentsRoute.get(
  "/:paymentId",
  requireAuth,
  paymentIdParamValidator,
  validateResult,
  paymentController.getMyPayment,
);

export default mePaymentsRoute;
