import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import completionService from "./completion.service.js";

class CompletionController {
  constructor({ completionService }) {
    this.completionService = completionService;
  }

  createCompletion = asyncHandler(async (req, res) => {
    const result = await this.completionService.createCompletion({
      lessonId: req.params.lessonId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, result, {
      statusCode: result.isNew ? StatusCode.CREATED : StatusCode.OK,
      message: result.isNew
        ? "Lesson completed successfully"
        : "Lesson already completed",
    });
  });

  getCourseLessonCompletions = asyncHandler(async (req, res) => {
    const completions = await this.completionService.getCourseCompletions({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, completions, {
      message: "Course lesson completions fetched successfully",
    });
  });

  getCompletion = asyncHandler(async (req, res) => {
    const completion = await this.completionService.getCompletion({
      lessonId: req.params.lessonId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, completion || null, {
      message: "Lesson completion fetched successfully",
    });
  });
}

export { CompletionController };
export default new CompletionController({ completionService });
