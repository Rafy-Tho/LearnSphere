import { useEffect, useState } from "react";
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
    // Close sidebar on mobile by default
    const checkScreenSize = () => {
      if (window.innerWidth < 1024) {
        setIsSidebarOpen(false);
      } else {
        setIsSidebarOpen(true);
      }
    };
    checkScreenSize();
    window.addEventListener("resize", checkScreenSize);
    return () => window.removeEventListener("resize", checkScreenSize);
  }, []);
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
      <Outlet
        context={{ isSidebarOpen, setIsSidebarOpen, isRatingOpen, setIsRatingOpen }}
      />
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
