import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN } from "../../common/constants/constants.js";
import adminUserController from "./admin-user.controller.js";
import {
  createUserValidator,
  updateUserValidator,
  userIdParamValidator,
} from "./validation.js";

const adminUsersRoute = express.Router();

adminUsersRoute.use(requireAuth, authorize(ADMIN));

adminUsersRoute
  .route("/")
  .get(adminUserController.getUsers)
  .post(createUserValidator, validateResult, adminUserController.createUser);

adminUsersRoute
  .route("/:userId")
  .patch(updateUserValidator, validateResult, adminUserController.updateUser)
  .delete(
    userIdParamValidator,
    validateResult,
    adminUserController.deleteUser,
  );

export default adminUsersRoute;
