import { ArrowUpRight } from "lucide-react";
import { SwiperSlide } from "swiper/react";
import { Link } from "react-router-dom";

import { useRecommendedCourses } from "@/features/dashboard/hooks/useDashboard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import EmptyState from "@/components/ui/EmptyState";
import SwiperWrapper from "@/features/dashboard/components/SwiperWrapper";
import SectionHeader from "@/features/dashboard/components/SectionHeader";
import CourseCarouselSkeleton from "@/features/dashboard/components/CourseCarouselSkeleton";
import CourseCard from "@/components/common/CourseCard";

export default function RecommendedSection() {
  const { data, isPending, error } = useRecommendedCourses();
  const courses = data || [];
  return (
    <section className="mb-14">
      <SectionHeader
        icon={<ArrowUpRight className="size-4" />}
        title="Recommended For You"
        action={
          <button
            type="button"
            className="cursor-pointer rounded-lg border border-border px-4 py-2 text-sm font-medium text-primary transition-colors hover:bg-primary/10"
          >
            Learning Preferences
          </button>
        }
      />
      {error && <ErrorMessage message={error.message} />}
      {isPending && <CourseCarouselSkeleton />}
      {!isPending && !error && courses.length === 0 && (
        <EmptyState
          icon={<ArrowUpRight className="size-6" />}
          title="No recommendations yet"
          description="Explore a few courses and we'll tailor recommendations to your interests."
        />
      )}
      {!isPending && courses.length > 0 && (
        <SwiperWrapper>
          {courses.map((course) => (
            <SwiperSlide key={course.id}>
              <CourseCard course={course} variant="carousel" />
            </SwiperSlide>
          ))}
        </SwiperWrapper>
      )}
      <div className="mt-8 flex justify-center">
        <Link
          to="/courses"
          onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
          className="block cursor-pointer rounded-lg bg-primary px-8 py-3 font-semibold text-white hover:bg-primary-hover"
        >
          Explore All
        </Link>
      </div>
    </section>
  );
}
