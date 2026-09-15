import ApiError from "../errors/api-error.js";
import StatusCode from "../constants/status-code.js";

/**
 * Assert that the current user owns a resource (or is an admin).
 * Centralizes the ownership checks currently duplicated across controllers.
 * @param {{ ownerId?: string, user?: { id?: string, role?: string }, message?: string }} params
 */
export function assertOwnership({ ownerId, user, message }) {
  const isAdmin = user?.role === "ADMIN";
  if (!isAdmin && ownerId !== user?.id) {
    throw new ApiError(
      StatusCode.FORBIDDEN,
      message || "You are not authorized to access this resource.",
    );
  }
}

export default assertOwnership;
