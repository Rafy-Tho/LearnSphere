import {
  BookOpen,
  CreditCard,
  FolderTree,
  GraduationCap,
  LayoutDashboard,
  Users,
} from "lucide-react";

export const navItems = [
  { title: "Dashboard", url: "/", icon: LayoutDashboard },
  { title: "Categories", url: "/categories", icon: FolderTree },
  { title: "Courses", url: "/courses", icon: BookOpen },
  { title: "Subscriptions", url: "/subscriptions", icon: CreditCard },
  { title: "Instructors", url: "/instructors", icon: GraduationCap },
  { title: "Users", url: "/users", icon: Users },
];