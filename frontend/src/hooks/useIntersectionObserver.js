import { useEffect, useRef } from "react";

/**
 * Observe a target element and invoke `onIntersect` when it enters the viewport.
 * Returns a ref to attach to the sentinel element.
 */
export default function useIntersectionObserver(
  onIntersect,
  { rootMargin = "200px", enabled = true } = {},
) {
  const targetRef = useRef(null);
  const callbackRef = useRef(onIntersect);

  useEffect(() => {
    callbackRef.current = onIntersect;
  }, [onIntersect]);

  useEffect(() => {
    const node = targetRef.current;
    if (!node || !enabled || typeof IntersectionObserver === "undefined") {
      return undefined;
    }

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0]?.isIntersecting) callbackRef.current?.();
      },
      { rootMargin },
    );

    observer.observe(node);
    return () => observer.disconnect();
  }, [enabled, rootMargin]);

  return targetRef;
}
