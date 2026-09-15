import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import * as controller from "./controller.js";
import { courseIdParamValidator } from "./validation.js";

// Mounted at /api/v1/admin/courses
const adminCoursesRoute = express.Router();

adminCoursesRoute.get(
  "/",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  controller.getCoursesDashboard,
);
adminCoursesRoute.get(
  "/:courseId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  validateResult,
  controller.getCourseDetailsDashboard,
);

export default adminCoursesRoute;
