import { validationResult } from "express-validator";
import ApiError from "../errors/api-error.js";
import StatusCode from "../constants/status-code.js";

export const validateResult = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    const messages = errors.array()[0].msg;
    return next(new ApiError(StatusCode.VALIDATION_ERROR, messages));
  }
  next();
};
