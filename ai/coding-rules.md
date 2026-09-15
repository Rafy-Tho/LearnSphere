# Coding Rules (for AI Agents)

Follow these when writing or modifying code.

## 1. Language & Modules

- JavaScript only. Do not introduce TypeScript.
- Backend is ESM (`import`/`export`). Do not use `require`.
- Target Node 22 (backend) and modern browsers (frontends).
- No comments unless they explain non-obvious intent. The codebase avoids comments.

## 2. Naming

| Element | Convention |
|---|---|
| Backend files | `camelCase.js` for controllers/routes, `PascalCase.js` for repositories/classes |
| React components | `PascalCase.jsx` |
| Admin hooks | `kebab-case.js` (e.g. `use-get-courses.js`) |
| Frontend hooks | `camelCase.js` (e.g. `useCourses.js`) |
| Functions/variables | `camelCase` |
| Constants | `UPPER_SNAKE_CASE` |
| DB identifiers | `snake_case` |
| React Query keys | arrays, kebab/domain (`['course-details', courseId]`) |

## 3. Backend

- Wrap async controllers in `asyncHandler`.
- Throw `ApiError(statusCode, message)`; do not hand-craft error responses.
- Return the envelope `{ success, statusCode, message, data }`.
- Use `StatusCode` constants.
- Put validators in `backend/src/validators/*` using shared builders; always follow with `validateResult`.
- Apply `requireAuth` before `authorize`; verify ownership in the controller.
- Repository methods: `create`, `update`, `delete`, `findById`, `findBy<Parent>Id`, `get<Thing>By<Parent>Id`, `getInstructor`.
- Use `RETURNING` on writes.
- Never interpolate SQL; use placeholders.

## 4. Frontend (both apps)

- Function components + hooks. Class components only for error boundaries.
- One component per file.
- Data access only via hooks → services. No `fetch` in components.
- Use `react-hook-form` + `zodResolver` for forms already using that pattern.
- Show validation errors from `formState.errors`; disable submit while pending.
- Invalidate relevant query keys after mutations.
- Tailwind utilities only; use `cn()` in admin for conditional classes.
- Keep filters/pagination in the URL.

## 5. Imports & Structure

- Import from the nearest existing module; do not create parallel abstractions.
- Keep utilities in `utils/` and helpers in `helper/` per app.
- Do not create new top-level folders without reason.

## 6. Error Handling

- Backend: central handler; development includes stack, production does not.
- Frontend: rely on the API client's 401 handling; surface mutation errors via toasts.

## 7. Linting

Run before finishing:

```bash
# backend (no lint script)
npx eslint .

# frontend
npm run lint

# admin
npm run lint
```

Rules of note: `no-unused-vars`, `no-console: warn`, `no-undef` (backend). Do not disable rules to make code pass; fix the code.

## 8. Formatting

- 2-space indentation.
- Semicolons used consistently with surrounding files.
- Single quotes in JS, double quotes in JSX attributes (match existing files).
- Keep lines reasonably short; let Prettier-style formatting match neighbors.

## 9. Dependencies

- Do not add a dependency without explicit approval.
- Prefer existing libraries (React Query, RHF, Zod, Tailwind, Radix, lucide-react).
- Check `package.json` before assuming a library is available.

## 10. Changes

- Make the smallest change that solves the problem.
- Do not refactor unrelated code in the same change.
- Do not rename public routes, query keys, or DB columns without approval.
- Update `docs/` and `ai/` when conventions or contracts change.

## 11. Definition of Done

- Code follows the layer it belongs to.
- No unused imports/vars; no `console.log`.
- Lint passes for touched apps.
- Behavior matches `docs/02-requirements/acceptance-criteria.md` where applicable.
