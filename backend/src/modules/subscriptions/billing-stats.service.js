import billingStatsRepository from "./billing-stats.repository.js";

class BillingStatsService {
  constructor({ billingStatsRepository }) {
    this.billingStatsRepository = billingStatsRepository;
  }

  async getStats() {
    return this.billingStatsRepository.getStats();
  }
}

export { BillingStatsService };
export default new BillingStatsService({ billingStatsRepository });
