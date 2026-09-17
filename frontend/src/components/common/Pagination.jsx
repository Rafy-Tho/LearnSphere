import { useEffect } from "react";
import {
  ChevronLeft,
  ChevronRight,
  ChevronsLeft,
  ChevronsRight,
} from "lucide-react";
import { useSearchParams } from "react-router-dom";
import scrollToTop from "@/utils/scrollToTop";

const navButtonClass =
  "inline-flex size-9 items-center justify-center rounded-lg text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground disabled:pointer-events-none disabled:opacity-40";

const Pagination = ({
  totalItems = 0,
  itemsPerPage = 10,
  siblingCount = 1,
  showFirstLast = true,
  showPrevNext = true,
}) => {
  const [searchParams, setSearchParams] = useSearchParams();
  const currentPage = Number(searchParams.get("page")) || 1;

  const totalPages = Math.ceil(totalItems / itemsPerPage);

  useEffect(() => {
    scrollToTop();
  }, [currentPage]);

  if (!totalItems || !itemsPerPage || totalPages <= 1) return null;

  const handlePageChange = (page) => {
    if (page === currentPage) return;
    if (page < 1 || page > totalPages) return;
    setSearchParams((prev) => {
      const params = new URLSearchParams(prev);
      params.set("page", page);
      params.set("limit", itemsPerPage);
      return params;
    });
  };

  const getPageNumbers = () => {
    const pageNumbers = [];
    const leftSiblingIndex = Math.max(currentPage - siblingCount, 1);
    const rightSiblingIndex = Math.min(currentPage + siblingCount, totalPages);

    const showLeftEllipsis = leftSiblingIndex > 2;
    const showRightEllipsis = rightSiblingIndex < totalPages - 1;

    pageNumbers.push(1);

    if (showLeftEllipsis) {
      pageNumbers.push("...");
    }

    for (let i = leftSiblingIndex; i <= rightSiblingIndex; i++) {
      if (i !== 1 && i !== totalPages) {
        pageNumbers.push(i);
      }
    }

    if (showRightEllipsis) {
      pageNumbers.push("...");
    }

    if (totalPages > 1) {
      pageNumbers.push(totalPages);
    }

    return pageNumbers;
  };

  const pageNumbers = getPageNumbers();
  const startItem = (currentPage - 1) * itemsPerPage + 1;
  const endItem = Math.min(currentPage * itemsPerPage, totalItems);

  return (
    <nav aria-label="Pagination" className="mt-8 border-t border-border pt-6">
      <div className="flex flex-col items-center gap-4 sm:flex-row sm:justify-between">
        <p className="text-sm text-foreground-muted">
          Showing{" "}
          <span className="font-medium text-foreground">{startItem}</span>
          {"–"}
          <span className="font-medium text-foreground">{endItem}</span> of{" "}
          <span className="font-medium text-foreground">{totalItems}</span>{" "}
          results
        </p>

        <div className="flex items-center gap-1">
          {showFirstLast && (
            <button
              type="button"
              onClick={() => handlePageChange(1)}
              disabled={currentPage === 1}
              aria-label="Go to first page"
              className={navButtonClass}
            >
              <ChevronsLeft className="size-4" />
            </button>
          )}

          {showPrevNext && (
            <button
              type="button"
              onClick={() => handlePageChange(currentPage - 1)}
              disabled={currentPage === 1}
              aria-label="Go to previous page"
              className={navButtonClass}
            >
              <ChevronLeft className="size-4" />
            </button>
          )}

          <div className="hidden items-center gap-1 sm:flex">
            {pageNumbers.map((page, index) => {
              if (page === "...") {
                return (
                  <span
                    key={`ellipsis-${index}`}
                    className="inline-flex size-9 items-center justify-center text-sm text-foreground-muted"
                  >
                    …
                  </span>
                );
              }

              return (
                <button
                  key={page}
                  type="button"
                  onClick={() => handlePageChange(page)}
                  aria-current={currentPage === page ? "page" : undefined}
                  className={`inline-flex size-9 items-center justify-center rounded-lg text-sm font-medium transition-colors ${
                    currentPage === page
                      ? "bg-primary text-white shadow-sm"
                      : "text-foreground-muted hover:bg-surface-muted hover:text-foreground"
                  }`}
                >
                  {page}
                </button>
              );
            })}
          </div>

          <span className="px-2 text-sm font-medium text-foreground sm:hidden">
            Page {currentPage} of {totalPages}
          </span>

          {showPrevNext && (
            <button
              type="button"
              onClick={() => handlePageChange(currentPage + 1)}
              disabled={currentPage === totalPages}
              aria-label="Go to next page"
              className={navButtonClass}
            >
              <ChevronRight className="size-4" />
            </button>
          )}

          {showFirstLast && (
            <button
              type="button"
              onClick={() => handlePageChange(totalPages)}
              disabled={currentPage === totalPages}
              aria-label="Go to last page"
              className={navButtonClass}
            >
              <ChevronsRight className="size-4" />
            </button>
          )}
        </div>
      </div>
    </nav>
  );
};

export default Pagination;
