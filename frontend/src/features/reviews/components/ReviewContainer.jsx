import { RatingSummary } from "@/features/reviews/components/RatingSummary";
import { StudentFeedback } from "@/features/reviews/components/StudentFeedback";

function ReviewContainer() {
  return (
    <div className="min-h-screen bg-background px-4 py-8 transition-colors sm:px-6">
      <div className="mx-auto max-w-6xl space-y-6">
        <div className="rounded-lg bg-surface p-4 sm:p-8">
          <h2 className="mb-6 text-2xl font-bold text-foreground">
            Reviews
          </h2>
          <RatingSummary />
          <StudentFeedback />
        </div>
      </div>
    </div>
  );
}

export default ReviewContainer;
