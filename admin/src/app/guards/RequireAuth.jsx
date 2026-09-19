import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "@/app/providers/context";
import { Loading } from "@/components/common/Loading";

function RequireAuth() {
  const { user, isLoading } = useAuth();

  if (isLoading) return <Loading />;
  if (!user) return <Navigate to="/login" replace />;

  return <Outlet />;
}

export default RequireAuth;