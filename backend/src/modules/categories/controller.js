import StatusCode from "../../common/constants/StatusCode.js";
import asyncHandler from "../../common/http/asyncHandler.js";
import { sendSuccess } from "../../common/http/response.js";
import * as categoriesService from "./service.js";

export const getAllCategories = asyncHandler(async (req, res) => {
  const categories = await categoriesService.listCategories();

  return sendSuccess(res, categories, {
    message: "Categories retrieved successfully",
  });
});

export const getCategoryById = asyncHandler(async (req, res) => {
  const category = await categoriesService.getCategory(req.params.categoryId);

  return sendSuccess(res, category, {
    message: "Category retrieved successfully",
  });
});

export const createCategory = asyncHandler(async (req, res) => {
  const category = await categoriesService.createCategory(req.body);

  return sendSuccess(res, category, {
    statusCode: StatusCode.CREATED,
    message: "Category created successfully",
  });
});

export const updateCategory = asyncHandler(async (req, res) => {
  const category = await categoriesService.updateCategory(
    req.params.categoryId,
    req.body,
  );

  return sendSuccess(res, category, {
    message: "Category updated successfully",
  });
});

export const deleteCategory = asyncHandler(async (req, res) => {
  await categoriesService.deleteCategory(req.params.categoryId);

  return sendSuccess(res, null, { message: "Category deleted successfully" });
});
