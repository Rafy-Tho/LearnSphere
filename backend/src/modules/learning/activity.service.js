import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import activityRepository from "./activity.repository.js";

export const ACTIVITY_TYPE = Object.freeze({
  ENROLL_COURSE: "ENROLL_COURSE",
  START_COURSE: "START_COURSE",
  START_LESSON: "START_LESSON",
  COMPLETE_LESSON: "COMPLETE_LESSON",
  COMPLETE_COURSE: "COMPLETE_COURSE",
  EARN_CERTIFICATE: "EARN_CERTIFICATE",
});

class ActivityService {
  constructor({ activityRepository }) {
    this.activityRepository = activityRepository;
  }

  /**
   * Record a learner activity. When `once` is true the activity is written at
   * most once for the same (user, type, course, lesson) tuple, keeping repeated
   * requests from creating duplicate rows.
   */
  async record(
    { userId, type, courseId = null, lessonId = null, metadata = {}, once = false },
    client,
  ) {
    if (once) {
      const exists = await this.activityRepository.exists(
        { userId, type, courseId, lessonId },
        client,
      );
      if (exists) return null;
    }

    return this.activityRepository.create(
      { userId, type, courseId, lessonId, metadata },
      client,
    );
  }

  async getMyActivities(userId, query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [activities, total] = await Promise.all([
      this.activityRepository.findByUser(userId, { limit, offset }),
      this.activityRepository.countByUser(userId),
    ]);

    return {
      activities,
      pagination: buildPagination({ total, page, limit }),
    };
  }
}

export { ActivityService };
export default new ActivityService({ activityRepository });
