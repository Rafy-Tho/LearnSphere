import ApiError from "../../common/errors/api-error.js";

// Stable, non-sensitive codes returned to the frontend OAuth callback page.
// They never include provider responses, tokens or internal error details.
const OAUTH_ERROR_CODES = {
  OAUTH_STATE_INVALID: "OAUTH_STATE_INVALID",
  GOOGLE_AUTH_FAILED: "GOOGLE_AUTH_FAILED",
  GOOGLE_EMAIL_NOT_VERIFIED: "GOOGLE_EMAIL_NOT_VERIFIED",
  GOOGLE_ACCOUNT_ALREADY_LINKED: "GOOGLE_ACCOUNT_ALREADY_LINKED",
  OAUTH_CALLBACK_FAILED: "OAUTH_CALLBACK_FAILED",
  OAUTH_CANCELLED: "OAUTH_CANCELLED",
};

class OAuthError extends ApiError {
  constructor(code, statusCode, message) {
    super(statusCode, message);
    this.name = "OAuthError";
    this.code = code;
  }
}

export { OAUTH_ERROR_CODES, OAuthError };
export default OAuthError;
