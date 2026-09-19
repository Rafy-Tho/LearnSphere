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

  // Subscriptions
  plans: () => ['admin-plans'],
  subscriptions: () => ['admin-user-subscriptions'],
  subscriptionsDetail: (id) =>
    id === undefined ? ['admin-user-subscription'] : ['admin-user-subscription', id],
  payments: () => ['admin-payments'],
  paymentDetails: (id) =>
    id === undefined ? ['admin-payment'] : ['admin-payment', id],
  paymentRefunds: (id) => ['admin-payment-refunds', id],
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
