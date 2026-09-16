// src/components/Tabs.tsx
import { NavLink } from "react-router-dom";
const tabs = [
  { label: "Home", href: "/learning-dashboard" },
  { label: "Recently Viewed", href: "/learning-dashboard/recent-viewed" },
  { label: "In Progress", href: "/learning-dashboard/in-progress" },
  { label: "Completed", href: "/learning-dashboard/completed" },
];
export default function Tabs() {
  return (
    <nav
      className="mb-8 flex gap-6 overflow-x-auto border-b border-border pb-0"
      aria-label="Main"
    >
      {tabs.map((t) => (
        <NavLink
          key={t.label}
          to={t.href}
          end={true}
          className={({ isActive }) =>
            `${
              isActive
                ? "border-b-2 border-primary text-primary"
                : "text-foreground-muted hover:text-foreground"
            } whitespace-nowrap px-1 pb-3 text-sm font-medium transition-colors`
          }
        >
          {t.label}
        </NavLink>
      ))}
    </nav>
  );
}
