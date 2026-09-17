import features from "@/constants/features";
import Section from "@/components/common/Section";
import SectionHeading from "@/components/common/SectionHeading";
import Card from "@/components/ui/Card";

function Feature() {
  return (
    <Section id="features" background="background">
      <SectionHeading
        eyebrow="Why learn with us"
        title="Everything you need to accelerate your career"
        subtitle="Interactive tools, real-world projects, and community support."
      />

      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mt-14">
        {features.map((feature) => {
          const Icon = feature.icon;
          return (
            <Card
              key={feature.title}
              variant="interactive"
              className="group h-full transition-transform hover:-translate-y-1"
            >
              <div className="w-12 h-12 rounded-xl bg-primary/10 text-primary flex items-center justify-center mb-6 transition-transform group-hover:scale-105">
                <Icon className="h-6 w-6" />
              </div>
              <h3 className="text-lg font-semibold mb-2">{feature.title}</h3>
              <p className="leading-relaxed text-foreground-muted">
                {feature.description}
              </p>
            </Card>
          );
        })}
      </div>
    </Section>
  );
}

export default Feature;
