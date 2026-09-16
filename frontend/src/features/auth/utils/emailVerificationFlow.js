const FLOW_KEY = "email-verification-flow";
const TIMER_KEY = "email-verification-resend-timer";
const RESEND_COOLDOWN_SECONDS = 60;

export function saveEmailVerificationFlow(email) {
  sessionStorage.setItem(FLOW_KEY, JSON.stringify({ email: email || "" }));
}

export function getEmailVerificationFlow() {
  try {
    return JSON.parse(sessionStorage.getItem(FLOW_KEY));
  } catch {
    return null;
  }
}

export function removeEmailVerificationFlow() {
  sessionStorage.removeItem(FLOW_KEY);
  localStorage.removeItem(TIMER_KEY);
}

export function startResendCooldown() {
  const expire = Date.now() + RESEND_COOLDOWN_SECONDS * 1000;
  localStorage.setItem(TIMER_KEY, String(expire));
}

export function getResendRemaining() {
  const expire = Number(localStorage.getItem(TIMER_KEY));
  if (!expire) return 0;
  const remaining = Math.ceil((expire - Date.now()) / 1000);
  return remaining > 0 ? remaining : 0;
}
