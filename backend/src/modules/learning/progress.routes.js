import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import progressController from "./progress.controller.js";
import {
  courseIdParamValidator,
  learningProgressValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/progress
const progressRoute = express.Router({ mergeParams: true });

progressRoute
  .route("/")
  .post(
    requireAuth,
    courseIdParamValidator,
    validateResult,
    progressController.createProgress,
  )
  .get(requireAuth, progressController.getProgress)
  .patch(
    requireAuth,
    courseIdParamValidator,
    learningProgressValidator,
    validateResult,
    progressController.updateProgress,
  );

export default progressRoute;
