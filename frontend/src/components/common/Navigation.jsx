import { useEffect, useRef, useState } from "react";
import Avatar from "@/components/common/navbar/Avatar";
import Desktop from "@/components/common/navbar/Desktop";
import Logo from "@/components/common/navbar/Logo";
import Menu from "@/components/common/navbar/Menu";
import Mobile from "@/components/common/navbar/Mobile";
import LoginSignupButton from "@/components/common/LoginSignupButton";

const Navigation = ({ user, onLogout }) => {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [isAvatarOpen, setIsAvatarOpen] = useState(false);
  const navRef = useRef(null);

  // Close dropdowns when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (navRef.current && !navRef.current.contains(event.target)) {
        setIsAvatarOpen(false);
        setIsMobileMenuOpen(false);
      }
    };

    const handleEscape = (event) => {
      if (event.key === "Escape") {
        setIsAvatarOpen(false);
        setIsMobileMenuOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    document.addEventListener("keydown", handleEscape);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
      document.removeEventListener("keydown", handleEscape);
    };
  }, []);

  // Lock body scroll while the mobile menu is open
  useEffect(() => {
    if (!isMobileMenuOpen) return;
    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = previousOverflow;
    };
  }, [isMobileMenuOpen]);

  const toggleMobileMenu = () => {
    setIsMobileMenuOpen(!isMobileMenuOpen);
    if (!isMobileMenuOpen) {
      setIsAvatarOpen(false);
    }
  };

  const toggleAvatar = (e) => {
    e.stopPropagation();
    setIsAvatarOpen(!isAvatarOpen);
  };

  const closeAll = () => {
    setIsMobileMenuOpen(false);
    setIsAvatarOpen(false);
  };

  return (
    <header
      className="sticky top-0 z-50 bg-surface/95 border-b border-border shadow-sm"
      ref={navRef}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Logo />
          {/* Desktop Navigation */}
          <Desktop closeAll={closeAll} />
          {/* Right side actions */}
          <div className="flex items-center gap-2">
            {/* Avatar */}
            {user && (
              <Avatar
                user={user}
                onLogout={onLogout}
                isAvatarOpen={isAvatarOpen}
                toggleAvatar={toggleAvatar}
                closeAll={closeAll}
              />
            )}
            {!user && <LoginSignupButton />}
            {/* Mobile menu button */}
            <Menu
              isMobileMenuOpen={isMobileMenuOpen}
              toggleMobileMenu={toggleMobileMenu}
            />
          </div>
        </div>
        {/* Mobile Menu with Functional Dropdowns */}
        <Mobile
          user={user}
          onLogout={onLogout}
          isMobileMenuOpen={isMobileMenuOpen}
          closeAll={closeAll}
          isAvatarOpen={isAvatarOpen}
          toggleAvatar={toggleAvatar}
        />
      </div>
    </header>
  );
};

export default Navigation;
