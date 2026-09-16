import { useEffect, useMemo, useState } from "react";
import { Outlet } from "react-router-dom";
import useAuth from "@/features/auth/hooks/useAuth";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import AppToastContainer from "@/components/ui/AppToastContainer";
import LearningNavigation from "@/features/learning/components/LearningNavigation";
function LearningLayout() {
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [isRatingOpen, setIsRatingOpen] = useState(false);
  const { error, isLoading } = useAuth();
  useEffect(() => {
    const syncSidebar = () => {
      setIsSidebarOpen(window.innerWidth >= 1024);
    };
    syncSidebar();
    let frame;
    const handleResize = () => {
      cancelAnimationFrame(frame);
      frame = requestAnimationFrame(syncSidebar);
    };
    window.addEventListener("resize", handleResize);
    return () => {
      cancelAnimationFrame(frame);
      window.removeEventListener("resize", handleResize);
    };
  }, []);
  const outletContext = useMemo(
    () => ({ isSidebarOpen, setIsSidebarOpen, isRatingOpen, setIsRatingOpen }),
    [isSidebarOpen, isRatingOpen],
  );
  if (isLoading)
    return (
      <div className="w-full h-screen flex items-center justify-center bg-background">
        <SpinnerLoader />
      </div>
    );

  if (error)
    return (
      <div className="w-full h-screen flex items-center justify-center bg-background text-foreground-muted">
        <ErrorMessage
          className="w-full"
          message={error?.message || "Server error"}
        />
      </div>
    );
  return (
    <div className="min-h-screen bg-background text-foreground">
      <LearningNavigation
        isSidebarOpen={isSidebarOpen}
        setIsSidebarOpen={setIsSidebarOpen}
        isRatingOpen={isRatingOpen}
        setIsRatingOpen={setIsRatingOpen}
      />
      <Outlet context={outletContext} />
      <AppToastContainer />
    </div>
  );
}

export default LearningLayout;
