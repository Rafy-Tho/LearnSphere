import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import {
  codeAttemptsLimiter,
  loginLimiter,
  passwordResetLimiter,
} from "../../common/middleware/rateLimitMiddlewares.js";
import * as controller from "./controller.js";
import * as validation from "./validation.js";

const authRoute = express.Router();

authRoute.post(
  "/register",
  validation.validateRegister,
  validateResult,
  controller.register,
);
authRoute.post(
  "/login",
  loginLimiter,
  validation.validateLogin,
  validateResult,
  controller.login,
);
authRoute.post("/logout", requireAuth, controller.logout);
authRoute.post(
  "/password-resets",
  passwordResetLimiter,
  validation.validateEmailResetCode,
  validateResult,
  controller.sendPasswordResetCode,
);
authRoute.post(
  "/password-resets/verify",
  codeAttemptsLimiter,
  validation.validateSendResetPasswordCode,
  validateResult,
  controller.verifyPasswordResetCode,
);
authRoute.patch(
  "/password",
  codeAttemptsLimiter,
  validation.validateResetPassword,
  validateResult,
  controller.resetPassword,
);

export default authRoute;
