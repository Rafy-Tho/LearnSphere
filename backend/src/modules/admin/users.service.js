import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import hashService from "../../common/services/HashService.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import { withTransaction } from "../../config/database.js";
import User from "../users/repository.js";

// TODO(security): replace the hardcoded temporary password with an invite flow (audit P0-9).
const TEMP_PASSWORD = "TempPassword123!";
const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

export async function getUsers({ role, page, limit }) {
  const {
    page: currentPage,
    limit: pageSize,
    offset,
  } = parsePagination({ page, limit }, { defaultLimit: 20 });

  const users = await User.findAll({ role, limit: pageSize, offset });
  const total = await User.findAllCount(role);

  return {
    users,
    pagination: buildPagination({ total, page: currentPage, limit: pageSize }),
  };
}

export async function createUser({ name, email, role, status }) {
  if (!name || !email) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Name and email are required");
  }

  const existing = await User.findByEmail(email);
  if (existing) {
    throw new ApiError(
      StatusCode.BAD_REQUEST,
      "User with this email already exists",
    );
  }

  const hashedPassword = await hashService.hash(TEMP_PASSWORD);

  return withTransaction(async (client) => {
    const user = await User.create(
      { name, email, password: hashedPassword, imageUrl: DEFAULT_AVATAR },
      client,
    );

    // create defaults to LEARNER/ACTIVE; override if provided
    if (role || status) {
      await User.updateById(
        {
          id: user.id,
          name: user.name,
          email: user.email,
          role: role || user.role,
          status: status || user.status,
        },
        client,
      );
    }

    await User.createProfile(user.id, client);

    return user;
  });
}

export async function updateUser(userId, body) {
  const existing = await User.findById(userId);
  if (!existing) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  return User.updateById({
    id: userId,
    name: body.name || existing.name,
    email: body.email || existing.email,
    role: body.role || existing.role,
    status: body.status || existing.status,
  });
}

export async function deleteUser(userId) {
  const existing = await User.findById(userId);
  if (!existing) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  await User.deleteById(userId);
}
