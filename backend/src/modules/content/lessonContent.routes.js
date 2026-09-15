import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import {
  lessonContentIdParamValidator,
  lessonContentValidator,
} from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/contents
export const lessonContentCollectionRoute = express.Router({
  mergeParams: true,
});

lessonContentCollectionRoute.get("/", controller.getLessonContents);
lessonContentCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentValidator,
  validateResult,
  controller.createLessonContent,
);

// Mounted at /api/v1/contents
export const lessonContentItemRoute = express.Router();

lessonContentItemRoute.patch(
  "/:contentId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentValidator,
  validateResult,
  controller.updateLessonContent,
);
lessonContentItemRoute.delete(
  "/:contentId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  lessonContentIdParamValidator,
  validateResult,
  controller.deleteLessonContent,
);
