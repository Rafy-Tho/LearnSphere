import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import enrollmentController from "./enrollment.controller.js";
import { courseIdParamValidator } from "./validation.js";

// Mounted at /api/v1/courses/:courseId/enrollments
const enrollmentRoute = express.Router({ mergeParams: true });

enrollmentRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    enrollmentController.enrollCourse,
  )
  .get(requireAuth, enrollmentController.getEnrollment);

export default enrollmentRoute;
