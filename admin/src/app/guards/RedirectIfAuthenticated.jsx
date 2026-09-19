import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "@/app/providers/context";

function RedirectIfAuthenticated({ children }) {
  const { user } = useAuth();

  if (user) return <Navigate to="/" replace />;

  // Render wrapped children when provided (used by /login); otherwise act as a
  // layout route and render the matched child route.
  return children ?? <Outlet />;
}

export default RedirectIfAuthenticated;