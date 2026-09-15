import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import createRandomCode from "../../common/helper/create-random-code.js";
import emailService from "../../common/services/email-service.js";
import hashCode from "../../common/services/hash-code.js";
import hashService from "../../common/services/hash-service.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";
import passwordResetCodeRepository from "./repository.js";

const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

const RESET_CODE_TTL_MS = 10 * 60 * 1000;
const MAX_RESET_ATTEMPTS = 5;

// Constant-time equalizer: compared against when the user is missing so login
// response time does not reveal whether an account exists.
const DUMMY_PASSWORD_HASH =
  "$2b$12$UQHWK5enHifqm5uTqj/eGu1qrGVmgz2tRuquLxuuTDHj/fprC9sVy";

class AuthService {
  constructor({
    userRepository,
    passwordResetCodeRepository,
    hashService,
    emailService,
  }) {
    this.userRepository = userRepository;
    this.passwordResetCodeRepository = passwordResetCodeRepository;
    this.hashService = hashService;
    this.emailService = emailService;
  }

  async registerUser({ name, email, password }) {
    const existingUser = await this.userRepository.findByEmail(email);
    if (existingUser) {
      throw new ApiError(StatusCode.CONFLICT, "Email already registered");
    }

    const hashedPassword = await this.hashService.hash(password);

    return withTransaction(async (client) => {
      const user = await this.userRepository.create(
        { email, password: hashedPassword, name, imageUrl: DEFAULT_AVATAR },
        client,
      );
      await this.userRepository.createProfile(user.id, client);
      return user;
    });
  }

  async authenticate({ email, password }) {
    const user = await this.userRepository.findByEmail(email);

    if (!user) {
      await this.hashService.verify(password, DUMMY_PASSWORD_HASH);
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    const isPasswordMatch = await this.hashService.verify(
      password,
      user.password,
    );
    if (!isPasswordMatch) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    if (user.status !== "ACTIVE") {
      throw new ApiError(StatusCode.FORBIDDEN, "Account is not active");
    }

    await this.userRepository.updateLastLogin({
      userId: user.id,
      lastLogin: new Date(),
    });
    delete user.password;

    return user;
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
    });
  }

  async changePassword({ userId, oldPassword, newPassword }) {
    const user = await this.userRepository.findById(userId);
    if (!user) {
      throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
    }

    const isMatch = await this.hashService.verify(oldPassword, user.password);
    if (!isMatch) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
    }

    const passwordHash = await this.hashService.hash(newPassword);
    await this.userRepository.updatePassword({ userId, passwordHash });
  }
}

export { AuthService };
export default new AuthService({
  userRepository,
  passwordResetCodeRepository,
  hashService,
  emailService,
});
