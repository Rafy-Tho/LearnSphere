import { useCallback, useRef } from "react";
import HeroSection from "@/features/catalog/components/course-detail/HeroSection";
import LearningObjective from "@/features/catalog/components/course-detail/LearningObjective";
import LearningRoadmap from "@/features/catalog/components/course-detail/LearningRoadmap";
import ReviewContainer from "@/features/reviews/components/ReviewContainer";

function CourseDetailScreen() {
  const sectionRef = useRef(null);
  const scrollToSection = useCallback(() => {
    sectionRef.current?.scrollIntoView({
      behavior: "smooth",
      block: "start",
    });
  }, []);
  return (
    <div className="bg-slate-100 dark:bg-slate-900">
      <HeroSection scrollToSection={scrollToSection} />
      <LearningObjective />
      <LearningRoadmap sectionRef={sectionRef} />
      <ReviewContainer />
    </div>
  );
}

export default CourseDetailScreen;
