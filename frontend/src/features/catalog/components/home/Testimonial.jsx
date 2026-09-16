import { testimonials } from "@/constants/testimonials";
import RatingStars from "@/components/common/RatingStars";

const Testimonial = () => {
  const getGridSpan = (index) => {
    if (index === 0) return "md:col-span-2";
    if (index === 1) return "md:col-span-1";
    if (index === 2) return "md:col-span-1";
    if (index === 3) return "md:col-span-2";
    return "";
  };

  const getMarginBottom = (index) => {
    return index === 0 || index === 3 ? "mb-14" : "mb-8";
  };

  return (
    <section className="py-16 px-4 md:px-8 flex items-center justify-center bg-surface-muted">
      <div className="max-w-6xl w-full">
        {/* Header Section */}
        <div className="mb-12">
          <h1 className="text-4xl font-bold text-foreground text-center md:text-left mb-4">
            Our Testimonials
          </h1>
          <p className="text-foreground-muted text-sm/6 text-center md:text-left mx-auto md:mx-0 max-w-md">
            See what our customers are saying as they build and launch projects
            at lightning speed.
          </p>
        </div>

        {/* Testimonials Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {testimonials.map((testimonial, index) => (
            <div
              key={testimonial.id}
              className={`
                border border-border 
                rounded-2xl p-6 
                hover:border-primary/40 
                hover:shadow-md
                transition-shadow
                bg-surface
                ${getGridSpan(index)}
              `}
            >
              {/* Stars */}
              <RatingStars rating={testimonial.rating} />

              {/* Testimonial Text */}
              <p
                className={`
                text-foreground-muted 
                text-sm leading-relaxed 
                ${getMarginBottom(index)}
              `}
              >
                {testimonial.text}
              </p>

              {/* Author Info */}
              <div className="flex items-center gap-3">
                <img
                  src={testimonial.image}
                  alt={testimonial.name}
                  className="w-12 h-12 rounded-full object-cover ring-2 ring-border"
                />
                <div className="flex flex-col gap-1">
                  <h3 className="text-foreground text-sm font-medium">
                    {testimonial.name}
                  </h3>
                  <p className="text-foreground-muted text-sm">
                    {testimonial.role}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Testimonial;
