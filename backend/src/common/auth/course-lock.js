import ApiError from "../errors/api-error.js";
import StatusCode from "../constants/status-code.js";

/**
 * A course under review (`PENDING`) is locked from further edits by its
 * instructor so an admin reviews the exact submitted content. Admins bypass
 * the lock.
 * @param {{ courseStatus?: string, user?: { role?: string }, message?: string }} params
 */
export function assertCourseEditable({ courseStatus, user, message }) {
  if (user?.role === "ADMIN") return;

  if (courseStatus === "PENDING") {
    throw new ApiError(
      StatusCode.CONFLICT,
      message ||
        "This course is under review and cannot be edited until it is reviewed.",
    );
  }
}

export default assertCourseEditable;
