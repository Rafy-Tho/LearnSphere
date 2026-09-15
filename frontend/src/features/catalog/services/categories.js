import { api } from "@/lib/api-client";

export const categoriesApi = {
  getAll: () => api.get("/categories"),
};
