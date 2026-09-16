import { api } from "@/lib/apiClient";

export const categoriesApi = {
  getAll: (options) => api.get("/categories", options),
};
