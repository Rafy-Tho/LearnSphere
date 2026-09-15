import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import lessonService from "./lesson.service.js";

class LessonController {
  constructor({ lessonService }) {
    this.lessonService = lessonService;
  }

  createLesson = asyncHandler(async (req, res) => {
    const lesson = await this.lessonService.createLesson({
      chapterId: req.params.chapterId,
      lessonData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, lesson, {
      statusCode: StatusCode.CREATED,
      message: "Lesson created successfully",
    });
  });

  updateLesson = asyncHandler(async (req, res) => {
    const lesson = await this.lessonService.updateLesson(
      req.params.lessonId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, lesson, { message: "Lesson updated successfully" });
  });

  deleteLesson = asyncHandler(async (req, res) => {
    await this.lessonService.deleteLesson(
      req.params.lessonId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Lesson deleted successfully" });
  });

  getFirstLesson = asyncHandler(async (req, res) => {
    const lesson = await this.lessonService.getFirstLesson(req.params.courseId);

    return sendSuccess(res, lesson, {
      message: "First lesson retrieved successfully",
    });
  });
}

export { LessonController };
export default new LessonController({ lessonService });
