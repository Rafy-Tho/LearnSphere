import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { chapterIdParamValidator, chapterValidators } from "./validation.js";

// Mounted at /api/v1/modules/:moduleId/chapters
export const chapterCollectionRoute = express.Router({ mergeParams: true });

chapterCollectionRoute.get("/", controller.getChapters);
chapterCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterValidators,
  validateResult,
  controller.createChapter,
);

// Mounted at /api/v1/chapters
export const chapterItemRoute = express.Router();

chapterItemRoute.get("/:chapterId", controller.getChapter);
chapterItemRoute.patch(
  "/:chapterId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterValidators,
  validateResult,
  controller.updateChapter,
);
chapterItemRoute.delete(
  "/:chapterId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  chapterIdParamValidator,
  validateResult,
  controller.deleteChapter,
);
