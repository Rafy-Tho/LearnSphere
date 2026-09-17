import { api, buildQuery } from "@/lib/apiClient";

export const activityApi = {
  getActivities: (params, options) =>
    api.getPaginated(`/users/me/activities${buildQuery(params)}`, options),
};
