import { NavLink as RouterNavLink } from "react-router-dom";
import { cn } from "@/lib/utils";

export function NavLink({ to, className, activeClassName, end, children }) {
  return (
    <RouterNavLink
      to={to}
      end={end}
      className={({ isActive }) =>
        cn(className, isActive ? activeClassName : undefined)
      }
    >
      {children}
    </RouterNavLink>
  );
}