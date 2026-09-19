import { lazy } from "react";
import { useAuth } from "@/app/providers/context";

const AdminDashboard = lazy(
  () => import("@/features/dashboard/pages/DashboardPage"),
);
const InstructorDashboard = lazy(
  () => import("@/features/instructor/pages/InstructorDashboardPage"),
);

export default function RoleHome() {
  const { user } = useAuth();

  if (user?.role === "ADMIN") return <AdminDashboard />;
  return <InstructorDashboard />;
}
