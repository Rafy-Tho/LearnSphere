import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import questionService from "./question.service.js";

class QuestionController {
  constructor({ questionService }) {
    this.questionService = questionService;
  }

  createQuestion = asyncHandler(async (req, res) => {
    const question = await this.questionService.createQuestion({
      lessonId: req.params.lessonId,
      questionData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, question, {
      statusCode: StatusCode.CREATED,
      message: "Question created successfully",
    });
  });

  updateQuestion = asyncHandler(async (req, res) => {
    const question = await this.questionService.updateQuestion(
      req.params.questionId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, question, {
      message: "Question updated successfully",
    });
  });

  deleteQuestion = asyncHandler(async (req, res) => {
    await this.questionService.deleteQuestion(
      req.params.questionId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Question deleted successfully" });
  });

  getQuestions = asyncHandler(async (req, res) => {
    const questions = await this.questionService.getQuestions(
      req.params.lessonId,
      req.session.user,
    );

    return sendSuccess(res, questions, {
      message: "Questions retrieved successfully",
    });
  });
}

export { QuestionController };
export default new QuestionController({ questionService });
