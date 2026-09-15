import ApiError from "../../common/errors/ApiError.js";
import StatusCode from "../../common/constants/StatusCode.js";
import Category from "./repository.js";

export async function listCategories() {
  return Category.findAll();
}

export async function getCategory(categoryId) {
  const category = await Category.findById(categoryId);
  if (!category) {
    throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
  }
  return category;
}

export async function createCategory({ name, slug, description }) {
  return Category.create({ name, slug, description });
}

export async function updateCategory(categoryId, data) {
  const category = await Category.findById(categoryId);
  if (!category) {
    throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
  }

  await Category.update({
    categoryId,
    name: data.name || category.name,
    slug: data.slug || category.slug,
    description: data.description || category.description,
  });

  return Category.findById(categoryId);
}

export async function deleteCategory(categoryId) {
  const category = await Category.findById(categoryId);
  if (!category) {
    throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
  }

  await Category.delete(categoryId);
}
