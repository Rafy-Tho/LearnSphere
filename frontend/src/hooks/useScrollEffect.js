import { useEffect, useState } from "react";

/**
 * Custom hook for handling scroll effect
 */
function useScrollEffect() {
  const [isScrolled, setIsScrolled] = useState(false);

  useEffect(() => {
    let frame = null;
    const update = () => {
      frame = null;
      setIsScrolled(window.scrollY > 10);
    };
    const handleScroll = () => {
      if (frame !== null) return;
      frame = requestAnimationFrame(update);
    };
    handleScroll();
    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => {
      if (frame !== null) cancelAnimationFrame(frame);
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return isScrolled;
}
export default useScrollEffect;
