import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import lessonController from "./lesson.controller.js";
import { lessonIdParamValidator, lessonValidator } from "./validation.js";

// Mounted at /api/v1/chapters/:chapterId/lessons
export const lessonCollectionRoute = express.Router({ mergeParams: true });

lessonCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonValidator,
  validateResult,
  lessonController.createLesson,
);

// Mounted at /api/v1/lessons
export const lessonItemRoute = express.Router();

lessonItemRoute.patch(
  "/:lessonId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonValidator,
  validateResult,
  lessonController.updateLesson,
);
lessonItemRoute.delete(
  "/:lessonId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonIdParamValidator,
  validateResult,
  lessonController.deleteLesson,
);
