import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN } from "../../common/constants/constants.js";
import adminController from "./admin.controller.js";

// Mounted at /api/v1/admin
const adminRoute = express.Router();

// Instructors use GET /api/v1/instructor/dashboard instead.
adminRoute.get(
  "/dashboard",
  requireAuth,
  authorize(ADMIN),
  adminController.getDashboardData,
);

export default adminRoute;
