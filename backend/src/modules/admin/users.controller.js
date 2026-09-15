import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as adminUsersService from "./users.service.js";

export const getUsers = asyncHandler(async (req, res) => {
  const { users, pagination } = await adminUsersService.getUsers(req.query);

  return sendSuccess(res, users, {
    message: "Users retrieved successfully",
    pagination,
  });
});

export const createUser = asyncHandler(async (req, res) => {
  const user = await adminUsersService.createUser(req.body);

  return sendSuccess(res, user, {
    statusCode: StatusCode.CREATED,
    message: "User created successfully",
  });
});

export const updateUser = asyncHandler(async (req, res) => {
  const user = await adminUsersService.updateUser(req.params.userId, req.body);

  return sendSuccess(res, user, { message: "User updated successfully" });
});

export const deleteUser = asyncHandler(async (req, res) => {
  await adminUsersService.deleteUser(req.params.userId);

  return sendSuccess(res, null, { message: "User deleted successfully" });
});
