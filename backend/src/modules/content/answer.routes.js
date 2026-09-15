import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import * as controller from "./controller.js";
import { answerValidator } from "./validation.js";

const answerRoute = express.Router({ mergeParams: true });

answerRoute
  .route("/")
  .post(requireAuth, answerValidator, validateResult, controller.createAnswer);

answerRoute
  .route("/:id")
  .patch(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.updateAnswer)
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteAnswer);

export default answerRoute;
