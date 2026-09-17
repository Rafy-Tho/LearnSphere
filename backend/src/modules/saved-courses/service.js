import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import courseRepository from "../courses/repository.js";
import savedCourseRepository from "./repository.js";

class SavedCourseService {
  constructor({ courseRepository, savedCourseRepository }) {
    this.courseRepository = courseRepository;
    this.savedCourseRepository = savedCourseRepository;
  }

  async saveCourse({ userId, courseId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course || course.status !== "PUBLISHED") {
      throw new ApiError(StatusCode.NOT_FOUND, "Course not found");
    }

    return this.savedCourseRepository.save({ userId, courseId });
  }

  async unsaveCourse({ userId, courseId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.savedCourseRepository.unsave({ userId, courseId });
  }

  async getSavedCourseIds(userId) {
    return this.savedCourseRepository.getSavedCourseIds(userId);
  }

  async getSavedCourses(userId, query) {
    return this.savedCourseRepository.getSavedCourses({
      userId,
      queryString: query,
    });
  }
}

export { SavedCourseService };
export default new SavedCourseService({
  courseRepository,
  savedCourseRepository,
});
