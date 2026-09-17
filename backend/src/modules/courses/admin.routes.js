import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import courseController from "./course.controller.js";
import {
  adminCourseListQueryValidator,
  courseIdParamValidator,
} from "./validation.js";

// Mounted at /api/v1/admin/courses
const adminCoursesRoute = express.Router();

adminCoursesRoute.get(
  "/",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  adminCourseListQueryValidator,
  courseController.getCoursesDashboard,
);
adminCoursesRoute.get(
  "/:courseId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  courseIdParamValidator,
  validateResult,
  courseController.getCourseDetailsDashboard,
);

export default adminCoursesRoute;
