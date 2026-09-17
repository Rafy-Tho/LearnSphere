import environment from "../../config/environment.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import sessionService from "../../common/services/session-service.js";
import authService from "../auth/service.js";
import userService from "./service.js";

class UserController {
  constructor({ userService, authService, sessionService }) {
    this.userService = userService;
    this.authService = authService;
    this.sessionService = sessionService;
  }

  getMe = asyncHandler(async (req, res) => {
    const userId = req.session?.user?.id || null;

    const user = await this.userService.getMe(userId);

    return sendSuccess(res, user, {
      message: "User info retrieved successfully",
    });
  });

  getProfile = asyncHandler(async (req, res) => {
    const user = await this.userService.getProfile(req.session.user.id);

    return sendSuccess(res, user, {
      message: "User info retrieved successfully",
    });
  });

  updateProfile = asyncHandler(async (req, res) => {
    const updatedProfile = await this.userService.updateProfile({
      userId: req.session.user.id,
      profileData: req.body,
      imageFile: req.file,
    });

    return sendSuccess(res, updatedProfile, {
      message: "User info updated successfully",
    });
  });

  updatePassword = asyncHandler(async (req, res) => {
    const userId = req.session.user.id;
    const { oldPassword, newPassword } = req.body;

    await this.authService.changePassword({ userId, oldPassword, newPassword });

    // All sessions (including this one) were invalidated; clear the current
    // cookie so it is not re-persisted by the rolling session.
    await this.sessionService.destroy(req);
    res.clearCookie(environment.COOKIE_NAME);

    return sendSuccess(res, null, { message: "Password updated successfully" });
  });
}

export { UserController };
export default new UserController({ userService, authService, sessionService });
