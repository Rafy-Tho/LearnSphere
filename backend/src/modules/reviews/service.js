import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import Course from "../courses/repository.js";
import Enrollment from "../learning/repository.js";
import User from "../users/repository.js";
import Review from "./repository.js";

// TODO(refactor): course/user cross-module calls should go through their services.

export async function getReviews({ courseId, userId, query }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return Review.getReviews(query, courseId, userId);
}

export async function getReviewDetail(courseId) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return Review.getReviewsDetail(courseId);
}

export async function createReview({ userId, courseId, rating, description }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  const enrollment = await Enrollment.findOne({ courseId, userId });
  if (!enrollment) {
    throw new ApiError(
      StatusCode.FORBIDDEN,
      "You must be enrolled in this course to review it",
    );
  }

  const review =
    description || "The user did not leave a review description";

  return Review.createReview({ userId, courseId, rating, review });
}

export async function getReview({ userId, courseId }) {
  const course = await Course.findById(courseId);
  if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

  return Review.getReview({ userId, courseId });
}

export async function reviewHelpfulVote({ userId, reviewId, isHelpful }) {
  const user = userId ? await User.findById(userId) : null;
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  const review = await Review.findById(reviewId);
  if (!review) throw new ApiError(StatusCode.NOT_FOUND, "Review not found");

  const existingVote = await Review.getReviewHelpfulVote({ userId, reviewId });
  const isHelpfulBool = isHelpful === true || isHelpful === "true";

  if (!existingVote) {
    await Review.createReviewHelpfulVote({ userId, reviewId, isHelpful });
  } else if (existingVote.is_helpful === isHelpfulBool) {
    await Review.deleteReviewHelpfulVote({ userId, reviewId });
  } else {
    await Review.updateReviewHelpfulVote({ userId, reviewId, isHelpful });
  }
}

export async function createReviewReport({
  userId,
  reviewId,
  reason,
  description,
}) {
  const user = userId ? await User.findById(userId) : null;
  if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

  const review = await Review.findById(reviewId);
  if (!review) throw new ApiError(StatusCode.NOT_FOUND, "Review not found");

  const existingReport = await Review.getReviewReports({ userId, reviewId });
  if (existingReport) {
    throw new ApiError(StatusCode.BAD_REQUEST, "Review already reported");
  }

  return Review.createReviewReport({
    userId,
    reviewId,
    reason,
    description,
  });
}
