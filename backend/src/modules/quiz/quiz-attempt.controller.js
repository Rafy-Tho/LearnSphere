import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import quizAttemptService from "./quiz-attempt.service.js";

class QuizAttemptController {
  constructor({ quizAttemptService }) {
    this.quizAttemptService = quizAttemptService;
  }

  submitAttempt = asyncHandler(async (req, res) => {
    const result = await this.quizAttemptService.submitAttempt({
      lessonId: req.params.lessonId,
      answers: req.body.answers,
      user: req.session.user,
    });

    return sendSuccess(res, result, {
      statusCode: StatusCode.CREATED,
      message: "Quiz submitted successfully",
    });
  });

  getAttempts = asyncHandler(async (req, res) => {
    const result = await this.quizAttemptService.getAttempts({
      lessonId: req.params.lessonId,
      user: req.session.user,
    });

    return sendSuccess(res, result, {
      message: "Quiz attempts retrieved successfully",
    });
  });

  getLatestAttempt = asyncHandler(async (req, res) => {
    const result = await this.quizAttemptService.getLatestAttempt({
      lessonId: req.params.lessonId,
      user: req.session.user,
    });

    return sendSuccess(res, result, {
      message: "Latest quiz attempt retrieved successfully",
    });
  });
}

export { QuizAttemptController };
export default new QuizAttemptController({ quizAttemptService });
