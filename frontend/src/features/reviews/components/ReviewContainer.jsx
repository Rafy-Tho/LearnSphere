import { RatingSummary } from "@/features/reviews/components/RatingSummary";
import { StudentFeedback } from "@/features/reviews/components/StudentFeedback";

function ReviewContainer() {
  return (
    <div className="min-h-screen bg-background py-8 px-4 transition-colors">
      <div className="max-w-6xl mx-auto space-y-6">
        <div className="bg-surface rounded-lg p-8">
          <h2 className="text-2xl font-bold mb-6 text-foreground">
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
