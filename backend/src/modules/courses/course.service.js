import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import chapterRepository from "../content/chapter.repository.js";
import lessonContentRepository from "../content/lesson-content.repository.js";
import lessonRepository from "../content/lesson.repository.js";
import optionRepository from "../content/option.repository.js";
import moduleRepository from "../content/module.repository.js";
import questionRepository from "../content/question.repository.js";
import subscriptionRepository from "../subscriptions/subscription.repository.js";
import userRepository from "../users/repository.js";
import courseObjectiveRepository from "./objective.repository.js";
import courseRepository from "./repository.js";

class CourseService {
  constructor({
    courseRepository,
    courseObjectiveRepository,
    subscriptionRepository,
    userRepository,
    moduleRepository,
    chapterRepository,
    lessonRepository,
    lessonContentRepository,
    questionRepository,
    optionRepository,
  }) {
    this.courseRepository = courseRepository;
    this.courseObjectiveRepository = courseObjectiveRepository;
    this.subscriptionRepository = subscriptionRepository;
    this.userRepository = userRepository;
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
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.courseRepository.getCourseDetailsById(courseId);
  }

  async getLearningData(courseId, userId) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const activeSubscription = userId
      ? await this.subscriptionRepository.getActivePaidSubscription(userId)
      : null;

    const curriculum = await this.courseRepository.getLearningData(courseId);

    return {
      ...curriculum,
      modules: curriculum.modules.map((courseModule) => ({
        ...courseModule,
        lessons: courseModule.lessons.map((lesson) =>
          lesson.access_type === "SUBSCRIPTION" && activeSubscription
            ? { ...lesson, access_type: "FREE" }
            : lesson,
        ),
      })),
    };
  }

  async getRecentlyViewed(userId) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    return this.courseRepository.getRecentlyViewed(userId);
  }

  async getRecommended(userId) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

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
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    return this.courseRepository.getCourseInProgress({
      userId,
      queryString: query,
    });
  }

  async getCompleted(userId, query) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

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

    const objectives =
      await this.courseObjectiveRepository.getObjectivesByCourseId(courseId);
    const modules = await this.moduleRepository.getModulesByCourseId(courseId);
    const chapters =
      await this.chapterRepository.getChaptersByCourseId(courseId);
    const lessons = await this.lessonRepository.getLessonsByCourseId(courseId);
    const lessonContents =
      await this.lessonContentRepository.getLessonContentsByCourseId(courseId);
    const quizzes = await this.questionRepository.getQuestionsByCourseId(
      courseId,
    );
    const options = await this.optionRepository.getOptionsByCourseId(courseId);

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
  subscriptionRepository,
  userRepository,
  moduleRepository,
  chapterRepository,
  lessonRepository,
  lessonContentRepository,
  questionRepository,
  optionRepository,
});
