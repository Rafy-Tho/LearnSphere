import { QueryClient, keepPreviousData } from "@tanstack/react-query";
import { queryKeys, userScopedQueryRoots } from "@/lib/queryKeys";

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5,
      gcTime: 1000 * 60 * 30,
      retry: (failureCount, error) => {
        if (error?.statusCode && error.statusCode < 500) return false;
        return failureCount < 1;
      },
      placeholderData: keepPreviousData,
      refetchOnWindowFocus: false,
    },
  },
});

export function clearUserQueries() {
  queryClient.setQueryData(queryKeys.me(), null);
  queryClient.removeQueries({
    predicate: (query) => userScopedQueryRoots.has(query.queryKey[0]),
  });
}