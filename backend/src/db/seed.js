/* eslint-disable no-console */
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import pgPool from "../config/database.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const seedsDir = path.join(__dirname, "seeds");

async function ensureSeedsTable() {
  await pgPool.query(`
    CREATE TABLE IF NOT EXISTS schema_seeds (
      version TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      applied_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  `);
}

async function appliedVersions() {
  const { rows } = await pgPool.query("SELECT version FROM schema_seeds");
  return new Set(rows.map((row) => row.version));
}

function seedFiles() {
  return fs
    .readdirSync(seedsDir)
    .filter((file) => file.endsWith(".sql"))
    .sort();
}

async function up() {
  await ensureSeedsTable();
  const applied = await appliedVersions();

  for (const file of seedFiles()) {
    const version = file.split("_")[0];
    if (applied.has(version)) continue;

    const sql = fs.readFileSync(path.join(seedsDir, file), "utf8");
    const client = await pgPool.connect();
    try {
      await client.query("BEGIN");
      await client.query(sql);
      await client.query(
        "INSERT INTO schema_seeds (version, name) VALUES ($1, $2)",
        [version, file],
      );
      await client.query("COMMIT");
      console.log(`Applied ${file}`);
    } catch (err) {
      await client.query("ROLLBACK");
      console.error(`Failed ${file}: ${err.message}`);
      process.exitCode = 1;
      return;
    } finally {
      client.release();
    }
  }

  console.log("Seeds up to date");
}

async function status() {
  await ensureSeedsTable();
  const applied = await appliedVersions();

  for (const file of seedFiles()) {
    const version = file.split("_")[0];
    console.log(`${applied.has(version) ? "[x]" : "[ ]"} ${file}`);
  }
}

const command = process.argv[2] || "up";
const run = command === "status" ? status : up;

run()
  .then(() => pgPool.end())
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });