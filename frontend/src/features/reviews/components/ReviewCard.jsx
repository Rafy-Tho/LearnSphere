import { ThumbsDown, ThumbsUp } from "lucide-react";
import { memo, useState } from "react";
import formatTimeAgo from "@/utils/formatTimeAgo";
import RatingStars from "@/components/common/RatingStars";
import { ReportModal } from "@/features/reviews/components/ReportModal";
import { useNavigate } from "react-router-dom";
import useAuth from "@/features/auth/hooks/useAuth";
import { useHelpfulVote } from "@/features/reviews/hooks/useReviewMutations";

export const ReviewCard = memo(function ReviewCard({ review }) {
  const [showReportModal, setShowReportModal] = useState(false);
  const { mutate } = useHelpfulVote();
  const helpfulVote = review.is_helpful ?? null;
  const isReported = review.is_reported ?? false;
  const { user } = useAuth();
  const navigate = useNavigate();
  const handleHelpfulVote = (voteType) => {
    if (!user) {
      navigate("/login");
      window.scrollTo({ top: 0, behavior: "smooth" });
      return;
    }
    const next = helpfulVote === voteType ? null : voteType;
    mutate({ reviewId: review.id, isHelpful: next });
  };

  return (
    <div className="py-6 border-b border-border last:border-b-0">
      <div className="flex gap-4">
        <div className="flex-shrink-0">
          <div className="lg:w-14 lg:h-14 w-10 h-10 rounded-full bg-surface-muted flex items-center justify-center text-white font-semibold text-lg">
            <img
              src={review.user_profile}
              alt={review.user_name}
              className="lg:w-12 lg:h-12 w-8 h-8 rounded-full"
            />
          </div>
        </div>

        <div className="flex-1">
          <div className="flex flex-col sm:flex-row sm:items-center gap-2 mb-2">
            <h3 className="font-semibold text-foreground">
              {review.user_name}
            </h3>
            <div className="flex items-center gap-2">
              <RatingStars rating={review.rating} />
              <span className="text-sm text-foreground-muted">
                {formatTimeAgo(review.created_at)}
              </span>
            </div>
          </div>

          <p className="text-foreground mb-4 leading-relaxed">
            {review.review}
          </p>

          <div className="flex items-center gap-4">
            {helpfulVote === null && (
              <span className="text-sm text-foreground-muted">
                Was this review helpful?
              </span>
            )}
            {helpfulVote !== null && (
              <span className="text-sm text-foreground-muted">
                Thank you for your vote!
              </span>
            )}
            <div className="flex gap-2">
              <button
                onClick={() => handleHelpfulVote(true)}
                aria-label="Mark review as helpful"
                className={`w-10 h-10 rounded-full border-2 flex items-center justify-center cursor-pointer transition-colors duration-200 ${
                  Boolean(helpfulVote) === Boolean(true)
                    ? "bg-primary border-primary hover:bg-primary-hover"
                    : "border-primary hover:bg-primary/10"
                }`}
              >
                <ThumbsUp
                  size={18}
                  className={`transition-colors ${
                    helpfulVote === true ? "text-white" : "text-primary"
                  }`}
                />
              </button>
              <button
                onClick={() => handleHelpfulVote(false)}
                aria-label="Mark review as not helpful"
                className={`w-10 h-10 rounded-full border-2 flex items-center justify-center cursor-pointer transition-colors duration-200 ${
                  helpfulVote === false
                    ? "bg-primary border-primary hover:bg-primary-hover"
                    : "border-primary hover:bg-primary/10"
                }`}
              >
                <ThumbsDown
                  size={18}
                  className={`transition-colors ${
                    helpfulVote === false ? "text-white" : "text-primary"
                  }`}
                />
              </button>
            </div>
            {!isReported && (
              <button
                onClick={() => setShowReportModal(true)}
                className="text-sm font-medium text-foreground hover:text-primary transition-colors underline cursor-pointer"
              >
                Report
              </button>
            )}
            {isReported && (
              <span className="text-sm text-foreground-muted">
                Reported
              </span>
            )}
          </div>
        </div>
      </div>

      <ReportModal
        isOpen={showReportModal}
        onClose={() => setShowReportModal(false)}
        reviewId={review.id}
      />
    </div>
  );
});
