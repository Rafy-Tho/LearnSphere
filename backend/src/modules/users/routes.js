import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { upload } from "../../common/middleware/multer.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { validateUpdatePassword } from "../auth/validation.js";
import userController from "./controller.js";
import * as validation from "./validation.js";

const usersRoute = express.Router();

usersRoute.get("/me", userController.getMe);
usersRoute.get("/me/profile", requireAuth, userController.getProfile);
usersRoute.patch(
  "/me/profile",
  requireAuth,
  upload.single("image"),
  validation.validateUpdateProfile,
  validateResult,
  userController.updateProfile,
);
usersRoute.get("/me/xp", requireAuth, userController.getXpEarnings);
usersRoute.patch(
  "/me/password",
  requireAuth,
  validateUpdatePassword,
  validateResult,
  userController.updatePassword,
);

export default usersRoute;
