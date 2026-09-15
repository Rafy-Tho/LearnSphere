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

// Public
authRoute.post("/register", validation.validateRegister, validateResult, controller.register);
authRoute.post(
  "/login",
  loginLimiter,
  validation.validateLogin,
  validateResult,
  controller.login,
);
authRoute.get("/me", controller.getMe);
authRoute.post(
  "/password-reset-code",
  passwordResetLimiter,
  validation.validateEmailResetCode,
  validateResult,
  controller.sendPasswordResetCode,
);
authRoute.post(
  "/verify-password-reset-code",
  codeAttemptsLimiter,
  validation.validateSendResetPasswordCode,
  validateResult,
  controller.verifyPasswordResetCode,
);
authRoute.post(
  "/reset-password",
  codeAttemptsLimiter,
  validation.validateResetPassword,
  validateResult,
  controller.resetPassword,
);

// Private
authRoute.post("/logout", requireAuth, controller.logout);
authRoute.patch(
  "/update-password",
  requireAuth,
  validation.validateUpdatePassword,
  validateResult,
  controller.updatePassword,
);

export default authRoute;
