import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { upload } from "../../common/middleware/multer.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import { validateUpdatePassword } from "../auth/validation.js";
import * as controller from "./controller.js";
import * as validation from "./validation.js";

const usersRoute = express.Router();

usersRoute.get("/me", controller.getMe);
usersRoute.get("/me/profile", requireAuth, controller.getProfile);
usersRoute.patch(
  "/me/profile",
  requireAuth,
  upload.single("image"),
  validation.validateUpdateProfile,
  validateResult,
  controller.updateProfile,
);
usersRoute.get("/me/xp", requireAuth, controller.getXpEarning);
usersRoute.patch(
  "/me/password",
  requireAuth,
  validateUpdatePassword,
  validateResult,
  controller.updatePassword,
);

export default usersRoute;
