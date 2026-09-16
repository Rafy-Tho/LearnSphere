import { MessageSquare } from "lucide-react";
import EmptyState from "@/components/ui/EmptyState";

function NoSummary() {
  return (
    <EmptyState
      icon={<MessageSquare className="size-6" />}
      title="No feedback yet"
      description="Feedback will appear here once available"
      className="bg-surface-muted rounded-xl border border-border mb-5"
    />
  );
}

export default NoSummary;
