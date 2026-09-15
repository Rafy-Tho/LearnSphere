import express from "express";
import requireAuth from "../../common/middleware/require-auth.js";
import authorize from "../../common/middleware/authorize.js";
import { validateResult } from "../../common/middleware/validate-result.js";
import { ADMIN } from "../../common/constants/constants.js";
import categoryController from "./controller.js";
import { categoryIdParamValidator, categoryValidator } from "./validation.js";

const categoriesRoute = express.Router();

categoriesRoute
  .route("/")
  .get(categoryController.listCategories)
  .post(
    requireAuth,
    authorize(ADMIN),
    categoryValidator,
    validateResult,
    categoryController.createCategory,
  );

categoriesRoute
  .route("/:categoryId")
  .get(categoryController.getCategory)
  .patch(
    requireAuth,
    authorize(ADMIN),
    categoryValidator,
    validateResult,
    categoryController.updateCategory,
  )
  .delete(
    requireAuth,
    authorize(ADMIN),
    categoryIdParamValidator,
    validateResult,
    categoryController.deleteCategory,
  );

export default categoriesRoute;
