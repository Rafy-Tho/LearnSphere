import express from "express";
import { ADMIN, INSTRUCTOR } from "../../common/constants/constants.js";
import authorize from "../../common/middleware/authorize.js";
import requireAuth from "../../common/middleware/requireAuth.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import chapterRoute from "./chapter.routes.js";
import * as controller from "./controller.js";
import { moduleValidators } from "./validation.js";

const moduleRoute = express.Router({ mergeParams: true });

moduleRoute.use("/:id/chapters", chapterRoute);
moduleRoute
  .route("/")
  .post(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    moduleValidators,
    validateResult,
    controller.createModule,
  );

moduleRoute
  .route("/:id")
  .get(controller.getModule)
  .patch(
    requireAuth,
    authorize(INSTRUCTOR, ADMIN),
    moduleValidators,
    validateResult,
    controller.updateModule,
  )
  .delete(requireAuth, authorize(INSTRUCTOR, ADMIN), controller.deleteModule);

export default moduleRoute;
