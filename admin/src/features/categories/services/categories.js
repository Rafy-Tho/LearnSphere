import { api } from "@/lib/apiClient";

export const categoriesApi = {
  getCategories: () => api.get("/categories"),
  createCategory: (category) => api.post("/categories", category),
  updateCategory: (id, category) => api.patch(`/categories/${id}`, category),
  deleteCategory: (id) => api.delete(`/categories/${id}`),
};