import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import completionController from "./completion.controller.js";
import { lessonIdParamValidator } from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/completions
const completionRoute = express.Router({ mergeParams: true });

completionRoute
  .route("/")
  .post(
    requireAuth,
    lessonIdParamValidator,
    validateResult,
    completionController.createCompletion,
  )
  .get(requireAuth, completionController.getCompletion);

export default completionRoute;
