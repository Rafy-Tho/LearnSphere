import fs from "fs";
import pgPool from "./src/config/database.js";
const dir = fs.readdirSync("src/db/seeds").find(f => f.startsWith("026_") && f.endsWith(".sql"));
const sql = fs.readFileSync("src/db/seeds/" + dir, "utf8");
const client = await pgPool.connect();
try {
  await client.query("BEGIN");
  await client.query(sql);
  await client.query("ROLLBACK");
  console.log(dir, "OK");
} catch (err) {
  await client.query("ROLLBACK");
  const p = Number(err.position) - 1;
  console.log("message:", err.message);
  if (err.position) {
    console.log("line:", sql.slice(0, p).split("\n").length);
    console.log("context:", JSON.stringify(sql.slice(Math.max(0, p - 120), p + 80)));
  }
} finally {
  client.release();
  await pgPool.end();
}
