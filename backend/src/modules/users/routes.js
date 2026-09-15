import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { upload } from "../../common/middleware/multer.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import * as validation from "./validation.js";

const usersRoute = express.Router();

usersRoute.get("/profile", requireAuth, controller.getProfile);
usersRoute.get("/xp-earned", requireAuth, controller.getXpEarning);
usersRoute.patch(
  "/profile",
  requireAuth,
  upload.single("image"),
  validation.validateUpdateProfile,
  validateResult,
  controller.updateProfile,
);

export default usersRoute;
