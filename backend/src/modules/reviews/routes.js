import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import {
  helpfulVoteValidator,
  reportValidator,
  reviewValidator,
} from "./validation.js";

const reviewsRoute = express.Router({ mergeParams: true });

reviewsRoute
  .route("/")
  .get(controller.getReviews)
  .post(requireAuth, reviewValidator, validateResult, controller.createReview);

reviewsRoute.route("/summary").get(controller.getReviewDetail);

reviewsRoute
  .route("/:id/helpful-votes")
  .post(requireAuth, helpfulVoteValidator, validateResult, controller.reviewHelpfulVote);

reviewsRoute
  .route("/:id/reports")
  .post(requireAuth, reportValidator, validateResult, controller.createReviewReport);

reviewsRoute.route("/me").get(requireAuth, controller.getReview);

export default reviewsRoute;
