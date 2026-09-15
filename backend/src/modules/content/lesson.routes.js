import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import completionRoute from "../learning/completion.routes.js";
import lessonContentRoute from "./lessonContent.routes.js";
import questionRoute from "./question.routes.js";
import * as controller from "./controller.js";
import { lessonValidator } from "./validation.js";

const lessonRoute = express.Router({ mergeParams: true });

lessonRoute.use("/:id/contents", lessonContentRoute);
lessonRoute.use("/:id/questions", questionRoute);
lessonRoute.use("/:id/completions", completionRoute);

lessonRoute
  .route("/")
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    lessonValidator,
    validateResult,
    controller.createLesson,
  );

lessonRoute
  .route("/:id")
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    lessonValidator,
    validateResult,
    controller.updateLesson,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteLesson);

lessonRoute.get("/first", controller.getFirstLesson);

export default lessonRoute;
