import AuthProvider from "@/app/providers/AuthProvider";
import ThemeProvider from "@/app/providers/ThemeProvider";

function AppProviders({ children }) {
  return (
    <ThemeProvider>
      <AuthProvider>{children}</AuthProvider>
    </ThemeProvider>
  );
}

export default AppProviders;
