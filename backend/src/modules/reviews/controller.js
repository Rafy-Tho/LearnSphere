import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as reviewsService from "./service.js";

export const getReviews = asyncHandler(async (req, res) => {
  const { data, pagination } = await reviewsService.getReviews({
    courseId: req.params.courseId,
    userId: req.session?.user?.id || null,
    query: req.query,
  });

  return sendSuccess(res, data, {
    message: "Reviews retrieved successfully",
    pagination,
  });
});

export const getReviewDetail = asyncHandler(async (req, res) => {
  const review = await reviewsService.getReviewDetail(req.params.courseId);

  return sendSuccess(res, review, {
    message: "Review retrieved successfully",
  });
});

export const createReview = asyncHandler(async (req, res) => {
  const review = await reviewsService.createReview({
    userId: req.session.user.id,
    courseId: req.params.courseId,
    rating: req.body.rating,
    description: req.body.description,
  });

  return sendSuccess(res, review, { message: "Review created successfully" });
});

export const getReview = asyncHandler(async (req, res) => {
  const review = await reviewsService.getReview({
    userId: req.session.user.id,
    courseId: req.params.courseId,
  });

  return sendSuccess(res, review || null, {
    message: "Review retrieved successfully",
  });
});

export const setHelpfulVote = asyncHandler(async (req, res) => {
  await reviewsService.setHelpfulVote({
    userId: req.session.user.id,
    reviewId: req.params.reviewId,
    isHelpful: req.body.isHelpful,
  });

  return sendSuccess(res, null, {
    message: "Review helpful vote saved successfully",
  });
});

export const removeHelpfulVote = asyncHandler(async (req, res) => {
  await reviewsService.removeHelpfulVote({
    userId: req.session.user.id,
    reviewId: req.params.reviewId,
  });

  return sendSuccess(res, null, {
    message: "Review helpful vote removed successfully",
  });
});

export const createReviewReport = asyncHandler(async (req, res) => {
  const report = await reviewsService.createReviewReport({
    userId: req.session.user.id,
    reviewId: req.params.reviewId,
    reason: req.body.reason,
    description: req.body.description,
  });

  return sendSuccess(res, report, {
    message: "Review report created successfully",
  });
});
