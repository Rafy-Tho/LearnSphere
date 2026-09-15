import { useRef } from "react";
import HeroSection from "@/features/catalog/components/courseDetail/HeroSection";
import LearningObjective from "@/features/catalog/components/courseDetail/LearningObjective";
import LearningRoadmap from "@/features/catalog/components/courseDetail/LearningRoadMap";
import ReviewContainer from "@/features/reviews/components/ReviewContainer";

function CourseDetailScreen() {
  const sectionRef = useRef(null);
  const scrollToSection = () => {
    sectionRef.current?.scrollIntoView({
      behavior: "smooth",
      block: "start",
    });
  };
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
