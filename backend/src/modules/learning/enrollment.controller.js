import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import enrollmentService from "./enrollment.service.js";

class EnrollmentController {
  constructor({ enrollmentService }) {
    this.enrollmentService = enrollmentService;
  }

  enrollCourse = asyncHandler(async (req, res) => {
    const enrollment = await this.enrollmentService.enrollCourse({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, enrollment, {
      message: "Course enrolled successfully",
    });
  });

  getEnrollment = asyncHandler(async (req, res) => {
    const enrollment = await this.enrollmentService.getEnrollment({
      courseId: req.params.courseId,
      userId: req.session.user.id,
    });

    return sendSuccess(res, enrollment || null, {
      message: "Enrollment retrieved successfully",
    });
  });
}

export { EnrollmentController };
export default new EnrollmentController({ enrollmentService });
