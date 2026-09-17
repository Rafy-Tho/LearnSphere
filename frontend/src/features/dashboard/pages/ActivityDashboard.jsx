import { useMemo } from "react";
import { Activity } from "lucide-react";
import { useInfiniteActivities } from "@/features/activity/hooks/useActivity";
import ActivityItem from "@/features/activity/components/ActivityItem";
import useIntersectionObserver from "@/hooks/useIntersectionObserver";
import ErrorMessage from "@/components/ui/ErrorMessage";
import EmptyState from "@/components/ui/EmptyState";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

export default function ActivityDashboard() {
  const {
    data,
    isPending,
    error,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useInfiniteActivities({ limit: 20 });

  const activities = useMemo(
    () => data?.pages.flatMap((page) => page.data ?? []) ?? [],
    [data],
  );

  const sentinelRef = useIntersectionObserver(
    () => {
      if (hasNextPage && !isFetchingNextPage) fetchNextPage();
    },
    { enabled: hasNextPage && !isFetchingNextPage },
  );

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  if (!activities.length) {
    return (
      <EmptyState
        icon={<Activity className="size-6" />}
        title="No activity yet"
        description="Start learning to build your progress."
      />
    );
  }

  return (
    <section>
      <h2 className="mb-4 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Activity className="size-4 text-primary" />
        </span>
        All Activity
      </h2>
      <div className="rounded-xl border border-border bg-surface p-6">
        <ul className="divide-y divide-border">
          {activities.map((activity) => (
            <ActivityItem key={activity.id} activity={activity} />
          ))}
        </ul>
        <div ref={sentinelRef} className="h-px" aria-hidden="true" />
        {isFetchingNextPage && (
          <div className="flex justify-center py-4">
            <SpinnerLoader />
          </div>
        )}
        {!hasNextPage && (
          <p className="py-4 text-center text-sm text-foreground-muted">
            You&apos;re all caught up.
          </p>
        )}
      </div>
    </section>
  );
}
