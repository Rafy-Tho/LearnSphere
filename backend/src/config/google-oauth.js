import * as client from "openid-client";
import ApiError from "../common/errors/api-error.js";
import StatusCode from "../common/constants/status-code.js";
import environment from "./environment.js";

// Google's OpenID Connect issuer. Metadata (authorization/token/jwks endpoints)
// is discovered once and cached for the process lifetime.
const GOOGLE_ISSUER = new URL("https://accounts.google.com");
const GOOGLE_SCOPES = "openid email profile";

let configurationPromise = null;

function assertConfigured() {
  const missing = [
    "GOOGLE_CLIENT_ID",
    "GOOGLE_CLIENT_SECRET",
    "GOOGLE_CALLBACK_URL",
  ].filter((key) => !environment[key]);

  if (missing.length > 0) {
    throw new ApiError(
      StatusCode.INTERNAL_SERVER_ERROR,
      "Google login is not configured",
    );
  }
}

export function isGoogleOAuthConfigured() {
  return Boolean(
    environment.GOOGLE_CLIENT_ID &&
      environment.GOOGLE_CLIENT_SECRET &&
      environment.GOOGLE_CALLBACK_URL,
  );
}

export async function getGoogleConfiguration() {
  assertConfigured();

  if (!configurationPromise) {
    configurationPromise = client
      .discovery(
        GOOGLE_ISSUER,
        environment.GOOGLE_CLIENT_ID,
        environment.GOOGLE_CLIENT_SECRET,
      )
      .catch((error) => {
        // Do not cache a failed discovery; allow a later request to retry.
        configurationPromise = null;
        throw error;
      });
  }

  return configurationPromise;
}

export async function buildGoogleAuthorizationUrl({
  state,
  nonce,
  codeVerifier,
}) {
  const configuration = await getGoogleConfiguration();
  const codeChallenge = await client.calculatePKCECodeChallenge(codeVerifier);

  return client.buildAuthorizationUrl(configuration, {
    redirect_uri: environment.GOOGLE_CALLBACK_URL,
    scope: GOOGLE_SCOPES,
    state,
    nonce,
    code_challenge: codeChallenge,
    code_challenge_method: "S256",
    prompt: "select_account",
  });
}

// Validates `state`, PKCE and the ID token (signature, issuer, audience,
// expiry, nonce) and exchanges the authorization code for tokens.
export async function exchangeGoogleCode({
  currentUrl,
  state,
  nonce,
  codeVerifier,
}) {
  const configuration = await getGoogleConfiguration();

  return client.authorizationCodeGrant(configuration, currentUrl, {
    expectedState: state,
    expectedNonce: nonce,
    pkceCodeVerifier: codeVerifier,
    idTokenExpected: true,
  });
}

export { client as openidClient };
