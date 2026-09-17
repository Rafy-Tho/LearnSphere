export function formatMoney(amount, currency) {
  const value = Number(amount ?? 0);
  const code = String(currency || "USD").toUpperCase();
  try {
    return new Intl.NumberFormat(undefined, {
      style: "currency",
      currency: code,
    }).format(value);
  } catch {
    return `${value.toFixed(2)} ${code}`;
  }
}

export function formatDate(value) {
  if (!value) return "—";
  return new Date(value).toLocaleDateString(undefined, {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
}

export function maskPaymentId(value) {
  if (!value) return "—";
  const text = String(value);
  return `••••••••${text.slice(-4)}`;
}
