import { api, buildQuery } from "@/lib/apiClient";

function toQueryString(params) {
  if (typeof params === "string") return params ? `?${params}` : "";
  return buildQuery(params);
}

export const payoutsApi = {
  getSettings: () => api.get("/admin/settings"),
  updateSettings: (data) => api.patch("/admin/settings", data),
  getPayouts: (params) =>
    api.getPaginated(`/admin/instructor-payouts${toQueryString(params)}`),
  createPayout: (data) => api.post("/admin/instructor-payouts", data),
  updatePayout: (id, data) =>
    api.patch(`/admin/instructor-payouts/${id}`, data),
};
