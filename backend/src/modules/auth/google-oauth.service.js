import {
  randomNonce,
  randomPKCECodeVerifier,
  randomState,
} from "openid-client";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import { withTransaction } from "../../config/database.js";
import {
  buildGoogleAuthorizationUrl,
  exchangeGoogleCode,
  isGoogleOAuthConfigured,
} from "../../config/google-oauth.js";
import userRepository from "../users/repository.js";
import authProviderRepository from "./auth-provider.repository.js";
import { OAUTH_ERROR_CODES, OAuthError } from "./oauth-error.js";

const GOOGLE_PROVIDER = "GOOGLE";
const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

class GoogleOAuthService {
  constructor({
    userRepository,
    authProviderRepository,
    buildAuthorizationUrl,
    exchangeCode,
    isConfigured,
  }) {
    this.userRepository = userRepository;
    this.authProviderRepository = authProviderRepository;
    this.buildAuthorizationUrl = buildAuthorizationUrl;
    this.exchangeCode = exchangeCode;
    this.isConfigured = isConfigured;
  }

  // Generates the CSRF state, OIDC nonce and PKCE verifier that the caller
  // stores in the session until the callback returns.
  async getAuthorizationUrl() {
    const state = randomState();
    const nonce = randomNonce();
    const codeVerifier = randomPKCECodeVerifier();

    const url = await this.buildAuthorizationUrl({
      state,
      nonce,
      codeVerifier,
    });

    return { url: url.href, state, nonce, codeVerifier };
  }

  // Resolves the verified Google identity to an application user, linking or
  // creating an account when appropriate. Throws OAuthError on policy failures.
  async handleCallback({ currentUrl, state, nonce, codeVerifier }) {
    const tokens = await this.exchangeCode({
      currentUrl,
      state,
      nonce,
      codeVerifier,
    });

    const claims = tokens.claims();
    const providerUserId = claims?.sub;
    const providerEmail = claims?.email;

    if (!providerUserId || !providerEmail) {
      throw new OAuthError(
        OAUTH_ERROR_CODES.GOOGLE_AUTH_FAILED,
        StatusCode.UNAUTHORIZED,
        "Could not read the Google account",
      );
    }

    // Never link an unverified Google email to an existing account.
    if (claims.email_verified !== true) {
      throw new OAuthError(
        OAUTH_ERROR_CODES.GOOGLE_EMAIL_NOT_VERIFIED,
        StatusCode.FORBIDDEN,
        "Google email is not verified",
      );
    }

    // Case A: this Google identity is already linked.
    const existingLink = await this.authProviderRepository.findByProvider({
      provider: GOOGLE_PROVIDER,
      providerUserId,
    });
    if (existingLink) {
      return this.loginExistingLink(existingLink.user_id);
    }

    // Case B: the email already belongs to an application user.
    const existingUser = await this.userRepository.findByEmail(providerEmail);
    if (existingUser) {
      return this.linkToExistingUser({
        user: existingUser,
        providerUserId,
        providerEmail,
      });
    }

    // Case C: brand new user.
    return this.createGoogleUser({
      providerUserId,
      providerEmail,
      name: claims.name,
      imageUrl: claims.picture,
    });
  }

  async loginExistingLink(userId) {
    const user = await this.userRepository.findById(userId);
    if (!user) {
      throw new OAuthError(
        OAUTH_ERROR_CODES.GOOGLE_AUTH_FAILED,
        StatusCode.UNAUTHORIZED,
        "Linked account no longer exists",
      );
    }

    await this.userRepository.updateLastLogin({
      userId: user.id,
      lastLogin: new Date(),
    });

    logger.audit("auth.google.login", { userId: user.id });
    delete user.password;
    return user;
  }

  async linkToExistingUser({ user, providerUserId, providerEmail }) {
    // Case D: never move a Google identity between users.
    const userLink = await this.authProviderRepository.findByUserAndProvider({
      userId: user.id,
      provider: GOOGLE_PROVIDER,
    });
    if (userLink && userLink.provider_user_id !== providerUserId) {
      throw new OAuthError(
        OAUTH_ERROR_CODES.GOOGLE_ACCOUNT_ALREADY_LINKED,
        StatusCode.CONFLICT,
        "A different Google account is already linked to this user",
      );
    }

    await withTransaction(async (client) => {
      if (!userLink) {
        await this.authProviderRepository.create(
          {
            userId: user.id,
            provider: GOOGLE_PROVIDER,
            providerUserId,
            providerEmail,
          },
          client,
        );
      }

      // Trust Google's verified email to satisfy app verification.
      if (!user.email_verified_at) {
        await this.userRepository.markEmailVerified(user.id, client);
      }

      await this.userRepository.updateLastLogin(
        { userId: user.id, lastLogin: new Date() },
        client,
      );
    });

    logger.audit("auth.google.link", { userId: user.id });
    const linkedUser = await this.userRepository.findById(user.id);
    delete linkedUser.password;
    return linkedUser;
  }

  async createGoogleUser({ providerUserId, providerEmail, name, imageUrl }) {
    const user = await withTransaction(async (client) => {
      const createdUser = await this.userRepository.createOAuthUser(
        {
          email: providerEmail,
          name: name || providerEmail,
          imageUrl: imageUrl || DEFAULT_AVATAR,
        },
        client,
      );

      await this.userRepository.createProfile(createdUser.id, client);
      await this.authProviderRepository.create(
        {
          userId: createdUser.id,
          provider: GOOGLE_PROVIDER,
          providerUserId,
          providerEmail,
        },
        client,
      );

      return createdUser;
    });

    logger.audit("auth.google.register", { userId: user.id });
    return user;
  }
}

export { GoogleOAuthService };
export default new GoogleOAuthService({
  userRepository,
  authProviderRepository,
  buildAuthorizationUrl: buildGoogleAuthorizationUrl,
  exchangeCode: exchangeGoogleCode,
  isConfigured: isGoogleOAuthConfigured,
});
