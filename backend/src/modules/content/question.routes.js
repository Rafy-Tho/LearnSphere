import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import answerRoute from "./answer.routes.js";
import * as controller from "./controller.js";
import { questionValidator } from "./validation.js";

const questionRoute = express.Router({ mergeParams: true });

questionRoute.use("/:id/options", answerRoute);
questionRoute
  .route("/")
  .get(controller.getQuestions)
  .post(
    requireAuth,
    authorize(ADMIN, INSTRUCTOR),
    questionValidator,
    validateResult,
    controller.createQuestion,
  );
questionRoute
  .route("/:id")
  .patch(
    requireAuth,
    authorize(ADMIN, INSTRUCTOR),
    questionValidator,
    validateResult,
    controller.updateQuestion,
  )
  .delete(requireAuth, authorize(ADMIN, INSTRUCTOR), controller.deleteQuestion);

export default questionRoute;
