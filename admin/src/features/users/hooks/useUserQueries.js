import { useQuery } from '@tanstack/react-query';
import { usersApi } from '@/features/users/services/users';
import { queryKeys } from '@/lib/queryKeys';

export function useGetUsers({ role, page, limit } = {}, { enabled = true } = {}) {
  const params = new URLSearchParams();
  if (role) params.set('role', role);
  if (page) params.set('page', page);
  if (limit) params.set('limit', limit);
  const queryString = params.toString();

  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.users({ role, page, limit }),
    queryFn: () => usersApi.getUsers(queryString || undefined),
    enabled,
  });
  return { data, isPending, error };
}
