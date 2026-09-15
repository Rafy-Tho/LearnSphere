import { MessageSquare } from "lucide-react";
import EmptyState from "@/components/ui/EmptyState";

function NoSummary() {
  return (
    <EmptyState
      icon={<MessageSquare className="size-6" />}
      title="No feedback yet"
      description="Feedback will appear here once available"
      className="bg-slate-50 dark:bg-slate-800/30 rounded-xl border border-slate-200 dark:border-slate-700 mb-5"
    />
  );
}

export default NoSummary;
