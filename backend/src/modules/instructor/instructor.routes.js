import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import courseController from "../courses/course.controller.js";
import instructorController from "./instructor.controller.js";
import {
  courseIdParamValidator,
  listQueryValidator,
  studentsQueryValidator,
} from "./validation.js";

// Mounted at /api/v1/instructor
const instructorRoute = express.Router();

instructorRoute.get(
  "/dashboard",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  instructorController.getDashboard,
);

instructorRoute.get(
  "/earnings",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  instructorController.getEarnings,
);

instructorRoute.get(
  "/payouts",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  listQueryValidator,
  validateResult,
  instructorController.getPayouts,
);

instructorRoute.get(
  "/courses/:courseId/students",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseIdParamValidator,
  studentsQueryValidator,
  validateResult,
  instructorController.getStudents,
);

instructorRoute.get(
  "/courses/:courseId/analytics",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseIdParamValidator,
  validateResult,
  instructorController.getAnalytics,
);

instructorRoute.get(
  "/courses/:courseId/reviews",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseIdParamValidator,
  listQueryValidator,
  validateResult,
  instructorController.getReviews,
);

instructorRoute.get(
  "/courses/:courseId/certificates",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseIdParamValidator,
  listQueryValidator,
  validateResult,
  instructorController.getCertificates,
);

instructorRoute.post(
  "/courses/:courseId/submit",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  courseIdParamValidator,
  validateResult,
  courseController.submitCourseForReview,
);

export default instructorRoute;
