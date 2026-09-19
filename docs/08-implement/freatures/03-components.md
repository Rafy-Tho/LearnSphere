# Admin Frontend Components

Component organization for the admin SPA (`admin/`). It follows the same
feature-based architecture as the learner frontend, with shared UI and common
components kept outside `features/`.

## 1. Component Types

### UI Components

Generic shadcn/Radix primitives. No domain knowledge, no data fetching.

Path: `admin/src/components/ui/`

```text
Button
Input
Textarea
Select
Dialog
Sheet
Table
Badge
Skeleton
Tabs
Alert
```

### Common Components

Reusable application components built from UI primitives, shared by two or
more features.

Path: `admin/src/components/common/`

```text
DataTable
PaginationTable
FormModal
ConfirmDialog
StatusBadge
EmptyState
ErrorState
Loading
NavLink
```

### Layout Components

Application shell / page chrome.

Path: `admin/src/layouts/`

```text
AdminLayout
AdminSidebar
```

### Feature Components

Components specific to a single feature.

Path: `admin/src/features/<domain>/components/`

```text
features/dashboard/components/       StatsCard
features/courses/components/         CourseHeader, ObjectivesCard, ModuleCard,
                                     ChapterItem, LessonItem, ContentItem,
                                     QuizItem, *Modal
features/subscriptions/components/   *Tab, *Modal
```

## 2. Where Does a Component Go?

| The component is... | Place it in |
|---|---|
| a generic primitive with no domain knowledge | `components/ui/` |
| an app-aware composite reused by 2+ features | `components/common/` |
| page shell / chrome | `layouts/` |
| used by a single feature only | `features/<domain>/components/` |

## 3. Rules

- Keep components small and focused.
- Components never call `fetch` or `apiClient`; they use hooks, and hooks use
  feature services (`features/<domain>/services/`).
- Keep feature-specific components inside their feature folder.
- Promote a component to `components/common/` only when it is genuinely reused
  by 2+ features.
- Avoid duplicated components; extend an existing common component instead.
- Keep common/UI components free of domain data logic.
- Import via the `@/` alias and use PascalCase filenames. No barrel `index.js`
  files — import files directly.
- Reuse existing UI primitives; do not add new component libraries.

## 4. Data Flow

```text
Page
  ↓
Feature Component
  ↓
Hook (useQuery / useMutation)
  ↓
Service (features/<f>/services/xxxApi)
  ↓
API Client (lib/apiClient.js)
  ↓
Backend (/api/v1/*)
```

## 5. See Also

- [`../../refactor/admin/architecture.md`](../../refactor/admin/architecture.md) — full admin target architecture and refactor plan.
- [`../../../progress/frontend-admin.md`](../../../progress/frontend-admin.md) — admin implementation status.
