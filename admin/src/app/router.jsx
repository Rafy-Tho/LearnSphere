import { Route, Routes } from "react-router-dom";
import RedirectIfAuthenticated from "@/app/guards/RedirectIfAuthenticated";
import RequireAuth from "@/app/guards/RequireAuth";
import { AdminLayout } from "@/layouts/AdminLayout";
import CategoriesPage from "@/features/categories/pages/CategoriesPage";
import CourseDetailPage from "@/features/courses/pages/CourseDetailPage";
import CoursesPage from "@/features/courses/pages/CoursesPage";
import DashboardPage from "@/features/dashboard/pages/DashboardPage";
import LoginPage from "@/features/auth/pages/LoginPage";
import NotFound from "@/pages/NotFound";
import ProfilePage from "@/features/users/pages/ProfilePage";
import SubscriptionsPage from "@/features/subscriptions/pages/SubscriptionsPage";
import UsersPage from "@/features/users/pages/UsersPage";

function AppRouter() {
  return (
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
  );
}

export default AppRouter;