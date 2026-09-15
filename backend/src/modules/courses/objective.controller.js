import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import courseObjectiveService from "./objective.service.js";

class CourseObjectiveController {
  constructor({ courseObjectiveService }) {
    this.courseObjectiveService = courseObjectiveService;
  }

  getCourseObjectives = asyncHandler(async (req, res) => {
    const objectives = await this.courseObjectiveService.getCourseObjectives(
      req.params.courseId,
    );

    return sendSuccess(res, objectives, {
      message: "Course objectives retrieved successfully",
    });
  });

  createCourseObjective = asyncHandler(async (req, res) => {
    const objective = await this.courseObjectiveService.createCourseObjective({
      courseId: req.params.courseId,
      objectiveData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, objective, {
      statusCode: StatusCode.CREATED,
      message: "Course objective created successfully",
    });
  });

  updateCourseObjective = asyncHandler(async (req, res) => {
    const objective = await this.courseObjectiveService.updateCourseObjective(
      req.params.objectiveId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, objective, {
      message: "Course objective updated successfully",
    });
  });

  deleteCourseObjective = asyncHandler(async (req, res) => {
    await this.courseObjectiveService.deleteCourseObjective(
      req.params.objectiveId,
      req.session.user,
    );

    return sendSuccess(res, null, {
      message: "Course objective deleted successfully",
    });
  });
}

export { CourseObjectiveController };
export default new CourseObjectiveController({ courseObjectiveService });
