import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import {
  helpfulVoteValidator,
  reportValidator,
  reviewValidator,
} from "./validation.js";

// Mounted at /api/v1/courses/:courseId/reviews
export const reviewsCollectionRoute = express.Router({ mergeParams: true });

reviewsCollectionRoute
  .route("/")
  .get(controller.getReviews)
  .post(requireAuth, reviewValidator, validateResult, controller.createReview);

reviewsCollectionRoute.get("/summary", controller.getReviewDetail);
reviewsCollectionRoute.get("/me", requireAuth, controller.getReview);

// Mounted at /api/v1/reviews
export const reviewsItemRoute = express.Router();

reviewsItemRoute.put(
  "/:reviewId/helpful-vote",
  requireAuth,
  helpfulVoteValidator,
  validateResult,
  controller.setHelpfulVote,
);
reviewsItemRoute.delete(
  "/:reviewId/helpful-vote",
  requireAuth,
  controller.removeHelpfulVote,
);
reviewsItemRoute.post(
  "/:reviewId/reports",
  requireAuth,
  reportValidator,
  validateResult,
  controller.createReviewReport,
);
