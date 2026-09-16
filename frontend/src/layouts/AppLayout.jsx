import { Outlet } from 'react-router-dom';
import useAuth from '@/features/auth/hooks/useAuth';
import { useLogout } from '@/features/auth/hooks/useAuthMutations';
import ErrorMessage from '@/components/ui/ErrorMessage';
import SpinnerLoader from '@/components/ui/SpinnerLoader';
import AppToastContainer from '@/components/ui/AppToastContainer';
import Footer from '@/components/common/Footer';
import Navigation from '@/components/common/Navigation';
function AppLayout() {
  
  const { user, isLoading, error } = useAuth();
  const { logout } = useLogout();
  if (isLoading) return (
    <div className="w-full h-screen flex items-center justify-center bg-background">
      <SpinnerLoader />
    </div>
  );

  if (error) return <div className="w-full h-screen flex items-center justify-center bg-background text-foreground-muted"><ErrorMessage className="w-full" message={error?.message || 'Server error'} /></div>
   
  return (
    <div className="min-w-sm bg-background">
      <Navigation user={user} onLogout={logout} />
      <Outlet />
      <Footer />
      <AppToastContainer />
    </div>
  );
}

export default AppLayout;
