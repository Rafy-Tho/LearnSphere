import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import createRandomCode from "../../common/helper/createRadomCode.js";
import emailService from "../../common/services/EmailService.js";
import hashCode from "../../common/services/HashCode.js";
import hashService from "../../common/services/HashService.js";
import User from "../users/repository.js";
import PasswordResetCode from "./repository.js";

const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

const RESET_CODE_TTL_MS = 10 * 60 * 1000;
const MAX_RESET_ATTEMPTS = 5;

export async function registerUser({ name, email, password }) {
  const userExists = await User.findByEmail(email);
  if (userExists) {
    throw new ApiError(StatusCode.BAD_REQUEST, "User already exists");
  }

  const hashedPassword = await hashService.hash(password);
  const user = await User.create({
    email,
    password: hashedPassword,
    name,
    imageUrl: DEFAULT_AVATAR,
  });
  await User.createProfile(user.id);

  return user;
}

export async function authenticate({ email, password }) {
  const user = await User.findByEmail(email);
  if (!user) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
  }

  const isPasswordMatch = await hashService.verify(password, user.password);
  if (!isPasswordMatch) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Invalid credentials");
  }

  await User.updateLastLogin({ userId: user.id, lastLogin: new Date() });
  delete user.password;

  return user;
}

export async function getUserById(userId) {
  return User.findById(userId);
}

export async function getMe(userId) {
  const user = userId ? await User.findById(userId) : null;
  if (user) delete user.password;
  return user;
}

export async function sendResetCode(email) {
  const user = await User.findByEmail(email);
  if (!user) {
    throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
  }

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
  if (!user) {
    throw new ApiError(StatusCode.NOT_FOUND, "User Doesn't Exist");
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
  await User.updatePassword({ userId: user.id, passwordHash });
  await PasswordResetCode.delete(user.id);
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
