import { api, buildQuery } from "@/lib/apiClient";

export const dashboardApi = {
  getRecentlyViewed: (options) =>
    api.get("/users/me/courses/recently-viewed", options),
  getRecommended: (options) =>
    api.get("/users/me/courses/recommended", options),
  getInProgress: (params, options) =>
    api.getPaginated(
      `/users/me/courses/in-progress${buildQuery(params)}`,
      options,
    ),
  getCompleted: (params, options) =>
    api.getPaginated(
      `/users/me/courses/completed${buildQuery(params)}`,
      options,
    ),
};
