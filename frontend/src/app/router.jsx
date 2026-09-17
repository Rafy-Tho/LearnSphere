import { lazy, Suspense } from "react";
import { Route, Routes } from "react-router-dom";
import AppLayout from "@/layouts/AppLayout";
import LearningLayout from "@/layouts/LearningLayout";
import RedirectIfAuthenticated from "@/app/guards/RedirectIfAuthenticated";
import RequireAuth from "@/app/guards/RequireAuth";
import RedirectToFirstLesson from "@/app/guards/RedirectToFirstLesson";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const Home = lazy(() => import("@/features/catalog/pages/Home"));
const CoursePage = lazy(() => import("@/features/catalog/pages/CourseScreen"));
const CourseDetailScreen = lazy(
  () => import("@/features/catalog/pages/CourseDetailScreen"),
);
const Login = lazy(() => import("@/features/auth/pages/Login"));
const Signup = lazy(() => import("@/features/auth/pages/Signup"));
const ResetPasswordFlow = lazy(
  () => import("@/features/auth/pages/ResetPasswordFlow"),
);
const VerifyEmail = lazy(
  () => import("@/features/auth/pages/VerifyEmail"),
);
const OAuthCallback = lazy(
  () => import("@/features/auth/pages/OAuthCallback"),
);
const LearningDashboard = lazy(
  () => import("@/features/dashboard/pages/LearningDashboard"),
);
const HomeDashboard = lazy(
  () => import("@/features/dashboard/pages/HomeDashboard"),
);
const RecentViewDashboard = lazy(
  () => import("@/features/dashboard/pages/RecentViewDashboard"),
);
const InProgressDashboard = lazy(
  () => import("@/features/dashboard/pages/InProgressDashboard"),
);
const CompletedCourseDashboard = lazy(
  () => import("@/features/dashboard/pages/CompletedCourseDashboard"),
);
const SavedCoursesDashboard = lazy(
  () => import("@/features/dashboard/pages/SavedCoursesDashboard"),
);
const ActivityDashboard = lazy(
  () => import("@/features/dashboard/pages/ActivityDashboard"),
);
const CertificatesDashboard = lazy(
  () => import("@/features/dashboard/pages/CertificatesDashboard"),
);
const CourseLearningScreen = lazy(
  () => import("@/features/learning/pages/CourseLearningScreen"),
);
const LessonContent = lazy(
  () => import("@/features/learning/pages/LessonContent"),
);
const Quiz = lazy(() => import("@/features/learning/pages/Quiz"));
const CertificateView = lazy(
  () => import("@/features/learning/pages/CertificateView"),
);
const PricingScreen = lazy(
  () => import("@/features/subscriptions/pages/PricingScreen"),
);
const PaymentSuccess = lazy(
  () => import("@/features/subscriptions/pages/PaymentSuccess"),
);
const PaymentCancel = lazy(
  () => import("@/features/subscriptions/pages/PaymentCancel"),
);
const UserSetting = lazy(() => import("@/features/settings/pages/UserSetting"));
const NotFoundPage = lazy(() => import("@/pages/NotFoundPage"));

function AppRouter() {
  return (
    <Suspense fallback={<SpinnerLoader />}>
      <Routes>
        {/* App Layout */}
        <Route path="/" element={<AppLayout />}>
          {/* Login and Signup */}
          <Route element={<RedirectIfAuthenticated />}>
            <Route index element={<Home />} />
            <Route path="/signup" element={<Signup />} />
            <Route path="/login" element={<Login />} />
            <Route path="/reset-password" element={<ResetPasswordFlow />} />
            <Route path="/verify-email" element={<VerifyEmail />} />
          </Route>
          {/* OAuth callback (public: backend has already set the session) */}
          <Route path="/auth/callback" element={<OAuthCallback />} />
          {/* Learning Dashboard */}
          <Route element={<RequireAuth />}>
            <Route path="/learning-dashboard" element={<LearningDashboard />}>
              <Route index element={<HomeDashboard />} />
              <Route path="recent-viewed" element={<RecentViewDashboard />} />
              <Route path="in-progress" element={<InProgressDashboard />} />
              <Route path="completed" element={<CompletedCourseDashboard />} />
              <Route path="saved" element={<SavedCoursesDashboard />} />
              <Route path="activity" element={<ActivityDashboard />} />
              <Route path="certificates" element={<CertificatesDashboard />} />
            </Route>
            <Route path="/payment-success" element={<PaymentSuccess />} />
            <Route path="/payment-cancel" element={<PaymentCancel />} />
            <Route path="/user-setting" element={<UserSetting />} />
          </Route>
          {/* Courses */}
          <Route path="/courses" element={<CoursePage />} />
          <Route path="/courses/:courseId" element={<CourseDetailScreen />} />
          <Route path="/pricing" element={<PricingScreen />} />
          <Route element={<RequireAuth />}>
            <Route path="/certificates/:id" element={<CertificateView />} />
          </Route>
        </Route>
        {/* Learning Layout */}
        <Route element={<RequireAuth />}>
          <Route path="/courses/:courseId/lessons" element={<LearningLayout />}>
            <Route element={<CourseLearningScreen />}>
              <Route index element={<RedirectToFirstLesson />} />
              <Route path=":lessonId">
                <Route index element={<LessonContent />} />
                <Route path="quiz" element={<Quiz />} />
              </Route>
            </Route>
          </Route>
        </Route>
        {/* Not Found Page */}
        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </Suspense>
  );
}

export default AppRouter;
