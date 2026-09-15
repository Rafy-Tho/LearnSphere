import crypto from "crypto";
import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import logger from "../../common/logger.js";
import hashService from "../../common/services/hash-service.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import { withTransaction } from "../../config/database.js";
import authService from "../auth/service.js";
import userRepository from "../users/repository.js";

const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

class AdminUserService {
  constructor({ userRepository, hashService, authService }) {
    this.userRepository = userRepository;
    this.hashService = hashService;
    this.authService = authService;
  }

  async getUsers({ role, page, limit }) {
    const {
      page: currentPage,
      limit: pageSize,
      offset,
    } = parsePagination({ page, limit }, { defaultLimit: 20 });

    const users = await this.userRepository.findAll({
      role,
      limit: pageSize,
      offset,
    });
    const total = await this.userRepository.findAllCount(role);

    return {
      users,
      pagination: buildPagination({ total, page: currentPage, limit: pageSize }),
    };
  }

  async createUser({ name, email, role, status }) {
    if (!name || !email) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Name and email are required");
    }

    const existingUser = await this.userRepository.findByEmail(email);
    if (existingUser) {
      throw new ApiError(
        StatusCode.BAD_REQUEST,
        "User with this email already exists",
      );
    }

    // Random unguessable password; the user sets their own via the invite below.
    const randomPassword = crypto.randomBytes(32).toString("hex");
    const hashedPassword = await this.hashService.hash(randomPassword);

    const user = await withTransaction(async (client) => {
      const createdUser = await this.userRepository.create(
        { name, email, password: hashedPassword, imageUrl: DEFAULT_AVATAR },
        client,
      );

      // create defaults to LEARNER/ACTIVE; override if provided
      if (role || status) {
        await this.userRepository.updateById(
          {
            id: createdUser.id,
            name: createdUser.name,
            email: createdUser.email,
            role: role || createdUser.role,
            status: status || createdUser.status,
          },
          client,
        );
      }

      await this.userRepository.createProfile(createdUser.id, client);

      return createdUser;
    });

    logger.audit("admin.user.create", {
      userId: user.id,
      role: role || user.role,
      status: status || user.status,
    });

    // Invite: send a password-reset code so the user can set their own password.
    try {
      await this.authService.sendResetCode(email);
    } catch (error) {
      logger.error("Failed to send admin invite", { message: error.message });
    }

    return user;
  }

  async updateUser(userId, userData) {
    const existingUser = await this.userRepository.findById(userId);
    if (!existingUser) {
      throw new ApiError(StatusCode.NOT_FOUND, "User not found");
    }

    const updatedUser = await this.userRepository.updateById({
      id: userId,
      name: userData.name || existingUser.name,
      email: userData.email || existingUser.email,
      role: userData.role || existingUser.role,
      status: userData.status || existingUser.status,
    });

    logger.audit("admin.user.update", {
      userId,
      role: updatedUser.role,
      status: updatedUser.status,
    });

    return updatedUser;
  }

  async deleteUser(userId) {
    const existingUser = await this.userRepository.findById(userId);
    if (!existingUser) {
      throw new ApiError(StatusCode.NOT_FOUND, "User not found");
    }

    await this.userRepository.deleteById(userId);
    logger.audit("admin.user.delete", { userId });
  }
}

export { AdminUserService };
export default new AdminUserService({
  userRepository,
  hashService,
  authService,
});
