import { ArrowUpRight } from "lucide-react";
import { SwiperSlide } from "swiper/react";
import CourseCard from "@/components/common/CourseCard";
import SwiperWrapper from "@/features/dashboard/components/SwiperWrapper";
import SectionHeader from "@/features/dashboard/components/SectionHeader";
import CourseCarouselSkeleton from "@/features/dashboard/components/CourseCarouselSkeleton";
import EmptyState from "@/components/ui/EmptyState";
import { usePopularCourses } from "@/features/catalog/hooks/useCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";

export default function PopularCourses() {
  const { data, isPending, error } = usePopularCourses();
  const courses = data || [];
  return (
    <section className="mb-14">
      <SectionHeader
        icon={<ArrowUpRight className="size-4" />}
        title="Most Popular Courses"
      />
      {error && <ErrorMessage message={error.message} />}
      {isPending && <CourseCarouselSkeleton />}
      {!isPending && !error && courses.length === 0 && (
        <EmptyState
          icon={<ArrowUpRight className="size-6" />}
          title="No popular courses yet"
          description="Check back soon — courses will appear here as learners enroll."
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
    </section>
  );
}
