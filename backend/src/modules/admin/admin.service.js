import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "../learning/enrollment.repository.js";
import userRepository from "../users/repository.js";

class AdminService {
  constructor({ courseRepository, enrollmentRepository, userRepository }) {
    this.courseRepository = courseRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.userRepository = userRepository;
  }

  async getDashboardData(userId) {
    const user = await this.userRepository.findById(userId);
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    const [
      totalCourses,
      totalInstructors,
      totalStudents,
      totalEnrollments,
      courses,
      instructors,
    ] = await Promise.all([
      this.courseRepository.getTotalCourse(),
      this.userRepository.getTotalInstructors(),
      this.userRepository.getTotalStudents(),
      this.enrollmentRepository.getTotalEnrollments(),
      this.courseRepository.getRecentCourses(),
      this.userRepository.getInstructors(),
    ]);

    return {
      totalCourses,
      totalInstructors,
      totalStudents,
      totalEnrollments,
      courses,
      instructors,
    };
  }
}

export { AdminService };
export default new AdminService({
  courseRepository,
  enrollmentRepository,
  userRepository,
});
