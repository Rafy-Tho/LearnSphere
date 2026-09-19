import { LogOut, Moon, Sun } from "lucide-react";
import { useLocation, useNavigate } from "react-router-dom";
import { useAuth } from "@/app/providers/context";
import { AppLogo } from "@/components/common/AppLogo";
import { NavLink } from "@/components/common/NavLink";
import { LogoutButton } from "@/components/ui/alert-dialog";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { Separator } from "@/components/ui/separator";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarRail,
  useSidebar,
} from "@/components/ui/sidebar";
import { getNavItems } from "@/constants/navItems";
import { useTheme } from "@/hooks/use-theme";
import { cn } from "@/lib/utils";

const ROLE_LABELS = {
  ADMIN: "Administrator",
  INSTRUCTOR: "Instructor",
};

const menuButtonClass =
  "relative h-10 rounded-lg px-3 text-sm font-medium text-sidebar-foreground/80 " +
  "hover:bg-sidebar-accent hover:text-sidebar-accent-foreground";

export function AdminSidebar() {
  const { state } = useSidebar();
  const collapsed = state === "collapsed";
  const { theme, toggleTheme } = useTheme();
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const { pathname } = useLocation();
  const navItems = getNavItems(user?.role);
  const isInstructor = user?.role === "INSTRUCTOR";

  const initials =
    user?.name
      ?.split(" ")
      .map((n) => n[0])
      .join("")
      .toUpperCase() || "A";

  const isActive = (url) =>
    url === "/" ? pathname === "/" : pathname.startsWith(url);

  const handleLogout = () => {
    logout();
    navigate("/login");
  };

  return (
    <Sidebar collapsible="icon">
      <SidebarHeader className={cn("p-3", collapsed && "p-1.5")}>
        <div
          className={cn(
            "flex items-center gap-2.5",
            collapsed && "justify-center",
          )}
        >
          <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-blue-400 to-blue-700 shadow-lg shadow-blue-500/25 ring-1 ring-inset ring-white/20">
            <AppLogo className="h-5 w-5 text-white" />
          </div>
          {!collapsed && (
            <div className="flex min-w-0 flex-col leading-tight">
              <span className="truncate text-sm font-bold tracking-tight text-sidebar-accent-foreground">
                LearnSphere
              </span>
              <span className="truncate text-[10px] font-semibold uppercase tracking-[0.16em] text-sidebar-foreground/60">
                {isInstructor ? "Instructor Studio" : "Admin Console"}
              </span>
            </div>
          )}
        </div>
      </SidebarHeader>

      <SidebarContent>
        <SidebarGroup className="pt-0">
          <SidebarGroupLabel className="px-3 text-[10px] font-semibold uppercase tracking-[0.16em] text-sidebar-foreground/50">
            Menu
          </SidebarGroupLabel>

          <SidebarGroupContent>
            <SidebarMenu className="gap-1">
              {navItems.map((item) => {
                const active = isActive(item.url);
                return (
                  <SidebarMenuItem key={item.title}>
                    <SidebarMenuButton
                      asChild
                      tooltip={item.title}
                      className={cn(
                        menuButtonClass,
                        active &&
                          "bg-sidebar-primary/10 font-semibold text-sidebar-primary hover:bg-sidebar-primary/15 hover:text-sidebar-primary",
                      )}
                    >
                      <NavLink to={item.url} end={item.url === "/"}>
                        <span
                          className={cn(
                            "absolute left-0 top-1/2 h-5 w-1 -translate-y-1/2 rounded-r-full bg-sidebar-primary transition-opacity",
                            active ? "opacity-100" : "opacity-0",
                          )}
                        />
                        <item.icon className="h-4 w-4 shrink-0" />
                        {!collapsed && <span>{item.title}</span>}
                      </NavLink>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                );
              })}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>

      <SidebarFooter className={cn("gap-1 p-3", collapsed && "p-2")}>
        <Separator className="mb-1 bg-sidebar-border" />

        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton
              tooltip="Profile"
              onClick={() => navigate("/profile")}
              className={cn(menuButtonClass, "h-11")}
            >
              <Avatar className="h-7 w-7 ring-1 ring-sidebar-border">
                <AvatarFallback className="bg-sidebar-primary text-[10px] font-semibold text-sidebar-primary-foreground">
                  {initials}
                </AvatarFallback>
              </Avatar>
              {!collapsed && (
                <div className="flex min-w-0 flex-col items-start leading-tight">
                  <span className="w-full truncate text-sm font-medium text-sidebar-accent-foreground">
                    {user?.name || "Profile"}
                  </span>
                  <span className="w-full truncate text-[11px] text-sidebar-foreground/60">
                    {ROLE_LABELS[user?.role] || "Member"}
                  </span>
                </div>
              )}
            </SidebarMenuButton>
          </SidebarMenuItem>

          <SidebarMenuItem>
            <SidebarMenuButton
              tooltip={theme === "dark" ? "Light mode" : "Dark mode"}
              onClick={toggleTheme}
              className={menuButtonClass}
            >
              {theme === "dark" ? (
                <Sun className="h-4 w-4 shrink-0" />
              ) : (
                <Moon className="h-4 w-4 shrink-0" />
              )}
              {!collapsed && (
                <span>{theme === "dark" ? "Light mode" : "Dark mode"}</span>
              )}
            </SidebarMenuButton>
          </SidebarMenuItem>

          <SidebarMenuItem>
            <LogoutButton onLogout={handleLogout}>
              <SidebarMenuButton
                title="Logout"
                className={cn(
                  menuButtonClass,
                  "text-destructive/90 hover:bg-destructive/10 hover:text-destructive",
                )}
              >
                <LogOut className="h-4 w-4 shrink-0" />
                {!collapsed && <span>Logout</span>}
              </SidebarMenuButton>
            </LogoutButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>

      <SidebarRail />
    </Sidebar>
  );
}
