import Stripe from "stripe";
import ENV from "./Env.js";

const stripe = new Stripe(ENV.STRIPE_SECRET_KEY);

export default stripe;
