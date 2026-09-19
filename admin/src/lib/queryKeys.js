export const queryKeys = {
  // Auth & User
  me: () => ['me'],

  // Dashboard
  dashboardData: () => ['dashboard-data'],

  // Categories
  categories: () => ['categories'],

  // Courses
  courses: (params) => ['courses', params],
  courseSummary: (courseId) => ['course-summary', courseId],
  moduleChapters: (courseId, moduleId) => [
    'module-chapters',
    courseId,
    moduleId,
  ],
  chapterLessons: (courseId, chapterId) => [
    'chapter-lessons',
    courseId,
    chapterId,
  ],
  lessonContents: (courseId, lessonId) => [
    'lesson-contents',
    courseId,
    lessonId,
  ],
  lessonQuestions: (courseId, lessonId) => [
    'lesson-questions',
    courseId,
    lessonId,
  ],
  moduleChaptersRoot: (courseId) => ['module-chapters', courseId],
  chapterLessonsRoot: (courseId) => ['chapter-lessons', courseId],
  lessonContentsRoot: (courseId) => ['lesson-contents', courseId],
  lessonQuestionsRoot: (courseId) => ['lesson-questions', courseId],

  // Users
  users: (params) => ['admin-users', params],
  usersRoot: () => ['admin-users'],

  // Instructor workspace
  instructorDashboard: () => ['instructor-dashboard'],
  instructorStudents: (courseId, params) => [
    'instructor-students',
    courseId,
    params,
  ],
  instructorAnalytics: (courseId) => ['instructor-analytics', courseId],
  instructorReviews: (courseId, params) => [
    'instructor-reviews',
    courseId,
    params,
  ],
  instructorCertificates: (courseId, params) => [
    'instructor-certificates',
    courseId,
    params,
  ],
  instructorEarnings: () => ['instructor-earnings'],
  instructorPayouts: (params) => ['instructor-payouts', params],

  // Admin instructor management
  platformSettings: () => ['platform-settings'],
  adminPayouts: (params) => ['admin-payouts', params],

  // Subscriptions
  plans: () => ['admin-plans'],
  subscriptions: () => ['admin-user-subscriptions'],
  subscriptionsDetail: (id) =>
    id === undefined ? ['admin-user-subscription'] : ['admin-user-subscription', id],
  payments: () => ['admin-payments'],
  paymentDetails: (id) =>
    id === undefined ? ['admin-payment'] : ['admin-payment', id],
  paymentRefunds: (id) =>
    id === undefined ? ['admin-payment-refunds'] : ['admin-payment-refunds', id],
  coupons: () => ['admin-coupons'],
  billingStats: () => ['admin-billing-stats'],
  refundRequests: () => ['admin-refund-requests'],
  refundRequestDetails: (id) =>
    id === undefined ? ['admin-refund-request'] : ['admin-refund-request', id],
  refunds: () => ['admin-refunds'],
};

export const userScopedQueryRoots = new Set([
  queryKeys.me()[0],
  queryKeys.dashboardData()[0],
  queryKeys.categories()[0],
  queryKeys.courses(null)[0],
  queryKeys.courseSummary(null)[0],
  queryKeys.moduleChapters(null, null)[0],
  queryKeys.chapterLessons(null, null)[0],
  queryKeys.lessonContents(null, null)[0],
  queryKeys.lessonQuestions(null, null)[0],
  queryKeys.users(null)[0],
  queryKeys.instructorDashboard()[0],
  queryKeys.instructorStudents(null, null)[0],
  queryKeys.instructorAnalytics(null)[0],
  queryKeys.instructorReviews(null, null)[0],
  queryKeys.instructorCertificates(null, null)[0],
  queryKeys.instructorEarnings()[0],
  queryKeys.instructorPayouts(null)[0],
  queryKeys.platformSettings()[0],
  queryKeys.adminPayouts(null)[0],
  queryKeys.plans()[0],
  queryKeys.subscriptions()[0],
  queryKeys.subscriptionsDetail(null)[0],
  queryKeys.payments()[0],
  queryKeys.paymentDetails(null)[0],
  queryKeys.paymentRefunds(null)[0],
  queryKeys.coupons()[0],
  queryKeys.billingStats()[0],
  queryKeys.refundRequests()[0],
  queryKeys.refundRequestDetails(null)[0],
  queryKeys.refunds()[0],
]);
