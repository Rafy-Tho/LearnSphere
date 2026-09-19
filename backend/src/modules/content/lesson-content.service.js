import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import assertCourseEditable from "../../common/auth/course-lock.js";
import subscriptionRepository from "../subscriptions/subscription.repository.js";
import lessonContentRepository from "./lesson-content.repository.js";
import lessonRepository from "./lesson.repository.js";

const OWNER_MESSAGE = "You are not authorized to do this";

class LessonContentService {
  constructor({
    lessonContentRepository,
    lessonRepository,
    subscriptionRepository,
  }) {
    this.lessonContentRepository = lessonContentRepository;
    this.lessonRepository = lessonRepository;
    this.subscriptionRepository = subscriptionRepository;
  }

  async createLessonContent({ lessonId, lessonContentData, user }) {
    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    const instructor = await this.lessonRepository.getInstructor(lessonId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.lessonContentRepository.create({
      lessonId,
      name: lessonContentData.name,
      position: lessonContentData.position,
      content: lessonContentData.content,
    });
  }

  async updateLessonContent(contentId, lessonContentData, user) {
    const lessonContent = await this.lessonContentRepository.findById(contentId);
    if (!lessonContent) {
      throw new ApiError(StatusCode.NOT_FOUND, "Lesson content not found");
    }

    const instructor =
      await this.lessonContentRepository.getInstructor(contentId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.lessonContentRepository.update({
      id: contentId,
      name: lessonContentData.name,
      position: lessonContentData.position,
      content: lessonContentData.content,
    });
  }

  async deleteLessonContent(contentId, user) {
    const lessonContent = await this.lessonContentRepository.findById(contentId);
    if (!lessonContent) {
      throw new ApiError(StatusCode.NOT_FOUND, "Lesson content not found");
    }

    const instructor =
      await this.lessonContentRepository.getInstructor(contentId);
    assertOwnership({
      ownerId: instructor?.instructor_id,
      user,
      message: OWNER_MESSAGE,
    });

    assertCourseEditable({ courseStatus: instructor?.course_status, user });

    return this.lessonContentRepository.delete(contentId);
  }

  async getLessonContents(lessonId, userId) {
    if (!lessonId) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Lesson ID is required");
    }

    const lesson = await this.lessonRepository.findById(lessonId);
    if (!lesson) throw new ApiError(StatusCode.NOT_FOUND, "Lesson not found");

    if (lesson.access_type === "SUBSCRIPTION") {
      if (!userId) throw new ApiError(StatusCode.UNAUTHORIZED, "Unauthorized");

      const activeSubscription =
        await this.subscriptionRepository.getActivePaidSubscription(userId);
      if (!activeSubscription) {
        throw new ApiError(
          StatusCode.FORBIDDEN,
          "You don't have a paid subscription",
        );
      }
    }

    return this.lessonContentRepository.findByLessonId(lessonId);
  }
}

export { LessonContentService };
export default new LessonContentService({
  lessonContentRepository,
  lessonRepository,
  subscriptionRepository,
});
