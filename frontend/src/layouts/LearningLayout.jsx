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
    return <SpinnerLoader fullScreen label="Loading…" />;

  if (error)
    return (
      <ErrorMessage
        fullScreen
        message={error?.message || "Server error"}
      />
    );
  return (
    <div className="flex h-[100dvh] flex-col bg-background text-foreground">
      <LearningNavigation
        isSidebarOpen={isSidebarOpen}
        setIsSidebarOpen={setIsSidebarOpen}
        isRatingOpen={isRatingOpen}
        setIsRatingOpen={setIsRatingOpen}
      />
      <div className="relative min-h-0 flex-1">
        <Outlet context={outletContext} />
      </div>
      <AppToastContainer />
    </div>
  );
}

export default LearningLayout;
