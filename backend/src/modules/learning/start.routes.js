import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import progressController from "./progress.controller.js";
import { lessonIdParamValidator } from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/start
const startLessonRoute = express.Router({ mergeParams: true });

startLessonRoute.post(
  "/",
  requireAuth,
  lessonIdParamValidator,
  validateResult,
  progressController.startLesson,
);

export default startLessonRoute;
