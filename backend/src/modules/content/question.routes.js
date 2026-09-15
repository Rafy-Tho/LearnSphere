import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import questionController from "./question.controller.js";
import {
  lessonIdParamValidator,
  questionIdParamValidator,
  questionValidator,
  quizSubmissionValidator,
} from "./validation.js";

// Mounted at /api/v1/lessons/:lessonId/questions
export const questionCollectionRoute = express.Router({ mergeParams: true });

questionCollectionRoute.get("/", requireAuth, questionController.getQuestions);
questionCollectionRoute.post(
  "/",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionValidator,
  validateResult,
  questionController.createQuestion,
);

// Mounted at /api/v1/lessons/:lessonId/quiz-submissions
export const quizSubmissionRoute = express.Router({ mergeParams: true });

quizSubmissionRoute.post(
  "/",
  requireAuth,
  lessonIdParamValidator,
  quizSubmissionValidator,
  validateResult,
  questionController.submitQuiz,
);

// Mounted at /api/v1/questions
export const questionItemRoute = express.Router();

questionItemRoute.patch(
  "/:questionId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionValidator,
  validateResult,
  questionController.updateQuestion,
);
questionItemRoute.delete(
  "/:questionId",
  requireAuth,
  authorize(ADMIN, INSTRUCTOR),
  questionIdParamValidator,
  validateResult,
  questionController.deleteQuestion,
);
