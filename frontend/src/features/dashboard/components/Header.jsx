import { Link } from "react-router-dom";
import useAuth from "@/features/auth/hooks/useAuth";
import UserAvatar from "@/components/common/UserAvatar";

// src/components/Header.tsx
export default function Header() {
  const { user } = useAuth();
  return (
    <header className="mb-8 flex flex-col gap-6 sm:flex-row sm:items-start sm:justify-between">
      <div className="flex gap-4">
        <UserAvatar
          src={user?.image_url}
          name={user?.name}
          className="size-14 shrink-0 rounded-full border border-border text-lg"
        />
        <div>
          <div className="flex flex-wrap items-center gap-2">
            <h1 className="text-2xl font-bold sm:text-3xl">
              Welcome, {user?.name}!
            </h1>
          </div>
          <p className="mt-1 text-foreground-muted">
            Take the first steps to building your professional skills
          </p>
        </div>
      </div>
      <Link
         to='/courses'
        className="shrink-0 self-start rounded-lg border border-border px-4 py-2 text-sm font-medium text-primary block"
      >
        Explore All
      </Link>
    </header>
  );
}
