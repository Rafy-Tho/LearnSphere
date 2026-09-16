import environment from "../../config/environment.js";
import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import sessionService from "../../common/services/session-service.js";
import authService from "./service.js";
import googleOAuthService from "./google-oauth.service.js";
import { OAUTH_ERROR_CODES, OAuthError } from "./oauth-error.js";

class AuthController {
  constructor({ authService, sessionService, emailService, googleOAuthService }) {
    this.authService = authService;
    this.sessionService = sessionService;
    this.emailService = emailService;
    this.googleOAuthService = googleOAuthService;
  }

  register = asyncHandler(async (req, res) => {
    const { email, password, name } = req.body;

    const { created, user } = await this.authService.registerUser({
      name,
      email,
      password,
    });

    // Never auto-login and never reveal whether the email already existed.
    if (created) {
      await this.authService.sendVerificationCode(user);
      req.session.pendingVerificationUserId = user.id;

      this.emailService
        .sendWelcome(email, name)
        .catch((error) =>
          logger.error("Failed to send welcome email", {
            message: error.message,
          }),
        );
    }

    return sendSuccess(
      res,
      { requiresEmailVerification: true, email },
      {
        statusCode: StatusCode.CREATED,
        message: "Registration successful. Please verify your email.",
      },
    );
  });

  login = asyncHandler(async (req, res) => {
    const { email, password } = req.body;

    const user = await this.authService.authenticate({ email, password });

    // Unverified accounts must verify before an authenticated session exists.
    if (!user.email_verified_at) {
      await this.authService.sendVerificationCode(user);
      req.session.pendingVerificationUserId = user.id;

      return sendSuccess(
        res,
        { requiresEmailVerification: true, email: user.email },
        { message: "Email verification required" },
      );
    }

    await this.sessionService.create(req, user);

    return sendSuccess(
      res,
      { ...user, requiresEmailVerification: false },
      { message: "User logged in successfully" },
    );
  });

  googleLogin = asyncHandler(async (req, res) => {
    try {
      const { url, state, nonce, codeVerifier } =
        await this.googleOAuthService.getAuthorizationUrl();

      // Persist state/nonce/PKCE verifier before leaving the origin so the
      // callback can validate the response (CSRF + replay protection).
      req.session.googleOAuth = { state, nonce, codeVerifier };
      await this.saveSession(req);

      return res.redirect(url);
    } catch (error) {
      logger.error("Google OAuth start failed", { message: error.message });
      return this.redirectToClient(res, {
        status: "error",
        code: OAUTH_ERROR_CODES.GOOGLE_AUTH_FAILED,
      });
    }
  });

  googleCallback = asyncHandler(async (req, res) => {
    const oauthState = req.session.googleOAuth;
    delete req.session.googleOAuth;

    // The user declined the consent screen (or Google returned an error).
    if (req.query.error) {
      logger.audit("auth.google.cancelled");
      return this.redirectToClient(res, {
        status: "error",
        code: OAUTH_ERROR_CODES.OAUTH_CANCELLED,
      });
    }

    if (!oauthState || !req.query.code) {
      logger.audit("auth.google.state_invalid");
      return this.redirectToClient(res, {
        status: "error",
        code: OAUTH_ERROR_CODES.OAUTH_STATE_INVALID,
      });
    }

    try {
      const user = await this.googleOAuthService.handleCallback({
        currentUrl: this.buildCallbackUrl(req),
        state: oauthState.state,
        nonce: oauthState.nonce,
        codeVerifier: oauthState.codeVerifier,
      });

      await this.sessionService.create(req, user);

      return this.redirectToClient(res, { status: "success" });
    } catch (error) {
      if (error instanceof OAuthError) {
        logger.audit("auth.google.failed", { code: error.code });
        return this.redirectToClient(res, {
          status: "error",
          code: error.code,
        });
      }

      logger.error("Google OAuth callback failed", { message: error.message });
      return this.redirectToClient(res, {
        status: "error",
        code: OAUTH_ERROR_CODES.OAUTH_CALLBACK_FAILED,
      });
    }
  });

  saveSession(req) {
    return new Promise((resolve, reject) => {
      req.session.save((error) => (error ? reject(error) : resolve()));
    });
  }

  // Rebuilds the full callback URL (with query) from the configured callback
  // base so the token exchange can validate the authorization response.
  buildCallbackUrl(req) {
    const callbackUrl = new URL(environment.GOOGLE_CALLBACK_URL);
    const queryIndex = req.originalUrl.indexOf("?");
    if (queryIndex !== -1) {
      callbackUrl.search = req.originalUrl.slice(queryIndex);
    }
    return callbackUrl;
  }

  redirectToClient(res, params) {
    const query = new URLSearchParams(params).toString();
    return res.redirect(`${environment.CLIENT_URL_1}/auth/callback?${query}`);
  }

  verifyEmail = asyncHandler(async (req, res) => {
    const { code } = req.body;
    const pendingUserId = req.session.pendingVerificationUserId;

    const user = await this.authService.verifyEmailCode({
      userId: pendingUserId,
      code,
    });

    delete req.session.pendingVerificationUserId;
    await this.sessionService.create(req, user);

    return sendSuccess(
      res,
      { ...user, requiresEmailVerification: false },
      { message: "Email verified successfully" },
    );
  });

  resendVerificationCode = asyncHandler(async (req, res) => {
    const pendingUserId = req.session.pendingVerificationUserId;

    await this.authService.resendVerificationCode(pendingUserId);

    return sendSuccess(res, null, {
      message: "Verification code sent successfully",
    });
  });

  logout = asyncHandler(async (req, res) => {
    const userId = req.session.user.id;

    const user = await this.authService.getUserById(userId);
    if (!user) {
      throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
    }

    await this.sessionService.destroy(req);
    res.clearCookie(environment.COOKIE_NAME);
    logger.audit("auth.logout", { userId });

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
export default new AuthController({
  authService,
  sessionService,
  emailService,
  googleOAuthService,
});
