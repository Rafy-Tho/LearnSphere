import { NavLink } from "react-router-dom";
import { navLinks } from "@/constants/navLinks";

function Desktop({ closeAll }) {
  return (
    <nav className="hidden lg:flex items-center flex-1 justify-center">
      <ul className="flex items-center gap-4">
        {navLinks.map((link) => (
          <li key={link.label}>
            <NavLink
              to={link.href}
              onClick={() => {
                closeAll();
                window.scrollTo({ top: 0, behavior: "smooth" });
              }}
              className={({ isActive }) =>
                `${
                  isActive
                    ? "text-primary"
                    : "text-foreground-muted hover:text-foreground"
                } relative whitespace-nowrap px-1 pb-3 text-sm font-medium transition-colors`
              }
            >
              {({ isActive }) => (
                <>
                  {link.label}
                  {isActive && (
                    <span className="absolute inset-x-0 bottom-0 h-0.5 rounded-full bg-primary" />
                  )}
                </>
              )}
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  );
}

export default Desktop;
