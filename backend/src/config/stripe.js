import Stripe from "stripe";
import environment from "./environment.js";

const stripe = new Stripe(environment.STRIPE_SECRET_KEY);

export default stripe;
