import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import lessonRoute from "./lesson.routes.js";
import * as controller from "./controller.js";
import { chapterValidators } from "./validation.js";

const chapterRoute = express.Router({ mergeParams: true });

chapterRoute.use("/:id/lessons", lessonRoute);
chapterRoute
  .route("/")
  .get(controller.getChapters)
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    chapterValidators,
    validateResult,
    controller.createChapter,
  );
chapterRoute
  .route("/:id")
  .get(controller.getChapter)
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    chapterValidators,
    validateResult,
    controller.updateChapter,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteChapter);

export default chapterRoute;
