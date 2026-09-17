import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import savedCourseController from "./controller.js";
import { courseIdParamValidator } from "./validation.js";

// Mounted at /api/v1/courses/:courseId/saved
export const savedCourseRoute = express.Router({ mergeParams: true });

savedCourseRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    savedCourseController.saveCourse,
  )
  .delete(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    savedCourseController.unsaveCourse,
  );

// Mounted at /api/v1/users/me/saved-courses
export const meSavedCoursesRoute = express.Router();

meSavedCoursesRoute.get(
  "/",
  requireAuth,
  savedCourseController.getSavedCourses,
);
meSavedCoursesRoute.get(
  "/ids",
  requireAuth,
  savedCourseController.getSavedCourseIds,
);
