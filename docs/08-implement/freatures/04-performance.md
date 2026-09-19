# Frontend Performance

## 1. Goals

- Reduce unnecessary renders
- Reduce unnecessary API requests
- Improve initial load time
- Keep large lists responsive

## 2. Review

Check for:

- Unnecessary re-renders
- Duplicate API requests
- Poor caching
- Large component trees
- Large lists
- Unnecessary state updates
- Large bundles
- Unnecessary dependencies

## 3. Rules

- Measure before optimizing.
- Use server-state caching where appropriate.
- Avoid unnecessary global state.
- Use pagination or virtualization for large lists when needed.
- Avoid premature optimization.

## 4. Verification

```text
Measure
  ↓
Change
  ↓
Test
  ↓
Measure Again
```
