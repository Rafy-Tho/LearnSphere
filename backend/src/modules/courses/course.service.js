import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import chapterRepository from "../content/chapter.repository.js";
import lessonContentRepository from "../content/lesson-content.repository.js";
import lessonRepository from "../content/lesson.repository.js";
import optionRepository from "../content/option.repository.js";
import moduleRepository from "../content/module.repository.js";
import questionRepository from "../content/question.repository.js";
import subscriptionService from "../subscriptions/subscription.service.js";
import courseObjectiveRepository from "./objective.repository.js";
import courseRepository from "./repository.js";

class CourseService {
  constructor({
    courseRepository,
    courseObjectiveRepository,
    subscriptionService,
    moduleRepository,
    chapterRepository,
    lessonRepository,
    lessonContentRepository,
    questionRepository,
    optionRepository,
  }) {
    this.courseRepository = courseRepository;
    this.courseObjectiveRepository = courseObjectiveRepository;
    this.subscriptionService = subscriptionService;
    this.moduleRepository = moduleRepository;
    this.chapterRepository = chapterRepository;
    this.lessonRepository = lessonRepository;
    this.lessonContentRepository = lessonContentRepository;
    this.questionRepository = questionRepository;
    this.optionRepository = optionRepository;
  }

  async createCourse({ instructorId, courseData }) {
    return this.courseRepository.create({ instructorId, ...courseData });
  }

  async listCourses(query) {
    return this.courseRepository.getAllCourses(query);
  }

  async updateCourse(courseId, courseData, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to update this course",
    });

    return this.courseRepository.update({ id: courseId, ...courseData });
  }

  async deleteCourse(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to delete this course",
    });

    return this.courseRepository.delete(courseId);
  }

  async getCourseDetails(courseId) {
    const course = await this.courseRepository.getCourseDetailsById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return course;
  }

  async getLearningData(courseId, userId) {
    const hasActiveSubscription =
      await this.subscriptionService.hasActiveSubscription(userId);

    const curriculum = await this.courseRepository.getLearningData(courseId);
    if (!curriculum) {
      throw new ApiError(StatusCode.NOT_FOUND, "Course not found");
    }

    return {
      ...curriculum,
      modules: curriculum.modules.map((courseModule) => ({
        ...courseModule,
        lessons: courseModule.lessons.map((lesson) =>
          lesson.access_type === "SUBSCRIPTION" && hasActiveSubscription
            ? { ...lesson, access_type: "FREE" }
            : lesson,
        ),
      })),
    };
  }

  async getRecentlyViewed(userId) {
    return this.courseRepository.getRecentlyViewed(userId);
  }

  async getRecommended(userId) {
    let recommended = await this.courseRepository.getRecommended(userId);
    if (recommended.length === 0) {
      recommended = await this.courseRepository.getHighlyRated();
    }
    return recommended;
  }

  async getPopular() {
    return this.courseRepository.getPopular();
  }

  async getInProgress(userId, query) {
    return this.courseRepository.getCourseInProgress({
      userId,
      queryString: query,
    });
  }

  async getCompleted(userId, query) {
    return this.courseRepository.getCompletedCourses({
      userId,
      queryString: query,
    });
  }

  async getDashboard(query) {
    return this.courseRepository.getAllCoursesDashboard(query);
  }

  async getDashboardDetails(courseId, user) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to view this course dashboard",
    });

    const [
      objectives,
      modules,
      chapters,
      lessons,
      lessonContents,
      quizzes,
      options,
    ] = await Promise.all([
      this.courseObjectiveRepository.getObjectivesByCourseId(courseId),
      this.moduleRepository.getModulesByCourseId(courseId),
      this.chapterRepository.getChaptersByCourseId(courseId),
      this.lessonRepository.getLessonsByCourseId(courseId),
      this.lessonContentRepository.getLessonContentsByCourseId(courseId),
      this.questionRepository.getQuestionsByCourseId(courseId),
      this.optionRepository.getOptionsByCourseId(courseId),
    ]);

    return {
      course,
      objectives,
      modules,
      chapters,
      lessons,
      lessonContents,
      quizzes,
      options,
    };
  }
}

export { CourseService };
export default new CourseService({
  courseRepository,
  courseObjectiveRepository,
  subscriptionService,
  moduleRepository,
  chapterRepository,
  lessonRepository,
  lessonContentRepository,
  questionRepository,
  optionRepository,
});
