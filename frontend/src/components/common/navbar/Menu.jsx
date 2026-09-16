import { MenuIcon, X } from "lucide-react";

function Menu({ isMobileMenuOpen, toggleMobileMenu }) {
  return (
    <button
      onClick={toggleMobileMenu}
      className="lg:hidden p-2 rounded-md text-foreground-muted hover:bg-surface-muted hover:text-foreground transition-colors cursor-pointer"
      aria-label="Toggle menu"
      aria-expanded={isMobileMenuOpen}
    >
      {isMobileMenuOpen ? <X /> : <MenuIcon />}
    </button>
  );
}

export default Menu;
