export function formatMoney(amount, currency = "usd") {
  const value = Number(amount ?? 0);
  try {
    return new Intl.NumberFormat(undefined, {
      style: "currency",
      currency: String(currency || "usd").toUpperCase(),
    }).format(value);
  } catch {
    return `${value.toFixed(2)} ${String(currency || "usd").toUpperCase()}`;
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
