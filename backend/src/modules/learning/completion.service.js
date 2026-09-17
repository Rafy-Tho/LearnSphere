import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import { withTransaction } from "../../config/database.js";
import lessonRepository from "../content/lesson.repository.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "./enrollment.repository.js";
import learningProgressRepository from "./progress.repository.js";
import lessonCompletionRepository from "./completion.repository.js";
import activityService, { ACTIVITY_TYPE } from "./activity.service.js";
import xpService, { XP_REASON } from "./xp.service.js";

class CompletionService {
  constructor({
    courseRepository,
    lessonRepository,
    enrollmentRepository,
    learningProgressRepository,
    lessonCompletionRepository,
    activityService,
    xpService,
  }) {
    this.courseRepository = courseRepository;
    this.lessonRepository = lessonRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.learningProgressRepository = learningProgressRepository;
    this.lessonCompletionRepository = lessonCompletionRepository;
    this.activityService = activityService;
    this.xpService = xpService;
  }

  async createCompletion({ lessonId, userId }) {
    const courseId = await this.courseRepository.getCourseIdByLessonId(lessonId);
    if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const enrollment = await this.enrollmentRepository.findOne({
      courseId,
      userId,
    });
    if (!enrollment) {
      throw new ApiError(
        StatusCode.FORBIDDEN,
        "You must be enrolled in this course",
      );
    }

    return withTransaction(async (client) => {
      const existing = await this.lessonCompletionRepository.getCompletion(
        { courseId, userId, lessonId },
        client,
      );
      if (existing) {
        return { completion: existing, xpEarned: 0, isNew: false };
      }

      const completion = await this.lessonCompletionRepository.create(
        { courseId, userId, lessonId },
        client,
      );

      await this.learningProgressRepository.upsertCurrentLesson(
        { courseId, userId, lessonId },
        client,
      );

      await this.activityService.record(
        {
          userId,
          type: ACTIVITY_TYPE.COMPLETE_LESSON,
          courseId,
          lessonId,
          metadata: { lessonName: lesson.name },
          once: true,
        },
        client,
      );

      const xpAmount = Number(lesson.xp_points) || 0;
      await this.xpService.award(
        {
          userId,
          amount: xpAmount,
          reason: XP_REASON.LESSON_COMPLETION,
          referenceType: "LESSON",
          referenceId: lessonId,
          metadata: { courseId },
        },
        client,
      );

      const isCourseComplete =
        await this.lessonCompletionRepository.isCourseComplete(
          { courseId, userId },
          client,
        );

      if (isCourseComplete) {
        await this.activityService.record(
          {
            userId,
            type: ACTIVITY_TYPE.COMPLETE_COURSE,
            courseId,
            once: true,
          },
          client,
        );
      }

      return {
        completion,
        xpEarned: xpAmount,
        isNew: true,
        isCourseComplete,
      };
    });
  }

  async getCourseCompletions({ courseId, userId }) {
    return this.lessonCompletionRepository.getCourseCompletions(
      courseId,
      userId,
    );
  }

  async getCompletion({ lessonId, userId }) {
    const courseId = await this.courseRepository.getCourseIdByLessonId(lessonId);
    if (!courseId) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    return this.lessonCompletionRepository.getCompletion({
      lessonId,
      userId,
      courseId,
    });
  }

  // Used by the quiz flow, which marks a lesson complete after grading.
  async markLessonComplete({ lessonId, userId }) {
    const existing = await this.getCompletion({ lessonId, userId });
    if (existing) return { completion: existing, xpEarned: 0, isNew: false };

    return this.createCompletion({ lessonId, userId });
  }
}

export { CompletionService };
export default new CompletionService({
  courseRepository,
  lessonRepository,
  enrollmentRepository,
  learningProgressRepository,
  lessonCompletionRepository,
  activityService,
  xpService,
});
