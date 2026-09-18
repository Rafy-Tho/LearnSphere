export const queryKeys = {
  me: () => ["me"],

  dashboardData: () => ["dashboard-data"],

  categories: () => ["categories"],

  courses: (params) => ["courses", params],
  courseDetails: (courseId) => ["course-details", courseId],

  users: (params) => ["admin-users", params],

  plans: () => ["admin-plans"],
  subscriptions: (params) => ["admin-user-subscriptions", params],
  payments: (params) => ["admin-payments", params],
  coupons: () => ["admin-coupons"],
  billingStats: () => ["admin-billing-stats"],
};

export const userScopedQueryRoots = new Set([
  queryKeys.me()[0],
  queryKeys.dashboardData()[0],
  queryKeys.categories()[0],
  queryKeys.courses(null)[0],
  queryKeys.courseDetails(null)[0],
  queryKeys.users(null)[0],
  queryKeys.plans()[0],
  queryKeys.subscriptions(null)[0],
  queryKeys.payments(null)[0],
  queryKeys.coupons()[0],
  queryKeys.billingStats()[0],
]);