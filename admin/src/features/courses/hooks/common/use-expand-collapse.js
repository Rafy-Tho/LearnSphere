import { useCallback, useState } from 'react';

function toggleSet(setter, id) {
  setter((prev) => {
    const next = new Set(prev);
    next.has(id) ? next.delete(id) : next.add(id);
    return next;
  });
}

export function useExpandCollapse() {
  const [expandedModules, setExpandedModules] = useState(new Set());
  const [expandedChapters, setExpandedChapters] = useState(new Set());
  const [expandedLessons, setExpandedLessons] = useState(new Set());

  const toggleModule = useCallback(
    (id) => toggleSet(setExpandedModules, id),
    [],
  );
  const toggleChapter = useCallback(
    (id) => toggleSet(setExpandedChapters, id),
    [],
  );
  const toggleLesson = useCallback(
    (id) => toggleSet(setExpandedLessons, id),
    [],
  );

  return {
    expandedModules,
    expandedChapters,
    expandedLessons,
    toggleModule,
    toggleChapter,
    toggleLesson,
  };
}
