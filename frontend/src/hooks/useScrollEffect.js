import { useEffect, useState } from "react";

/**
 * Custom hook for handling scroll effect
 */
function useScrollEffect() {
  const [isScrolled, setIsScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 10);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return isScrolled;
}
export default useScrollEffect;
