import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import adminUserService from "./admin-user.service.js";

class AdminUserController {
  constructor({ adminUserService }) {
    this.adminUserService = adminUserService;
  }

  getUsers = asyncHandler(async (req, res) => {
    const { users, pagination } = await this.adminUserService.getUsers(
      req.query,
    );

    return sendSuccess(res, users, {
      message: "Users retrieved successfully",
      pagination,
    });
  });

  createUser = asyncHandler(async (req, res) => {
    const user = await this.adminUserService.createUser(req.body);

    return sendSuccess(res, user, {
      statusCode: StatusCode.CREATED,
      message: "User created successfully",
    });
  });

  updateUser = asyncHandler(async (req, res) => {
    const user = await this.adminUserService.updateUser(
      req.params.userId,
      req.body,
    );

    return sendSuccess(res, user, { message: "User updated successfully" });
  });

  setPassword = asyncHandler(async (req, res) => {
    await this.adminUserService.setPassword(
      req.params.userId,
      req.body.newPassword,
    );

    return sendSuccess(res, null, {
      message: "Password updated successfully",
    });
  });

  deleteUser = asyncHandler(async (req, res) => {
    await this.adminUserService.deleteUser(req.params.userId);

    return sendSuccess(res, null, { message: "User deleted successfully" });
  });
}

export { AdminUserController };
export default new AdminUserController({ adminUserService });
