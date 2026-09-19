import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "@/app/providers/context";
import { Loading } from "@/components/common/Loading";

// Roles that can use the admin console at all. A user whose role is not in this
// set (e.g. LEARNER) is sent to /no-access instead of a redirect loop.
const APP_ROLES = ["ADMIN", "INSTRUCTOR"];

function RequireRole({ allowedRoles }) {
  const { user, isLoading } = useAuth();

  if (isLoading) return <Loading />;
  if (!user) return <Navigate to="/login" replace />;

  if (!allowedRoles.includes(user.role)) {
    return (
      <Navigate
        to={APP_ROLES.includes(user.role) ? "/" : "/no-access"}
        replace
      />
    );
  }

  return <Outlet />;
}

export default RequireRole;
