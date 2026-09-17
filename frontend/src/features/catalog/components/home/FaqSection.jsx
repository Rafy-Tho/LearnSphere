import { useState } from "react";
import { Minus, Plus } from "lucide-react";

import { faqQuestions } from "@/constants/faqQuestions";
import Section from "@/components/common/Section";
import SectionHeading from "@/components/common/SectionHeading";

function FaqSection() {
  const [openFaq, setOpenFaq] = useState(null);

  return (
    <Section id="faq" background="background">
      <SectionHeading
        eyebrow="Questions?"
        title="Frequently asked questions"
        subtitle="Everything you need to know about learning with LearnSphere."
      />

      <div className="mt-12 max-w-3xl mx-auto rounded-2xl border border-border bg-surface shadow-sm divide-y divide-border overflow-hidden">
        {faqQuestions.map((item, idx) => {
          const isOpen = openFaq === idx;
          return (
            <div key={idx}>
              <button
                onClick={() => setOpenFaq(isOpen ? null : idx)}
                aria-expanded={isOpen}
                className="w-full flex items-center justify-between gap-4 px-5 sm:px-6 py-5 text-left font-semibold text-foreground transition-colors hover:text-primary cursor-pointer"
              >
                <span>{item.q}</span>
                <span
                  className={`shrink-0 w-7 h-7 rounded-full flex items-center justify-center transition-colors ${
                    isOpen
                      ? "bg-primary text-white"
                      : "bg-surface-muted text-foreground-muted"
                  }`}
                >
                  {isOpen ? (
                    <Minus className="h-4 w-4" />
                  ) : (
                    <Plus className="h-4 w-4" />
                  )}
                </span>
              </button>
              <div
                className={`grid transition-all duration-300 ${
                  isOpen
                    ? "grid-rows-[1fr] opacity-100"
                    : "grid-rows-[0fr] opacity-0"
                }`}
              >
                <div className="overflow-hidden">
                  <p className="px-5 sm:px-6 pb-5 leading-relaxed text-foreground-muted">
                    {item.a}
                  </p>
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </Section>
  );
}

export default FaqSection;
