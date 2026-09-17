import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import createRandomCode from "../../common/helper/create-random-code.js";
import logger from "../../common/logger.js";
import emailService from "../../common/services/email-service.js";
import hashCode from "../../common/services/hash-code.js";
import hashService from "../../common/services/hash-service.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import passwordResetCodeRepository from "./repository.js";
import emailVerificationCodeRepository from "./email-verification.repository.js";
import sessionRepository from "./session.repository.js";

const RESET_CODE_TTL_MS = 10 * 60 * 1000;
const MAX_RESET_ATTEMPTS = 5;
const EMAIL_VERIFICATION_TTL_MS = 10 * 60 * 1000;
const MAX_EMAIL_VERIFICATION_ATTEMPTS = 5;
const MAX_LOGIN_ATTEMPTS = 5;
const LOCK_DURATION_MINUTES = 15;

// Constant-time equalizer: compared against when the user is missing so login
// response time does not reveal whether an account exists.
const DUMMY_PASSWORD_HASH =
  "$2b$12$UQHWK5enHifqm5uTqj/eGu1qrGVmgz2tRuquLxuuTDHj/fprC9sVy";

class AuthService {
  constructor({
    userRepository,
    passwordResetCodeRepository,
    emailVerificationCodeRepository,
    sessionRepository,
    hashService,
    emailService,
  }) {
    this.userRepository = userRepository;
    this.passwordResetCodeRepository = passwordResetCodeRepository;
    this.emailVerificationCodeRepository = emailVerificationCodeRepository;
    this.sessionRepository = sessionRepository;
    this.hashService = hashService;
    this.emailService = emailService;
  }

  async registerUser({ name, email, password }) {
    const existingUser = await this.userRepository.findByEmail(email);
    if (existingUser) {
      // Do not reveal account existence: return the same shape as a new signup.
      logger.audit("auth.register.duplicate");
      return { created: false, user: null };
    }

    const hashedPassword = await this.hashService.hash(password);

    const user = await withTransaction(async (client) => {
      const createdUser = await this.userRepository.create(
        { email, password: hashedPassword, name, imageUrl: null },
        client,
      );
      await this.userRepository.createProfile(createdUser.id, client);
      return createdUser;
    });

    logger.audit("auth.register", { userId: user.id });
    return { created: true, user };
  }

  async authenticate({ email, password }) {
    const user = await this.userRepository.findByEmail(email);

    if (!user) {
      await this.hashService.verify(password, DUMMY_PASSWORD_HASH);
      logger.audit("auth.login.failed", { reason: "unknown_user" });
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    // Provider-only accounts (e.g. Google) have no password; reject password
    // login with the same generic error and comparable timing.
    if (!user.password) {
      await this.hashService.verify(password, DUMMY_PASSWORD_HASH);
      logger.audit("auth.login.failed", { reason: "no_password" });
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    // Locked accounts are rejected without verifying the password; the response
    // stays generic so it does not reveal account state.
    if (this.isLocked(user)) {
      logger.audit("auth.login.locked", { userId: user.id });
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    const isPasswordMatch = await this.hashService.verify(
      password,
      user.password,
    );
    if (!isPasswordMatch) {
      await this.userRepository.recordFailedLogin({
        userId: user.id,
        maxAttempts: MAX_LOGIN_ATTEMPTS,
        lockMinutes: LOCK_DURATION_MINUTES,
      });
      logger.audit("auth.login.failed", { userId: user.id });
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    if (user.status !== "ACTIVE") {
      logger.audit("auth.login.inactive", {
        userId: user.id,
        status: user.status,
      });
      throw new ApiError(StatusCode.FORBIDDEN, "Account is not active");
    }

    await this.userRepository.resetFailedLogin(user.id);
    await this.userRepository.updateLastLogin({
      userId: user.id,
      lastLogin: new Date(),
    });
    logger.audit("auth.login.success", { userId: user.id });
    delete user.password;

    return user;
  }

  isLocked(user) {
    if (!user.locked_until) return false;
    return new Date(user.locked_until).getTime() > Date.now();
  }

  // Invalidate any previous code, generate + store a new hashed code and email
  // it. Email failures are logged but never fail the auth flow (resend exists).
  async sendVerificationCode(user) {
    await this.emailVerificationCodeRepository.deleteByUserId(user.id);

    const code = createRandomCode();
    const expiresAt = new Date(Date.now() + EMAIL_VERIFICATION_TTL_MS);

    await this.emailVerificationCodeRepository.create({
      code: hashCode(code),
      userId: user.id,
      expiresAt,
    });

    try {
      await this.emailService.sendVerificationCode(user.email, code);
    } catch (error) {
      logger.error("Failed to send verification email", {
        message: error.message,
        userId: user.id,
      });
    }

    logger.audit("auth.email_verification.sent", { userId: user.id });
  }

  async verifyEmailCode({ userId, code }) {
    // No pending verification in the session: stay generic.
    if (!userId) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
    }

    const attemptCount =
      await this.emailVerificationCodeRepository.incrementAttempt(userId);
    if (attemptCount > MAX_EMAIL_VERIFICATION_ATTEMPTS) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Too many attempts");
    }

    const existingCode =
      await this.emailVerificationCodeRepository.findLatestByUserId(userId);
    if (!existingCode) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
    }

    if (existingCode.expires_at < new Date()) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Code expired");
    }

    if (existingCode.code !== hashCode(code)) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
    }

