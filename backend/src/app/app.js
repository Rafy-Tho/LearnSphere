import express from "express";
import connectCloudinary from "../config/cloudinary.js";
import errorHandler from "../common/middleware/errorHandler.js";
import notFoundUrl from "../common/http/notFoundUrl.js";
import { registerMiddleware } from "./middleware.js";
import { registerRoutes } from "./routes.js";

connectCloudinary();

const app = express();

await registerMiddleware(app);
registerRoutes(app);

// Not found + centralized error handling (must be last)
app.use(notFoundUrl);
app.use(errorHandler);

export default app;
