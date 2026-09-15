class SubscriptionApi {
  constructor() {
    this.baseUrl = import.meta.env.VITE_BASE_URL + '/admin';
  }

  async getPlans(params) {
    const url = params
      ? `${this.baseUrl}/plans?${params}`
      : `${this.baseUrl}/plans`;
    const response = await fetch(url, {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to fetch plans');
    }
    return result;
  }

  async createPlan(data) {
    const response = await fetch(`${this.baseUrl}/plans`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to create plan');
    }
    return result;
  }

  async updatePlan(id, data) {
    const response = await fetch(`${this.baseUrl}/plans/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to update plan');
    }
    return result;
  }

  async deletePlan(id) {
    const response = await fetch(`${this.baseUrl}/plans/${id}`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to delete plan');
    }
    return result;
  }

  async getUserSubscriptions(params) {
    const url = params
      ? `${this.baseUrl}/subscriptions?${params}`
      : `${this.baseUrl}/subscriptions`;
    const response = await fetch(url, {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to fetch user subscriptions');
    }
    return result;
  }

  async createUserSubscription(data) {
    const response = await fetch(`${this.baseUrl}/subscriptions`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to create user subscription');
    }
    return result;
  }

  async updateUserSubscription(id, data) {
    const response = await fetch(`${this.baseUrl}/subscriptions/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to update user subscription');
    }
    return result;
  }

  async deleteUserSubscription(id) {
    const response = await fetch(`${this.baseUrl}/subscriptions/${id}`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to delete user subscription');
    }
    return result;
  }

  async getPayments(params) {
    const url = params
      ? `${this.baseUrl}/payments?${params}`
      : `${this.baseUrl}/payments`;
    const response = await fetch(url, {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to fetch payments');
    }
    return result;
  }

  async createPayment(data) {
    const response = await fetch(`${this.baseUrl}/payments`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to create payment');
    }
    return result;
  }

  async deletePayment(id) {
    const response = await fetch(`${this.baseUrl}/payments/${id}`, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to delete payment');
    }
    return result;
  }

  async updatePayment(id, data) {
    const response = await fetch(`${this.baseUrl}/payments/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await response.json();
    if (!response.ok) {
      throw new Error(result.message || 'Failed to update payment');
    }
    return result;
  }
}

const subscriptionApi = new SubscriptionApi();
export default subscriptionApi;
