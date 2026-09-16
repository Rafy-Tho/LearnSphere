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
                    ? "border-b-2 border-primary text-primary"
                    : "text-foreground-muted hover:text-foreground"
                } whitespace-nowrap px-1 pb-3 text-sm font-medium transition-colors`
              }
            >
              {link.label}
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  );
}

export default Desktop;
