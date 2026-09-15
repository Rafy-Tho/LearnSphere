import ActivitySection from "@/features/dashboard/components/ActivitySection";
import CertificationSection from "@/features/dashboard/components/CertificationSection";
import DiscoverFeatures from "@/features/dashboard/components/DiscoverFeatures";
import PopularCourses from "@/features/dashboard/components/PopularCourses";
import RecentlyViewed from "@/features/dashboard/components/RecentlyViewed";
import RecommendedSection from "@/features/dashboard/components/RecommendedSection";

function HomeDashboard() {
  return (
    <>
      <RecentlyViewed limit={4} />
      <RecommendedSection />
      <PopularCourses />
      <ActivitySection />
      <CertificationSection />
      <DiscoverFeatures />
    </>
  );
}

export default HomeDashboard;
