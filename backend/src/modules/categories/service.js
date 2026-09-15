import ApiError from "../../common/errors/api-error.js";
import StatusCode from "../../common/constants/status-code.js";
import categoryRepository from "./repository.js";

class CategoryService {
  constructor({ categoryRepository }) {
    this.categoryRepository = categoryRepository;
  }

  async listCategories() {
    return this.categoryRepository.findAll();
  }

  async getCategory(categoryId) {
    const category = await this.categoryRepository.findById(categoryId);
    if (!category) {
      throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
    }
    return category;
  }

  async createCategory({ name, slug, description }) {
    return this.categoryRepository.create({ name, slug, description });
  }

  async updateCategory(categoryId, categoryData) {
    const category = await this.categoryRepository.findById(categoryId);
    if (!category) {
      throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
    }

    await this.categoryRepository.update({
      categoryId,
      name: categoryData.name || category.name,
      slug: categoryData.slug || category.slug,
      description: categoryData.description || category.description,
    });

    return this.categoryRepository.findById(categoryId);
  }

  async deleteCategory(categoryId) {
    const category = await this.categoryRepository.findById(categoryId);
    if (!category) {
      throw new ApiError(StatusCode.NOT_FOUND, "Category not found");
    }

    await this.categoryRepository.delete(categoryId);
  }
}

export { CategoryService };
export default new CategoryService({ categoryRepository });
