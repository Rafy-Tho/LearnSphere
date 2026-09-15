import { api } from "@/lib/api-client";

export const subscriptionsApi = {
  getById: (id) => api.get(`/plans/${id}`),
  getActive: () => api.get("/users/me/subscription"),
  createPayment: (id) => api.post(`/subscriptions/${id}/checkout`),
};
