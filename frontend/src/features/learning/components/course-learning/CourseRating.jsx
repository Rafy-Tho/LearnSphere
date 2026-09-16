import { useState } from "react";

import { useOutletContext, useParams } from "react-router-dom";
import StarRating from "@/features/learning/components/course-learning/StarRating";
import { useCreateReview } from "@/features/reviews/hooks/useReviewMutations";
import { toast } from "react-toastify";
import Modal from "@/components/ui/Modal";
import Button from "@/components/ui/Button";

export default function CourseRating() {
  const { courseId } = useParams();
  const { isRatingOpen, setIsRatingOpen } = useOutletContext();
  const [rating, setRating] = useState(0);
  const [description, setDescription] = useState("");
  const [error, setError] = useState("");
  const { mutate, isPending } = useCreateReview();
  const handleSubmit = (e) => {
    e.preventDefault();
    if (!rating) {
      setError("Please select a rating");
      return;
    }
    mutate(
      { courseId, rating, description },
      {
        onSuccess: () => {
          setIsRatingOpen(false);
        },
        onError: (error) => {
          toast.error(error.message || "Rating failed");
        },
      },
    );
  };
  return (
    <Modal
      open={isRatingOpen}
      onClose={() => setIsRatingOpen(false)}
      title="Rate this course"
      size="sm"
    >
      <form onSubmit={handleSubmit} className="flex flex-col gap-5">
        <p className="text-xs text-foreground-muted">Share your experience</p>

        <div>
          <label className="text-xs text-foreground-muted block mb-2">
            Your rating
          </label>
          <StarRating value={rating} onChange={setRating} setError={setError} />
        </div>
        {error && (
          <p className="text-xs text-destructive">{error}</p>
        )}
        <div>
          <label className="text-xs text-foreground-muted block mb-2">
            Description (optional)
          </label>
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            placeholder="Tell others what you thought about this course..."
            rows={4}
            className="w-full rounded-lg border border-border bg-surface-muted px-3 py-2 text-sm text-foreground placeholder:text-foreground-muted focus:outline-none focus:ring-2 focus:ring-ring resize-none"
          />
        </div>

        <Button type="submit" variant="primary" isLoading={isPending} fullWidth>
          Submit review
        </Button>
      </form>
    </Modal>
  );
}
