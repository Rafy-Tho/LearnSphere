import { useQuery } from '@tanstack/react-query';
import { useAuth } from '@/app/providers/context';
import { dashboardApi } from '@/features/dashboard/services/dashboard';

export default function useGetDashboardData() {
  const { user } = useAuth();
  const { data, isPending, error } = useQuery({
    queryKey: ['dashboard-data'],
    queryFn: () => dashboardApi.getDashboardData(),
    enabled: !!user,
  });
  return { data, isPending, error };
}