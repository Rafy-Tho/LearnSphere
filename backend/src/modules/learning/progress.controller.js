import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import progressService from "./progress.service.js";

class ProgressController {
  constructor({ progressService }) {
    this.progressService = progressService;
  }

  createProgress = asyncHandler(async (req, res) => {
    const progress = await this.progressService.createProgress({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, progress, {
      statusCode: StatusCode.CREATED,
      message: "Learning progress created successfully",
    });
  });

  updateProgress = asyncHandler(async (req, res) => {
    const { isCreated, progress } = await this.progressService.updateProgress({
      courseId: req.params.courseId,
      userId: req.session.user.id,
      lessonId: req.body.lessonId,
    });

    return sendSuccess(res, progress, {
      statusCode: StatusCode.OK,
      message: isCreated
        ? "Learning progress created successfully"
        : "Learning progress updated successfully",
    });
  });

  getProgress = asyncHandler(async (req, res) => {
    const progress = await this.progressService.getProgress({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, progress || null, {
      message: "Learning progress retrieved successfully",
    });
  });

  startLesson = asyncHandler(async (req, res) => {
    const progress = await this.progressService.startLesson({
      lessonId: req.params.lessonId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, progress, {
      statusCode: StatusCode.OK,
      message: "Lesson started successfully",
    });
  });
}

export { ProgressController };
export default new ProgressController({ progressService });
