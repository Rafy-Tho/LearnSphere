import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import {
  lessonIdParamValidator,
  quizSubmissionValidator,
} from "../content/validation.js";
import quizAttemptController from "./quiz-attempt.controller.js";

// Mounted at /api/v1/lessons/:lessonId/quiz-attempts
const quizAttemptRoute = express.Router({ mergeParams: true });

quizAttemptRoute
  .route("/")
  .post(
    requireAuth,
    lessonIdParamValidator,
    quizSubmissionValidator,
    validateResult,
    quizAttemptController.submitAttempt,
  )
  .get(
    requireAuth,
    lessonIdParamValidator,
    validateResult,
    quizAttemptController.getAttempts,
  );

quizAttemptRoute.get(
  "/latest",
  requireAuth,
  lessonIdParamValidator,
  validateResult,
  quizAttemptController.getLatestAttempt,
);

export default quizAttemptRoute;
