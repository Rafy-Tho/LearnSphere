-- ============================================================================
-- SEED 012: Complete course — "Docker & Kubernetes in Practice"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD     (20000000-0000-4000-8000-000000000009)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Container Foundations     → C1 Containers & Docker Basics · C2 Images, Networks & Volumes
--   M2 Building Images           → C3 Writing Dockerfiles · C4 Docker Compose
--   M3 Kubernetes Core           → C5 Pods, Deployments & Services · C6 ConfigMaps, Secrets & Ingress
--   M4 Operations                → C7 Scaling, Updates & Health · C8 Monitoring & Logging
--   M5 Capstone: Deploy a Web App → C9 Project Setup & Containerize · C10 Deploying & Observability
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs, so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  'C0000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'Docker & Kubernetes in Practice',
  'docker-kubernetes-in-practice',
  'Containerize any application and run it anywhere. Master Docker from first run to production-grade images and multi-service Compose apps, then step into Kubernetes — Pods, Deployments, Services, ConfigMaps, Secrets, and Ingress — and finish by deploying a complete web application on a live cluster, scaling it under load, and keeping it observable.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  10
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('C0000000-0000-4000-8000-000000000011', 'C0000000-0000-4000-8000-000000000001', 'Containerize applications with reproducible, portable images.',                1),
  ('C0000000-0000-4000-8000-000000000012', 'C0000000-0000-4000-8000-000000000001', 'Manage containers, images, networks, and volumes with the Docker CLI.',        2),
  ('C0000000-0000-4000-8000-000000000013', 'C0000000-0000-4000-8000-000000000001', 'Orchestrate multi-container apps with Docker Compose.',                        3),
  ('C0000000-0000-4000-8000-000000000014', 'C0000000-0000-4000-8000-000000000001', 'Deploy and expose workloads on Kubernetes using Pods, Deployments, and Services.', 4),
  ('C0000000-0000-4000-8000-000000000015', 'C0000000-0000-4000-8000-000000000001', 'Operate resilient systems: config, secrets, health checks, scaling, and monitoring.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('C0000000-0000-4000-8000-000000000101', 'C0000000-0000-4000-8000-000000000001', 1, 'Container Foundations',   'Understand what containers are and how Docker runs containerized applications.',  'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000102', 'C0000000-0000-4000-8000-000000000001', 2, 'Building Images',         'Create efficient Docker images with Dockerfiles and run stacks with Compose.',     'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000103', 'C0000000-0000-4000-8000-000000000001', 3, 'Kubernetes Core',         'Deploy workloads on Kubernetes with Pods, Deployments, Services, and Ingress.',    'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000104', 'C0000000-0000-4000-8000-000000000001', 4, 'Operations',              'Keep clusters healthy: scaling, rolling updates, health checks, and observability.', 'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000105', 'C0000000-0000-4000-8000-000000000001', 5, 'Capstone: Deploy a Web App', 'Containerize, deploy, and observe a complete web application end to end.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('C0000000-0000-4000-8000-000000000201', 'C0000000-0000-4000-8000-000000000101', 1, 'Containers & Docker Basics',       'What containers are and the essential Docker CLI commands.',     'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000202', 'C0000000-0000-4000-8000-000000000101', 2, 'Images, Networks & Volumes',       'Layered images, registries, container networking, and persistent storage.', 'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000203', 'C0000000-0000-4000-8000-000000000102', 1, 'Writing Dockerfiles',              'From instructions to lean, cache-friendly builds.',             'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000204', 'C0000000-0000-4000-8000-000000000102', 2, 'Docker Compose',                   'Define and run multi-service applications declaratively.',      'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000205', 'C0000000-0000-4000-8000-000000000103', 1, 'Pods, Deployments & Services',     'The Kubernetes building blocks for stateless workloads.',       'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000206', 'C0000000-0000-4000-8000-000000000103', 2, 'ConfigMaps, Secrets & Ingress',    'Configuration, secrets, and routing external traffic.',         'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000207', 'C0000000-0000-4000-8000-000000000104', 1, 'Scaling, Updates & Health',        'Scale workloads, ship updates safely, and probe health.',       'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000208', 'C0000000-0000-4000-8000-000000000104', 2, 'Monitoring & Logging',             'Collect metrics and logs to keep clusters observable.',         'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000209', 'C0000000-0000-4000-8000-000000000105', 1, 'Project Setup & Containerize',     'Scaffold the capstone app and turn it into an image.',          'PUBLISHED'),
  ('C0000000-0000-4000-8000-000000000210', 'C0000000-0000-4000-8000-000000000105', 2, 'Deploying & Observability',        'Deploy the capstone to Kubernetes and operate it in production.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: C0000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('C0000000-0000-4000-8000-000000000301', 'C0000000-0000-4000-8000-000000000201', 1, 'What is a Container?',            'Understand what containers are, how they isolate processes, and when to use them.',       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  6),
  ('C0000000-0000-4000-8000-000000000302', 'C0000000-0000-4000-8000-000000000201', 2, 'Docker & the CLI',                'Learn the Docker client-server model and the core commands for running containers.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000303', 'C0000000-0000-4000-8000-000000000201', 3, 'Container Foundations Quiz',       'Check your understanding of containers and the Docker CLI.',                             'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000304', 'C0000000-0000-4000-8000-000000000202', 1, 'Images & Registries',             'Work with layered images, tags, and registries like Docker Hub.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('C0000000-0000-4000-8000-000000000305', 'C0000000-0000-4000-8000-000000000202', 2, 'Networks & Volumes',              'Connect containers with networks and persist data with volumes.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000306', 'C0000000-0000-4000-8000-000000000202', 3, 'Images, Networks & Volumes Quiz', 'Test your grasp of images, networking, and storage.',                                    'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000307', 'C0000000-0000-4000-8000-000000000203', 1, 'Anatomy of a Dockerfile',         'Read and write Dockerfiles: base images, layers, instructions, and commands.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000308', 'C0000000-0000-4000-8000-000000000203', 2, 'Multi-stage Builds & Caching',    'Keep images small and rebuilds fast with layers, caching, and multi-stage builds.',      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000309', 'C0000000-0000-4000-8000-000000000203', 3, 'Writing Dockerfiles Quiz',        'Check your Dockerfile knowledge.',                                                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000310', 'C0000000-0000-4000-8000-000000000204', 1, 'Compose: Services & Dependencies','Define multi-service applications with docker-compose.yml from scratch.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000311', 'C0000000-0000-4000-8000-000000000204', 2, 'Compose Config & Scaling',        'Inject environment config, manage dependencies, and scale Compose services.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000312', 'C0000000-0000-4000-8000-000000000204', 3, 'Docker Compose Quiz',             'Test your Compose skills.',                                                              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000313', 'C0000000-0000-4000-8000-000000000205', 1, 'Pods & Basic Workloads',          'Meet the Kubernetes architecture and the smallest deployable unit: the Pod.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('C0000000-0000-4000-8000-000000000314', 'C0000000-0000-4000-8000-000000000205', 2, 'Deployments & Services',          'Run replicated workloads with Deployments and expose them with Services.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('C0000000-0000-4000-8000-000000000315', 'C0000000-0000-4000-8000-000000000205', 3, 'Kubernetes Core Quiz',            'Check your understanding of Pods, Deployments, and Services.',                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000316', 'C0000000-0000-4000-8000-000000000206', 1, 'ConfigMaps & Environment Config', 'Separate configuration from images using ConfigMaps.',                                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('C0000000-0000-4000-8000-000000000317', 'C0000000-0000-4000-8000-000000000206', 2, 'Secrets & Ingress',               'Store sensitive values in Secrets and route HTTP traffic with Ingress.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000318', 'C0000000-0000-4000-8000-000000000206', 3, 'Config, Secrets & Ingress Quiz',  'Test your configuration, secrets, and ingress knowledge.',                              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000319', 'C0000000-0000-4000-8000-000000000207', 1, 'Scaling & Rolling Updates',       'Scale Deployments up and down and roll out new versions with zero downtime.',            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000320', 'C0000000-0000-4000-8000-000000000207', 2, 'Health Checks & Self-Healing',    'Probe containers so Kubernetes can restart or drain unhealth? workloads automatically.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('C0000000-0000-4000-8000-000000000321', 'C0000000-0000-4000-8000-000000000207', 3, 'Scaling, Updates & Health Quiz',  'Check your scaling, update, and health-probe knowledge.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000322', 'C0000000-0000-4000-8000-000000000208', 1, 'Metrics & Cluster Monitoring',    'Measure cluster and workload metrics with Metrics Server and Prometheus.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000323', 'C0000000-0000-4000-8000-000000000208', 2, 'Logging & Debugging',             'Collect logs and debug running workloads with kubectl.',                                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('C0000000-0000-4000-8000-000000000324', 'C0000000-0000-4000-8000-000000000208', 3, 'Monitoring & Logging Quiz',       'Test your observability knowledge.',                                                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('C0000000-0000-4000-8000-000000000325', 'C0000000-0000-4000-8000-000000000209', 1, 'Capstone: Containerize the App',  'Scaffold the capstone project and turn it into a reusable Docker image.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('C0000000-0000-4000-8000-000000000326', 'C0000000-0000-4000-8000-000000000210', 1, 'Deploying the Capstone to Kubernetes', 'Deploy the containerized app to a cluster with manifests and kubectl.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('C0000000-0000-4000-8000-000000000327', 'C0000000-0000-4000-8000-000000000210', 2, 'Observing & Operating in Production', 'Roll updates, scale under load, and keep the capstone observable in production.',   'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('C0000000-0000-4000-8000-000000000328', 'C0000000-0000-4000-8000-000000000210', 3, 'Final Assessment',               'Prove what you learned across the whole course.',                                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: C0000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  'C0000000-0000-4000-8000-000000000401',
  'C0000000-0000-4000-8000-000000000301',
  1,
  'What is a Container?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is a Container?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>What is a Container?</h1>
  <p>A <strong>container</strong> is a lightweight, isolated unit of software that packages an application and everything it needs — code, runtime, system libraries, and settings — into one portable bundle. It runs everywhere consistently: on your laptop, in CI, and on production servers.</p>
  <p>Unlike a virtual machine, a container does not carry its own operating system. Multiple containers on the same host share the host kernel, while Linux features called <em>namespaces</em> and <em>cgroups</em> give each one its own view of processes, filesystem, and network — and cap how much CPU and memory it may consume.</p>
  <pre class="code-block"># Run an nginx container and keep it in the foreground
docker run nginx:stable

# Same, but detached and published to host port 8080
docker run -d -p 8080:80 nginx:stable</pre>
  <h2>Why containers matter</h2>
  <ul>
    <li><strong>Portability</strong> — the image runs anywhere a container runtime exists.</li>
    <li><strong>Consistency</strong> — "works on my machine" stops being a thing.</li>
    <li><strong>Efficiency</strong> — far less overhead than a VM per workload.</li>
    <li><strong>Density</strong> — hundreds of containers can fit on one host.</li>
  </ul>
  <h2>Containers vs virtual machines</h2>
  <table>
    <thead>
      <tr><th>Feature</th><th>Container</th><th>Virtual machine</th></tr>
    </thead>
    <tbody>
      <tr><td>OS included</td><td>Shares the host kernel</td><td>Runs its own guest OS</td></tr>
      <tr><td>Startup</td><td>Milliseconds</td><td>Seconds to minutes</td></tr>
      <tr><td>Size</td><td>Megabytes</td><td>Gigabytes</td></tr>
      <tr><td>Isolation</td><td>Process-level</td><td>Hardware virtualization</td></tr>
      <tr><td>Footprint</td><td>Small, high density</td><td>Large, lower density</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>How isolation works</strong>
    <p>Namespaces separate process IDs, network stacks, mount points, and users; cgroups limit resources. Together they keep containers on the same host from stomping on one another.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Key takeaway</strong>
    <p>A container is an <em>isolated process</em>, not a tiny machine. Keep that mental model and the rest of this course will click into place.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000402',
  'C0000000-0000-4000-8000-000000000302',
  1,
  'Docker & the CLI',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Docker &amp; the CLI</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Docker &amp; the CLI</h1>
  <p>Docker uses a <strong>client-server model</strong>. The <span class="ic">docker</span> CLI you type into is the client; a daemon called <span class="ic">dockerd</span> does the heavy lifting — pulling images, running containers, and managing networks and volumes.</p>
  <p>On Linux the daemon talks to containerd, which supervises the actual container processes. On macOS and Windows, Docker Desktop runs a lightweight Linux VM internally, so the commands you learn here are identical everywhere.</p>
  <h2>Core commands</h2>
  <pre class="code-block">docker pull nginx:stable     # download an image
docker run nginx:stable      # create + start a container
docker ps                    # list running containers
docker ps -a                 # list all containers (even stopped)
docker logs &lt;container&gt;      # show container output
docker stop &lt;container&gt;      # stop a running container
docker rm &lt;container&gt;        # remove a stopped container</pre>
  <h2>Running containers interactively</h2>
  <pre class="code-block">docker run -it ubuntu:jammy bash          # interactive terminal
docker run -d --name web -p 8080:80 nginx # detached, named, port mapped
docker exec -it web bash                  # open a shell inside "web"</pre>
  <table>
    <thead>
      <tr><th>Flag</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">-it</span></td><td>Interactive + pseudo-TTY (keeps stdin open).</td></tr>
      <tr><td><span class="ic">-d</span></td><td>Detached — run in the background.</td></tr>
      <tr><td><span class="ic">--name</span></td><td>Give the container a human-friendly name.</td></tr>
      <tr><td><span class="ic">-p host:container</span></td><td>Publish a container port to the host.</td></tr>
      <tr><td><span class="ic">-v</span></td><td>Mount a volume or bind mount (next lesson).</td></tr>
      <tr><td><span class="ic">--rm</span></td><td>Remove the container automatically when it stops.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Declarative style</strong>
    <p>Long flag strings get unwieldy. Soon you will encode containers as Docker Compose or Kubernetes manifests — but the CLI is still the fastest way to experiment and debug.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Practice now</strong>
    <p>Run a detached nginx, curl <span class="ic">localhost:8080</span>, read its logs, exec into it, then stop and remove it. That whole loop is ninety percent of the CLI.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000403',
  'C0000000-0000-4000-8000-000000000304',
  1,
  'Images & Registries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Images &amp; Registries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Images &amp; Registries</h1>
  <p>An <strong>image</strong> is the blueprint for a container: a read-only, layered snapshot of a filesystem plus runtime metadata. When you <span class="ic">docker run</span> an image, the engine layers a thin writable filesystem on top and starts the process from <span class="ic">CMD</span>.</p>
  <p>Images are stored and shared through <strong>registries</strong>. Docker Hub is the default public registry, but teams run private registries (ECR, GHCR, Harbor) for proprietary images.</p>
  <h2>Naming and tagging</h2>
  <pre class="code-block">docker pull nginx:stable
docker pull postgres:16-alpine
docker pull node:20-slim

# Tag your own image, then push it to a registry
docker tag myapp:dev ghcr.io/yourname/myapp:1.0.0
docker push ghcr.io/yourname/myapp:1.0.0</pre>
  <p>The format is <span class="ic">registry/repo:tag</span>. The tag is a human label — <span class="ic">:latest</span> moves and should never be assumed stable in production. Pin real versions such as <span class="ic">:16-alpine</span>.</p>
  <h2>Images are layered</h2>
  <ul>
    <li>Each instruction in a Dockerfile adds one or more read-only layers.</li>
    <li>Layers are shared between images — pulling a new image reuses layers you already have.</li>
    <li>Build caching (explored in Module 2) makes rebuilds fast by reusing unchanged layers.</li>
  </ul>
  <table>
    <thead>
      <tr><th>Command</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">docker images</span></td><td>List local images.</td></tr>
      <tr><td><span class="ic">docker pull</span></td><td>Download an image from a registry.</td></tr>
      <tr><td><span class="ic">docker build</span></td><td>Build an image from a Dockerfile.</td></tr>
      <tr><td><span class="ic">docker tag</span></td><td>Add a name/tag to an image.</td></tr>
      <tr><td><span class="ic">docker push</span></td><td>Upload an image to a registry.</td></tr>
      <tr><td><span class="ic">docker rmi</span></td><td>Remove an image locally.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Digests guarantee identity</strong>
    <p>Every image has a content hash called a <em>digest</em> (<span class="ic">image@sha256:…</span>). Tags move; digests do not. For immutable deployments, reference the digest.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Prefer slim/official images</strong>
    <p>Alpine or slim variants shrink attack surface and download size. Verify image provenance from trusted registries before relying on it in production.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000404',
  'C0000000-0000-4000-8000-000000000305',
  1,
  'Networks & Volumes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Networks &amp; Volumes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Networks &amp; Volumes</h1>
  <p>Two needs appear as soon as you run more than one container or want data to survive restarts: <strong>networking</strong> between containers and <strong>persistent storage</strong>. Both are first-class concepts in Docker.</p>
  <h2>Networks</h2>
  <p>Containers on the same user-defined network can find each other by <em>name</em> — no IP bookkeeping needed. The default <span class="ic">bridge</span> driver works on a single host; other drivers exist for special cases.</p>
  <pre class="code-block">docker network create app-net

# Both containers join the same network
docker run -d --name db --network app-net postgres:16-alpine
docker run -d --name api --network app-net -p 8080:3000 myapp:1.0

# From inside "api", the database is reachable at hostname "db"
docker exec api ping db</pre>
  <table>
    <thead>
      <tr><th>Driver</th><th>Use case</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">bridge</span></td><td>Default; isolated container network on one host.</td></tr>
      <tr><td><span class="ic">host</span></td><td>Container shares the host network stack.</td></tr>
      <tr><td><span class="ic">overlay</span></td><td>Multi-host networking (Swarm / Kubernetes era).</td></tr>
      <tr><td><span class="ic">none</span></td><td>Fully isolated network stack.</td></tr>
    </tbody>
  </table>
  <h2>Volumes</h2>
  <p>Container files are ephemeral. A <strong>volume</strong> is managed storage that outlives its container — perfect for databases, uploads, and logs.</p>
  <pre class="code-block">docker volume create app-data

docker run -d --name db \
  -v app-data:/var/lib/postgresql/data \
  postgres:16-alpine

# Bind mount: map a host directory into the container
docker run -d -v "$PWD/src:/app/src" myapp:1.0</pre>
  <ul>
    <li><strong>Named volumes</strong> — managed by Docker, stored in its data area; use for real persistent data.</li>
    <li><strong>Bind mounts</strong> — point at any host folder; ideal for live-development hot reload.</li>
    <li><strong>tmpfs mounts</strong> — in-memory, wiped on stop; use for scratch data.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Volumes survive, containers do not</strong>
    <p>Removing a container (<span class="ic">docker rm</span>) never touches its volumes. That separation is exactly why critical data belongs in volumes.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Inspect when in doubt</strong>
    <p><span class="ic">docker inspect &lt;container&gt;</span> lists mounts and network memberships — the first tool to reach for when networking feels wrong.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000405',
  'C0000000-0000-4000-8000-000000000307',
  1,
  'Anatomy of a Dockerfile',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of a Dockerfile</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Anatomy of a Dockerfile</h1>
  <p>A <strong>Dockerfile</strong> is a text recipe that builds an image. Every meaningful line becomes one or more read-only layers. Here is a complete example for a Node application:</p>
  <pre class="code-block"># syntax=docker/dockerfile:1

FROM node:20-slim
WORKDIR /app

# Install dependencies (frequently cached)
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copy the source and run it
COPY src ./src
EXPOSE 3000

CMD ["node", "src/index.js"]</pre>
  <h2>The most important instructions</h2>
  <table>
    <thead>
      <tr><th>Instruction</th><th>Role</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">FROM</span></td><td>Base image; must be the first statement.</td></tr>
      <tr><td><span class="ic">WORKDIR</span></td><td>Set the working directory for later steps.</td></tr>
      <tr><td><span class="ic">COPY</span></td><td>Copy files/directories from the build context into the image.</td></tr>
      <tr><td><span class="ic">RUN</span></td><td>Execute a command during the build (install, compile).</td></tr>
      <tr><td><span class="ic">ENV</span></td><td>Set an environment variable.</td></tr>
      <tr><td><span class="ic">EXPOSE</span></td><td>Document which port the app listens on.</td></tr>
      <tr><td><span class="ic">CMD</span></td><td>Default command when the container starts; overridable.</td></tr>
      <tr><td><span class="ic">ENTRYPOINT</span></td><td>Fixed entry command; arguments are appended after it.</td></tr>
    </tbody>
  </table>
  <h2>Build context</h2>
  <p>The build context is the folder you hand to <span class="ic">docker build</span>. Only files in it can be copied with <span class="ic">COPY</span>. Everything in the context is sent to the builder — so keep it small and use a <span class="ic">.dockerignore</span> file (see the next lesson).</p>
  <pre class="code-block">docker build -t myapp:1.0 .
docker run -d -p 3000:3000 myapp:1.0</pre>
  <div class="callout callout-info">
    <strong>Shell vs exec form</strong>
    <p><span class="ic">CMD ["node", "src/index.js"]</span> (exec form) is preferred — the process runs as PID 1 without a wrapping shell, so signals reach it directly.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Order for caching</strong>
    <p>Put instructions whose inputs change least often (dependency installs) before the code you edit constantly. That order maximizes layer reuse and keeps rebuilds fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000406',
  'C0000000-0000-4000-8000-000000000308',
  1,
  'Multi-stage Builds & Caching',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Multi-stage Builds &amp; Caching</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Multi-stage Builds &amp; Caching</h1>
  <p>Two techniques separate professional images from toy images: <strong>layer caching</strong> for speed and <strong>multi-stage builds</strong> for a small, secure final image.</p>
  <h2>Layer caching</h2>
  <p>Docker caches each layer and only rebuilds it when its inputs change. Instruction order therefore matters a lot:</p>
  <pre class="code-block"># Good: lockfile pairs are cached, source edits reuse the layer above
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY src ./src

# Bad: every source change re-runs the whole install
COPY . .
RUN npm ci</pre>
  <p>A <span class="ic">.dockerignore</span> file keeps node_modules, .git, logs, and local env files out of the build context — making both context transfer and caching faster.</p>
  <pre class="code-block"># .dockerignore
node_modules
.git
*.log
.env
.venv</pre>
  <h2>Multi-stage builds</h2>
  <p>A multi-stage Dockerfile names several <span class="ic">FROM</span> stages. The later stages copy only what they need from earlier ones, so build toolchains never reach the final image.</p>
  <pre class="code-block"># Stage 1: build the app
FROM node:20-slim AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: runtime — tiny, production-only
FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app/package.json /app/package-lock.json ./
RUN npm ci --omit=dev
COPY --from=build /app/dist ./dist
EXPOSE 3000
USER node
CMD ["node", "dist/server.js"]</pre>
  <ul>
    <li><strong>Smaller attack surface</strong> — compilers, SDKs, and sources stay out of production.</li>
    <li><strong>Smaller images</strong> — pull time drops and disk usage shrinks.</li>
    <li><strong>Right privileges</strong> — run as non-root (<span class="ic">USER node</span>).</li>
  </ul>
  <div class="callout callout-info">
    <strong>Never bake secrets</strong>
    <p>Passwords and API keys placed in an image with <span class="ic">ENV</span> or <span class="ic">COPY</span> stay in its layers forever. Use runtime secrets instead (Compose <span class="ic">env_file</span>, Kubernetes Secrets).</p>
  </div>
  <div class="callout callout-tip">
    <strong>Measure it</strong>
    <p>Run <span class="ic">docker build</span> twice in a row. The second build should be seconds. If it is not, your instruction order or <span class="ic">.dockerignore</span> is the culprit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000407',
  'C0000000-0000-4000-8000-000000000310',
  1,
  'Compose: Services & Dependencies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Compose: Services &amp; Dependencies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Compose: Services &amp; Dependencies</h1>
  <p>Docker Compose turns a multi-container stack into a single <span class="ic">docker-compose.yml</span> file. You declare the services, volumes, and networks, and Compose does the wiring — one network, one command.</p>
  <h2>A first Compose file</h2>
  <pre class="code-block"># docker-compose.yml
services:
  web:
    build: .
    ports:
      - "8080:3000"
    environment:
      - NODE_ENV=production
    depends_on:
      - db
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - db-data:/var/lib/postgresql/data

volumes:
  db-data:</pre>
  <p>Compose creates a default network, and <span class="ic">web</span> can reach <span class="ic">db</span> at the hostname <span class="ic">db</span> — the key <span class="ic">depends_on</span> guarantees start order, not readiness (see the note below).</p>
  <h2>Lifecycle commands</h2>
  <pre class="code-block">docker compose up -d        # build + create + start, in background
docker compose ps           # status of every service
docker compose logs -f web  # stream logs
docker compose exec web sh  # shell inside a running service
docker compose down         # stop and remove containers
docker compose down -v      # also remove named volumes</pre>
  <table>
    <thead>
      <tr><th>Compose key</th><th>Controls</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">image</span></td><td>Pull a ready-made image (no local build).</td></tr>
      <tr><td><span class="ic">build</span></td><td>Build this service from a Dockerfile.</td></tr>
      <tr><td><span class="ic">ports</span></td><td>Publish host-to-container port mappings.</td></tr>
      <tr><td><span class="ic">environment</span></td><td>Inline environment variables.</td></tr>
      <tr><td><span class="ic">depends_on</span></td><td>Start-order dependency between services.</td></tr>
      <tr><td><span class="ic">volumes</span></td><td>Mount named volumes or bind mounts.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>depends_on is not a health gate</strong>
    <p>It only orders creation. Your app must still retry the database connection until <span class="ic">db</span> is actually accepting traffic.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Local dev gold standard</strong>
    <p>A Compose stack with the app, its database, a queue, and mocks is the fastest way to reproduce production locally — and this app will become your capstone later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000408',
  'C0000000-0000-4000-8000-000000000311',
  1,
  'Compose Config & Scaling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Compose Config &amp; Scaling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Compose Config &amp; Scaling</h1>
  <p>Real applications need configuration that differs between environments and the ability to run several replicas of a service. Compose covers both — without changing a line of application code.</p>
  <h2>Environment configuration</h2>
  <pre class="code-block"># .env (never committed)
DB_PASSWORD=supersecret

# docker-compose.yml — variable substitution + env_file
services:
  web:
    build: .
    ports:
      - "${WEB_PORT:-8080}:3000"
    env_file:
      - .env
    environment:
      - NODE_ENV=production</pre>
  <ul>
    <li><strong>Variable substitution</strong> — <span class="ic">${VAR}</span> is read from your shell or <span class="ic">.env</span>; <span class="ic">:-default</span> supplies a fallback.</li>
    <li><strong>env_file</strong> — load many variables from a file; great for local config that must not be committed.</li>
    <li><strong>environment</strong> — inline values that always apply; useful for non-secret knobs.</li>
  </ul>
  <h2>Healthchecks and scaling</h2>
  <pre class="code-block"># docker-compose.yml
services:
  web:
    build: .
    ports:
      - "8080:3000"
    healthcheck:
      test: ["CMD", "curl", "-fs", "http://localhost:3000/health"]
      interval: 30s
      timeout: 5s
      retries: 3
    deploy:
      replicas: 3</pre>
  <pre class="code-block">docker compose up -d                  # start all services
docker compose up -d --scale web=5    # scale a service on the fly
docker compose ps                     # verify replica count and health</pre>
  <table>
    <thead>
      <tr><th>Config feature</th><th>Use</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">healthcheck</span></td><td>Status column shows <em>healthy</em> only when the command exits 0.</td></tr>
      <tr><td><span class="ic">deploy.replicas</span></td><td>Declared replica count for a service.</td></tr>
      <tr><td><span class="ic">--scale</span></td><td>Overrides replicas at the command line.</td></tr>
      <tr><td><span class="ic">profiles</span></td><td>Start optional services only when a profile is requested.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Config belongs to runtime</strong>
    <p>The same image runs in dev, staging, and prod; only its configuration differs. If you feel tempted to rebuild for each environment, you are practicing the anti-pattern.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Validate changes</strong>
    <p><span class="ic">docker compose config</span> prints the fully-resolved file — always run it after big edits to catch indentation and interpolation bugs before startup.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000409',
  'C0000000-0000-4000-8000-000000000313',
  1,
  'Pods & Basic Workloads',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pods &amp; Basic Workloads</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Pods &amp; Basic Workloads</h1>
  <p>Kubernetes manages <strong>clusters</strong>: a set of worker machines (nodes) plus a control plane that makes all decisions. You talk to the control plane through <span class="ic">kubectl</span>.</p>
  <h2>The cluster anatomy</h2>
  <table>
    <thead>
      <tr><th>Component</th><th>Role</th></tr>
    </thead>
    <tbody>
      <tr><td>kube-apiserver</td><td>Front door — all API calls land here.</td></tr>
      <tr><td>etcd</td><td>Consistent key-value store holding cluster state.</td></tr>
      <tr><td>kube-scheduler</td><td>Decides which node runs each new Pod.</td></tr>
      <tr><td>kube-controller-manager</td><td>Runs controllers that reconcile desired state.</td></tr>
      <tr><td>kubelet</td><td>Node agent that runs containers and reports health.</td></tr>
    </tbody>
  </table>
  <h2>The Pod: the smallest unit</h2>
  <p>A <strong>Pod</strong> is one or more containers that share a network namespace, storage, and lifecycle. In practice most Pods hold a single container — they exist so the platform can schedule, scale, and heal them.</p>
  <pre class="code-block"># pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  labels:
    app: demo
spec:
  containers:
    - name: app
      image: nginx:stable
      ports:
        - containerPort: 80</pre>
  <pre class="code-block">kubectl apply -f pod.yaml
kubectl get pods
kubectl get pod my-pod -o wide        # see node + IP
kubectl describe pod my-pod           # deep diagnostics
kubectl delete pod my-pod             # delete it</pre>
  <div class="callout callout-info">
    <strong>Pods are ephemeral</strong>
    <p>Pods die, get evicted, and are rescheduled all the time. You rarely create Pods directly — controllers (like Deployments, next lesson) own them instead.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Labels are everything</strong>
    <p>Selectors and Services match Pods by <em>labels</em>. Keep them consistent and predictable — they are the glue of the whole platform.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000410',
  'C0000000-0000-4000-8000-000000000314',
  1,
  'Deployments & Services',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deployments &amp; Services</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Deployments &amp; Services</h1>
  <p>Raw Pods are too fragile for production. The <strong>Deployment</strong> controller manages a set of identical Pods and guarantees the cluster always converges to the desired state: the right image, at the right replica count, everywhere.</p>
  <h2>Deployment manifest</h2>
  <pre class="code-block"># deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: app
          image: ghcr.io/yourname/myapp:1.0.0
          ports:
            - containerPort: 3000</pre>
  <pre class="code-block">kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods
kubectl rollout status deployment/web</pre>
  <h2>Service: a stable address</h2>
  <p>Pods come and go and their IPs change. A <strong>Service</strong> front-loads them with a stable virtual IP and DNS name, load-balancing traffic across matching Pods.</p>
  <pre class="code-block"># service.yaml
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  selector:
    app: web
  ports:
    - port: 80
      targetPort: 3000</pre>
  <table>
    <thead>
      <tr><th>Service type</th><th>Reachability</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">ClusterIP</span> (default)</td><td>Only inside the cluster.</td></tr>
      <tr><td><span class="ic">NodePort</span></td><td>Exposes a high port on every node.</td></tr>
      <tr><td><span class="ic">LoadBalancer</span></td><td>Provisions a cloud load balancer in front.</td></tr>
      <tr><td><span class="ic">ExternalName</span></td><td>Maps to an external DNS name (no selector).</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Selector == glue</strong>
    <p>The Service selector <span class="ic">app: web</span> must match Deployment Pod labels. If they drift apart, Endpoints empty and the app goes dark.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Verification loop</strong>
    <p>After each apply, run <span class="ic">kubectl get pods,svc,deploy</span> and <span class="ic">kubectl describe service web</span> to confirm Endpoints are populated.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000411',
  'C0000000-0000-4000-8000-000000000316',
  1,
  'ConfigMaps & Environment Config',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ConfigMaps &amp; Environment Config</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>ConfigMaps &amp; Environment Config</h1>
  <p>A <strong>ConfigMap</strong> keeps non-sensitive configuration out of images: connection strings, feature flags, URLs, and shared settings. Change the ConfigMap, update the Deployment, and the same image serves a different environment.</p>
  <h2>Creating a ConfigMap</h2>
  <pre class="code-block"># From literal values
kubectl create configmap app-config \
  --from-literal=FLAVOR=demo \
  --from-literal=LOG_LEVEL=info

# From a file (e.g. a YAML or properties file)
kubectl create configmap app-config \
  --from-file=app.properties

kubectl get configmap app-config -o yaml</pre>
  <h2>Using a ConfigMap in a Pod</h2>
  <pre class="code-block">apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  template:
    spec:
      containers:
        - name: app
          image: ghcr.io/yourname/myapp:1.0.0
          envFrom:
            - configMapRef:
                name: app-config   # every key becomes an env var
          env:
            - name: FLAVOR
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: FLAVOR</pre>
  <p>You can also mount a ConfigMap as a volume so the app reads config files instead of environment variables:</p>
  <pre class="code-block">spec:
  containers:
    - name: app
      image: ghcr.io/yourname/myapp:1.0.0
      volumeMounts:
        - name: config
          mountPath: /etc/app
  volumes:
    - name: config
      configMap:
        name: app-config</pre>
  <table>
    <thead>
      <tr><th>Delivery method</th><th>When to use</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">envFrom</span></td><td>Win dependencies benefit from many env vars.</td></tr>
      <tr><td><span class="ic">valueFrom</span> single key</td><td>Pin one explicit variable to one ConfigMap key.</td></tr>
      <tr><td>Volume mount</td><td>App reads config files from a path.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Size limits</strong>
    <p>ConfigMaps and Secrets are capped at 1 MiB. They are for configuration, not application data.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Never put secrets in a ConfigMap</strong>
    <p>ConfigMaps are plain text and readable by anyone with cluster access. Sensitive values belong in a Secret — next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000412',
  'C0000000-0000-4000-8000-000000000317',
  1,
  'Secrets & Ingress',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secrets &amp; Ingress</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Secrets &amp; Ingress</h1>
  <p><strong>Secrets</strong> hold sensitive data — passwords, API keys, TLS certs — and <strong>Ingress</strong> routes external HTTP traffic into the cluster. Together they finish the story of running stateless apps properly.</p>
  <h2>Working with Secrets</h2>
  <pre class="code-block"># Create a Secret from literals
kubectl create secret generic db-creds \
  --from-literal=username=postgres \
  --from-literal=password=supersecret

kubectl get secret db-creds -o yaml</pre>
  <p>Secret values appear <em>base64-encoded</em> in YAML output — encoding is not encryption. In production, enable encryption at rest and use tools such as Sealed Secrets, SOPS, or External Secrets.</p>
  <pre class="code-block"># Consume a Secret as an environment variable
env:
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: db-creds
        key: password</pre>
  <h2>Ingress</h2>
  <p><span class="ic">ClusterIP</span> Services are internal. <strong>Ingress</strong> gives one entry point that routes hostnames and paths to Services, terminating TLS in the process.</p>
  <pre class="code-block"># ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web
spec:
  rules:
    - host: app.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 80</pre>
  <pre class="code-block">kubectl apply -f ingress.yaml
kubectl get ingress web            # host + address
kubectl describe ingress web</pre>
  <table>
    <thead>
      <tr><th>Ingress concept</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">host</span></td><td>Hostname this rule matches.</td></tr>
      <tr><td><span class="ic">path / pathType</span></td><td>URL prefix to route (Prefix or Exact).</td></tr>
      <tr><td><span class="ic">backend</span></td><td>Target Service and port.</td></tr>
      <tr><td>Ingress controller</td><td>The load balancer/proxy implementing the rules (nginx, traefik, …).</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Built-in vs external</strong>
    <p>Kubernetes provides the Ingress <em>API</em>; a controller implements it. Without an installed controller, Ingress objects do nothing on their own.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Good hygiene</strong>
    <p>Rotate secrets often, and reference them from env, not from image layers or committed files. Never log their values.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000413',
  'C0000000-0000-4000-8000-000000000319',
  1,
  'Scaling & Rolling Updates',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scaling &amp; Rolling Updates</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Scaling &amp; Rolling Updates</h1>
  <p>Scaling in Kubernetes is about <strong>replicas</strong>: more copies of a Pod, spread across nodes. Updating means changing the image tag and letting the controller roll the change out without taking the app down.</p>
  <h2>Scaling a Deployment</h2>
  <pre class="code-block"># Imperative (quick).
kubectl scale deployment web --replicas=5

# Declarative (preferred): edit the manifest, then apply.
kubectl patch deployment web -p '{"spec":{"replicas":5}}'
kubectl apply -f deployment.yaml

kubectl get pods -l app=web</pre>
  <h2>Rolling updates</h2>
  <pre class="code-block"># Bump the image tag and watch the rollout.
kubectl set image deployment/web app=ghcr.io/yourname/myapp:1.1.0
kubectl rollout status deployment/web
kubectl get events --sort-by=.lastTimestamp</pre>
  <p>By default a Deployment uses the <strong>RollingUpdate</strong> strategy: old Pods are terminated only as new ones pass readiness, so clients never lose service.</p>
  <table>
    <thead>
      <tr><th>Strategy</th><th>Behavior</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">RollingUpdate</span></td><td>Replaces Pods gradually; the default.</td></tr>
      <tr><td><span class="ic">Recreate</span></td><td>Kills all old Pods first — downtime, but simple.</td></tr>
      <tr><td><span class="ic">Rollback</span></td><td><span class="ic">kubectl rollout undo deployment/web</span></td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Progress-based flow</strong>
    <p>During a rollout the Deployment creates a ReplicaSet for the new revision, scales it up, and only then scales the old one down. Check <span class="ic">kubectl get rs</span> to watch this dance.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Roll back fast</strong>
    <p><span class="ic">kubectl rollout undo deployment/web</span> reverts to the previous revision instantly. Keep it in your muscle memory — it is the cleanest incident tool you have.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000414',
  'C0000000-0000-4000-8000-000000000320',
  1,
  'Health Checks & Self-Healing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Checks &amp; Self-Healing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Health Checks &amp; Self-Healing</h1>
  <p>Kubernetes self-heals — but only if it can tell healthy from unhealthy. Three <strong>probes</strong> give the kubelet that judgment, checked continuously against your application.</p>
  <h2>The three probes</h2>
  <table>
    <thead>
      <tr><th>Probe</th><th>Answers</th><th>Failure result</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">livenessProbe</span></td><td>Is the process alive?</td><td>Container is restarted.</td></tr>
      <tr><td><span class="ic">readinessProbe</span></td><td>Is it ready to serve traffic?</td><td>Traffic is withheld (endpoints removed).</td></tr>
      <tr><td><span class="ic">startupProbe</span></td><td>Has startup finished?</td><td>Delays liveness/readiness for slow boots.</td></tr>
    </tbody>
  </table>
  <pre class="code-block"># deployment.yaml — probes inside the container spec
containers:
  - name: app
    image: ghcr.io/yourname/myapp:1.0.0
    ports:
      - containerPort: 3000
    livenessProbe:
      httpGet:
        path: /healthz
        port: 3000
      initialDelaySeconds: 3
      periodSeconds: 10
    readinessProbe:
      httpGet:
        path: /readyz
        port: 3000
      initialDelaySeconds: 3
      periodSeconds: 5</pre>
  <pre class="code-block">kubectl get pods                 # watch READY column fill in
kubectl describe pod &lt;name&gt;      # probe events and restarts
kubectl get events --sort-by=.lastTimestamp</pre>
  <ul>
    <li><strong>liveness</strong> — restart anything wedged; use a lightweight endpoint that does not depend on downstream services.</li>
    <li><strong>readiness</strong> — a Service routes traffic to a Pod only once it is ready.</li>
    <li><strong>startup</strong> — guard slow-booting apps so liveness does not kill them mid-start.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Probe endpoints must be cheap</strong>
    <p>Probes run every few seconds per Pod. If <span class="ic">/healthz</span> queries the database, a slow DB triggers restart loops — keep health checks shallow and dependency checks on the readiness path.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Restart count tells a story</strong>
    <p><span class="ic">RESTARTS</span> in <span class="ic">kubectl get pods</span> above zero usually means the liveness probe is too strict or the app is genuinely broken. Investigate both, starting with logs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000415',
  'C0000000-0000-4000-8000-000000000322',
  1,
  'Metrics & Cluster Monitoring',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Metrics &amp; Cluster Monitoring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Metrics &amp; Cluster Monitoring</h1>
  <p>Monitoring answers two questions: are resources exhausted, and is the application healthy at a glance. Kubernetes ships a small metrics pipeline; heavy-duty monitoring layers on top with <strong>Prometheus</strong> and <strong>Grafana</strong>.</p>
  <h2>Metrics Server</h2>
  <p><span class="ic">kubectl top</span> needs the cluster Metrics Server (a slim aggregator of per-Pod CPU/memory):</p>
  <pre class="code-block"># Install Metrics Server (one-shot for local clusters)
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl top nodes
kubectl top pods -l app=web</pre>
  <h2>Prometheus for richer metrics</h2>
  <p>Prometheus scrapes HTTP endpoints of applications and stores time series; Grafana visualizes them. Applications expose a <span class="ic">/metrics</span> endpoint in Prometheus text format.</p>
  <pre class="code-block"># Sample exposition inside your app
http_requests_total{method="GET",status="200"} 42
up 1</pre>
  <pre class="code-block"># A ServiceMonitor tells Prometheus which Services to scrape.
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: web
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: web
  endpoints:
    - port: metrics
      path: /metrics</pre>
  <table>
    <thead>
      <tr><th>Tool</th><th>Job in the stack</th></tr>
    </thead>
    <tbody>
      <tr><td>Metrics Server</td><td>Quick CPU/memory for kubectl top and HPA.</td></tr>
      <tr><td>Prometheus</td><td>Pull, store, and alert on time-series metrics.</td></tr>
      <tr><td>Grafana</td><td>Dashboards over Prometheus data.</td></tr>
      <tr><td>Alertmanager</td><td>Route alert rules to pages/channels.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Prometheus is pull-based</strong>
    <p>Prometheus polls target endpoints on a schedule instead of receiving pushes. Firewalls must allow that scraping traffic, or use an exporter/pushgateway workaround.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start with RED</strong>
    <p>Track rate, errors, and duration for every endpoint you own; add alerts only where silence would hurt. Small, meaningful dashboards beat sprawling ones.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000416',
  'C0000000-0000-4000-8000-000000000323',
  1,
  'Logging & Debugging',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logging &amp; Debugging</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Logging &amp; Debugging</h1>
  <p>When something misbehaves, logs and direct inspection get you to the root cause. Kubernetes makes both first-class: containers write to stdout/stderr, and <span class="ic">kubectl</span> reads them instantly.</p>
  <h2>The logging model</h2>
  <p>Containers are expected to write logs to stdout and stderr. The container runtime captures them; the node keeps small rotating files; <span class="ic">kubectl logs</span> streams them to you.</p>
  <pre class="code-block">kubectl logs deployment/web                  # last logs of a Deployment
kubectl logs web-7c9d8f5645-k2m9n -f          # follow one Pod live
kubectl logs web-7c9d8f5645-k2m9n --previous  # logs of the crashed previous container
kubectl logs deployment/web --tail=50</pre>
  <h2>Debugging toolkit</h2>
  <pre class="code-block">kubectl describe pod web-7c9d8f5645-k2m9n    # conditions, events, restarts
kubectl get events --sort-by=.lastTimestamp  # cluster-wide recent events
kubectl exec -it web-7c9d8f5645-k2m9n -- sh  # shell inside a container
kubectl port-forward service/web 8080:3000   # tunnel to a service locally</pre>
  <table>
    <thead>
      <tr><th>Commando</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">logs</span></td><td>Application output, follow / previous variants.</td></tr>
      <tr><td><span class="ic">describe</span></td><td>Pod status, conditions, and probe events.</td></tr>
      <tr><td><span class="ic">exec</span></td><td>Interact with a live container (sh, curl, env).</td></tr>
      <tr><td><span class="ic">port-forward</span></td><td>Reach cluster-internal services from your laptop.</td></tr>
    </tbody>
  </table>
  <h2>Centralized logging</h2>
  <p>Pod logs evaporate with the Pod. For durable search, ship them to aggregation — commonly <strong>Loki</strong> (Grafana) or <strong>Elasticsearch</strong>, collected by a node-level agent or a logging sidecar.</p>
  <pre class="code-block"># Node-level agent pattern: Fluent Bit → Loki
# Deployed as a DaemonSet so every node ships its own logs</pre>
  <div class="callout callout-info">
    <strong>Log to stdout, not files</strong>
    <p>Files inside a container vanish on restart; stdout/stdout flows into the platform automatically. If your runtime writes to files, tail-forward them to stdout instead of fighting the model.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Structured is better</strong>
    <p>Emit JSON logs like <span class="ic">{"level":"error","req":123,"msg":"timeout"}</span> — fields make filtering and alerting trivial in Loki and friends.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000417',
  'C0000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Containerize the App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Containerize the App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Containerize the App</h1>
  <p>The capstone is a small Node.js web app with a <span class="ic">/health</span> endpoint and a hit counter, ready to be containerized, pushed to a registry, and later deployed to Kubernetes.</p>
  <h2>Project layout</h2>
  <pre class="code-block">capstone/
├── src/
│   └── index.js        # Express app
├── Dockerfile
├── .dockerignore
└── package.json        # express as the only dependency</pre>
  <h2>2. The app (src/index.js)</h2>
  <pre class="code-block">const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from the capstone app!');
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok', uptime: process.uptime() });
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log('listening on ' + port));</pre>
  <h2>3. Dockerfile (multi-stage)</h2>
  <pre class="code-block"># syntax=docker/dockerfile:1
FROM node:20-slim AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY src ./src

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app/package.json /app/package-lock.json ./
RUN npm ci --omit=dev
COPY --from=build /app/src ./src
EXPOSE 3000
USER node
CMD ["node", "src/index.js"]</pre>
  <h2>4. Build, tag, push, and run</h2>
  <pre class="code-block">docker build -t capstone-web:1.0.0 .
docker tag capstone-web:1.0.0 ghcr.io/YOUR_USER/capstone-web:1.0.0
docker push ghcr.io/YOUR_USER/capstone-web:1.0.0

# Local smoke test
docker run -d -p 3000:3000 capstone-web:1.0.0
curl http://localhost:3000/health</pre>
  <div class="callout callout-info">
    <strong>Ship the digest, not just a tag</strong>
    <p><span class="ic">docker push</span> prints a digest. Record it, and reference <span class="ic">image@sha256:…</span> in your manifests so the cluster pulls exactly the tested artifact.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Checkpoint</strong>
    <p>Verify the image runs locally and <span class="ic">/health</span> returns <span class="ic">200</span>. Everything from here on deploys this exact image to Kubernetes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000418',
  'C0000000-0000-4000-8000-000000000326',
  1,
  'Deploying the Capstone to Kubernetes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deploying the Capstone to Kubernetes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Deploying the Capstone to Kubernetes</h1>
  <p>Now we turn the image into a running, reachable service. The plan: create a namespace, define the Deployment, expose it with a Service, and route external traffic through an Ingress.</p>
  <h2>1. Namespace</h2>
  <p>A namespace scopes resources and keeps the capstone isolated from other work on the cluster.</p>
  <pre class="code-block">kubectl create namespace capstone
kubectl config set-context --current --namespace=capstone</pre>
  <h2>2. Deployment</h2>
  <pre class="code-block"># deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
  namespace: capstone
spec:
  replicas: 3
  selector:
    matchLabels:
      app: capstone-web
  template:
    metadata:
      labels:
        app: capstone-web
    spec:
      containers:
        - name: app
          image: ghcr.io/YOUR_USER/capstone-web:1.0.0
          ports:
            - containerPort: 3000
          livenessProbe:
            httpGet: { path: /health, port: 3000 }
            periodSeconds: 10
          readinessProbe:
            httpGet: { path: /health, port: 3000 }
            periodSeconds: 5
          resources:
            requests: { cpu: 100m, memory: 64Mi }
            limits:   { cpu: 200m, memory: 128Mi }</pre>
  <h2>3. Service</h2>
  <pre class="code-block"># service.yaml
apiVersion: v1
kind: Service
metadata:
  name: web
  namespace: capstone
spec:
  selector:
    app: capstone-web
  ports:
    - port: 80
      targetPort: 3000</pre>
  <h2>4. Ingress</h2>
  <pre class="code-block"># ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web
  namespace: capstone
spec:
  rules:
    - host: capstone.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 80</pre>
  <h2>5. Apply and verify</h2>
  <pre class="code-block">kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml

kubectl get deployments,svc,ingress,pods
kubectl rollout status deployment/web
curl -H "Host: capstone.example.com" http://&lt;ingress-ip&gt;/health</pre>
  <div class="callout callout-info">
    <strong>Resources and probes work together</strong>
    <p>Without ready Pods the Service finds no endpoints; without requests/limits the scheduler and autoscaler fly blind. Define both from the start.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Update circle</strong>
    <p>Next lesson completes the loop: roll a new version, scale under load, and watch it heal — that is production operating.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'C0000000-0000-4000-8000-000000000419',
  'C0000000-0000-4000-8000-000000000327',
  1,
  'Observing & Operating in Production',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Observing &amp; Operating in Production</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Observing &amp; Operating in Production</h1>
  <p>Deployed is the beginning, not the end. Operating means shipping new versions continuously, scaling with demand, and keeping the stack observable while it runs.</p>
  <h2>1. Ship a new version</h2>
  <pre class="code-block"># Build, tag, push, then update the Deployment image.
docker build -t ghcr.io/YOUR_USER/capstone-web:1.1.0 .
docker push ghcr.io/YOUR_USER/capstone-web:1.1.0

kubectl set image deployment/web app=ghcr.io/YOUR_USER/capstone-web:1.1.0
kubectl rollout status deployment/web

# Something broke? Roll back instantly.
kubectl rollout undo deployment/web</pre>
  <h2>2. Scale under load</h2>
  <p>Increase replicas manually or let the platform decide. For automatic scaling based on CPU, attach an HPA:</p>
  <pre class="code-block"># hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web
  namespace: capstone
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web
  minReplicas: 3
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70</pre>
  <pre class="code-block">kubectl apply -f hpa.yaml
kubectl get hpa -w               # watch desired vs current load
kubectl top pods                 # confirm utilization</pre>
  <h2>3. Keep it healthy and observable</h2>
  <pre class="code-block">kubectl get pods                  # READY/1, RESTARTS tells the story
kubectl logs deployment/web --tail=100
kubectl get events --sort-by=.lastTimestamp
kubectl port-forward svc/web 8080:80</pre>
  <p>Pair Prometheus scraping of <span class="ic">/metrics</span> with Grafana dashboards (detailed in Module 4) to track latency, error rate, and saturation — the signals that turn incidents into five-minute fixes.</p>
  <h2>4. Wrap up (optional cleanup)</h2>
  <pre class="code-block">kubectl delete namespace capstone   # removes everything it holds</pre>
  <div class="callout callout-info">
    <strong>Declarative is the theme</strong>
    <p>Every action here edits desired state — image tag, replica count, HPA policy — and controllers converge to it. Scripting fixes is a sign the manifest should have said it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>You did it</strong>
    <p>From <span class="ic">docker run</span> to a self-healing, autoscaled, observable deployment of your own app. Take the final assessment to lock in the certificate.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501-503) · Q2 → L6 (504-506) · Q3 → L9 (507-509)
--    Q4 → L12 (510-512) · Q5 → L15 (513-515) · Q6 → L18 (516-518)
--    Q7 → L21 (519-521) · Q8 → L24 (522-524) · Q9 → L28 (525-529)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('C0000000-0000-4000-8000-000000000501', 'C0000000-0000-4000-8000-000000000303',
   'What best describes a Docker container?',
   'A container is a lightweight, isolated process running on the host kernel with its own filesystem and runtime.', 1),
  ('C0000000-0000-4000-8000-000000000502', 'C0000000-0000-4000-8000-000000000303',
   'Which command creates and starts a container from an image?',
   'docker run both creates and starts a container from a local or pulled image.', 2),
  ('C0000000-0000-4000-8000-000000000503', 'C0000000-0000-4000-8000-000000000303',
   'How do containers keep resources isolated from one another?',
   'Linux namespaces isolate processes; cgroups limit CPU and memory.', 3),
  ('C0000000-0000-4000-8000-000000000504', 'C0000000-0000-4000-8000-000000000306',
   'Where are Docker images stored and shared by default?',
   'Container images are published to a registry, and Docker Hub is the default public one.', 1),
  ('C0000000-0000-4000-8000-000000000505', 'C0000000-0000-4000-8000-000000000306',
   'What is a Docker named volume used for?',
   'Named volumes survive container restart and removal, preserving persistent data.', 2),
  ('C0000000-0000-4000-8000-000000000506', 'C0000000-0000-4000-8000-000000000306',
   'Which Docker network driver is the default for single-host container networking?',
   'The bridge driver connects containers on a host through a virtual switch.', 3),
  ('C0000000-0000-4000-8000-000000000507', 'C0000000-0000-4000-8000-000000000309',
   'Which Dockerfile instruction sets the base image?',
   'FROM names the starting image and must be the first instruction in a Dockerfile.', 1),
  ('C0000000-0000-4000-8000-000000000508', 'C0000000-0000-4000-8000-000000000309',
   'Which Dockerfile instruction sets the default command run at container start?',
   'CMD defines the default process; it can be overridden at runtime.', 2),
  ('C0000000-0000-4000-8000-000000000509', 'C0000000-0000-4000-8000-000000000309',
   'Which instruction copies files from the build context into the image?',
   'COPY adds files or directories from the context into the image filesystem.', 3),
  ('C0000000-0000-4000-8000-000000000510', 'C0000000-0000-4000-8000-000000000312',
   'Which top-level key in docker-compose.yml lists the services of the stack?',
   'The services key enumerates every containerized component.', 1),
  ('C0000000-0000-4000-8000-000000000511', 'C0000000-0000-4000-8000-000000000312',
   'Which command builds, creates, and starts Compose services in the background?',
   'docker compose up -d starts the whole stack detached from your terminal.', 2),
  ('C0000000-0000-4000-8000-000000000512', 'C0000000-0000-4000-8000-000000000312',
   'How do Compose services address each other on the shared network?',
   'Compose provides DNS by service name, so services find each other by name.', 3),
  ('C0000000-0000-4000-8000-000000000513', 'C0000000-0000-4000-8000-000000000315',
   'What is the smallest deployable unit in Kubernetes?',
   'A Pod is the atomic scheduling unit and may hold one or more containers.', 1),
  ('C0000000-0000-4000-8000-000000000514', 'C0000000-0000-4000-8000-000000000315',
   'Which command applies a manifest to the cluster?',
   'kubectl apply -f sends the manifest to the API server declaratively.', 2),
  ('C0000000-0000-4000-8000-000000000515', 'C0000000-0000-4000-8000-000000000315',
   'Which object gives a set of Pods a stable virtual IP and DNS name?',
   'A Service fronts Pods with a stable address and load-balances traffic.', 3),
  ('C0000000-0000-4000-8000-000000000516', 'C0000000-0000-4000-8000-000000000318',
   'Which Kubernetes object is used for non-sensitive configuration such as feature flags?',
   'ConfigMaps store plain-text configuration that can be injected as env or files.', 1),
  ('C0000000-0000-4000-8000-000000000517', 'C0000000-0000-4000-8000-000000000318',
   'How are values stored inside a Kubernetes Secret?',
   'Secret values are base64-encoded strings in the manifest (encoding, not encryption).', 2),
  ('C0000000-0000-4000-8000-000000000518', 'C0000000-0000-4000-8000-000000000318',
   'What does an Ingress resource do?',
   'An Ingress routes HTTP traffic to Services based on hostname and path.', 3),
  ('C0000000-0000-4000-8000-000000000519', 'C0000000-0000-4000-8000-000000000321',
   'Which command changes the number of replicas of a Deployment?',
   'kubectl scale deployment adjusts the replica count imperatively.', 1),
  ('C0000000-0000-4000-8000-000000000520', 'C0000000-0000-4000-8000-000000000321',
   'Which update strategy replaces old Pods gradually with zero downtime?',
   'RollingUpdate is the default strategy and swaps Pods progressively.', 2),
  ('C0000000-0000-4000-8000-000000000521', 'C0000000-0000-4000-8000-000000000321',
   'Which probe decides whether a Pod is allowed to receive traffic?',
   'The readinessProbe gates traffic; failing it removes the Pod from Service endpoints.', 3),
  ('C0000000-0000-4000-8000-000000000522', 'C0000000-0000-4000-8000-000000000324',
   'Which probe restarts the container when it fails?',
   'The livenessProbe restarts an unhealthy container to trigger self-healing.', 1),
  ('C0000000-0000-4000-8000-000000000523', 'C0000000-0000-4000-8000-000000000324',
   'Which command streams the logs of a Pod?',
   'kubectl logs reads container stdout/stderr; -f follows it live.', 2),
  ('C0000000-0000-4000-8000-000000000524', 'C0000000-0000-4000-8000-000000000324',
   'Which tool is commonly used to collect and query Kubernetes metrics?',
   'Prometheus scrapes application and platform metrics and powers alerting.', 3),
  ('C0000000-0000-4000-8000-000000000525', 'C0000000-0000-4000-8000-000000000328',
   'What is the main difference between containers and virtual machines?',
   'Containers share the host kernel; VMs each run a full guest operating system.', 1),
  ('C0000000-0000-4000-8000-000000000526', 'C0000000-0000-4000-8000-000000000328',
   'Which Kubernetes object manages stateless workloads with rolling updates?',
   'A Deployment owns the Pod template, replica count, and rollout strategy.', 2),
  ('C0000000-0000-4000-8000-000000000527', 'C0000000-0000-4000-8000-000000000328',
   'How do you expose a Deployment to clients outside the cluster?',
   'Use a NodePort or LoadBalancer Service, or route it via an Ingress.', 3),
  ('C0000000-0000-4000-8000-000000000528', 'C0000000-0000-4000-8000-000000000328',
   'Which probe controls whether a Pod stays in the Service load-balancing set?',
   'The readinessProbe admits traffic only when the app is ready to serve.', 4),
  ('C0000000-0000-4000-8000-000000000529', 'C0000000-0000-4000-8000-000000000328',
   'Which command removes all resources described in a manifest file?',
   'kubectl delete -f tears down whatever the manifests declare.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly 1 is_correct per question.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096
--    Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): What best describes a Docker container?
  ('C0000000-0000-4000-8000-000000001001', 'C0000000-0000-4000-8000-000000000501', 'A lightweight, isolated process sharing the host kernel', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001002', 'C0000000-0000-4000-8000-000000000501', 'A full virtual machine with its own operating system', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001003', 'C0000000-0000-4000-8000-000000000501', 'A static compiled binary with no runtime', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001004', 'C0000000-0000-4000-8000-000000000501', 'A physical server partition on the host', FALSE, 4),
  -- Q1 (501) q2: docker run
  ('C0000000-0000-4000-8000-000000001005', 'C0000000-0000-4000-8000-000000000502', 'docker run', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001006', 'C0000000-0000-4000-8000-000000000502', 'docker pull', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001007', 'C0000000-0000-4000-8000-000000000502', 'docker build', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001008', 'C0000000-0000-4000-8000-000000000502', 'docker push', FALSE, 4),
  -- Q1 (501) q3: isolation between containers
  ('C0000000-0000-4000-8000-000000001009', 'C0000000-0000-4000-8000-000000000503', 'Virtual machines on a hypervisor', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001010', 'C0000000-0000-4000-8000-000000000503', 'Namespaces and cgroups', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001011', 'C0000000-0000-4000-8000-000000000503', 'TLS certificates and firewalls', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001012', 'C0000000-0000-4000-8000-000000000503', 'Separate physical network cables', FALSE, 4),
  -- Q2 (504): registry default
  ('C0000000-0000-4000-8000-000000001013', 'C0000000-0000-4000-8000-000000000504', 'A registry such as Docker Hub', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001014', 'C0000000-0000-4000-8000-000000000504', 'A folder inside the container', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001015', 'C0000000-0000-4000-8000-000000000504', 'Any running database', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001016', 'C0000000-0000-4000-8000-000000000504', 'The host operating system cache', FALSE, 4),
  -- Q2 (504) q2: named volumes persistence
  ('C0000000-0000-4000-8000-000000001017', 'C0000000-0000-4000-8000-000000000505', 'To store unpacked image layers', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001018', 'C0000000-0000-4000-8000-000000000505', 'To persist data across restart and removal', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001019', 'C0000000-0000-4000-8000-000000000505', 'To fix container-to-container networking', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001020', 'C0000000-0000-4000-8000-000000000505', 'To encrypt data at rest', FALSE, 4),
  -- Q2 (504) q3: default network driver
  ('C0000000-0000-4000-8000-000000001021', 'C0000000-0000-4000-8000-000000000506', 'host', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001022', 'C0000000-0000-4000-8000-000000000506', 'overlay', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001023', 'C0000000-0000-4000-8000-000000000506', 'bridge', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001024', 'C0000000-0000-4000-8000-000000000506', 'none', FALSE, 4),
  -- Q3 (507): base image instruction
  ('C0000000-0000-4000-8000-000000001025', 'C0000000-0000-4000-8000-000000000507', 'FROM', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001026', 'C0000000-0000-4000-8000-000000000507', 'RUN', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001027', 'C0000000-0000-4000-8000-000000000507', 'CMD', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001028', 'C0000000-0000-4000-8000-000000000507', 'EXPOSE', FALSE, 4),
  -- Q3 (507) q2: default command
  ('C0000000-0000-4000-8000-000000001029', 'C0000000-0000-4000-8000-000000000508', 'RUN', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001030', 'C0000000-0000-4000-8000-000000000508', 'ENV', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001031', 'C0000000-0000-4000-8000-000000000508', 'CMD', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001032', 'C0000000-0000-4000-8000-000000000508', 'WORKDIR', FALSE, 4),
  -- Q3 (507) q3: copy instruction
  ('C0000000-0000-4000-8000-000000001033', 'C0000000-0000-4000-8000-000000000509', 'ADD', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001034', 'C0000000-0000-4000-8000-000000000509', 'ENV', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001035', 'C0000000-0000-4000-8000-000000000509', 'VOLUME', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001036', 'C0000000-0000-4000-8000-000000000509', 'COPY', TRUE,  4),
  -- Q4 (510): services key
  ('C0000000-0000-4000-8000-000000001037', 'C0000000-0000-4000-8000-000000000510', 'services', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001038', 'C0000000-0000-4000-8000-000000000510', 'containers', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001039', 'C0000000-0000-4000-8000-000000000510', 'images', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001040', 'C0000000-0000-4000-8000-000000000510', 'deployments', FALSE, 4),
  -- Q4 (510) q2: compose up -d
  ('C0000000-0000-4000-8000-000000001041', 'C0000000-0000-4000-8000-000000000511', 'docker compose build', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001042', 'C0000000-0000-4000-8000-000000000511', 'docker compose down', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001043', 'C0000000-0000-4000-8000-000000000511', 'docker compose up -d', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001044', 'C0000000-0000-4000-8000-000000000511', 'docker compose ps', FALSE, 4),
  -- Q4 (510) q3: service addressing
  ('C0000000-0000-4000-8000-000000001045', 'C0000000-0000-4000-8000-000000000512', 'By container ID only', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001046', 'C0000000-0000-4000-8000-000000000512', 'By transient IP address', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001047', 'C0000000-0000-4000-8000-000000000512', 'By MAC address', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001048', 'C0000000-0000-4000-8000-000000000512', 'By service name', TRUE,  4),
  -- Q5 (513): smallest deployable unit
  ('C0000000-0000-4000-8000-000000001049', 'C0000000-0000-4000-8000-000000000513', 'A Pod', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001050', 'C0000000-0000-4000-8000-000000000513', 'A Node', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001051', 'C0000000-0000-4000-8000-000000000513', 'A Cluster', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001052', 'C0000000-0000-4000-8000-000000000513', 'A Namespace', FALSE, 4),
  -- Q5 (513) q2: apply manifest
  ('C0000000-0000-4000-8000-000000001053', 'C0000000-0000-4000-8000-000000000514', 'kubectl apply -f', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001054', 'C0000000-0000-4000-8000-000000000514', 'kubectl run -f', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001055', 'C0000000-0000-4000-8000-000000000514', 'kubectl push -f', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001056', 'C0000000-0000-4000-8000-000000000514', 'kubectl build -f', FALSE, 4),
  -- Q5 (513) q3: service stable address
  ('C0000000-0000-4000-8000-000000001057', 'C0000000-0000-4000-8000-000000000515', 'A ConfigMap', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001058', 'C0000000-0000-4000-8000-000000000515', 'A Secret', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001059', 'C0000000-0000-4000-8000-000000000515', 'A Service', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001060', 'C0000000-0000-4000-8000-000000000515', 'An Ingress', FALSE, 4),
  -- Q6 (516): configmap purpose
  ('C0000000-0000-4000-8000-000000001061', 'C0000000-0000-4000-8000-000000000516', 'ConfigMap', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001062', 'C0000000-0000-4000-8000-000000000516', 'Secret', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001063', 'C0000000-0000-4000-8000-000000000516', 'PersistentVolume', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001064', 'C0000000-0000-4000-8000-000000000516', 'Namespace', FALSE, 4),
  -- Q6 (516) q2: secret storage
  ('C0000000-0000-4000-8000-000000001065', 'C0000000-0000-4000-8000-000000000517', 'Plain text in the manifest', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001066', 'C0000000-0000-4000-8000-000000000517', 'base64-encoded strings', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001067', 'C0000000-0000-4000-8000-000000000517', 'Encrypted in the image layer', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001068', 'C0000000-0000-4000-8000-000000000517', 'Hashed with a one-way function', FALSE, 4),
  -- Q6 (516) q3: ingress routing
  ('C0000000-0000-4000-8000-000000001069', 'C0000000-0000-4000-8000-000000000518', 'Exposes a database externally', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001070', 'C0000000-0000-4000-8000-000000000518', 'Balances TCP traffic between nodes', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001071', 'C0000000-0000-4000-8000-000000000518', 'Routes HTTP traffic to Services by host and path', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001072', 'C0000000-0000-4000-8000-000000000518', 'Encrypts container images', FALSE, 4),
  -- Q7 (519): scale deployment
  ('C0000000-0000-4000-8000-000000001073', 'C0000000-0000-4000-8000-000000000519', 'kubectl scale deployment', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001074', 'C0000000-0000-4000-8000-000000000519', 'kubectl resize deployment', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001075', 'C0000000-0000-4000-8000-000000000519', 'kubectl count deployment', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001076', 'C0000000-0000-4000-8000-000000000519', 'kubectl deploy --replicas 5', FALSE, 4),
  -- Q7 (519) q2: rolling update strategy
  ('C0000000-0000-4000-8000-000000001077', 'C0000000-0000-4000-8000-000000000520', 'Recreate', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001078', 'C0000000-0000-4000-8000-000000000520', 'RollingUpdate', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001079', 'C0000000-0000-4000-8000-000000000520', 'BlueGreen', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001080', 'C0000000-0000-4000-8000-000000000520', 'RecreateAll', FALSE, 4),
  -- Q7 (519) q3: readiness probe
  ('C0000000-0000-4000-8000-000000001081', 'C0000000-0000-4000-8000-000000000521', 'startupProbe', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001082', 'C0000000-0000-4000-8000-000000000521', 'livenessProbe', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001083', 'C0000000-0000-4000-8000-000000000521', 'volumeProbe', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001084', 'C0000000-0000-4000-8000-000000000521', 'readinessProbe', TRUE,  4),
  -- Q8 (522): liveness probe restart
  ('C0000000-0000-4000-8000-000000001085', 'C0000000-0000-4000-8000-000000000522', 'livenessProbe', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001086', 'C0000000-0000-4000-8000-000000000522', 'readinessProbe', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001087', 'C0000000-0000-4000-8000-000000000522', 'configProbe', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001088', 'C0000000-0000-4000-8000-000000000522', 'healthProbe', FALSE, 4),
  -- Q8 (522) q2: kubectl logs
  ('C0000000-0000-4000-8000-000000001089', 'C0000000-0000-4000-8000-000000000523', 'kubectl describe', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001090', 'C0000000-0000-4000-8000-000000000523', 'kubectl logs', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001091', 'C0000000-0000-4000-8000-000000000523', 'kubectl exec', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001092', 'C0000000-0000-4000-8000-000000000523', 'kubectl top', FALSE, 4),
  -- Q8 (522) q3: metrics tool
  ('C0000000-0000-4000-8000-000000001093', 'C0000000-0000-4000-8000-000000000524', 'Grafana', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001094', 'C0000000-0000-4000-8000-000000000524', 'Loki', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001095', 'C0000000-0000-4000-8000-000000000524', 'Prometheus', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001096', 'C0000000-0000-4000-8000-000000000524', 'Kibana', FALSE, 4),
  -- Q9 (525): containers vs VMs
  ('C0000000-0000-4000-8000-000000001097', 'C0000000-0000-4000-8000-000000000525', 'Containers share the host kernel; VMs run a full guest OS', TRUE,  1),
  ('C0000000-0000-4000-8000-000000001098', 'C0000000-0000-4000-8000-000000000525', 'Containers are a slower, heavier abstraction', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001099', 'C0000000-0000-4000-8000-000000000525', 'VMs cannot run applications at scale', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001100', 'C0000000-0000-4000-8000-000000000525', 'There is no difference', FALSE, 4),
  -- Q9 (525) q2: workload controller
  ('C0000000-0000-4000-8000-000000001101', 'C0000000-0000-4000-8000-000000000526', 'Service', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001102', 'C0000000-0000-4000-8000-000000000526', 'Deployment', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001103', 'C0000000-0000-4000-8000-000000000526', 'ConfigMap', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001104', 'C0000000-0000-4000-8000-000000000526', 'Ingress', FALSE, 4),
  -- Q9 (525) q3: exposing outside cluster
  ('C0000000-0000-4000-8000-000000001105', 'C0000000-0000-4000-8000-000000000527', 'Create a bare Pod', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001106', 'C0000000-0000-4000-8000-000000000527', 'Write a ConfigMap', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001107', 'C0000000-0000-4000-8000-000000000527', 'Use a NodePort or LoadBalancer Service, or an Ingress', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001108', 'C0000000-0000-4000-8000-000000000527', 'Attach a PersistentVolume directly', FALSE, 4),
  -- Q9 (525) q4: ready pod in load balancer
  ('C0000000-0000-4000-8000-000000001109', 'C0000000-0000-4000-8000-000000000528', 'NodePort assignment', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001110', 'C0000000-0000-4000-8000-000000000528', 'Image pull success', FALSE, 2),
  ('C0000000-0000-4000-8000-000000001111', 'C0000000-0000-4000-8000-000000000528', 'A passing readinessProbe', TRUE,  3),
  ('C0000000-0000-4000-8000-000000001112', 'C0000000-0000-4000-8000-000000000528', 'Only the restart count', FALSE, 4),
  -- Q9 (525) q5: delete from manifest
  ('C0000000-0000-4000-8000-000000001113', 'C0000000-0000-4000-8000-000000000529', 'kubectl apply -f', FALSE, 1),
  ('C0000000-0000-4000-8000-000000001114', 'C0000000-0000-4000-8000-000000000529', 'kubectl delete -f', TRUE,  2),
  ('C0000000-0000-4000-8000-000000001115', 'C0000000-0000-4000-8000-000000000529', 'kubectl remove -f', FALSE, 3),
  ('C0000000-0000-4000-8000-000000001116', 'C0000000-0000-4000-8000-000000000529', 'kubectl destroy -f', FALSE, 4)
ON CONFLICT (id) DO NOTHING;