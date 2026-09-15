import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import lessonContentController from "./lesson-content.controller.js";
import {
  lessonContentIdParamValidator,
  lessonContentValidator,
} from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/contents
export const lessonContentCollectionRoute = express.Router({
  mergeParams: true,
});

lessonContentCollectionRoute.get("/", lessonContentController.getLessonContents);
lessonContentCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentValidator,
  validateResult,
  lessonContentController.createLessonContent,
);

// Mounted at /api/v1/contents
export const lessonContentItemRoute = express.Router();

lessonContentItemRoute.patch(
  "/:contentId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentValidator,
  validateResult,
  lessonContentController.updateLessonContent,
);
lessonContentItemRoute.delete(
  "/:contentId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentIdParamValidator,
  validateResult,
  lessonContentController.deleteLessonContent,
);
