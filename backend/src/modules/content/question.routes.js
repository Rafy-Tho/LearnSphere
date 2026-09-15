import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { questionIdParamValidator, questionValidator } from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/questions
export const questionCollectionRoute = express.Router({ mergeParams: true });

questionCollectionRoute.get("/", requireAuth, controller.getQuestions);
questionCollectionRoute.post(
  "/",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionValidator,
  validateResult,
  controller.createQuestion,
);

// Mounted at /api/v1/questions
export const questionItemRoute = express.Router();

questionItemRoute.patch(
  "/:questionId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionValidator,
  validateResult,
  controller.updateQuestion,
);
questionItemRoute.delete(
  "/:questionId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionIdParamValidator,
  validateResult,
  controller.deleteQuestion,
);
