import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "@/app/providers/context";
import { PageLoader } from "@/components/ui/skeleton";

function RequireAuth() {
  const { user, isLoading } = useAuth();

  if (isLoading) return <PageLoader />;
  if (!user) return <Navigate to="/login" replace />;

  return <Outlet />;
}

export default RequireAuth;