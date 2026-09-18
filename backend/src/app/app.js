import express from "express";
import connectCloudinary from "../config/cloudinary.js";
import errorHandler from "../common/middleware/error-handler.js";
import notFoundUrl from "../common/http/not-found-url.js";
import { registerMiddleware } from "./middleware.js";
import { registerRoutes } from "./routes.js";

connectCloudinary();

const app = express();

registerMiddleware(app);
registerRoutes(app);

// Not found + centralized error handling (must be last)
app.use(notFoundUrl);
app.use(errorHandler);

export default app;
