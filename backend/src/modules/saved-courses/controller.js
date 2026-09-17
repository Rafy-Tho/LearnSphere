import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import savedCourseService from "./service.js";

class SavedCourseController {
  constructor({ savedCourseService }) {
    this.savedCourseService = savedCourseService;
  }

  saveCourse = asyncHandler(async (req, res) => {
    const savedCourse = await this.savedCourseService.saveCourse({
      userId: req.session.user.id,
      courseId: req.params.courseId,
    });

    return sendSuccess(res, savedCourse, {
      statusCode: StatusCode.CREATED,
      message: "Course saved successfully",
    });
  });

  unsaveCourse = asyncHandler(async (req, res) => {
    await this.savedCourseService.unsaveCourse({
      userId: req.session.user.id,
      courseId: req.params.courseId,
    });

    return sendSuccess(res, null, {
      message: "Course removed from saved successfully",
    });
  });

  getSavedCourses = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.savedCourseService.getSavedCourses(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Saved courses retrieved successfully",
      pagination,
    });
  });

  getSavedCourseIds = asyncHandler(async (req, res) => {
    const courseIds = await this.savedCourseService.getSavedCourseIds(
      req.session.user.id,
    );

    return sendSuccess(res, courseIds, {
      message: "Saved course ids retrieved successfully",
    });
  });
}

export { SavedCourseController };
export default new SavedCourseController({ savedCourseService });
