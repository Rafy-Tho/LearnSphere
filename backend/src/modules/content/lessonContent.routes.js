import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { lessonContentValidator } from "./validation.js";

const lessonContentRoute = express.Router({ mergeParams: true });

lessonContentRoute
  .route("/")
  .get(controller.getLessonContents)
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    lessonContentValidator,
    validateResult,
    controller.createLessonContent,
  );

lessonContentRoute
  .route("/:id")
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    lessonContentValidator,
    validateResult,
    controller.updateLessonContent,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteLessonContent);

export default lessonContentRoute;
