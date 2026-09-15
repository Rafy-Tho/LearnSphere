import { api } from "@/lib/apiClient";

export const categoriesApi = {
  getAll: () => api.get("/categories"),
};
