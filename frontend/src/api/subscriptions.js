import { api } from "./client";

export const subscriptionsApi = {
  getById: (id) => api.get(`/plans/${id}`),
  getActive: () => api.get("/users/me/subscription"),
};
