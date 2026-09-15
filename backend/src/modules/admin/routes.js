import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import adminController from "./admin.controller.js";

// Mounted at /api/v1/admin
const adminRoute = express.Router();

adminRoute.get(
  "/dashboard",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  adminController.getDashboardData,
);

export default adminRoute;
