import { useReviewDetails as useGetReviewDetails } from "@/features/reviews/hooks/useReviews";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ProgressBar from "@/components/ui/ProgressBar";
import RatingStars from "@/components/common/RatingStars";
import NoSummary from "@/features/reviews/components/NoSummary";

export function RatingSummary() {
  const { data, isPending, error } = useGetReviewDetails();

  const reviewSummary = data?.review_summary ?? {};
  const { total, average, ratings } = reviewSummary || {};

  const breakdown = [5, 4, 3, 2, 1].map((stars) => {
    const count = ratings?.[`${stars}`] || 0;
    const percentage = total > 0 ? Math.round((count / total) * 100) : 0;
    return { stars, percentage };
  });

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  if (!total || !data || !ratings) return <NoSummary />;
  return (
    <div className="bg-surface py-4 sm:p-6 md:p-8 rounded-lg">
      <h2 className="text-xl sm:text-2xl font-bold mb-4 sm:mb-8 text-foreground">
        Student feedback
      </h2>

      <div className="flex flex-col lg:flex-row gap-6 sm:gap-8">
        <div className="flex flex-row lg:flex-col items-center justify-between lg:justify-start lg:w-1/4">
          <div className="text-5xl sm:text-6xl font-bold text-warning mb-1 sm:mb-2">
            {average.toFixed(1)}
          </div>
          <RatingStars rating={average} />
          <div className="text-warning font-medium text-sm sm:text-base mt-1 sm:mt-2">
            Course Rating
          </div>
        </div>

        <div className="flex-1 space-y-3 sm:space-y-2">
          {breakdown.map(({ stars, percentage }) => (
            <div
              key={stars}
              className="flex flex-col sm:flex-row sm:items-center gap-2 sm:gap-3"
            >
              <ProgressBar
                value={percentage}
                color="primary"
                className="w-full flex-1"
              />
              <div className="flex items-center justify-between sm:justify-start gap-2 sm:gap-3">
                <div className="flex items-center gap-1">
                  <RatingStars rating={stars} />
                </div>
                <div className="text-warning font-medium min-w-[50px] text-right sm:text-left text-sm sm:text-base">
                  {percentage < 1 ? "<1%" : `${percentage}%`}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
