import { QueryClient } from "@tanstack/react-query";
import { queryKeys, userScopedQueryRoots } from "@/lib/queryKeys";

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

export function clearUserQueries() {
  queryClient.setQueryData(queryKeys.me(), null);
  queryClient.removeQueries({
    predicate: (query) => userScopedQueryRoots.has(query.queryKey[0]),
  });
}