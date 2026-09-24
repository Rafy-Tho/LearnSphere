# System Context Diagram

The system context shows the platform, its actors, and external services.

```mermaid
C4Context
  title System Context - LearnSphere

  Person(guest, "Guest", "Unauthenticated visitor")
  Person(learner, "Learner", "Registered student")
  Person(instructor, "Instructor", "Course author")
  Person(admin, "Admin", "Platform administrator")

  System(learnerApp, "Learner Frontend", "React SPA for browsing, learning, quizzes, reviews, subscriptions")
  System(adminApp, "Admin Dashboard", "React SPA for managing catalog, users, billing")
  System(api, "Backend API", "Express 5 REST API under /api/v1")
  SystemDb(db, "PostgreSQL", "Primary data and session store")

  System_Ext(stripe, "Stripe", "Checkout and payment webhooks")
  System_Ext(cloudinary, "Cloudinary", "Profile image storage")
  System_Ext(mail, "Hostinger Mail API", "Transactional email")
  System_Ext(google, "Google OAuth", "Social sign-in (openid-client)")

  Rel(guest, learnerApp, "Browses, registers, logs in", "HTTPS")
  Rel(learner, learnerApp, "Learns, quizzes, reviews, subscribes", "HTTPS")
  Rel(instructor, adminApp, "Authors courses", "HTTPS")
  Rel(admin, adminApp, "Manages platform", "HTTPS")

  Rel(learnerApp, api, "REST + session cookie", "HTTPS/JSON")
  Rel(adminApp, api, "REST + session cookie", "HTTPS/JSON")

  Rel(api, db, "SQL (pg Pool)", "TCP")
  Rel(api, stripe, "Create Checkout Session", "HTTPS")
  Rel(stripe, api, "Webhook events", "HTTPS")
  Rel(api, cloudinary, "Upload images", "HTTPS")
  Rel(api, mail, "Send email", "HTTPS")
  Rel(api, google, "OAuth authorization + token/certs", "HTTPS")
```

## Actors

| Actor | Interacts With | Description |
|---|---|---|
| Guest | Learner frontend | Browse, register, log in, reset password |
| Learner | Learner frontend | Enroll, learn, quiz, review, subscribe |
| Instructor | Admin dashboard | Author and manage owned courses |
| Admin | Admin dashboard | Manage users, catalog, billing |

## External Systems

| System | Direction | Purpose |
|---|---|---|
| PostgreSQL | Bidirectional | Data persistence and session storage |
| Stripe | Outbound (checkout) + inbound (webhook) | Payment processing |
| Cloudinary | Outbound | Profile image storage |
| Hostinger Mail API | Outbound | Welcome, verification, reset-code, and payment emails |
| Google OAuth | Inbound (redirect callback) | Social sign-in |

## Trust Boundaries

```mermaid
flowchart TB
  subgraph Public["Public Internet (untrusted)"]
    U[Users / Browsers]
    S[Stripe]
  end
  subgraph App["Application Trust Zone"]
    FE[Frontends]
    API[Backend API]
  end
  subgraph Data["Data Zone"]
    DB[(PostgreSQL)]
  end
  U -->|HTTPS| FE
  FE -->|HTTPS + cookie| API
  S -->|signed webhook| API
  API -->|TLS SQL| DB
  API -->|HTTPS| EXT[Cloudinary / Hostinger Mail]
```

Notes:

- The backend is the only component with database credentials.
- The Stripe webhook is authenticated by signature, not session.
- Frontends never receive server secrets.
