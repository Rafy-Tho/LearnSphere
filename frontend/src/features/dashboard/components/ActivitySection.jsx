// src/components/ActivitySection.tsx
import { Rocket, Star } from "lucide-react";
import { useXpEarned as useGetExpEarned } from "@/features/settings/hooks/useUsers";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

export default function ActivitySection() {
  const { data, isPending, error } = useGetExpEarned();
  return (
    <div>
      <h2 className="mb-4 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <Rocket className="size-4 text-primary" />
        </span>
        Your Activity
      </h2>
      {error && <ErrorMessage message={error.message} />}
      {isPending && <SpinnerLoader />}
      {!isPending && !error && (
        <div className="rounded-xl border border-border bg-surface p-6">
          <div className="mb-6 flex items-center justify-between">
            <span className="font-bold">Learning Streak</span>
            <a
              href="#"
              className="text-sm font-medium text-primary"
            >
              View All
            </a>
          </div>
          <div className="grid grid-cols-1 divide-y divide-border md:grid-cols-2 md:divide-x md:divide-y-0">
            <div className="flex items-center gap-4 pb-6 md:pb-0 md:pr-6">
              <div className="flex size-14 items-center justify-center rounded-full border-2 border-border">
                <span className="text-warning">🔥</span>
              </div>
              <div>
                <p className="text-2xl font-bold">
                  {data?.today_xp || 0}
                </p>
                <p className="text-sm text-foreground-muted">
                  Current Streak
                </p>
              </div>
            </div>
            <div className="flex items-center gap-4 pt-6 md:pl-6 md:pt-0">
              <div className="flex size-14 items-center justify-center rounded-full border-2 border-border">
                <span className="text-lg">
                  <Star className="size-6" color="white" fill="orange" />
                </span>
              </div>
              <div>
                <p className="text-2xl font-bold">
                  {data?.total_xp || 0}
                </p>
                <p className="text-sm text-foreground-muted">
                  Longest Streak
                </p>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
