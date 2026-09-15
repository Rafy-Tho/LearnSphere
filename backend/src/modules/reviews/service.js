import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import courseRepository from "../courses/repository.js";
import enrollmentRepository from "../learning/enrollment.repository.js";
import userRepository from "../users/repository.js";
import reviewRepository from "./repository.js";

class ReviewService {
  constructor({
    courseRepository,
    enrollmentRepository,
    userRepository,
    reviewRepository,
  }) {
    this.courseRepository = courseRepository;
    this.enrollmentRepository = enrollmentRepository;
    this.userRepository = userRepository;
    this.reviewRepository = reviewRepository;
  }

  async getReviews({ courseId, userId, query }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.reviewRepository.getReviews(query, courseId, userId);
  }

  async getReviewDetail(courseId) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.reviewRepository.getReviewsDetail(courseId);
  }

  async createReview({ userId, courseId, rating, description }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    const enrollment = await this.enrollmentRepository.findOne({
      courseId,
      userId,
    });
    if (!enrollment) {
      throw new ApiError(
        StatusCode.FORBIDDEN,
        "You must be enrolled in this course to review it",
      );
    }

    const reviewDescription =
      description || "The user did not leave a review description";

    return this.reviewRepository.createReview({
      userId,
      courseId,
      rating,
      review: reviewDescription,
    });
  }

  async getReview({ userId, courseId }) {
    const course = await this.courseRepository.findById(courseId);
    if (!course) throw new ApiError(StatusCode.NOT_FOUND, "Course not found");

    return this.reviewRepository.getReview({ userId, courseId });
  }

  async setHelpfulVote({ userId, reviewId, isHelpful }) {
    const user = userId ? await this.userRepository.findById(userId) : null;
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    const review = await this.reviewRepository.findById(reviewId);
    if (!review) throw new ApiError(StatusCode.NOT_FOUND, "Review not found");

    const existingVote = await this.reviewRepository.getReviewHelpfulVote({
      userId,
      reviewId,
    });
    const isHelpfulNormalized = isHelpful === true || isHelpful === "true";

    if (!existingVote) {
      await this.reviewRepository.createReviewHelpfulVote({
        userId,
        reviewId,
        isHelpful: isHelpfulNormalized,
      });
    } else if (existingVote.is_helpful !== isHelpfulNormalized) {
      await this.reviewRepository.updateReviewHelpfulVote({
        userId,
        reviewId,
        isHelpful: isHelpfulNormalized,
      });
    }
  }

  async removeHelpfulVote({ userId, reviewId }) {
    const review = await this.reviewRepository.findById(reviewId);
    if (!review) throw new ApiError(StatusCode.NOT_FOUND, "Review not found");

    await this.reviewRepository.deleteReviewHelpfulVote({ userId, reviewId });
  }

  async createReviewReport({ userId, reviewId, reason, description }) {
    const user = userId ? await this.userRepository.findById(userId) : null;
    if (!user) throw new ApiError(StatusCode.NOT_FOUND, "User not found");

    const review = await this.reviewRepository.findById(reviewId);
    if (!review) throw new ApiError(StatusCode.NOT_FOUND, "Review not found");

    const existingReport = await this.reviewRepository.getReviewReports({
      userId,
      reviewId,
    });
    if (existingReport) {
      throw new ApiError(StatusCode.BAD_REQUEST, "Review already reported");
    }

    return this.reviewRepository.createReviewReport({
      userId,
      reviewId,
      reason,
      description,
    });
  }
}

export { ReviewService };
export default new ReviewService({
  courseRepository,
  enrollmentRepository,
  userRepository,
  reviewRepository,
});
