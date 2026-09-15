import Feature from "@/features/catalog/components/home/Feature";
import FreAskQuestion from "@/features/catalog/components/home/FreAskQuestion";
import Guide from "@/features/catalog/components/home/Guide";
import Hero from "@/features/catalog/components/home/Hero";
import StartLearning from "@/features/catalog/components/home/StartLearning";
import Testimonial from "@/features/catalog/components/home/Testimonial";
import TopCourse from "@/features/catalog/components/home/TopCourse";
const Home = () => {
  return (
    <div
      className={`bg-gray-100 dark:bg-gray-900 text-slate-900 dark:text-gray-100 text-[15px] transition-colors duration-300 min-w-xs`}
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
      <FreAskQuestion />
    </div>
  );
};

export default Home;
