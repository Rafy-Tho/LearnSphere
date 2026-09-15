import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import courseController from "./course.controller.js";

// Mounted at /api/v1/users/me/courses
const meCoursesRoute = express.Router();

meCoursesRoute.get(
  "/recently-viewed",
  requireAuth,
  courseController.getRecentlyViewedCourses,
);
meCoursesRoute.get(
  "/recommended",
  requireAuth,
  courseController.getRecommendedCourses,
);
meCoursesRoute.get(
  "/in-progress",
  requireAuth,
  courseController.getCourseInProgress,
);
meCoursesRoute.get(
  "/completed",
  requireAuth,
  courseController.getCourseCompleted,
);

export default meCoursesRoute;
