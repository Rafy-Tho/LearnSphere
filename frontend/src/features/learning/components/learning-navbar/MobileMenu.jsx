import { useId } from "react";
import useMenuState from "@/hooks/useMenuState";
import { MoreVertical } from "lucide-react";
import MobileMenuContent from "@/features/learning/components/learning-navbar/MobileMenuContent";

/**
 * Mobile menu component (visible below md breakpoint)
 * Uses its own state management
 */
function MobileMenu({ setIsRatingOpen }) {
  const { isOpen: menuOpen, setIsOpen: setMenuOpen, menuRef } = useMenuState();
  const menuId = useId();

  return (
    <div ref={menuRef} className="relative shrink-0 md:hidden">
      <button
        type="button"
        id={`${menuId}-trigger`}
        aria-expanded={menuOpen}
        aria-controls={menuId}
        aria-haspopup="true"
        aria-label="More options"
        className={`flex h-9 w-9 items-center justify-center rounded-lg text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground cursor-pointer ${
          menuOpen ? "bg-surface-muted text-foreground" : ""
        }`}
        onClick={() => setMenuOpen(!menuOpen)}
      >
        <MoreVertical className="h-5 w-5" />
      </button>

      {menuOpen && (
        <MobileMenuContent
          menuId={menuId}
          setMenuOpen={setMenuOpen}
          setIsRatingOpen={setIsRatingOpen}
        />
      )}
    </div>
  );
}

export default MobileMenu;
