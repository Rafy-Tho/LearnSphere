import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as usersService from "./service.js";

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
