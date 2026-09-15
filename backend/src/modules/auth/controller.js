import ENV from "../../config/Env.js";
import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import logger from "../../common/logger.js";
import emailService from "../../common/services/EmailService.js";
import sessionService from "../../common/services/SessionService.js";
import * as authService from "./service.js";

export const register = asyncHandler(async (req, res) => {
  const { email, password, name } = req.body;

  const user = await authService.registerUser({ name, email, password });
  await sessionService.create(req, user);

  emailService
    .sendWelcome(email, name)
    .catch((err) =>
      logger.error("Failed to send welcome email", { message: err.message }),
    );

  return sendSuccess(res, user, {
    statusCode: StatusCode.CREATED,
    message: "User registered successfully",
  });
});

export const login = asyncHandler(async (req, res) => {
  const { email, password } = req.body;

  const user = await authService.authenticate({ email, password });
  await sessionService.create(req, user);

  return sendSuccess(res, user, { message: "User logged in successfully" });
});

export const logout = asyncHandler(async (req, res) => {
  const userId = req.session.user.id;

  const user = await authService.getUserById(userId);
  if (!user) {
    throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
  }

  await sessionService.destroy(req);
  res.clearCookie(ENV.COOKIE_NAME);

  return sendSuccess(res, null, { message: "User logged out successfully" });
});

export const getMe = asyncHandler(async (req, res) => {
  const userId = req.session?.user?.id || null;

  const user = await authService.getMe(userId);

  return sendSuccess(res, user, {
    message: "User info retrieved successfully",
  });
});

export const sendPasswordResetCode = asyncHandler(async (req, res) => {
  const { email } = req.body;

  await authService.sendResetCode(email);

  return sendSuccess(res, null, {
    message: "Password reset code sent successfully",
  });
});

export const verifyPasswordResetCode = asyncHandler(async (req, res) => {
  const { email, code } = req.body;

  await authService.assertValidResetCode({ email, code });

  return sendSuccess(res, null, { message: "Verification successful" });
});

export const resetPassword = asyncHandler(async (req, res) => {
  const { email, code, password } = req.body;

  await authService.resetUserPassword({ email, code, password });

  return sendSuccess(res, null, { message: "Password reset successfully" });
});

export const updatePassword = asyncHandler(async (req, res) => {
  const userId = req.session.user.id;
  const { oldPassword, newPassword } = req.body;

  await authService.changePassword({ userId, oldPassword, newPassword });

  return sendSuccess(res, null, { message: "Password updated successfully" });
});
