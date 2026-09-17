import { useEffect, useRef, useState } from "react";
import useTheme from "@/hooks/useTheme";
import { Sun, Moon, Monitor, Check } from "lucide-react";

const ThemeSelector = () => {
  const [isOpen, setIsOpen] = useState(false);
  const { theme, setTheme } = useTheme();
  const dropdownRef = useRef(null);
  const buttonRef = useRef(null);

  // Handle click outside
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target) &&
        buttonRef.current &&
        !buttonRef.current.contains(event.target)
      ) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  // Handle escape key
  useEffect(() => {
    const handleEscape = (event) => {
      if (event.key === "Escape") {
        setIsOpen(false);
      }
    };
    document.addEventListener("keydown", handleEscape);
    return () => document.removeEventListener("keydown", handleEscape);
  }, []);

  const themes = [
    { value: "light", label: "Light", icon: Sun },
    { value: "dark", label: "Dark", icon: Moon },
    { value: "auto", label: "Auto (System)", icon: Monitor },
  ];

  const isDark =
    theme === "dark" ||
    (theme === "auto" &&
      window.matchMedia("(prefers-color-scheme: dark)").matches);

  return (
    <div className="relative inline-block">
      {/* Trigger */}
      <button
        ref={buttonRef}
        onClick={() => setIsOpen(!isOpen)}
        aria-expanded={isOpen}
        aria-haspopup="true"
        className="flex items-center text-foreground-muted hover:text-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring/50 font-medium rounded-lg transition-colors cursor-pointer"
      >
        {isDark ? <Moon className="w-5 h-5" /> : <Sun className="w-5 h-5" />}
        <span className="ml-2 text-sm font-normal">Theme Selector</span>
      </button>

      {/* Dropdown */}
      {isOpen && (
        <div
          ref={dropdownRef}
          className="absolute left-0 top-full z-50 mt-2 w-48 max-w-[calc(100vw-2rem)] rounded-lg border border-border bg-surface py-1 shadow-lg"
        >
          {themes.map((item) => {
            const Icon = item.icon;

            return (
              <button
                key={item.value}
                onClick={() => {
                  setTheme(item.value);
                  setIsOpen(false);
                }}
                className={`w-full flex items-center gap-3 px-4 py-2.5 text-sm transition-colors cursor-pointer ${
                  theme === item.value
                    ? "bg-primary/10 text-primary"
                    : "text-foreground hover:bg-surface-muted"
                }`}
              >
                <Icon className="w-4 h-4" />

                <span className="flex-1 text-left">{item.label}</span>

                {theme === item.value && <Check className="w-4 h-4" />}
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
};

export default ThemeSelector;
