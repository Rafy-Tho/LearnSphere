import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import lessonContentService from "./lesson-content.service.js";

class LessonContentController {
  constructor({ lessonContentService }) {
    this.lessonContentService = lessonContentService;
  }

  createLessonContent = asyncHandler(async (req, res) => {
    const lessonContent = await this.lessonContentService.createLessonContent({
      lessonId: req.params.lessonId,
      lessonContentData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, lessonContent, {
      statusCode: StatusCode.CREATED,
      message: "Lesson content created successfully",
    });
  });

  updateLessonContent = asyncHandler(async (req, res) => {
    const lessonContent = await this.lessonContentService.updateLessonContent(
      req.params.contentId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, lessonContent, {
      message: "Lesson content updated successfully",
    });
  });

  deleteLessonContent = asyncHandler(async (req, res) => {
    await this.lessonContentService.deleteLessonContent(
      req.params.contentId,
      req.session.user,
    );

    return sendSuccess(res, null, {
      message: "Lesson content deleted successfully",
    });
  });

  getLessonContents = asyncHandler(async (req, res) => {
    const contents = await this.lessonContentService.getLessonContents(
      req.params.lessonId,
      req.session?.user?.id || null,
    );

    return sendSuccess(res, contents, {
      message: "Lesson contents fetched successfully",
    });
  });
}

export { LessonContentController };
export default new LessonContentController({ lessonContentService });
