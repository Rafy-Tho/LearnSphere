import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import hashService from "../../common/services/hash-service.js";
import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import { withTransaction } from "../../config/database.js";
import userRepository from "../users/repository.js";

// TODO(security): replace the hardcoded temporary password with an invite flow (audit P0-9).
const TEMPORARY_PASSWORD = "TempPassword123!";
const DEFAULT_AVATAR =
  "https://res.cloudinary.com/dmuu7x5vm/image/upload/v1775903021/men_oquwmw.jpg";

class AdminUserService {
  constructor({ userRepository, hashService }) {
    this.userRepository = userRepository;
    this.hashService = hashService;
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

    const hashedPassword = await this.hashService.hash(TEMPORARY_PASSWORD);

    return withTransaction(async (client) => {
      const user = await this.userRepository.create(
        { name, email, password: hashedPassword, imageUrl: DEFAULT_AVATAR },
        client,
      );

      // create defaults to LEARNER/ACTIVE; override if provided
      if (role || status) {
        await this.userRepository.updateById(
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

      await this.userRepository.createProfile(user.id, client);

      return user;
    });
  }

  async updateUser(userId, userData) {
    const existingUser = await this.userRepository.findById(userId);
    if (!existingUser) {
      throw new ApiError(StatusCode.NOT_FOUND, "User not found");
    }

    return this.userRepository.updateById({
      id: userId,
      name: userData.name || existingUser.name,
      email: userData.email || existingUser.email,
      role: userData.role || existingUser.role,
      status: userData.status || existingUser.status,
    });
  }

  async deleteUser(userId) {
    const existingUser = await this.userRepository.findById(userId);
    if (!existingUser) {
      throw new ApiError(StatusCode.NOT_FOUND, "User not found");
    }

    await this.userRepository.deleteById(userId);
  }
}

export { AdminUserService };
export default new AdminUserService({ userRepository, hashService });
