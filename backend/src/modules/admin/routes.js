import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import * as controller from "./controller.js";

// Mounted at /api/v1/admin
const adminRoute = express.Router();

adminRoute.get(
  "/dashboard",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  controller.getDashboardData,
);

export default adminRoute;
