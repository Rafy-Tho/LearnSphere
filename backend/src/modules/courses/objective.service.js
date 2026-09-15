import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import assertOwnership from "../../common/auth/ownership.js";
import courseObjectiveRepository from "./objective.repository.js";
import courseRepository from "./repository.js";

class CourseObjectiveService {
  constructor({ courseRepository, courseObjectiveRepository }) {
    this.courseRepository = courseRepository;
    this.courseObjectiveRepository = courseObjectiveRepository;
  }

  async getCourseObjectives(courseId) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

    return this.courseObjectiveRepository.getByCourseId(courseId);
  }

  async createCourseObjective({ courseId, objectiveData, user }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to do this",
    });

    return this.courseObjectiveRepository.create({
      courseId,
      content: objectiveData.content,
      position: objectiveData.position,
    });
  }

  async updateCourseObjective(objectiveId, objectiveData, user) {
    const objective = await this.courseObjectiveRepository.findById(objectiveId);
    if (!objective) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Course objective not found");
    }

    const course = await this.courseRepository.findById(objective.course_id);
    if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to do this",
    });

    return this.courseObjectiveRepository.update({
      id: objectiveId,
      content: objectiveData.content,
      position: objectiveData.position,
    });
  }

  async deleteCourseObjective(objectiveId, user) {
    const objective = await this.courseObjectiveRepository.findById(objectiveId);
    if (!objective) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Course objective not found");
    }

    const course = await this.courseRepository.findById(objective.course_id);
    if (!course) throw new ApiError(StatusCode.BAD_REQUEST, "Course not found");

    assertOwnership({
      ownerId: course.instructor_id,
      user,
      message: "You are not authorized to do this",
    });

    return this.courseObjectiveRepository.delete(objectiveId);
  }
}

export { CourseObjectiveService };
export default new CourseObjectiveService({
  courseRepository,
  courseObjectiveRepository,
});
