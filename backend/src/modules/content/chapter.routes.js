import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import chapterController from "./chapter.controller.js";
import { chapterIdParamValidator, chapterValidators } from "./validation.js";

// Mounted at /api/v1/modules/:moduleId/chapters
export const chapterCollectionRoute = express.Router({ mergeParams: true });

chapterCollectionRoute.get("/", chapterController.getChapters);
chapterCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterValidators,
  validateResult,
  chapterController.createChapter,
);

// Mounted at /api/v1/chapters
export const chapterItemRoute = express.Router();

chapterItemRoute.get("/:chapterId", chapterController.getChapter);
chapterItemRoute.patch(
  "/:chapterId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterValidators,
  validateResult,
  chapterController.updateChapter,
);
chapterItemRoute.delete(
  "/:chapterId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterIdParamValidator,
  validateResult,
  chapterController.deleteChapter,
);
