// src/components/RecommendedSection.tsx
import { ArrowUpRight } from "lucide-react";
import { SwiperSlide } from "swiper/react";

import { useRecommendedCourses as useGetRecommendedCourse } from "@/features/dashboard/hooks/useDashboard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import SwiperWrapper from "@/features/dashboard/components/SwiperWrapper";
import CourseCard from "@/components/common/CourseCard";
import { Link } from "react-router-dom";

export default function RecommendedSection() {
  const { data, isPending, error } = useGetRecommendedCourse();
  const courses = data || [];
  return (
    <section className="mb-14">
      <div className="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <h2 className="flex items-center gap-2 text-lg font-bold">
          <span className="flex size-9 items-center justify-center rounded-lg bg-primary/10">
            <ArrowUpRight className="size-4 text-primary" />
          </span>
          Recommended For You
        </h2>
        <button
          type="button"
          className="cursor-pointer rounded-lg border border-border px-4 py-2 text-sm text-primary"
        >
          Learning Preferences
        </button>
      </div>
      {error && <ErrorMessage message={error.message} />}
      {isPending && <SpinnerLoader />}
      {!isPending && courses.length > 0 && (
        <SwiperWrapper>
          {courses.map((course) => (
            <SwiperSlide key={course.id}>
              <CourseCard course={course} />
            </SwiperSlide>
          ))}
        </SwiperWrapper>
      )}
      <div className="mt-8 flex justify-center">
        <Link
          to="/courses"
          onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
          type="button"
          className="rounded-lg bg-primary px-8 py-3 font-semibold text-white hover:bg-primary-hover cursor-pointer block"
        >
          Explore All
        </Link>
      </div>
    </section>
  );
}
