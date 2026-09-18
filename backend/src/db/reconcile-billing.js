/* eslint-disable no-console */
import pgPool from "../config/database.js";
import webhookService from "../modules/subscriptions/webhook.service.js";

// Recovers paid checkout orders whose Stripe webhook was missed. Stripe is the
// source of truth: each order's Checkout Session is fetched server-side and
// provisioned only when Stripe reports it paid.
//
//   npm run billing:reconcile            # all unpaid-but-paid orders
//   npm run billing:reconcile -- <uuid>  # a single checkout order
async function run() {
  const orderId = process.argv[2];

  if (orderId) {
    const result = await webhookService.reconcileOrder(orderId);
    console.log(JSON.stringify(result, null, 2));
    return;
  }

  const results = await webhookService.reconcileAll();
  console.log(`Checked ${results.length} checkout order(s)`);
  for (const result of results) {
    const detail = result.message ? ` (${result.message})` : "";
    console.log(` - ${result.orderId}: ${result.status}${detail}`);
  }
}

run()
  .then(() => pgPool.end())
  .catch(async (error) => {
    console.error(error);
    await pgPool.end();
    process.exit(1);
  });
