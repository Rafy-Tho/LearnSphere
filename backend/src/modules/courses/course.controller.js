import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import courseService from "./course.service.js";

class CourseController {
  constructor({ courseService }) {
    this.courseService = courseService;
  }

  createCourse = asyncHandler(async (req, res) => {
    const course = await this.courseService.createCourse({
      instructorId: req.session.user.id,
      courseData: req.body,
      user: req.session.user,
    });

    return sendSuccess(res, course, {
      statusCode: StatusCode.CREATED,
      message: "Course created successfully",
    });
  });

  listCourses = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.courseService.listCourses(
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Courses retrieved successfully",
      pagination,
    });
  });

  updateCourse = asyncHandler(async (req, res) => {
    const course = await this.courseService.updateCourse(
      req.params.courseId,
      req.body,
      req.session.user,
    );

    return sendSuccess(res, course, { message: "Course updated successfully" });
  });

  deleteCourse = asyncHandler(async (req, res) => {
    await this.courseService.deleteCourse(
      req.params.courseId,
      req.session.user,
    );

    return sendSuccess(res, null, { message: "Course deleted successfully" });
  });

  getCourseDetails = asyncHandler(async (req, res) => {
    const course = await this.courseService.getCourseDetails(
      req.params.courseId,
    );

    return sendSuccess(res, course, { message: "Course retrieved successfully" });
  });

  getCourseLearningData = asyncHandler(async (req, res) => {
    const curriculum = await this.courseService.getLearningData(
      req.params.courseId,
      req.session?.user?.id,
    );

    return sendSuccess(res, curriculum, {
      message: "Course curriculum retrieved successfully",
    });
  });

  getRecentlyViewedCourses = asyncHandler(async (req, res) => {
    const courses = await this.courseService.getRecentlyViewed(
      req.session.user.id,
    );

    return sendSuccess(res, courses, {
      message: "Recently viewed retrieved successfully",
    });
  });

  getRecommendedCourses = asyncHandler(async (req, res) => {
    const courses = await this.courseService.getRecommended(
      req.session.user.id,
    );

    return sendSuccess(res, courses, {
      message: "Recommended courses retrieved successfully",
    });
  });

  getPopularCourses = asyncHandler(async (req, res) => {
    const courses = await this.courseService.getPopular();

    return sendSuccess(res, courses, {
      message: "Popular courses retrieved successfully",
    });
  });

  getCourseInProgress = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.courseService.getInProgress(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Courses retrieved successfully",
      pagination,
    });
  });

  getCourseCompleted = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.courseService.getCompleted(
      req.session.user.id,
      req.query,
    );

    return sendSuccess(res, data, {
      message: "Courses retrieved successfully",
      pagination,
    });
  });

  getCoursesDashboard = asyncHandler(async (req, res) => {
    const { data, pagination } = await this.courseService.getDashboard(
      req.query,
      req.session.user,
    );

    return sendSuccess(res, data, {
      message: "Courses retrieved successfully",
      pagination,
    });
  });

  submitCourseForReview = asyncHandler(async (req, res) => {
    const course = await this.courseService.submitForReview(
      req.params.courseId,
      req.session.user,
    );

    return sendSuccess(res, course, {
      message: "Course submitted for review",
    });
  });

  approveCourse = asyncHandler(async (req, res) => {
    const course = await this.courseService.approveCourse(
      req.params.courseId,
      req.session.user,
    );

    return sendSuccess(res, course, { message: "Course approved" });
  });

  rejectCourse = asyncHandler(async (req, res) => {
    const course = await this.courseService.rejectCourse(
      req.params.courseId,
      req.body.reason,
      req.session.user,
    );

    return sendSuccess(res, course, { message: "Course rejected" });
  });

  getCourseSummary = asyncHandler(async (req, res) => {
    const summary = await this.courseService.getCourseSummary(
      req.params.courseId,
      req.session.user,
    );

    return sendSuccess(res, summary, {
      message: "Course summary retrieved successfully",
    });
  });

  getModuleChapters = asyncHandler(async (req, res) => {
    const chapters = await this.courseService.getModuleChapters(
      req.params.courseId,
      req.params.moduleId,
      req.session.user,
    );

    return sendSuccess(res, chapters, {
      message: "Module chapters retrieved successfully",
    });
  });

  getChapterLessons = asyncHandler(async (req, res) => {
    const lessons = await this.courseService.getChapterLessons(
      req.params.courseId,
      req.params.chapterId,
      req.session.user,
    );

    return sendSuccess(res, lessons, {
      message: "Chapter lessons retrieved successfully",
    });
  });

  getLessonContents = asyncHandler(async (req, res) => {
    const contents = await this.courseService.getLessonContents(
      req.params.courseId,
      req.params.lessonId,
      req.session.user,
    );

    return sendSuccess(res, contents, {
      message: "Lesson contents retrieved successfully",
    });
  });

  getLessonQuestions = asyncHandler(async (req, res) => {
    const questions = await this.courseService.getLessonQuestions(
      req.params.courseId,
      req.params.lessonId,
      req.session.user,
    );

    return sendSuccess(res, questions, {
      message: "Lesson questions retrieved successfully",
    });
  });
}

export { CourseController };
export default new CourseController({ courseService });
