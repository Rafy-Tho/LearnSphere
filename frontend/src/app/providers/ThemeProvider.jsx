import { useEffect, useMemo, useState } from "react";
import { ThemeContext } from "@/app/providers/context";

function ThemeProvider({ children }) {
  const [theme, setTheme] = useState(() => {
    return localStorage.getItem("theme") || "auto";
  });

  // Apply theme to HTML element
  useEffect(() => {
    const html = document.documentElement;
    const prefersDark = window.matchMedia(
      "(prefers-color-scheme: dark)",
    ).matches;

    html.classList.remove("light", "dark");

    if (theme === "dark" || (theme === "auto" && prefersDark)) {
      html.classList.add("dark");
    } else if (theme === "light" || (theme === "auto" && !prefersDark)) {
      html.classList.add("light");
    }

    localStorage.setItem("theme", theme);
  }, [theme]);

  const value = useMemo(() => ({ theme, setTheme }), [theme]);

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
}

export default ThemeProvider;
