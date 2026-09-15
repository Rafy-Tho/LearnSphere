import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { learningProgressValidator } from "./validation.js";

const progressRoute = express.Router({ mergeParams: true });

progressRoute
  .route("/")
  .post(requireAuth, controller.createLearningProgress)
  .get(requireAuth, controller.getLearningProgress)
  .patch(
    requireAuth,
    learningProgressValidator,
    validateResult,
    controller.updateLearningProgress,
  );

export default progressRoute;
