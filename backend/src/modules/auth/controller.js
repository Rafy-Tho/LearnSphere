import environment from "../../config/environment.js";
import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import sessionService from "../../common/services/session-service.js";
import authService from "./service.js";

class AuthController {
  constructor({ authService, sessionService, emailService }) {
    this.authService = authService;
    this.sessionService = sessionService;
    this.emailService = emailService;
  }

  register = asyncHandler(async (req, res) => {
    const { email, password, name } = req.body;

    const user = await this.authService.registerUser({ name, email, password });
    await this.sessionService.create(req, user);

    this.emailService
      .sendWelcome(email, name)
      .catch((error) =>
        logger.error("Failed to send welcome email", { message: error.message }),
      );

    return sendSuccess(res, user, {
      statusCode: StatusCode.CREATED,
      message: "User registered successfully",
    });
  });

  login = asyncHandler(async (req, res) => {
    const { email, password } = req.body;

    const user = await this.authService.authenticate({ email, password });
    await this.sessionService.create(req, user);

    return sendSuccess(res, user, { message: "User logged in successfully" });
  });

  logout = asyncHandler(async (req, res) => {
    const userId = req.session.user.id;

    const user = await this.authService.getUserById(userId);
    if (!user) {
      throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
    }

    await this.sessionService.destroy(req);
    res.clearCookie(environment.COOKIE_NAME);

    return sendSuccess(res, null, { message: "User logged out successfully" });
  });

  sendPasswordResetCode = asyncHandler(async (req, res) => {
    const { email } = req.body;

    await this.authService.sendResetCode(email);

    return sendSuccess(res, null, {
      message: "Password reset code sent successfully",
    });
  });

  verifyPasswordResetCode = asyncHandler(async (req, res) => {
    const { email, code } = req.body;

    await this.authService.assertValidResetCode({ email, code });

    return sendSuccess(res, null, { message: "Verification successful" });
  });

  resetPassword = asyncHandler(async (req, res) => {
    const { email, code, password } = req.body;

    await this.authService.resetUserPassword({ email, code, password });

    return sendSuccess(res, null, { message: "Password reset successfully" });
  });
}

export { AuthController };
export default new AuthController({ authService, sessionService, emailService });
