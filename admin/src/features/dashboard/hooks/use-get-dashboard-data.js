import { useQuery } from '@tanstack/react-query';
import { useAuth } from '@/app/providers/context';
import { dashboardApi } from '@/features/dashboard/services/dashboard';
import { queryKeys } from '@/lib/queryKeys';

export default function useGetDashboardData() {
  const { user } = useAuth();
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.dashboardData(),
    queryFn: () => dashboardApi.getDashboardData(),
    enabled: !!user,
  });
  return { data, isPending, error };
}