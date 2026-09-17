import { guideSteps } from "@/constants/guideSteps";
import Section from "@/components/common/Section";
import SectionHeading from "@/components/common/SectionHeading";

function Guide() {
  return (
    <Section id="how-it-works" background="background">
      <SectionHeading
        eyebrow="Your learning journey"
        title="Start in three simple steps"
      />

      <div className="relative grid sm:grid-cols-2 lg:grid-cols-3 gap-10 mt-14">
        <div
          aria-hidden="true"
          className="hidden lg:block absolute top-7 left-[16%] right-[16%] h-px bg-border"
        />
        {guideSteps.map((step, index) => (
          <div key={step.title} className="relative text-center">
            <div className="relative z-10 w-14 h-14 mx-auto mb-6 rounded-full bg-primary text-white text-xl font-bold flex items-center justify-center">
              {index + 1}
            </div>
            <h3 className="text-lg font-semibold mb-2">{step.title}</h3>
            <p className="leading-relaxed text-foreground-muted">
              {step.description}
            </p>
          </div>
        ))}
      </div>
    </Section>
  );
}

export default Guide;
