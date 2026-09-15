import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import reviewController from "./controller.js";
import {
  helpfulVoteValidator,
  reportValidator,
  reviewValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/reviews
export const reviewsCollectionRoute = express.Router({ mergeParams: true });

reviewsCollectionRoute
  .route("/")
  .get(reviewController.getReviews)
  .post(requireAuth, reviewValidator, validateResult, reviewController.createReview);

reviewsCollectionRoute.get("/summary", reviewController.getReviewDetail);
reviewsCollectionRoute.get("/me", requireAuth, reviewController.getReview);

// Mounted at /api/v1/reviews
export const reviewsItemRoute = express.Router();

reviewsItemRoute.put(
  "/:reviewId/helpful-vote",
  requireAuth,
  helpfulVoteValidator,
  validateResult,
  reviewController.setHelpfulVote,
);
reviewsItemRoute.delete(
  "/:reviewId/helpful-vote",
  requireAuth,
  reviewController.removeHelpfulVote,
);
reviewsItemRoute.post(
  "/:reviewId/reports",
  requireAuth,
  reportValidator,
  validateResult,
  reviewController.createReviewReport,
);
