import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import createRandomCode from "../../common/helper/createRadomCode.js";
import emailService from "../../common/services/EmailService.js";
import hashCode from "../../common/services/HashCode.js";
import hashService from "../../common/services/HashService.js";
import { withTransaction } from "../../config/database.js";
import User from "../users/repository.js";
import PasswordResetCode from "./repository.js";

const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

const RESET_CODE_TTL_MS = 10 * 60 * 1000;
const MAX_RESET_ATTEMPTS = 5;

// Constant-time equalizer: compared against when the user is missing so login
// response time does not reveal whether an account exists.
const DUMMY_PASSWORD_HASH =
  "$2b$12$UQHWK5enHifqm5uTqj/eGu1qrGVmgz2tRuquLxuuTDHj/fprC9sVy";

export async function registerUser({ name, email, password }) {
  const userExists = await User.findByEmail(email);
  if (userExists) {
    throw new ApiError(StatusCode.CONFLICT, "Email already registered");
  }

  const hashedPassword = await hashService.hash(password);

  return withTransaction(async (client) => {
    const user = await User.create(
      { email, password: hashedPassword, name, imageUrl: DEFAULT_AVATAR },
      client,
    );
    await User.createProfile(user.id, client);
    return user;
  });
}

export async function authenticate({ email, password }) {
  const user = await User.findByEmail(email);

  if (!user) {
    await hashService.verify(password, DUMMY_PASSWORD_HASH);
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
  }

  const isPasswordMatch = await hashService.verify(password, user.password);
  if (!isPasswordMatch) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
  }

  if (user.status !== "ACTIVE") {
    throw new ApiError(StatusCode.FORBIDDEN, "Account is not active");
  }

  await User.updateLastLogin({ userId: user.id, lastLogin: new Date() });
  delete user.password;

  return user;
}

export async function getUserById(userId) {
  const user = await User.findById(userId);
  if (user) delete user.password;
  return user;
}

export async function sendResetCode(email) {
  const user = await User.findByEmail(email);
  // Do not reveal whether the email is registered.
  if (!user) return;

  await PasswordResetCode.delete(user.id);

  const code = createRandomCode();
  const expiresAt = new Date(Date.now() + RESET_CODE_TTL_MS);

  await PasswordResetCode.create({
    code: hashCode(code),
    userId: user.id,
    expiresAt,
  });

  await emailService.sendResetCode(email, code);
}

export async function assertValidResetCode({ email, code }) {
  const user = await User.findByEmail(email);
  // Generic error to avoid revealing whether the email is registered.
  if (!user) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid or expired code");
  }

  const attempt = await PasswordResetCode.incrementAttempt(user.id);
  if (attempt > MAX_RESET_ATTEMPTS) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Too many attempts");
  }

  const codeExist = await PasswordResetCode.findCode({
    code: hashCode(code),
    userId: user.id,
  });
  if (!codeExist) {
    throw new ApiError(StatusCode.NOT_FOUND, "Code Doesn't Exist");
  }

  if (codeExist.expires_at < new Date()) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Code expired");
  }

  return user;
}

export async function resetUserPassword({ email, code, password }) {
  const user = await assertValidResetCode({ email, code });

  const passwordHash = await hashService.hash(password);
  await withTransaction(async (client) => {
    await User.updatePassword({ userId: user.id, passwordHash }, client);
    await PasswordResetCode.delete(user.id, client);
  });
}

export async function changePassword({ userId, oldPassword, newPassword }) {
  const user = await User.findById(userId);
  if (!user) {
    throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
  }

  const isMatch = await hashService.verify(oldPassword, user.password);
  if (!isMatch) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
  }

  const passwordHash = await hashService.hash(newPassword);
  await User.updatePassword({ userId, passwordHash });
}
