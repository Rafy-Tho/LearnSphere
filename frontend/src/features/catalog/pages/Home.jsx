import Feature from "@/features/catalog/components/home/Feature";
import FaqSection from "@/features/catalog/components/home/FaqSection";
import Guide from "@/features/catalog/components/home/Guide";
import Hero from "@/features/catalog/components/home/Hero";
import StartLearning from "@/features/catalog/components/home/StartLearning";
import Testimonial from "@/features/catalog/components/home/Testimonial";
import TopCourse from "@/features/catalog/components/home/TopCourse";
const Home = () => {
  return (
    <div
      className={`bg-background text-foreground text-sm min-w-xs`}
    >
      {/* ========== HERO SECTION (e-learning) ========== */}
      <Hero />
      {/*  ========== FEATURES SECTION (e-learning themed) ========== */}
      <Feature />
      {/* ========== COURSES SECTION (e-learning themed) ========== */}
      <TopCourse />
      {/* ========== HOW IT WORKS (simplified) ========== */}
      <Guide />
      {/* ========== TESTIMONIALS (shortened) ========== */}
      <Testimonial />
      {/* ========== CTA ========== */}
      <StartLearning />
      {/* ========== FAQ (accordion) ========== */}
      <FaqSection />
    </div>
  );
};

export default Home;
