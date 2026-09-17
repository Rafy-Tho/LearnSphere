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
  if (isLoading) return <SpinnerLoader fullScreen label="Loading…" />;

  if (error)
    return (
      <ErrorMessage
        fullScreen
        message={error?.message || "Server error"}
      />
    );
   
  return (
    <div className="flex min-h-screen flex-col bg-background">
      <Navigation user={user} onLogout={logout} />
      <div className="flex-1">
        <Outlet />
      </div>
      <Footer />
      <AppToastContainer />
    </div>
  );
}

export default AppLayout;
