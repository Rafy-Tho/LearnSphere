import { api } from "@/lib/api-client";

export const dashboardApi = {
  getRecentlyViewed: () => api.get("/users/me/courses/recently-viewed"),
  getRecommended: () => api.get("/users/me/courses/recommended"),
  getInProgress: () => api.get("/users/me/courses/in-progress"),
  getCompleted: () => api.get("/users/me/courses/completed"),
};
