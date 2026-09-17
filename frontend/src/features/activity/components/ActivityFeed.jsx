import { Activity } from "lucide-react";
import { useActivities } from "@/features/activity/hooks/useActivity";
import ActivityItem from "@/features/activity/components/ActivityItem";
import ErrorMessage from "@/components/ui/ErrorMessage";
import EmptyState from "@/components/ui/EmptyState";
import Skeleton from "@/components/ui/Skeleton";

function ActivityFeed({ limit = 6 }) {
  const { data, isPending, error } = useActivities({ limit });

  if (isPending) {
    return (
      <ul className="divide-y divide-border" aria-busy="true">
        {Array.from({ length: 4 }).map((_, index) => (
          <li key={index} className="flex items-center gap-3 py-3">
            <Skeleton variant="circle" className="size-9" />
            <div className="flex-1 space-y-2">
              <Skeleton variant="text" className="w-3/4" />
              <Skeleton variant="text" className="w-1/4" />
            </div>
          </li>
        ))}
      </ul>
    );
  }

  if (error) return <ErrorMessage message={error.message} />;

  if (!data?.length) {
    return (
      <EmptyState
        icon={<Activity className="size-6" />}
        title="No activity yet"
        description="Start learning to build your progress."
      />
    );
  }

  return (
    <ul className="divide-y divide-border">
      {data.map((activity) => (
        <ActivityItem key={activity.id} activity={activity} />
      ))}
    </ul>
  );
}

export default ActivityFeed;
