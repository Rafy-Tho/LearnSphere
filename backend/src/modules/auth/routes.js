import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import {
  codeAttemptsLimiter,
  loginLimiter,
  passwordResetLimiter,
} from "../../common/middleware/rate-limit-middlewares.js";
import authController from "./controller.js";
import * as validation from "./validation.js";

const authRoute = express.Router();

authRoute.post(
  "/register",
  validation.validateRegister,
  validateResult,
  authController.register,
);
authRoute.post(
  "/login",
  loginLimiter,
  validation.validateLogin,
  validateResult,
  authController.login,
);
authRoute.post("/logout", requireAuth, authController.logout);
authRoute.post(
  "/password-resets",
  passwordResetLimiter,
  validation.validateEmailResetCode,
  validateResult,
  authController.sendPasswordResetCode,
);
authRoute.post(
  "/password-resets/verify",
  codeAttemptsLimiter,
  validation.validateSendResetPasswordCode,
  validateResult,
  authController.verifyPasswordResetCode,
);
authRoute.patch(
  "/password",
  codeAttemptsLimiter,
  validation.validateResetPassword,
  validateResult,
  authController.resetPassword,
);

export default authRoute;
