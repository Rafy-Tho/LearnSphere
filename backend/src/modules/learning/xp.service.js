import {
  buildPagination,
  parsePagination,
} from "../../common/query/pagination.js";
import xpRepository from "./xp.repository.js";

export const XP_REASON = Object.freeze({
  LESSON_COMPLETION: "LESSON_COMPLETION",
  COURSE_COMPLETION: "COURSE_COMPLETION",
  ADMIN_ADJUSTMENT: "ADMIN_ADJUSTMENT",
});

class XpService {
  constructor({ xpRepository }) {
    this.xpRepository = xpRepository;
  }

  /**
   * Award XP. Safe to call repeatedly: the repository ignores duplicate
   * (user, reason, reference) rewards and returns null.
   */
  async award(
    { userId, amount, reason, referenceType = null, referenceId = null, metadata = {} },
    client,
  ) {
    if (!amount) return null;
    return this.xpRepository.create(
      { userId, amount, reason, referenceType, referenceId, metadata },
      client,
    );
  }

  async getSummary(userId) {
    return this.xpRepository.getSummary(userId);
  }

  async getTransactions(userId, query = {}) {
    const { page, limit, offset } = parsePagination(query, { defaultLimit: 20 });

    const [transactions, total] = await Promise.all([
      this.xpRepository.findByUser(userId, { limit, offset }),
      this.xpRepository.countByUser(userId),
    ]);

    return {
      transactions,
      pagination: buildPagination({ total, page, limit }),
    };
  }
}

export { XpService };
export default new XpService({ xpRepository });
