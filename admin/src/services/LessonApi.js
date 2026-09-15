import { apiFetch } from "./http.js";

class LessonApi {
  constructor() {
    this.baseUrl = import.meta.env.VITE_BASE_URL + '/lessons';
  }

  async update(id, data) {
    const res = await apiFetch(`${this.baseUrl}/${id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await res.json();
    if (!res.ok) {
      throw new Error(result.message || 'Failed to update lesson');
    }
    return result;
  }

  async delete(id) {
    const res = await apiFetch(`${this.baseUrl}/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    const result = await res.json();
    if (!res.ok) {
      throw new Error(result.message || 'Failed to delete lesson');
    }
    return result;
  }

  async createContent(id, data) {
    const res = await apiFetch(`${this.baseUrl}/${id}/contents`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await res.json();
    if (!res.ok) {
      throw new Error(result.message || 'Failed to create content');
    }
    return result;
  }
  async createQuestion(id, data) {
    const res = await apiFetch(`${this.baseUrl}/${id}/questions`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify(data),
    });
    const result = await res.json();
    if (!res.ok) {
      throw new Error(result.message || 'Failed to create question');
    }
    return result;
  }
}
const lessonApi = new LessonApi();
export default lessonApi;
