import { checkSchema } from "express-validator";
import {
  dateValidator,
  enumValidator,
  floatValidator,
  numberValidator,
  textValidator,
  uuidValidator,
} from "../../common/validation.js";

const SUBSCRIPTION_STATUSES = ["ACTIVE", "EXPIRED", "CANCELLED", "PENDING"];
const PAYMENT_STATUSES = [
  "PENDING",
  "COMPLETED",
  "FAILED",
  "REFUNDED",
  "PARTIALLY_REFUNDED",
];

export const createPlanValidator = checkSchema({
  name: textValidator("Name"),
  duration_days: numberValidator("Duration days"),
  price: floatValidator("Price"),
});

export const updatePlanValidator = checkSchema({
  name: textValidator("Name", true),
  duration_days: numberValidator("Duration days", true),
  price: floatValidator("Price", true),
});

export const createUserSubscriptionValidator = checkSchema({
  user_id: uuidValidator("User ID"),
  plan_id: uuidValidator("Plan ID"),
  start_date: dateValidator("Start date", true),
  end_date: dateValidator("End date", true),
  status: enumValidator("Status", SUBSCRIPTION_STATUSES, true),
});

export const updateUserSubscriptionValidator = checkSchema({
  user_id: uuidValidator("User ID", true),
  plan_id: uuidValidator("Plan ID", true),
  start_date: dateValidator("Start date", true),
  end_date: dateValidator("End date", true),
  status: enumValidator("Status", SUBSCRIPTION_STATUSES, true),
});

export const createPaymentValidator = checkSchema({
  user_subscription_id: uuidValidator("User subscription ID"),
  amount: floatValidator("Amount"),
  payment_status: enumValidator("Payment status", PAYMENT_STATUSES, true),
  stripe_payment_intent_id: textValidator("Stripe payment intent ID", true, 255),
});

export const updatePaymentValidator = checkSchema({
  amount: floatValidator("Amount", true),
  payment_status: enumValidator("Payment status", PAYMENT_STATUSES, true),
  stripe_payment_intent_id: textValidator("Stripe payment intent ID", true, 255),
});
