import { api } from "@/lib/apiClient";

export const subscriptionsApi = {
  getBillingStats: () => api.get("/admin/billing/stats"),
  getPlans: () => api.getPaginated("/admin/plans?limit=100"),
  createPlan: (data) => api.post("/admin/plans", data),
  updatePlan: (id, data) => api.patch(`/admin/plans/${id}`, data),
  deletePlan: (id) => api.delete(`/admin/plans/${id}`),
  getSubscriptions: () => api.getPaginated("/admin/subscriptions?limit=100"),
  overrideSubscription: (data) => api.post("/admin/subscriptions/override", data),
  getPayments: () => api.getPaginated("/admin/payments?limit=100"),
  refundPayment: (id, data) => api.post(`/admin/payments/${id}/refunds`, data),
  getCoupons: () => api.getPaginated("/admin/coupons?limit=100"),
  createCoupon: (data) => api.post("/admin/coupons", data),
  updateCoupon: (id, data) => api.patch(`/admin/coupons/${id}`, data),
  setCouponActive: (id, isActive) =>
    api.patch(`/admin/coupons/${id}/status`, { is_active: isActive }),
};