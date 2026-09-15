import express from "express";
import requireAuth from "../../common/middleware/requireAuth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validateResult.js";
import { ADMIN } from "../../common/constants/constants.js";
import * as controller from "./controller.js";
import { categoryValidator } from "./validation.js";

const categoriesRoute = express.Router();

categoriesRoute
  .route("/")
  .get(controller.getAllCategories)
  .post(
    requireAuth,
    authorize(ADMIN),
    categoryValidator,
    validateResult,
    controller.createCategory,
  );

categoriesRoute
  .route("/:id")
  .get(controller.getCategoryById)
  .patch(
    requireAuth,
    authorize(ADMIN),
    categoryValidator,
    validateResult,
    controller.updateCategory,
  )
  .delete(requireAuth, authorize(ADMIN), controller.deleteCategory);

export default categoriesRoute;
