# Architecture Diagrams

## 1. Component Diagram

```mermaid
flowchart TB
  subgraph Clients
    LF[Learner Frontend<br/>React 19 + Vite]
    AF[Admin Dashboard<br/>React 19 + Vite + shadcn]
  end

  subgraph Backend["Backend API (Express 5)"]
    APP[app.js<br/>middleware + routers]
    ROUTES[Routes]
    MW[Middlewares<br/>auth / authorize / validate / rate limit / session]
    CTRL[Controllers]
    SVC[Services<br/>Session / Hash / Email]
    REPO[Repositories]
    CFG[Configs<br/>Env / DB / Cloudinary]
  end

  DB[(PostgreSQL)]
  STRIPE[Stripe]
  CLOUD[Cloudinary]
  MAIL[Hostinger Mail]
  GOOG[Google OAuth]

  LF -->|fetch + cookie| APP
  AF -->|fetch + cookie| APP
  APP --> ROUTES --> MW --> CTRL
  CTRL --> SVC
  CTRL --> REPO
  REPO --> CFG
  REPO --> DB
  CFG --> DB
  CTRL --> STRIPE
  CTRL --> CLOUD
  SVC --> MAIL
  SVC --> GOOG
  STRIPE -->|webhook| APP
```

## 2. Backend Layer Diagram

```mermaid
flowchart LR
  Client -->|HTTP| Entry[server.js]
  Entry --> App[app.js]
  App --> CORS
  App --> Parsers[Body Parsers]
  App --> Limit[Rate Limiter]
  App --> Session[Session Middleware]
  App --> Router[Feature Routers]
  Router --> Validators
  Router --> Auth[requireAuth]
  Auth --> Role[authorize]
  Role --> Controller
  Controller --> Service
  Controller --> Repository
  Repository --> Pool[pg Pool]
  Pool --> PG[(PostgreSQL)]
  Router --> NotFound[404]
  Controller --> Err[Error Handler]
  NotFound --> Err
```

## 3. Request Processing Sequence

```mermaid
sequenceDiagram
  participant C as Client
  participant A as Express App
  participant M as Middleware
  participant Ctl as Controller
  participant R as Repository
  participant D as PostgreSQL

  C->>A: HTTP request
  A->>A: CORS + parsers
  A->>M: global rate limit
  A->>M: session
  A->>M: validators
  A->>M: requireAuth / authorize
  M->>Ctl: next()
  Ctl->>R: method()
  R->>D: parameterized SQL
  D-->>R: rows
  R-->>Ctl: result
  Ctl-->>A: envelope
  A-->>C: JSON response
```

## 4. Frontend Data Flow (Learner)

```mermaid
flowchart LR
  Page[Page/Component] --> Hook[React Query Hook]
  Hook --> Service[Service Module]
  Service --> Client[ApiClient fetch]
  Client -->|credentials: include| API[Backend API]
  API --> Client
  Client --> Hook
  Hook --> Page
  Mutation[Mutation Hook] --> Service
  Mutation -->|invalidate| Hook
```

## 5. Admin Content Tree

```mermaid
flowchart TD
  Course[Course] --> Objective[Objectives]
  Course --> Module[Modules]
  Module --> Chapter[Chapters]
  Chapter --> Lesson[Lessons]
  Lesson -->|TEXT| Content[Lesson Contents]
  Lesson -->|QUIZ| Question[Questions]
  Question --> Option[Options]
```

## 6. Deployment Diagram

```mermaid
flowchart TB
  subgraph Static Hosting
    FE[frontend/dist]
    AD[admin/dist]
  end
  subgraph Node Host
    API[backend process<br/>NODE_ENV=production]
  end
  subgraph Managed Services
    PG[(PostgreSQL)]
    CL[Cloudinary]
    ST[Stripe]
    HM[Hostinger Mail]
  end
  Browser -->|HTTPS| FE
  Browser -->|HTTPS| AD
  FE -->|HTTPS API| API
  AD -->|HTTPS API| API
  API --> PG
  API --> CL
  API --> ST
  API --> HM
  ST -->|webhook| API
```

## 7. Session & Auth Flow

```mermaid
flowchart TD
  A[Login request] --> B[Verify credentials]
  B -->|valid| C[SessionService.create]
  C --> D[Store session in PostgreSQL]
  D --> E[Set HttpOnly cookie]
  E --> F[Authenticated requests]
  F --> G{requireAuth}
  G -->|valid| H[req.user set]
  G -->|invalid| I[401]
  H --> J{authorize roles}
  J -->|pass| K[Controller]
  J -->|fail| L[403]
```
