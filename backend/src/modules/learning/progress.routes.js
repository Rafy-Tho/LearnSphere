import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
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
    controller.createLearningProgress,
  )
  .get(requireAuth, controller.getLearningProgress)
  .patch(
    requireAuth,
    courseIdParamValidator,
    learningProgressValidator,
    validateResult,
    controller.updateLearningProgress,
  );

export default progressRoute;
