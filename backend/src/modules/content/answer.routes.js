import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { answerIdParamValidator, answerValidator } from "./validation.js";

// Mounted at /api/v1/questions/:questionId/options
export const optionCollectionRoute = express.Router({ mergeParams: true });

optionCollectionRoute.post(
  "/",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  answerValidator,
  validateResult,
  controller.createAnswer,
);

// Mounted at /api/v1/options
export const optionItemRoute = express.Router();

optionItemRoute.patch(
  "/:optionId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  answerValidator,
  validateResult,
  controller.updateAnswer,
);
optionItemRoute.delete(
  "/:optionId",
  requireAuth,
  authorize(INSTRUCTOR, ADMIN),
  answerIdParamValidator,
  validateResult,
  controller.deleteAnswer,
);
