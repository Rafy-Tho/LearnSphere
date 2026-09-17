import { useState } from "react";
import { NavLink } from "react-router-dom";
import ThemeSelector from "@/components/common/ThemeSelector";
import { ChevronDown, ChevronUp, LogOut } from "lucide-react";
import { navLinks } from "@/constants/navLinks";
import { avatarMenuItems } from "@/constants/avatarMenuItems";
import ConfirmDialog from "@/components/ui/ConfirmDialog";
import UserAvatar from "@/components/common/UserAvatar";

function Mobile({
  user,
  onLogout,
  isMobileMenuOpen,
  closeAll,

  isAvatarOpen,
  toggleAvatar,
}) {
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);

  return (
    <>
      {isMobileMenuOpen && (
        <div
          className="lg:hidden fixed inset-0 top-16 bg-surface z-40 overflow-y-auto"
          aria-label="Mobile navigation"
        >
          <nav className="p-4 space-y-4">
            {/* Mobile Navigation Links */}
            <div className="space-y-1">
              {navLinks.map((link) => (
                <NavLink
                  key={link.label}
                  to={link.href}
                  end={true}
                  onClick={() => {
                    closeAll();
                    window.scrollTo({ top: 0, behavior: "smooth" });
                  }}
                  className={({ isActive }) =>
                    `${
                      isActive
                        ? "bg-primary/10 text-primary"
                        : "text-foreground-muted hover:bg-surface-muted hover:text-foreground"
                    } block rounded-lg px-3 py-3 text-sm font-medium transition-colors`
                  }
                >
                  {link.label}
                </NavLink>
              ))}
            </div>
            {/* Mobile User Info with Dropdown */}
            {user && (
              <div className="border-t border-border pt-4">
                <button
                  onClick={toggleAvatar}
                  className="flex items-center justify-between w-full px-4 py-3 text-foreground hover:bg-surface-muted rounded-lg font-medium transition-colors cursor-pointer"
                  aria-expanded={isAvatarOpen}
                >
                  <div className="flex items-center gap-3">
                    <UserAvatar
                      src={user?.image_url}
                      name={user?.name}
                      className="w-8 h-8 rounded-full text-sm"
                    />
                    <div className="text-left">
                      <p className="font-medium text-foreground">
                        {user?.name}
                      </p>
                      <p className="text-xs text-foreground-muted">
                        {user?.email}
                      </p>
                    </div>
                  </div>
                  {isAvatarOpen ? <ChevronDown /> : <ChevronUp />}
                </button>

                {/* Mobile Avatar Dropdown Items */}
                {isAvatarOpen && (
                  <div className="mt-2 ml-4 space-y-1">
                    <div className="flex items-center gap-3 px-4 py-2.5 text-sm transition-colors text-foreground">
                      <ThemeSelector />
                    </div>
                    {avatarMenuItems.map((item) => {
                      const Icon = item.icon;
                      return (
                        <NavLink
                          key={item.label}
                          to={item.href}
                          onClick={() => {
                            closeAll();
                            window.scrollTo({ top: 0, behavior: "smooth" });
                          }}
                          className="flex items-center gap-3 px-4 py-3 rounded-lg transition-colors text-foreground hover:bg-surface-muted"
                        >
                          <Icon className="w-5 h-5" />
                          {item.label}
                        </NavLink>
                      );
                    })}
                    <button
                      onClick={() => {
                        closeAll();
                        setIsConfirmOpen(true);
                      }}
                      className="flex w-full items-center gap-3 px-4 py-3 rounded-lg transition-colors text-destructive hover:bg-destructive/10 cursor-pointer"
                    >
                      <LogOut className="w-5 text-destructive" />
                      Logout
                    </button>
                  </div>
                )}
              </div>
            )}
          </nav>
        </div>
      )}
      <ConfirmDialog
        open={isConfirmOpen}
        onCancel={() => setIsConfirmOpen(false)}
        onConfirm={() => {
          setIsConfirmOpen(false);
          onLogout();
        }}
        title="Logout"
        message="Are you sure you want to logout?"
        confirmText="OK"
        cancelText="Cancel"
      />
    </>
  );
}
export default Mobile;
