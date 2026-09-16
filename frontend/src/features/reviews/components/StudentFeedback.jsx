import { ChevronDown, Search } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import { useInfiniteReviews as useGetReviews } from "@/features/reviews/hooks/useReviews";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import EmptyState from "@/components/ui/EmptyState";
import { ReviewCard } from "@/features/reviews/components/ReviewCard";

export function StudentFeedback() {
  const [searchQuery, setSearchQuery] = useState("");
  const [filterRating, setFilterRating] = useState("All");
  const [showFilterDropdown, setShowFilterDropdown] = useState(false);
  const [submittedSearch, setSubmittedSearch] = useState("");
  const selectRef = useRef(null);

  const activeSearch = searchQuery.trim() === "" ? "" : submittedSearch;
  const filters = {
    rating: filterRating,
    search: activeSearch || undefined,
    limit: 5,
  };

  const {
    data,
    isPending,
    error,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useGetReviews(filters);

  const reviews = data?.pages?.flatMap((page) => page.data) || [];

  const getFilterLabel = () => {
    if (filterRating === "All") return "All ratings";
    return `${filterRating} star${filterRating > 1 ? "s" : ""}`;
  };

  const handleSearch = (e) => {
    e.preventDefault();
    if (!searchQuery) return;
    setSubmittedSearch(searchQuery);
  };

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (selectRef.current && !selectRef.current.contains(event.target)) {
        setShowFilterDropdown(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  return (
    <>
      <div className="flex flex-col sm:flex-row gap-4 mb-8">
        <form onSubmit={handleSearch} className="flex-1 relative">
          <input
            type="text"
            placeholder="Search reviews"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full px-4 py-3 pr-12 border-2 border-border rounded-lg focus:outline-none focus:border-primary bg-surface text-foreground placeholder:text-foreground-muted"
          />
          <button
            type="submit"
            aria-label="Search reviews"
            className="absolute right-2 top-1/2 -translate-y-1/2 w-10 h-10 bg-primary rounded-lg flex items-center justify-center hover:bg-primary-hover transition-colors cursor-pointer"
          >
            <Search size={20} className="text-white" />
          </button>
        </form>

        <div className="relative" ref={selectRef}>
          <button
            onClick={() => setShowFilterDropdown(!showFilterDropdown)}
            className="w-full sm:w-auto px-6 py-3 border-2 border-border rounded-lg flex items-center justify-between gap-4 hover:border-primary transition-colors bg-surface text-foreground cursor-pointer"
          >
            <span className="text-sm font-medium">{getFilterLabel()}</span>
            <ChevronDown
              size={20}
              className="text-foreground-muted"
            />
          </button>

          {showFilterDropdown && (
            <div className="absolute right-0 mt-2 w-48 bg-surface border-2 border-border rounded-lg shadow-lg z-10">
              <button
                onClick={() => {
                  setFilterRating("All");
                  setShowFilterDropdown(false);
                }}
                className="w-full px-4 py-2 text-left hover:bg-surface-muted text-foreground cursor-pointer"
              >
                All ratings
              </button>
              {[5, 4, 3, 2, 1].map((rating) => (
                <button
                  key={rating}
                  onClick={() => {
                    setFilterRating(rating);
                    setShowFilterDropdown(false);
                  }}
                  className="w-full px-4 py-2 text-left hover:bg-surface-muted text-foreground cursor-pointer"
                >
                  {rating} star{rating > 1 ? "s" : ""}
                </button>
              ))}
            </div>
          )}
        </div>
      </div>

      <div className="space-y-0">
        {isPending && <SpinnerLoader />}
        {error && <ErrorMessage message={error.message} />}
        {!isPending &&
          !error &&
          reviews.map((review) => (
            <ReviewCard key={review.id} review={review} />
          ))}
      </div>

      {hasNextPage && (
        <div className="mt-8">
          <button
            onClick={() => fetchNextPage()}
            disabled={isFetchingNextPage}
            className="w-full px-6 py-3 border-2 border-primary text-primary font-medium rounded-lg hover:bg-primary/10 transition-colors cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {isFetchingNextPage ? (
              <span className="inline-flex items-center gap-2">
                <SpinnerLoader size="sm" color="primary" />
                Loading...
              </span>
            ) : (
              "See more reviews"
            )}
          </button>
        </div>
      )}

      {reviews.length === 0 && !isPending && !error && (
        <EmptyState
          icon={<Search className="size-6" />}
          title="No reviews found matching your criteria."
        />
      )}
    </>
  );
}
