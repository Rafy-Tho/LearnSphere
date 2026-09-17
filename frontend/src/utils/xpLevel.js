export const XP_PER_LEVEL = 250;

export function getXpLevel(totalXp = 0) {
  const total = Math.max(0, Number(totalXp) || 0);
  const level = Math.floor(total / XP_PER_LEVEL) + 1;
  const currentLevelXp = total % XP_PER_LEVEL;

  return {
    level,
    currentLevelXp,
    xpForNextLevel: XP_PER_LEVEL,
    xpToNextLevel: XP_PER_LEVEL - currentLevelXp,
  };
}
