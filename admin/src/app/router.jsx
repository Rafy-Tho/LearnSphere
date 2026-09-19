import { lazy, Suspense } from "react";
import { Route, Routes } from "react-router-dom";
import RedirectIfAuthenticated from "@/app/guards/RedirectIfAuthenticated";
import RequireAuth from "@/app/guards/RequireAuth";
import { Loading } from "@/components/common/Loading";
import LoginPage from "@/features/auth/pages/LoginPage";
import NotFound from "@/pages/NotFound";

const AdminLayout = lazy(() =>
  import("@/layouts/AdminLayout").then((m) => ({ default: m.AdminLayout })),
);
const CategoriesPage = lazy(
  () => import("@/features/categories/pages/CategoriesPage"),
);
const CourseDetailPage = lazy(
  () => import("@/features/courses/pages/CourseDetailPage"),
);
const CoursesPage = lazy(() => import("@/features/courses/pages/CoursesPage"));
const DashboardPage = lazy(
  () => import("@/features/dashboard/pages/DashboardPage"),
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
          <Route element={<AdminLayout />}>
            <Route path="/" element={<DashboardPage />} />
            <Route path="/categories" element={<CategoriesPage />} />
            <Route path="/courses" element={<CoursesPage />} />
            <Route path="/courses/:courseId" element={<CourseDetailPage />} />
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
              element={<UsersPage title="Users" subtitle="Manage all users" />}
            />
            <Route path="/profile" element={<ProfilePage />} />
          </Route>
          <Route path="*" element={<NotFound />} />
        </Route>
      </Routes>
    </Suspense>
  );
}

export default AppRouter;
