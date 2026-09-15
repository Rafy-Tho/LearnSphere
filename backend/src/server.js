import { createServer } from "http";
import app from "./app/app.js";
import environment from "./config/environment.js";
import pgPool from "./config/database.js";

const server = createServer(app);

async function startServer() {
  try {
    await pgPool.query("SELECT 1");
    console.log("DB READY");

    server.listen(environment.PORT, () => {
      console.log("Server running");
    });
  } catch {
    console.error("Cannot start server, DB not connected");
  }
}

startServer();
