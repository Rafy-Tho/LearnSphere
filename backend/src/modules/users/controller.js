import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as authService from "../auth/service.js";
import * as usersService from "./service.js";

export const getMe = asyncHandler(async (req, res) => {
  const userId = req.session?.user?.id || null;

  const user = await usersService.getMe(userId);

  return sendSuccess(res, user, {
    message: "User info retrieved successfully",
  });
});

export const getProfile = asyncHandler(async (req, res) => {
  const user = await usersService.getProfile(req.session.user.id);

  return sendSuccess(res, user, {
    message: "User info retrieved successfully",
  });
});

export const updateProfile = asyncHandler(async (req, res) => {
  const data = await usersService.updateProfile({
    userId: req.session.user.id,
    data: req.body,
    imageFile: req.file,
  });

  return sendSuccess(res, data, { message: "User info updated successfully" });
});

export const getXpEarning = asyncHandler(async (req, res) => {
  const earning = await usersService.getXpEarning(req.session.user.id);

  return sendSuccess(res, earning, {
    message: "Earning retrieved successfully",
  });
});

export const updatePassword = asyncHandler(async (req, res) => {
  const userId = req.session.user.id;
  const { oldPassword, newPassword } = req.body;

  await authService.changePassword({ userId, oldPassword, newPassword });

  return sendSuccess(res, null, { message: "Password updated successfully" });
});
