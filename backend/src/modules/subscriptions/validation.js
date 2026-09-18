import { checkSchema } from "express-validator";
import {
  floatValidator,
  textValidator,
  uuidParamValidator,
  uuidValidator,
} from "../../common/validation.js";

export const planIdParamValidator = checkSchema({
  planId: uuidParamValidator("Plan ID"),
});

export const paymentIdParamValidator = checkSchema({
  paymentId: uuidParamValidator("Payment ID"),
});

export const userSubscriptionIdParamValidator = checkSchema({
  subscriptionId: uuidParamValidator("User subscription ID"),
});

export const couponIdParamValidator = checkSchema({
  couponId: uuidParamValidator("Coupon ID"),
});

export const checkoutBodyValidator = checkSchema({
  coupon_code: textValidator("Coupon code", true, 50),
});

export const couponValidateValidator = checkSchema({
  code: textValidator("Coupon code", false, 50),
  plan_id: uuidValidator("Plan ID"),
});

export const refundRequestIdParamValidator = checkSchema({
  requestId: uuidParamValidator("Refund request ID"),
});

export const createRefundRequestValidator = checkSchema({
  requested_amount: floatValidator("Requested amount", true),
  reason: textValidator("Reason", false, 255),
  user_note: textValidator("User note", true, 1000),
});
