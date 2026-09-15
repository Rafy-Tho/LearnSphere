import { useEffect, useMemo, useState } from "react";
import { Outlet } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css"; // Don't forget this!
import useAuth from "@/features/auth/hooks/useAuth";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
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
      <div className="w-full h-screen flex items-center justify-center bg-slate-100 dark:bg-slate-900">
        <SpinnerLoader />
      </div>
    );

  if (error)
    return (
      <div className="w-full h-screen flex items-center justify-center bg-slate-100 dark:bg-slate-900 text-slate-500 dark:text-slate-400">
        <ErrorMessage
          className="bg-red-50 dark:bg-red-900/20 w-full"
          message={error?.message || "Server error"}
        />
      </div>
    );
  return (
    <div className="min-h-screen bg-slate-100 dark:bg-slate-900 text-white">
      <LearningNavigation
        isSidebarOpen={isSidebarOpen}
        setIsSidebarOpen={setIsSidebarOpen}
        isRatingOpen={isRatingOpen}
        setIsRatingOpen={setIsRatingOpen}
      />
      <Outlet context={outletContext} />
      <ToastContainer
        position="top-right"
        autoClose={3000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="colored"
      />
    </div>
  );
}

export default LearningLayout;
