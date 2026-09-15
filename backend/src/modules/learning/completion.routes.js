import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { lessonIdParamValidator } from "./validation.js";

const completionRoute = express.Router({ mergeParams: true });

completionRoute
  .route("/")
  .post(requireAuth, lessonIdParamValidator, validateResult, controller.createLessonCompletion)
  .get(requireAuth, controller.getLessonCompletion);

export default completionRoute;
