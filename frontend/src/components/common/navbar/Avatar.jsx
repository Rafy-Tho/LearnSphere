import { useState } from "react";
import { NavLink } from "react-router-dom";
import { LogOut } from "lucide-react";
import { avatarMenuItems } from "@/constants/avatarMenuItems";
import ThemeSelector from "@/components/common/ThemeSelector";
import ConfirmDialog from "@/components/ui/ConfirmDialog";

function Avatar({ user, onLogout, isAvatarOpen, toggleAvatar, closeAll }) {
  const [isConfirmOpen, setIsConfirmOpen] = useState(false);
  if (!user) return null;
  return (
    <div className="relative">
      <button
        onClick={toggleAvatar}
        className="flex items-center focus:outline-none"
        aria-expanded={isAvatarOpen}
        aria-haspopup="true"
      >
        <img
          className="w-8 h-8 sm:w-10 sm:h-10 rounded-full cursor-pointer hover:ring-2 hover:ring-blue-500 transition-all"
          src={user?.image_url}
          alt="User avatar"
        />
      </button>

      {/* Avatar Dropdown - Desktop */}
      {isAvatarOpen && (
        <div className="absolute right-0 mt-3 w-56 bg-white dark:bg-gray-700 rounded-lg shadow-lg border border-gray-200 dark:border-gray-600 py-2 z-50 hidden lg:block">
          <div className="px-4 py-3 border-b border-gray-200 dark:border-gray-600">
            <p className="font-medium text-gray-900 dark:text-white">
              {user?.name}
            </p>
            <p className="text-sm text-gray-500 dark:text-gray-400 truncate">
              {user?.email}
            </p>
          </div>

          <div className="py-2">
            <div className="flex items-center gap-3 px-4 py-2.5 text-sm transition-colors text-gray-700 dark:text-gray-200 hover:bg-gray-50 dark:hover:bg-gray-600">
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
                  className={`flex items-center gap-3 px-4 py-2.5 text-sm transition-colors text-gray-700 dark:text-gray-200 hover:bg-gray-50 dark:hover:bg-gray-600
                `}
                >
                  <Icon className="w-5 text-gray-500 dark:text-gray-400" />
                  {item.label}
                </NavLink>
              );
            })}
            <button
              onClick={() => {
                closeAll();
                setIsConfirmOpen(true);
              }}
              className={`flex items-center gap-3 px-4 py-2.5 text-sm transition-colors  text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-900/20`}
            >
              <LogOut className="w-5 text-red-500" />
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
