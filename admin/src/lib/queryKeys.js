export const queryKeys = {
  // Auth & User
  me: () => ['me'],

  // Dashboard
  dashboardData: () => ['dashboard-data'],

  // Categories
  categories: () => ['categories'],

  // Courses
  courses: (params) => ['courses', params],
  courseDetails: (courseId) => ['course-details', courseId],

  // Users
  users: (params) => ['admin-users', params],

  // Subscriptions
  plans: () => ['admin-plans'],
  subscriptions: () => ['admin-user-subscriptions'],
  payments: () => ['admin-payments'],
  coupons: () => ['admin-coupons'],
  billingStats: () => ['admin-billing-stats'],
};

export const userScopedQueryRoots = new Set([
  queryKeys.me()[0],
  queryKeys.dashboardData()[0],
  queryKeys.categories()[0],
  queryKeys.courses(null)[0],
  queryKeys.courseDetails(null)[0],
  queryKeys.users(null)[0],
  queryKeys.plans()[0],
  queryKeys.subscriptions()[0],
  queryKeys.payments()[0],
  queryKeys.coupons()[0],
  queryKeys.billingStats()[0],
]);
