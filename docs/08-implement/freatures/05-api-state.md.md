# Frontend API & State

## 1. API

Centralize API communication through the API layer.

```text
Component
  ↓
Hook
  ↓
Service
  ↓
API Client
  ↓
Backend
```

Rules:

- Do not duplicate API request logic.
- Keep API services feature-specific.
- Handle loading, error, and empty states.
- Keep response handling consistent.

## 2. State

Separate state by purpose:

- **Server state** — API data, caching, synchronization
- **Global client state** — shared application state
- **Local state** — component-specific UI state

## 3. Rules

- Prefer server-state management for server data.
- Keep local state local when possible.
- Avoid putting everything into global state.
- Avoid duplicating server data in client state.
- Invalidate or update cached data after mutations.
