import authRoute from "../modules/auth/routes.js";
import usersRoute from "../modules/users/routes.js";
import adminRoute from "../modules/admin/routes.js";
import paymentRoute from "../modules/subscriptions/payment.routes.js";
import categoriesRoute from "../modules/categories/routes.js";
import { standaloneCertificateRoute } from "../modules/certificates/routes.js";
import coursesRoute from "../modules/courses/routes.js";
import objectivesRoute from "../modules/courses/objectives.routes.js";
import moduleRoute from "../modules/content/module.routes.js";
import chapterRoute from "../modules/content/chapter.routes.js";
import lessonRoute from "../modules/content/lesson.routes.js";
import lessonContentRoute from "../modules/content/lessonContent.routes.js";
import questionRoute from "../modules/content/question.routes.js";
import answerRoute from "../modules/content/answer.routes.js";
import enrollmentRoute from "../modules/learning/enrollment.routes.js";
import progressRoute from "../modules/learning/progress.routes.js";
import completionRoute from "../modules/learning/completion.routes.js";
import reviewsRoute from "../modules/reviews/routes.js";
import subscriptionsRoute from "../modules/subscriptions/routes.js";
import adminUsersRoute from "../modules/admin/users.routes.js";
import adminSubscriptionsRoute from "../modules/subscriptions/admin.routes.js";

export function registerRoutes(app) {
  // Users (auth + profile + dashboard + Stripe checkout)
  app.use("/api/v1/users", authRoute);
  app.use("/api/v1/users", usersRoute);
  app.use("/api/v1/users", adminRoute);
  app.use("/api/v1/users", paymentRoute);

  // Catalog
  app.use("/api/v1/categories", categoriesRoute);
  app.use("/api/v1/courses", coursesRoute);
  app.use("/api/v1/objectives", objectivesRoute);

  // Content
  app.use("/api/v1/modules", moduleRoute);
  app.use("/api/v1/chapters", chapterRoute);
  app.use("/api/v1/lessons", lessonRoute);
  app.use("/api/v1/contents", lessonContentRoute);
  app.use("/api/v1/questions", questionRoute);
  app.use("/api/v1/options", answerRoute);

  // Learning
  app.use("/api/v1/enrollments", enrollmentRoute);
  app.use("/api/v1/progresses", progressRoute);
  app.use("/api/v1/completions", completionRoute);
  app.use("/api/v1/certificates", standaloneCertificateRoute);

  // Reviews + subscriptions
  app.use("/api/v1/reviews", reviewsRoute);
  app.use("/api/v1/subscriptions", subscriptionsRoute);

  // Admin
  app.use("/api/v1/admin/users", adminUsersRoute);
  app.use("/api/v1/admin/subscriptions", adminSubscriptionsRoute);
}
