const API_BASE_URL = import.meta.env.VITE_BASE_URL;

// Backend-driven OAuth: the browser is redirected to the API, which owns the
// Google client secret and the authorization-code exchange.
export function startGoogleLogin() {
  window.location.href = `${API_BASE_URL}/auth/google`;
}

const OAUTH_ERROR_MESSAGES = {
  OAUTH_STATE_INVALID:
    "Your sign-in session expired or was invalid. Please try again.",
  GOOGLE_AUTH_FAILED: "We couldn't sign you in with Google. Please try again.",
  GOOGLE_EMAIL_NOT_VERIFIED:
    "Your Google email is not verified, so it can't be used to sign in.",
  GOOGLE_ACCOUNT_ALREADY_LINKED:
    "This Google account is already linked to another user.",
  OAUTH_CALLBACK_FAILED:
    "Something went wrong during Google sign-in. Please try again.",
  OAUTH_CANCELLED: "Google sign-in was cancelled.",
};

export function getOAuthErrorMessage(code) {
  return (
    OAUTH_ERROR_MESSAGES[code] || "Google sign-in failed. Please try again."
  );
}
