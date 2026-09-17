import { checkSchema } from "express-validator";
import {
  dateValidator,
  enumValidator,
  floatValidator,
  numberValidator,
  textValidator,
  uuidValidator,
} from "../../common/validation.js";

const DISCOUNT_TYPES = ["PERCENTAGE", "FIXED_AMOUNT"];

const optionalBoolean = (field) => ({
  in: ["body"],
  optional: { options: { nullable: true } },
  customSanitizer: {
    options: (value) => {
      if (value === true || value === "true" || value === "1" || value === 1) {
        return true;
      }
      if (value === false || value === "false" || value === "0" || value === 0) {
        return false;
      }
      return value;
    },
  },
  isBoolean: {
    errorMessage: `${field} must be a boolean`,
  },
});

const optionalCurrency = {
  in: ["body"],
  optional: { options: { nullable: true, checkFalsy: true } },
  isLength: {
    options: { min: 3, max: 3 },
    errorMessage: "Currency must be a 3-letter code",
  },
};

const featuresValidator = {
  in: ["body"],
  optional: { options: { nullable: true } },
  custom: {
    options: (value) => {
      if (!Array.isArray(value)) {
        throw new Error("Features must be an array");
      }
      if (value.length > 20) {
        throw new Error("Features must have at most 20 items");
      }
      if (
        value.some(
          (item) => typeof item !== "string" || item.trim().length === 0,
        )
      ) {
        throw new Error("Each feature must be a non-empty string");
      }
      return true;
    },
  },
};

export const createPlanValidator = checkSchema({
  name: textValidator("Name", false, 50),
  description: textValidator("Description", true, 500),
  duration_days: numberValidator("Duration days"),
  price: floatValidator("Price"),
  currency: optionalCurrency,
  features: featuresValidator,
  is_active: optionalBoolean("Active"),
});

export const updatePlanValidator = checkSchema({
  name: textValidator("Name", true, 50),
  description: textValidator("Description", true, 500),
  duration_days: numberValidator("Duration days", true),
  price: floatValidator("Price", true),
  currency: optionalCurrency,
  features: featuresValidator,
  is_active: optionalBoolean("Active"),
});

export const createUserSubscriptionOverrideValidator = checkSchema({
  user_id: uuidValidator("User ID"),
  plan_id: uuidValidator("Plan ID"),
  start_date: dateValidator("Start date", true),
  end_date: dateValidator("End date", true),
  reason: textValidator("Reason", true, 500),
});

export const createCouponValidator = checkSchema({
  code: textValidator("Code", false, 50),
  discount_type: enumValidator("Discount type", DISCOUNT_TYPES),
  discount_value: floatValidator("Discount value"),
  max_redemptions: numberValidator("Maximum redemptions", true),
  starts_at: dateValidator("Start date", true),
  expires_at: dateValidator("Expiration date", true),
  is_active: optionalBoolean("Active"),
});

export const updateCouponValidator = checkSchema({
  code: textValidator("Code", true, 50),
  discount_type: enumValidator("Discount type", DISCOUNT_TYPES, true),
  discount_value: floatValidator("Discount value", true),
  max_redemptions: numberValidator("Maximum redemptions", true),
  starts_at: dateValidator("Start date", true),
  expires_at: dateValidator("Expiration date", true),
  is_active: optionalBoolean("Active"),
});

export const couponActiveValidator = checkSchema({
  is_active: {
    in: ["body"],
    notEmpty: { errorMessage: "Active is required", bail: true },
    customSanitizer: {
      options: (value) => {
        if (
          value === true ||
          value === "true" ||
          value === "1" ||
          value === 1
        ) {
          return true;
        }
        if (
          value === false ||
          value === "false" ||
          value === "0" ||
          value === 0
        ) {
          return false;
        }
        return value;
      },
    },
    isBoolean: { errorMessage: "Active must be a boolean" },
  },
});

export const createRefundValidator = checkSchema({
  amount: floatValidator("Amount", true),
  reason: textValidator("Reason", true, 500),
});
