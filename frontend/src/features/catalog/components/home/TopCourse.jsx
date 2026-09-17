import { ArrowRightIcon } from "lucide-react";
import { useNavigate } from "react-router-dom";

import { useCourses as useGetCourses } from "@/features/catalog/hooks/useCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";
import CourseCardGrid from "@/features/catalog/components/home/CourseCardGrid";
import Section from "@/components/common/Section";
import SectionHeading from "@/components/common/SectionHeading";

function TopCourse() {
  const navigate = useNavigate();
  const param = new URLSearchParams({});
  param.append("limit", 4);
  param.append("sort", "-avgRating");
  const { data, isPending, error } = useGetCourses(param);

  return (
    <Section background="muted">
      <SectionHeading
        eyebrow="Popular right now"
        title="Accelerate Your Engineering Career"
        subtitle="Master system design and coding interviews with courses crafted by FAANG engineers"
      />

      <div className="mt-14">
        {isPending && (
          <div className="flex justify-center">
            <SpinnerLoader size="lg" color="primary" />
          </div>
        )}
        {error && <ErrorMessage message={error.message} />}
        {data && <CourseCardGrid courses={data?.data?.slice(0, 4) || []} />}
      </div>

      <div className="text-center mt-12">
        <Button
          size="lg"
          rightIcon={<ArrowRightIcon className="w-5 h-5" />}
          onClick={() => {
            navigate("/courses");
            window.scrollTo({ top: 0, behavior: "smooth" });
          }}
        >
          View All Courses
        </Button>
      </div>
    </Section>
  );
}

export default TopCourse;
