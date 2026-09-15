import { Navigate, Outlet } from "react-router-dom";
import useAuth from "@/features/auth/hooks/useAuth";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

function RequireAuth() {
  const { user, isLoading } = useAuth();

  if (isLoading) return <SpinnerLoader />;
  if (!user) return <Navigate to="/login" replace />;

  return <Outlet />;
}

export default RequireAuth;
