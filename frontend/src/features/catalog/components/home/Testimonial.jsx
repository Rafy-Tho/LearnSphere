import { testimonials } from "@/constants/testimonials";
import RatingStars from "@/components/common/RatingStars";
import Section from "@/components/common/Section";
import SectionHeading from "@/components/common/SectionHeading";
import Card from "@/components/ui/Card";

const Testimonial = () => {
  return (
    <Section background="muted">
      <SectionHeading
        eyebrow="Testimonials"
        title="Loved by learners worldwide"
        subtitle="See what our learners are saying as they build and launch projects at lightning speed."
      />

      <div className="grid gap-6 mt-14 sm:grid-cols-2">
        {testimonials.map((testimonial) => (
          <Card
            key={testimonial.id}
            variant="interactive"
            className="h-full"
            bodyClassName="flex h-full flex-col"
          >
            <RatingStars rating={testimonial.rating} />

            <p className="mt-4 flex-1 text-sm leading-relaxed text-foreground-muted">
              {testimonial.text}
            </p>

            <div className="mt-6 flex items-center gap-3">
              <img
                src={testimonial.image}
                alt={testimonial.name}
                className="w-11 h-11 rounded-full object-cover ring-2 ring-border"
              />
              <div>
                <h3 className="text-sm font-semibold text-foreground">
                  {testimonial.name}
                </h3>
                <p className="text-sm text-foreground-muted">
                  {testimonial.role}
                </p>
              </div>
            </div>
          </Card>
        ))}
      </div>
    </Section>
  );
};

export default Testimonial;
