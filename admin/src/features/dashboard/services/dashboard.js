import { api } from "@/lib/apiClient";

export const dashboardApi = {
  getDashboardData: () => api.get("/admin/dashboard"),
};