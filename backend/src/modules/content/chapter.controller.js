import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import chapterService from "./chapter.service.js";

class ChapterController {
  constructor({ chapterService }) {
    this.chapterService = chapterService;
  }

  createChapter = asyncHandler(async (req, res) => {
    const chapter = await this.chapterService.createChapter({
      moduleId: req.params.moduleId,
      chapterData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, chapter, {
      statusCode: StatusCode.CREATED,
      message: "Chapter created successfully",
    });
  });

  getChapters = asyncHandler(async (req, res) => {
    const chapters = await this.chapterService.getChapters(req.params.moduleId);

    return sendSuccess(res, chapters, {
      message: "Chapters retrieved successfully",
    });
  });

  getChapter = asyncHandler(async (req, res) => {
    const chapter = await this.chapterService.getChapter(req.params.chapterId);

    return sendSuccess(res, chapter, {
      message: "Chapter retrieved successfully",
    });
  });

  updateChapter = asyncHandler(async (req, res) => {
    const chapter = await this.chapterService.updateChapter(
      req.params.chapterId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, chapter, {
      message: "Chapter updated successfully",
    });
  });

  deleteChapter = asyncHandler(async (req, res) => {
    await this.chapterService.deleteChapter(
      req.params.chapterId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Chapter deleted successfully" });
  });
}

export { ChapterController };
export default new ChapterController({ chapterService });
