import authRoute from "../modules/auth/routes.js";
import usersRoute from "../modules/users/routes.js";
import adminRoute from "../modules/admin/routes.js";
import adminUsersRoute from "../modules/admin/admin-user.routes.js";
import categoriesRoute from "../modules/categories/routes.js";
import coursesRoute from "../modules/courses/routes.js";
import { objectivesItemRoute } from "../modules/courses/objectives.routes.js";
import adminCoursesRoute from "../modules/courses/admin.routes.js";
import meCoursesRoute from "../modules/courses/me.routes.js";
import { meSavedCoursesRoute } from "../modules/saved-courses/routes.js";
import { moduleCollectionRoute, moduleItemRoute } from "../modules/content/module.routes.js";
import { chapterCollectionRoute, chapterItemRoute } from "../modules/content/chapter.routes.js";
import { lessonCollectionRoute, lessonItemRoute } from "../modules/content/lesson.routes.js";
import {
  lessonContentCollectionRoute,
  lessonContentItemRoute,
} from "../modules/content/lesson-content.routes.js";
import {
  questionCollectionRoute,
  questionItemRoute,
  quizSubmissionRoute,
} from "../modules/content/question.routes.js";
import { optionCollectionRoute, optionItemRoute } from "../modules/content/option.routes.js";
import quizAttemptRoute from "../modules/quiz/quiz-attempt.routes.js";
import completionRoute from "../modules/learning/completion.routes.js";
import { reviewsItemRoute } from "../modules/reviews/routes.js";
import {
  certificateItemRoute,
  meCertificatesRoute,
} from "../modules/certificates/routes.js";
import plansRoute from "../modules/subscriptions/plans.routes.js";
import subscriptionsRoute from "../modules/subscriptions/routes.js";
import meSubscriptionRoute from "../modules/subscriptions/me.routes.js";
import {
  adminPaymentsRoute,
  adminPlansRoute,
  adminSubscriptionsRoute,
} from "../modules/subscriptions/admin.routes.js";

export function registerRoutes(app) {
  // Auth + current user
  app.use("/api/v1/auth", authRoute);
  app.use("/api/v1/users/me/courses", meCoursesRoute);
  app.use("/api/v1/users/me/saved-courses", meSavedCoursesRoute);
  app.use("/api/v1/users/me/certificates", meCertificatesRoute);
  app.use("/api/v1/users/me/subscription", meSubscriptionRoute);
  app.use("/api/v1/users", usersRoute);

  // Catalog
  app.use("/api/v1/categories", categoriesRoute);
  app.use("/api/v1/courses", coursesRoute);
  app.use("/api/v1/objectives", objectivesItemRoute);

  // Content: collections under their parent, items at top level
  app.use("/api/v1/courses/:courseId/modules", moduleCollectionRoute);
  app.use("/api/v1/modules", moduleItemRoute);
  app.use("/api/v1/modules/:moduleId/chapters", chapterCollectionRoute);
  app.use("/api/v1/chapters", chapterItemRoute);
  app.use("/api/v1/chapters/:chapterId/lessons", lessonCollectionRoute);
  app.use("/api/v1/lessons", lessonItemRoute);
  app.use("/api/v1/lessons/:lessonId/contents", lessonContentCollectionRoute);
  app.use("/api/v1/contents", lessonContentItemRoute);
  app.use("/api/v1/lessons/:lessonId/questions", questionCollectionRoute);
  app.use("/api/v1/lessons/:lessonId/quiz-submissions", quizSubmissionRoute);
  app.use("/api/v1/lessons/:lessonId/quiz-attempts", quizAttemptRoute);
  app.use("/api/v1/lessons/:lessonId/completions", completionRoute);
  app.use("/api/v1/questions", questionItemRoute);
  app.use("/api/v1/questions/:questionId/options", optionCollectionRoute);
  app.use("/api/v1/options", optionItemRoute);

  // Reviews item routes (collection mounts under /courses/:courseId/reviews)
  app.use("/api/v1/reviews", reviewsItemRoute);

  // Certificates
  app.use("/api/v1/certificates", certificateItemRoute);

  // Billing
  app.use("/api/v1/plans", plansRoute);
  app.use("/api/v1/subscriptions", subscriptionsRoute);

  // Admin
  app.use("/api/v1/admin/users", adminUsersRoute);
  app.use("/api/v1/admin/courses", adminCoursesRoute);
  app.use("/api/v1/admin/plans", adminPlansRoute);
  app.use("/api/v1/admin/subscriptions", adminSubscriptionsRoute);
  app.use("/api/v1/admin/payments", adminPaymentsRoute);
  app.use("/api/v1/admin", adminRoute);
}
