import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import * as controller from "./controller.js";

// Mounted under /api/v1/users
const adminRoute = express.Router();

adminRoute.get(
  "/dashboard-data",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  controller.getDashboardData,
);

export default adminRoute;
