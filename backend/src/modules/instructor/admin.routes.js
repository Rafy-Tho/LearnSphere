import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN } from "../../common/constants/constants.js";
import instructorController from "./instructor.controller.js";
import {
  listQueryValidator,
  payoutCreateValidator,
  payoutIdParamValidator,
  payoutUpdateValidator,
  revenueSettingsValidator,
} from "./validation.js";

// Mounted at /api/v1/admin. Guards are applied per route (not at the router
// level) so mounting does not interfere with sibling /admin routers that allow
// other roles (e.g. /admin/courses allows INSTRUCTOR).
const adminGuard = [requireAuth, authorize(ADMIN)];

const adminInstructorRoute = express.Router();

adminInstructorRoute.get(
  "/settings",
  ...adminGuard,
  instructorController.getRevenueSettings,
);

adminInstructorRoute.patch(
  "/settings",
  ...adminGuard,
  revenueSettingsValidator,
  validateResult,
  instructorController.updateRevenueSettings,
);

adminInstructorRoute.get(
  "/instructor-payouts",
  ...adminGuard,
  listQueryValidator,
  validateResult,
  instructorController.listPayouts,
);

adminInstructorRoute.post(
  "/instructor-payouts",
  ...adminGuard,
  payoutCreateValidator,
  validateResult,
  instructorController.createPayout,
);

adminInstructorRoute.patch(
  "/instructor-payouts/:payoutId",
  ...adminGuard,
  payoutIdParamValidator,
  payoutUpdateValidator,
  validateResult,
  instructorController.updatePayout,
);

export default adminInstructorRoute;
