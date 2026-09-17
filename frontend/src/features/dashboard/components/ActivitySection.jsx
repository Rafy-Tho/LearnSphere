import { Flame, Rocket, Star } from "lucide-react";
import { useXpEarned as useGetExpEarned } from "@/features/settings/hooks/useUsers";
import ActivityFeed from "@/features/activity/components/ActivityFeed";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Skeleton from "@/components/ui/Skeleton";

export default function ActivitySection() {
  const { data, isPending, error } = useGetExpEarned();

  return (
    <div className="my-8 md:my-16">
      <h2 className="mb-4 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Rocket className="size-4 text-primary" />
        </span>
        Your Activity
      </h2>
      {error && <ErrorMessage message={error.message} />}
      <div className="grid gap-4 lg:grid-cols-3">
        <div className="rounded-xl border border-border bg-surface p-6 lg:col-span-1">
          <p className="mb-4 text-sm font-semibold text-foreground-muted">
            XP Earned
          </p>
          {isPending ? (
            <div className="space-y-4">
              <Skeleton className="h-8 w-24" />
              <Skeleton className="h-8 w-24" />
            </div>
          ) : (
            <div className="space-y-5">
              <div className="flex items-center gap-3">
                <span className="flex size-10 items-center justify-center rounded-full bg-primary/10">
                  <Star className="size-5 text-primary" fill="currentColor" />
                </span>
                <div>
                  <p className="text-2xl font-bold text-foreground">
                    {data?.total_xp ?? 0}
                  </p>
                  <p className="text-sm text-foreground-muted">Total XP</p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="flex size-10 items-center justify-center rounded-full bg-warning/10">
                  <Flame className="size-5 text-warning" />
                </span>
                <div>
                  <p className="text-2xl font-bold text-foreground">
                    {data?.today_xp ?? 0}
                  </p>
                  <p className="text-sm text-foreground-muted">Earned today</p>
                </div>
              </div>
            </div>
          )}
        </div>
        <div className="rounded-xl border border-border bg-surface p-6 lg:col-span-2">
          <p className="mb-2 text-sm font-semibold text-foreground-muted">
            Recent Activity
          </p>
          <ActivityFeed />
        </div>
      </div>
    </div>
  );
}
