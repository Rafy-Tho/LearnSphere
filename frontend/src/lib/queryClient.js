import { QueryClient } from "@tanstack/react-query";

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5,
      gcTime: 1000 * 60 * 30,
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
});

const USER_SCOPED_QUERY_ROOTS = new Set([
  "me",
  "profile",
  "xp-earned",
  "active-subscription",
  "subscription",
  "enrolled",
  "course-progress",
  "course-lesson-completions",
  "get-completed-lesson",
  "certificate",
  "certificate-eligibility",
  "my-certificates",
  "certificate-by-id",
  "review-me",
  "get-recently-viewed-courses",
  "recommended-course",
  "course-in-progress",
  "completed-course",
]);

export function clearUserQueries() {
  queryClient.setQueryData(["me"], null);
  queryClient.removeQueries({
    predicate: (query) => USER_SCOPED_QUERY_ROOTS.has(query.queryKey[0]),
  });
}
