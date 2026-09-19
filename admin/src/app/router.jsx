import { lazy, Suspense } from "react";
import { Route, Routes } from "react-router-dom";
import RedirectIfAuthenticated from "@/app/guards/RedirectIfAuthenticated";
import RequireAuth from "@/app/guards/RequireAuth";
import RequireRole from "@/app/guards/RequireRole";
import { Loading } from "@/components/common/Loading";
import LoginPage from "@/features/auth/pages/LoginPage";
import NotFound from "@/pages/NotFound";

const AdminLayout = lazy(() =>
  import("@/layouts/AdminLayout").then((m) => ({ default: m.AdminLayout })),
);
const RoleHome = lazy(() => import("@/pages/RoleHome"));
const CategoriesPage = lazy(
  () => import("@/features/categories/pages/CategoriesPage"),
);
const CourseDetailPage = lazy(
  () => import("@/features/courses/pages/CourseDetailPage"),
);
const CourseReviewsPage = lazy(
  () => import("@/features/courses/pages/CourseReviewsPage"),
);
const CoursesPage = lazy(() => import("@/features/courses/pages/CoursesPage"));
const InstructorEarningsPage = lazy(
  () => import("@/features/instructor/pages/InstructorEarningsPage"),
);
const NoAccess = lazy(() => import("@/pages/NoAccess"));
const PayoutsPage = lazy(
  () => import("@/features/payouts/pages/PayoutsPage"),
);
const ProfilePage = lazy(() => import("@/features/users/pages/ProfilePage"));
const SubscriptionsPage = lazy(
  () => import("@/features/subscriptions/pages/SubscriptionsPage"),
);
const UsersPage = lazy(() => import("@/features/users/pages/UsersPage"));

function AppRouter() {
  return (
    <Suspense fallback={<Loading />}>
      <Routes>
        <Route
          path="/login"
          element={
            <RedirectIfAuthenticated>
              <LoginPage />
            </RedirectIfAuthenticated>
          }
        />
        <Route element={<RequireAuth />}>
          <Route element={<RequireRole allowedRoles={["ADMIN", "INSTRUCTOR"]} />}>
            <Route element={<AdminLayout />}>
              <Route path="/" element={<RoleHome />} />
              <Route path="/courses" element={<CoursesPage />} />
              <Route path="/courses/:courseId" element={<CourseDetailPage />} />
              <Route path="/earnings" element={<InstructorEarningsPage />} />
              <Route path="/profile" element={<ProfilePage />} />
              <Route element={<RequireRole allowedRoles={["ADMIN"]} />}>
                <Route path="/categories" element={<CategoriesPage />} />
                <Route path="/course-reviews" element={<CourseReviewsPage />} />
                <Route path="/subscriptions" element={<SubscriptionsPage />} />
                <Route
                  path="/instructors"
                  element={
                    <UsersPage
                      filterRole="INSTRUCTOR"
                      title="Instructors"
                      subtitle="Manage instructors"
                    />
                  }
                />
                <Route
                  path="/users"
                  element={
                    <UsersPage title="Users" subtitle="Manage all users" />
                  }
                />
                <Route path="/payouts" element={<PayoutsPage />} />
              </Route>
            </Route>
          </Route>
          <Route path="/no-access" element={<NoAccess />} />
          <Route path="*" element={<NotFound />} />
        </Route>
      </Routes>
    </Suspense>
  );
}

export default AppRouter;
