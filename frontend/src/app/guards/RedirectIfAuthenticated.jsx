import { Navigate, Outlet } from "react-router-dom";
import useAuth from "@/features/auth/hooks/useAuth";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

function RedirectIfAuthenticated() {
  const { user, isLoading } = useAuth();

  if (isLoading) return <SpinnerLoader />;
  if (user) return <Navigate to="/learning-dashboard" replace />;

  return <Outlet />;
}

export default RedirectIfAuthenticated;
