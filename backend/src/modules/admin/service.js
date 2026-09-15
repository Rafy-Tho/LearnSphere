import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import Course from "../courses/repository.js";
import Enrollment from "../learning/repository.js";
import User from "../users/repository.js";

// TODO(refactor): course/learning/user cross-module calls should go through their services.

export async function getDashboardData(userId) {
  const user = await User.findById(userId);
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  const [
    totalCourses,
    totalInstructors,
    totalStudents,
    totalEnrollments,
    courses,
    instructors,
  ] = await Promise.all([
    Course.getTotalCourse(),
    User.getTotalInstructors(),
    User.getTotalStudents(),
    Enrollment.getTotalEnrollments(),
    Course.getRecentCourses(),
    User.getInstructors(),
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
