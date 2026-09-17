import { checkSchema } from "express-validator";
import { validateListQuery } from "../../common/middleware/list-query-validator.js";
import {
  booleanValidator,
  floatValidator,
  textValidator,
} from "../../common/validation.js";
import { reviewListQuerySpec } from "./review.query-spec.js";

export const reviewListQueryValidator = validateListQuery(reviewListQuerySpec);

export const helpfulVoteValidator = checkSchema({
  isHelpful: booleanValidator("Is Helpful"),
});

export const reportValidator = checkSchema({
  reason: textValidator("Report Reason", false, 500),
  description: textValidator("Report Description", false, 500),
});

export const reviewValidator = checkSchema({
  description: textValidator("Review Description", true, 500),
  rating: floatValidator("Rating"),
});
