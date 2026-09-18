import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "@/app/providers/context";

function RedirectIfAuthenticated() {
  const { user } = useAuth();

  if (user) return <Navigate to="/" replace />;

  return <Outlet />;
}

export default RedirectIfAuthenticated;