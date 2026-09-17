import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import couponController from "./coupon.controller.js";
import { couponValidateValidator } from "./validation.js";

const couponsRoute = express.Router();

couponsRoute.post(
  "/validate",
  requireAuth,
  couponValidateValidator,
  validateResult,
  couponController.validateCoupon,
);

export default couponsRoute;
