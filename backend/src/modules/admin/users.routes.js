import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN } from "../../common/constants/constants.js";
import * as controller from "./users.controller.js";

const adminUsersRoute = express.Router();

adminUsersRoute.use(requireAuth, authorize(ADMIN));

adminUsersRoute.route("/").get(controller.getUsers).post(controller.createUser);
adminUsersRoute
  .route("/:id")
  .patch(controller.updateUser)
  .delete(controller.deleteUser);

export default adminUsersRoute;
