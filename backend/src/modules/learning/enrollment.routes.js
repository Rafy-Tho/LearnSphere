import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { courseIdParamValidator } from "./validation.js";

// Mounted at /api/v1/courses/:courseId/enrollments
const enrollmentRoute = express.Router({ mergeParams: true });

enrollmentRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    controller.enrollCourse,
  )
  .get(requireAuth, controller.getEnrollment);

export default enrollmentRoute;
