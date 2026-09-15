import PG from "pg";
import ENV from "./Env.js";

const pgPool = new PG.Pool({
  connectionString: ENV.DATABASE_URL,
  max: 10,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 10000,
});

pgPool.on("connect", () => {
  console.log("🔌 New DB connection established");
});

pgPool.on("error", (err) => {
  console.error("💥 Unexpected error on idle client", err);
});

/**
 * Run `fn` inside a single database transaction.
 * Commits on success, rolls back on error, always releases the client.
 * @template T
 * @param {(client: import("pg").PoolClient) => Promise<T>} fn
 * @returns {Promise<T>}
 */
export async function withTransaction(fn) {
  const client = await pgPool.connect();
  try {
    await client.query("BEGIN");
    const result = await fn(client);
    await client.query("COMMIT");
    return result;
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

export default pgPool;
