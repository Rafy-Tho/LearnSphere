import { api, buildQuery } from "@/lib/apiClient";

export const subscriptionsApi = {
  getPlans: (options) => api.get("/plans", options),
  getById: (id, options) => api.get(`/plans/${id}`, options),
  getActive: (options) => api.get("/users/me/subscription", options),
  checkout: (id, couponCode) =>
    api.post(
      `/subscriptions/${id}/checkout`,
      couponCode ? { coupon_code: couponCode } : {},
    ),
  validateCoupon: (payload) => api.post("/coupons/validate", payload),
  getPayments: (params, options) =>
    api.getPaginated(
      `/users/me/payments${buildQuery(params)}`,
      options,
    ),
  getPayment: (id, options) => api.get(`/users/me/payments/${id}`, options),
  getRefundRequests: (params, options) =>
    api.getPaginated(
      `/users/me/refund-requests${buildQuery(params)}`,
      options,
    ),
  getRefundRequest: (id, options) =>
    api.get(`/users/me/refund-requests/${id}`, options),
  getPaymentRefundRequests: (paymentId, options) =>
    api.get(`/users/me/payments/${paymentId}/refund-requests`, options),
  createRefundRequest: (paymentId, payload) =>
    api.post(`/users/me/payments/${paymentId}/refund-requests`, payload),
};
