import { api, buildQuery } from "@/lib/apiClient";

function paged(path, params) {
  return api.getPaginated(`${path}${buildQuery({ limit: 100, ...params })}`);
}

export const subscriptionsApi = {
  getBillingStats: () => api.get("/admin/billing/stats"),

  // Plans
  getPlans: (params) => paged("/admin/plans", params),
  createPlan: (data) => api.post("/admin/plans", data),
  updatePlan: (id, data) => api.patch(`/admin/plans/${id}`, data),
  setPlanStatus: (id, isActive) =>
    api.patch(`/admin/plans/${id}/status`, { is_active: isActive }),
  deletePlan: (id) => api.delete(`/admin/plans/${id}`),

  // Subscriptions
  getSubscriptions: (params) => paged("/admin/subscriptions", params),
  getSubscription: (id) => api.get(`/admin/subscriptions/${id}`),
  overrideSubscription: (data) => api.post("/admin/subscriptions/override", data),

  // Payments
  getPayments: (params) => paged("/admin/payments", params),
  getPayment: (id) => api.get(`/admin/payments/${id}`),
  getPaymentRefunds: (id) => api.get(`/admin/payments/${id}/refunds`),
  refundPayment: (id, data) => api.post(`/admin/payments/${id}/refunds`, data),

  // Refunds
  getRefunds: (params) => paged("/admin/refunds", params),

  // Refund requests
  getRefundRequests: (params) => paged("/admin/refund-requests", params),
  getRefundRequest: (id) => api.get(`/admin/refund-requests/${id}`),
  approveRefundRequest: (id, data) =>
    api.post(`/admin/refund-requests/${id}/approve`, data),
  rejectRefundRequest: (id, data) =>
    api.post(`/admin/refund-requests/${id}/reject`, data),

  // Coupons
  getCoupons: (params) => paged("/admin/coupons", params),
  createCoupon: (data) => api.post("/admin/coupons", data),
  updateCoupon: (id, data) => api.patch(`/admin/coupons/${id}`, data),
  setCouponActive: (id, isActive) =>
    api.patch(`/admin/coupons/${id}/status`, { is_active: isActive }),
};
