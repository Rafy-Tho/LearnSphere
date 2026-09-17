import { useState } from "react";
import { NavLink } from "react-router-dom";
import { LogOut } from "lucide-react";
import { avatarMenuItems } from "@/constants/avatarMenuItems";
import ThemeSelector from "@/components/common/ThemeSelector";
import ConfirmDialog from "@/components/ui/ConfirmDialog";
import UserAvatar from "@/components/common/UserAvatar";

function Avatar({ user, onLogout, isAvatarOpen, toggleAvatar, closeAll }) {
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  if (!user) return null;
  return (
    <div className="relative">
      <button
        onClick={toggleAvatar}
        className="flex items-center rounded-full focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background"
        aria-expanded={isAvatarOpen}
        aria-haspopup="true"
        aria-label="Open user menu"
      >
        <UserAvatar
          src={user?.image_url}
          name={user?.name}
          className="w-8 h-8 sm:w-10 sm:h-10 rounded-full cursor-pointer hover:ring-2 hover:ring-primary transition-shadow"
        />
      </button>

      {/* Avatar Dropdown - Desktop */}
      {isAvatarOpen && (
        <div className="absolute right-0 mt-3 w-56 bg-surface rounded-lg shadow-lg border border-border py-2 z-50 hidden lg:block">
          <div className="px-4 py-3 border-b border-border">
            <p className="font-medium text-foreground">{user?.name}</p>
            <p className="text-sm text-foreground-muted truncate">
              {user?.email}
            </p>
          </div>

          <div className="py-2">
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
                  className="flex items-center gap-3 px-4 py-2.5 text-sm transition-colors text-foreground hover:bg-surface-muted"
                >
                  <Icon className="w-5 text-foreground-muted" />
                  {item.label}
                </NavLink>
              );
            })}
            <button
              onClick={() => {
                closeAll();
                setIsConfirmOpen(true);
              }}
              className="flex w-full items-center gap-3 px-4 py-2.5 text-sm transition-colors text-destructive hover:bg-destructive/10 cursor-pointer"
            >
              <LogOut className="w-5 text-destructive" />
              Logout
            </button>
          </div>
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
    </div>
  );
}

export default Avatar;
