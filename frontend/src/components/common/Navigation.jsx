import { useEffect, useRef, useState } from "react";
import Avatar from "@/components/common/navbar/Avatar";
import Desktop from "@/components/common/navbar/Desktop";
import Logo from "@/components/common/navbar/Logo";
import Menu from "@/components/common/navbar/Menu";
import Mobile from "@/components/common/navbar/Mobile";
import LoginSignupButton from "@/components/common/LoginSignupButton";

const Navigation = ({ user, onLogout }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [avatarOpen, setAvatarOpen] = useState(false);
  const navRef = useRef(null);

  // Close dropdowns when clicking outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (navRef.current && !navRef.current.contains(event.target)) {
        setAvatarOpen(false);
        setMobileMenuOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const toggleMobileMenu = () => {
    setMobileMenuOpen(!mobileMenuOpen);
    if (!mobileMenuOpen) {
      setAvatarOpen(false);
    }
  };

  const toggleAvatar = (e) => {
    e.stopPropagation();
    setAvatarOpen(!avatarOpen);
  };

  const closeAll = () => {
    setMobileMenuOpen(false);
    setAvatarOpen(false);
  };

  return (
    <header
      className="sticky top-0 z-50 bg-white dark:bg-gray-800 shadow-md"
      ref={navRef}
    >
      <div className="max-w-7xl mx-auto   ">
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
                avatarOpen={avatarOpen}
                toggleAvatar={toggleAvatar}
                closeAll={closeAll}
              />
            )}
            {!user && <LoginSignupButton />}
            {/* Mobile menu button */}
            <Menu
              mobileMenuOpen={mobileMenuOpen}
              toggleMobileMenu={toggleMobileMenu}
            />
          </div>
        </div>
        {/* Mobile Menu with Functional Dropdowns */}
        <Mobile
          user={user}
          onLogout={onLogout}
          mobileMenuOpen={mobileMenuOpen}
          closeAll={closeAll}
          avatarOpen={avatarOpen}
          toggleAvatar={toggleAvatar}
        />
      </div>
    </header>
  );
};

export default Navigation;
