import {
  BookOpen,
  ClipboardCheck,
  CreditCard,
  FolderTree,
  GraduationCap,
  LayoutDashboard,
  Users,
  Wallet,
} from "lucide-react";

const adminNavItems = [
  { title: "Dashboard", url: "/", icon: LayoutDashboard },
  { title: "Categories", url: "/categories", icon: FolderTree },
  { title: "Courses", url: "/courses", icon: BookOpen },
  { title: "Course Reviews", url: "/course-reviews", icon: ClipboardCheck },
  { title: "Subscriptions", url: "/subscriptions", icon: CreditCard },
  { title: "Instructors", url: "/instructors", icon: GraduationCap },
  { title: "Users", url: "/users", icon: Users },
  { title: "Payouts", url: "/payouts", icon: Wallet },
];

const instructorNavItems = [
  { title: "Dashboard", url: "/", icon: LayoutDashboard },
  { title: "My Courses", url: "/courses", icon: BookOpen },
  { title: "Earnings", url: "/earnings", icon: Wallet },
];

export const navItemsByRole = {
  ADMIN: adminNavItems,
  INSTRUCTOR: instructorNavItems,
};

export function getNavItems(role) {
  return navItemsByRole[role] ?? [];
}
