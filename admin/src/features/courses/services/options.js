import { api } from "@/lib/apiClient";

export const optionsApi = {
  update: (id, data) => api.patch(`/options/${id}`, data),
  delete: (id) => api.delete(`/options/${id}`),
};