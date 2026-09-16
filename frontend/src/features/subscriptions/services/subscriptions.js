import { api } from "@/lib/apiClient";

export const subscriptionsApi = {
  getById: (id, options) => api.get(`/plans/${id}`, options),
  getActive: (options) => api.get("/users/me/subscription", options),
  createPayment: (id) => api.post(`/subscriptions/${id}/checkout`),
};
