import { checkSchema } from "express-validator";
import { uuidParamValidator, uuidValidator } from "../../common/validation.js";

const optionalPage = {
  in: ["query"],
  optional: { options: { nullable: true, checkFalsy: true } },
  toInt: true,
  isInt: {
    options: { min: 1 },
    errorMessage: "page must be at least 1",
  },
};

const optionalLimit = {
  in: ["query"],
  optional: { options: { nullable: true, checkFalsy: true } },
  toInt: true,
  isInt: {
    options: { min: 1, max: 100 },
    errorMessage: "limit must be between 1 and 100",
  },
};

export const listQueryValidator = checkSchema({
  page: optionalPage,
  limit: optionalLimit,
});

export const studentsQueryValidator = checkSchema({
  page: optionalPage,
  limit: optionalLimit,
  search: {
    in: ["query"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isLength: {
      options: { max: 100 },
      errorMessage: "search must be at most 100 characters",
    },
  },
  completion: {
    in: ["query"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isIn: {
      options: [["COMPLETED", "IN_PROGRESS"]],
      errorMessage: "completion must be COMPLETED or IN_PROGRESS",
    },
  },
});

export const courseIdParamValidator = checkSchema({
  courseId: uuidParamValidator("Course ID"),
});

export const revenueSettingsValidator = checkSchema({
  revenueSharePercent: {
    in: ["body"],
    toInt: true,
    isInt: {
      options: { min: 0, max: 100 },
      errorMessage: "revenueSharePercent must be between 0 and 100",
    },
  },
});

export const payoutCreateValidator = checkSchema({
  instructorId: uuidValidator("Instructor ID"),
  amount: {
    in: ["body"],
    toFloat: true,
    isFloat: {
      options: { min: 0 },
      errorMessage: "amount must be a positive number",
    },
  },
  currency: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isLength: {
      options: { max: 10 },
      errorMessage: "currency must be at most 10 characters",
    },
  },
  status: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isIn: {
      options: [["PENDING", "PAID", "CANCELLED"]],
      errorMessage: "status must be PENDING, PAID or CANCELLED",
    },
  },
  periodStart: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    isISO8601: { errorMessage: "periodStart must be a date" },
  },
  periodEnd: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    isISO8601: { errorMessage: "periodEnd must be a date" },
  },
  note: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isLength: {
      options: { max: 1000 },
      errorMessage: "note must be at most 1000 characters",
    },
  },
});

export const payoutUpdateValidator = checkSchema({
  status: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isIn: {
      options: [["PENDING", "PAID", "CANCELLED"]],
      errorMessage: "status must be PENDING, PAID or CANCELLED",
    },
  },
  amount: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    toFloat: true,
    isFloat: {
      options: { min: 0 },
      errorMessage: "amount must be a positive number",
    },
  },
  note: {
    in: ["body"],
    optional: { options: { nullable: true, checkFalsy: true } },
    trim: true,
    isLength: {
      options: { max: 1000 },
      errorMessage: "note must be at most 1000 characters",
    },
  },
});

export const payoutIdParamValidator = checkSchema({
  payoutId: uuidParamValidator("Payout ID"),
});