    const user = await withTransaction(async (client) => {
      const verifiedUser = await this.userRepository.markEmailVerified(
        userId,
        client,
      );
      await this.emailVerificationCodeRepository.deleteByUserId(userId, client);
      return verifiedUser;
    });

    if (!user) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
    }

    logger.audit("auth.email_verification.verified", { userId });
    return user;
  }

  async resendVerificationCode(userId) {
    // Do not reveal account state; silently no-op for unknown/verified users.
    if (!userId) return;

    const user = await this.userRepository.findById(userId);
    if (!user || user.email_verified_at) return;

    await this.sendVerificationCode(user);
  }

  async getUserById(userId) {
    const user = await this.userRepository.findById(userId);
    if (user) delete user.password;
    return user;
  }

  async sendResetCode(email) {
    const user = await this.userRepository.findByEmail(email);
    // Do not reveal whether the email is registered.
    if (!user) return;

    await this.passwordResetCodeRepository.delete(user.id);

    const code = createRandomCode();
    const expiresAt = new Date(Date.now() + RESET_CODE_TTL_MS);

    await this.passwordResetCodeRepository.create({
      code: hashCode(code),
      userId: user.id,
      expiresAt,
    });

    await this.emailService.sendResetCode(email, code);
    logger.audit("auth.password.reset_requested", { userId: user.id });
  }

  async assertValidResetCode({ email, code }) {
    const user = await this.userRepository.findByEmail(email);
    // Generic error to avoid revealing whether the email is registered.
    if (!user) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
    }

    const attemptCount =
      await this.passwordResetCodeRepository.incrementAttempt(user.id);
    if (attemptCount > MAX_RESET_ATTEMPTS) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Too many attempts");
    }

    const existingCode = await this.passwordResetCodeRepository.findCode({
      code: hashCode(code),
      userId: user.id,
    });
    if (!existingCode) {
      throw new ApiError(StatusCode.NOT_FOUND, "Code Doesn't Exist");
    }

    if (existingCode.expires_at < new Date()) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Code expired");
    }

    return user;
  }

  async resetUserPassword({ email, code, password }) {
    const user = await this.assertValidResetCode({ email, code });

    const passwordHash = await this.hashService.hash(password);
    await withTransaction(async (client) => {
      await this.userRepository.updatePassword(
        { userId: user.id, passwordHash },
        client,
      );
      await this.passwordResetCodeRepository.delete(user.id, client);
      await this.sessionRepository.deleteByUserId(user.id, client);
    });
    logger.audit("auth.password.reset", { userId: user.id });
  }

  async changePassword({ userId, oldPassword, newPassword }) {
    const user = await this.userRepository.findById(userId);
    if (!user) {
      throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
    }

    // Provider-only accounts have no password to change.
    if (!user.password) {
      throw new ApiError(StatusCode.BAD_REQUEST, "No password set for this account");
    }

    const isMatch = await this.hashService.verify(oldPassword, user.password);
    if (!isMatch) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    const passwordHash = await this.hashService.hash(newPassword);
    await this.userRepository.updatePassword({ userId, passwordHash });
    await this.sessionRepository.deleteByUserId(userId);
    logger.audit("auth.password.change", { userId });
  }
}

export { AuthService };
export default new AuthService({
  userRepository,
  passwordResetCodeRepository,
  emailVerificationCodeRepository,
  sessionRepository,
  hashService,
  emailService,
});
