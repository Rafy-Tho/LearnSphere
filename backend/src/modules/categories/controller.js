import StatusCode from "../../common/constants/status-code.js";
import asyncHandler from "../../common/http/async-handler.js";
import { sendSuccess } from "../../common/http/response.js";
import categoryService from "./service.js";

class CategoryController {
  constructor({ categoryService }) {
    this.categoryService = categoryService;
  }

  listCategories = asyncHandler(async (req, res) => {
    const categories = await this.categoryService.listCategories();

    return sendSuccess(res, categories, {
      message: "Categories retrieved successfully",
    });
  });

  getCategory = asyncHandler(async (req, res) => {
    const category = await this.categoryService.getCategory(
      req.params.categoryId,
    );

    return sendSuccess(res, category, {
      message: "Category retrieved successfully",
    });
  });

  createCategory = asyncHandler(async (req, res) => {
    const category = await this.categoryService.createCategory(req.body);

    return sendSuccess(res, category, {
      statusCode: StatusCode.CREATED,
      message: "Category created successfully",
    });
  });

  updateCategory = asyncHandler(async (req, res) => {
    const category = await this.categoryService.updateCategory(
      req.params.categoryId,
      req.body,
    );

    return sendSuccess(res, category, {
      message: "Category updated successfully",
    });
  });

  deleteCategory = asyncHandler(async (req, res) => {
    await this.categoryService.deleteCategory(req.params.categoryId);

    return sendSuccess(res, null, { message: "Category deleted successfully" });
  });
}

export { CategoryController };
export default new CategoryController({ categoryService });
