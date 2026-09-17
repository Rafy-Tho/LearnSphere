import { Rocket } from "lucide-react";
import { Link } from "react-router-dom";
import ActivityFeed from "@/features/activity/components/ActivityFeed";
import XpSummaryCard from "@/features/activity/components/XpSummaryCard";

export default function ActivitySection() {
  return (
    <div className="my-8 md:my-16">
      <div className="mb-4 flex items-center justify-between gap-4">
        <h2 className="flex items-center gap-2 text-lg font-bold">
          <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
            <Rocket className="size-4 text-primary" />
          </span>
          Your Activity
        </h2>
        <Link
          to="/learning-dashboard/activity"
          className="text-sm font-medium text-primary hover:text-primary-hover"
        >
          View All
        </Link>
      </div>
      <div className="grid gap-4 lg:grid-cols-3">
        <div className="lg:col-span-1">
          <XpSummaryCard />
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
