import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import reviewService from "./service.js";

class ReviewController {
  constructor({ reviewService }) {
    this.reviewService = reviewService;
  }

  getReviews = asyncHandler(async (req, res) => {
    const { reviews, pagination } = await this.reviewService.getReviews({
      courseId: req.params.courseId,
      userId: req.session?.user?.id || null,
      query: req.query,
    });

    return sendSuccess(res, reviews, {
      message: "Reviews retrieved successfully",
      pagination,
    });
  });

  getReviewDetail = asyncHandler(async (req, res) => {
    const review = await this.reviewService.getReviewDetail(
      req.params.courseId,
    );

    return sendSuccess(res, review, {
      message: "Review retrieved successfully",
    });
  });

  createReview = asyncHandler(async (req, res) => {
    const review = await this.reviewService.createReview({
      userId: req.session.user.id,
      courseId: req.params.courseId,
      rating: req.body.rating,
      description: req.body.description,
    });

    return sendSuccess(res, review, { message: "Review created successfully" });
  });

  getReview = asyncHandler(async (req, res) => {
    const review = await this.reviewService.getReview({
      userId: req.session.user.id,
      courseId: req.params.courseId,
    });

    return sendSuccess(res, review || null, {
      message: "Review retrieved successfully",
    });
  });

  setHelpfulVote = asyncHandler(async (req, res) => {
    await this.reviewService.setHelpfulVote({
      userId: req.session.user.id,
      reviewId: req.params.reviewId,
      isHelpful: req.body.isHelpful,
    });

    return sendSuccess(res, null, {
      message: "Review helpful vote saved successfully",
    });
  });

  removeHelpfulVote = asyncHandler(async (req, res) => {
    await this.reviewService.removeHelpfulVote({
      userId: req.session.user.id,
      reviewId: req.params.reviewId,
    });

    return sendSuccess(res, null, {
      message: "Review helpful vote removed successfully",
    });
  });

  createReviewReport = asyncHandler(async (req, res) => {
    const report = await this.reviewService.createReviewReport({
      userId: req.session.user.id,
      reviewId: req.params.reviewId,
      reason: req.body.reason,
      description: req.body.description,
    });

    return sendSuccess(res, report, {
      message: "Review report created successfully",
    });
  });
}

export { ReviewController };
export default new ReviewController({ reviewService });
