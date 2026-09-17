-- ============================================================================
-- SEED 017: Complete course — "Microsoft Azure Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing    (20000000-0000-4000-8000-000000000004)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Cloud Concepts           → C1 Cloud Computing & Service Models · C2 Azure Architecture & Regions
--   M2 Core Azure Services      → C3 Compute & Networking · C4 Storage & Databases
--   M3 Identity & Governance    → C5 Microsoft Entra ID & RBAC · C6 Policy, Locks & Cost
--   M4 Monitoring & Tools       → C7 Azure Monitor & Alerts · C8 CLI, Portal & Security
--   M5 Capstone: Deploy         → C9 Planning & Portal Deployment · C10 CLI Deployment & Launch
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
  '01100000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'Microsoft Azure Fundamentals',
  'microsoft-azure-fundamentals',
  'Learn how Azure works from the ground up. Master cloud concepts, core compute, storage, networking, and database services, then secure resources with Microsoft Entra ID, govern them with Azure Policy and cost controls, and finish by deploying a real workload in the portal and with the Azure CLI.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  15
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01100000-0000-4000-8000-000000000011', '01100000-0000-4000-8000-000000000001', 'Explain cloud service and deployment models plus the shared responsibility model.', 1),
  ('01100000-0000-4000-8000-000000000012', '01100000-0000-4000-8000-000000000001', 'Describe Azure architecture: subscriptions, resource groups, regions, and availability zones.', 2),
  ('01100000-0000-4000-8000-000000000013', '01100000-0000-4000-8000-000000000001', 'Identify core Azure compute, networking, storage, and database services.', 3),
  ('01100000-0000-4000-8000-000000000014', '01100000-0000-4000-8000-000000000001', 'Apply Microsoft Entra ID, RBAC, Azure Policy, and cost management to real scenarios.', 4),
  ('01100000-0000-4000-8000-000000000015', '01100000-0000-4000-8000-000000000001', 'Deploy and monitor a capstone workload with the Azure portal, the Azure CLI, and Azure Monitor.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01100000-0000-4000-8000-000000000101', '01100000-0000-4000-8000-000000000001', 1, 'Cloud Concepts',               'Understand what cloud computing is and how Azure organizes the world.',       'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000102', '01100000-0000-4000-8000-000000000001', 2, 'Core Azure Services',          'Identify the main compute, networking, storage, and database building blocks.','PUBLISHED'),
  ('01100000-0000-4000-8000-000000000103', '01100000-0000-4000-8000-000000000001', 3, 'Identity, Security & Governance','Secure access with Entra ID and govern resources with policy and cost controls.','PUBLISHED'),
  ('01100000-0000-4000-8000-000000000104', '01100000-0000-4000-8000-000000000001', 4, 'Monitoring & Management Tools','Watch workloads with Azure Monitor and manage them with portal, CLI, and shell.','PUBLISHED'),
  ('01100000-0000-4000-8000-000000000105', '01100000-0000-4000-8000-000000000001', 5, 'Capstone: Deploy & Launch',    'Plan, deploy, monitor, and clean up a complete Azure workload.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01100000-0000-4000-8000-000000000201', '01100000-0000-4000-8000-000000000101', 1, 'Cloud Computing & Service Models', 'The value proposition and service models of the cloud.',        'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000202', '01100000-0000-4000-8000-000000000101', 2, 'Azure Architecture & Regions',     'How subscriptions, resource groups, regions, and zones work.', 'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000203', '01100000-0000-4000-8000-000000000102', 1, 'Compute & Networking',             'Virtual machines, containers, functions, and App Service.',    'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000204', '01100000-0000-4000-8000-000000000102', 2, 'Storage & Databases',              'Azure Storage services and managed database options.',         'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000205', '01100000-0000-4000-8000-000000000103', 1, 'Identity & Access Control',        'Microsoft Entra ID and role-based access control.',            'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000206', '01100000-0000-4000-8000-000000000103', 2, 'Governance & Cost Management',     'Azure Policy, locks, budgets, and SLAs.',                      'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000207', '01100000-0000-4000-8000-000000000104', 1, 'Monitoring & Reliability',         'Azure Monitor, alerts, and service health.',                   'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000208', '01100000-0000-4000-8000-000000000104', 2, 'Management Tools & Security',      'The Azure portal, CLI, and Microsoft Defender for Cloud.',     'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000209', '01100000-0000-4000-8000-000000000105', 1, 'Planning the Capstone',            'Design a small workload and deploy it in the portal.',         'PUBLISHED'),
  ('01100000-0000-4000-8000-000000000210', '01100000-0000-4000-8000-000000000105', 2, 'Deploying & Hardening',            'Automate deployment with the Azure CLI and monitor the result.','PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01100000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01100000-0000-4000-8000-000000000301', '01100000-0000-4000-8000-000000000201', 1, 'What Is Cloud Computing?',           'See the essential characteristics and economics of cloud computing.',              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01100000-0000-4000-8000-000000000302', '01100000-0000-4000-8000-000000000201', 2, 'Cloud Models & Service Levels',       'Compare public, private, and hybrid clouds and the IaaS, PaaS, and SaaS models.',  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000303', '01100000-0000-4000-8000-000000000201', 3, 'Cloud Concepts Quiz',                 'Check your understanding of cloud fundamentals.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000304', '01100000-0000-4000-8000-000000000202', 1, 'Subscriptions, Tenants & Accounts',   'Understand how access and billing are organized in Azure.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01100000-0000-4000-8000-000000000305', '01100000-0000-4000-8000-000000000202', 2, 'Regions, Zones & Resource Groups',    'Place resources across the world and group them logically.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000306', '01100000-0000-4000-8000-000000000202', 3, 'Azure Architecture Quiz',             'Test your grasp of how Azure is organized.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000307', '01100000-0000-4000-8000-000000000203', 1, 'Azure Virtual Machines & Scale Sets', 'Run full VMs with total control and scale them automatically.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000308', '01100000-0000-4000-8000-000000000203', 2, 'Containers, Functions & App Service', 'Choose the right compute service for each workload.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01100000-0000-4000-8000-000000000309', '01100000-0000-4000-8000-000000000203', 3, 'Compute Quiz',                        'Match workloads to the correct compute service.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000310', '01100000-0000-4000-8000-000000000204', 1, 'Azure Storage Accounts',              'Store blobs, files, queues, and tables with built-in resilience.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000311', '01100000-0000-4000-8000-000000000204', 2, 'Databases: SQL, Cosmos DB & More',    'Pick the right managed data service for structured and unstructured data.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01100000-0000-4000-8000-000000000312', '01100000-0000-4000-8000-000000000204', 3, 'Storage & Databases Quiz',            'Confirm your storage and database knowledge.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000313', '01100000-0000-4000-8000-000000000205', 1, 'Microsoft Entra ID',                  'Directory, identities, single sign-on, and conditional access.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000314', '01100000-0000-4000-8000-000000000205', 2, 'Role-Based Access Control',           'Grant least-privilege access with roles and scopes.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000315', '01100000-0000-4000-8000-000000000205', 3, 'Identity & Access Quiz',              'Verify identity and access concepts.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000316', '01100000-0000-4000-8000-000000000206', 1, 'Azure Policy & Management Locks',     'Enforce rules and protect resources from accidental change.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01100000-0000-4000-8000-000000000317', '01100000-0000-4000-8000-000000000206', 2, 'Cost Management & SLAs',              'Forecast spend, set budgets, and understand service commitments.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000318', '01100000-0000-4000-8000-000000000206', 3, 'Governance & Cost Quiz',              'Test policy and cost management skills.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000319', '01100000-0000-4000-8000-000000000207', 1, 'Azure Monitor & Log Analytics',       'Collect metrics and logs from every resource you run.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000320', '01100000-0000-4000-8000-000000000207', 2, 'Alerts, Service Health & Reliability','React to problems before users notice them.',                                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01100000-0000-4000-8000-000000000321', '01100000-0000-4000-8000-000000000207', 3, 'Monitoring Quiz',                     'Check monitoring and alerting concepts.',                                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000322', '01100000-0000-4000-8000-000000000208', 1, 'Azure CLI, Portal & Cloud Shell',     'Manage Azure resources in four different ways.',                                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01100000-0000-4000-8000-000000000323', '01100000-0000-4000-8000-000000000208', 2, 'Security & Microsoft Defender for Cloud','Harden workloads with defense in depth and track exposure.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01100000-0000-4000-8000-000000000324', '01100000-0000-4000-8000-000000000208', 3, 'Tools & Security Quiz',               'Verify management tool and security knowledge.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01100000-0000-4000-8000-000000000325', '01100000-0000-4000-8000-000000000209', 1, 'Capstone: Planning the Deployment',   'Design a small web workload and lay out its resources.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01100000-0000-4000-8000-000000000326', '01100000-0000-4000-8000-000000000209', 2, 'Deploying in the Azure Portal',       'Create and connect the capstone resources step by step.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01100000-0000-4000-8000-000000000327', '01100000-0000-4000-8000-000000000210', 1, 'Deploying with Azure CLI & Cleanup',  'Repeat the deployment with code, verify it, and tear it down.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01100000-0000-4000-8000-000000000328', '01100000-0000-4000-8000-000000000210', 2, 'Final Assessment',                    'Prove your Azure fundamentals knowledge across the course.',                      'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01100000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01100000-0000-4000-8000-000000000401',
  '01100000-0000-4000-8000-000000000301',
  1,
  'What Is Cloud Computing?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Is Cloud Computing?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What Is Cloud Computing?</h1>
  <p>Cloud computing delivers <strong>compute power, storage, networking, and databases</strong> over the internet on demand. Instead of buying servers and racking them in a data center of your own, you rent whichever resources you need from a provider and pay as you go.</p>
  <p>Think of it as the difference between buying a furnace and turning on a thermostat. The infrastructure is somewhere else, always available, and metered like a utility.</p>
  <div class="callout callout-tip">
    <strong>Why it works</strong>
    <p>The provider handles the physical layer. You focus on the abstraction: <span class="ic">2 vCPU, 8 GB RAM, West Europe</span> — not the iron underneath.</p>
  </div>
  <h2>The five essential characteristics</h2>
  <ul>
    <li><strong>On-demand self-service</strong> — provision resources without human intervention.</li>
    <li><strong>Broad network access</strong> — reach services from any device over the internet.</li>
    <li><strong>Resource pooling</strong> — many customers share the same physical hardware securely.</li>
    <li><strong>Rapid elasticity</strong> — scale up or down in seconds to match demand.</li>
    <li><strong>Measured service</strong> — usage is metered; you pay only for what you consume.</li>
  </ul>
  <h2>Before the cloud</h2>
  <table>
    <tr><th>Concern</th><th>On-premises</th><th>Azure</th></tr>
    <tr><td>Capacity planning</td><td>Estimate years ahead</td><td>Provision when needed</td></tr>
    <tr><td>Upfront cost</td><td>Large capital outlay</td><td>Small operational bills</td></tr>
    <tr><td>Time to market</td><td>Weeks of procurement</td><td>Minutes to deploy</td></tr>
    <tr><td>Scaling</td><td>Buy more hardware</td><td>Bump a number</td></tr>
  </table>
  <h2>The Azure difference</h2>
  <p>Azure is Microsoft&rsquo;s public cloud. It offers more than 200 services across compute, data, AI, and DevOps, with:</p>
  <ul>
    <li>A global footprint of regions spread across continents.</li>
    <li>Hybrid capabilities that connect Azure to your existing data center.</li>
    <li>Enterprise compliance certifications for regulated industries.</li>
  </ul>
  <pre class="code-block">A typical request to the cloud:
1. You ask for 2 vCPU + 8 GB RAM in West Europe
2. Azure provisions equivalent compute in seconds
3. You pay per second while it runs
4. You deallocate it — billing stops</pre>
  <div class="callout callout-info">
    <strong>No hardware, no excuses</strong>
    <p>Failed disks, dead power supplies, and old CPUs are the provider&rsquo;s problem. You never touch the machine — and you never miss a bill for idle capacity.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000402',
  '01100000-0000-4000-8000-000000000302',
  1,
  'Cloud Models & Service Levels',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Models & Service Levels</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cloud Models &amp; Service Levels</h1>
  <p>Two choices shape every cloud workload: the <strong>deployment model</strong> (who owns the cloud) and the <strong>service model</strong> (how much of the stack you manage).</p>
  <h2>The three service models</h2>
  <table>
    <tr><th>Model</th><th>You manage</th><th>Provider manages</th><th>Example</th></tr>
    <tr><td>IaaS</td><td>OS, runtime, apps, data</td><td>Hypervisor, network, physical</td><td>Azure Virtual Machines</td></tr>
    <tr><td>PaaS</td><td>Apps and data only</td><td>OS, runtime, patching, scale</td><td>App Service, Azure SQL</td></tr>
    <tr><td>SaaS</td><td>Users and data only</td><td>Everything else</td><td>Microsoft 365, Dynamics 365</td></tr>
  </table>
  <p>Moving from IaaS to SaaS, you trade control for <strong>convenience</strong>. Moving the other way, you trade convenience for <strong>control</strong>.</p>
  <div class="callout callout-info">
    <strong>Where do I run in it?</strong>
    <p>A lift-and-shift VM is IaaS. A web app on App Service is PaaS. Email on Microsoft 365 is SaaS.</p>
  </div>
  <h2>Deployment models</h2>
  <ul>
    <li><strong>Public cloud</strong> — shared infrastructure owned by the provider, most elasticity, least operational work.</li>
    <li><strong>Private cloud</strong> — dedicated infrastructure for one organization, maximum control and isolation.</li>
    <li><strong>Hybrid cloud</strong> — a connected mix of both, ideal when some systems must stay on premises.</li>
  </ul>
  <h2>CAPEX to OPEX</h2>
  <p>Cloud shifts spending from <strong>capital expenditure</strong> (buying assets upfront) to <strong>operational expenditure</strong> (paying for consumption over time).</p>
  <table>
    <tr><th>Expenditure</th><th>On-premises</th><th>Cloud</th></tr>
    <tr><td>CAPEX</td><td>Buy hardware, licenses, cooling</td><td>None</td></tr>
    <tr><td>OPEX</td><td>Power, staff, maintenance</td><td>Metered usage bills</td></tr>
  </table>
  <pre class="code-block">On-premises: pay for a server you hope to need in three years.
Azure:       rent the capacity you actually use, this month.</pre>
  <div class="callout callout-tip">
    <strong>Predictability helps</strong>
    <p>Cloud is cheapest when elasticity matches your real demand. Flat, constant workloads on VMs may cost more than hardware you already own — price it before you move it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000404',
  '01100000-0000-4000-8000-000000000304',
  1,
  'Subscriptions, Tenants & Accounts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subscriptions, Tenants & Accounts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Subscriptions, Tenants &amp; Accounts</h1>
  <p>Azure organizes access and billing in a hierarchy. Sign in as a user, work inside a <strong>tenant</strong>, buy capacity through a <strong>subscription</strong>, and group resources into <strong>resource groups</strong>.</p>
  <h2>The Microsoft Entra tenant</h2>
  <p>A tenant is a dedicated directory for identities in your organization. It holds users, groups, and the apps they are allowed to use, and it is the boundary for sign-in and single sign-on.</p>
  <p>Above and around your directory, a <strong>billing account</strong> handles who pays for what, while the subscription defines what is actually paid for.</p>
  <h2>Subscriptions</h2>
  <p>A subscription is the unit of billing <em>and</em> the unit of access control. Resources belong to exactly one subscription.</p>
  <ul>
    <li><strong>Billing boundary</strong> — usage is aggregated and invoiced per subscription.</li>
    <li><strong>Access boundary</strong> — roles assigned at the subscription level apply to everything inside.</li>
    <li><strong>Isolation</strong> — separate subscriptions separate dev, test, and production.</li>
  </ul>
  <table>
    <tr><th>Subscription</th><th>Purpose</th><th>Pattern</th></tr>
    <tr><td>dev</td><td>Try new ideas</td><td>Cheap SKUs, daily cleanup</td></tr>
    <tr><td>test</td><td>Validate releases</td><td>Matches production size</td></tr>
    <tr><td>prod</td><td>Serve customers</td><td>Redundancy, monitoring</td></tr>
  </table>
  <h2>Management groups</h2>
  <p>When an organization has many subscriptions, <strong>management groups</strong> bundle them so policies, access, and budgets can be applied once and inherited.</p>
  <pre class="code-block">Management group: Acme Corp
├── Production group
│   ├── sub-prod-apps
│   └── sub-prod-data
└── Non-production group
    ├── sub-dev
    └── sub-test</pre>
  <div class="callout callout-tip">
    <strong>One subscription for learning</strong>
    <p>For this course, a single free-tier subscription is plenty. The hierarchy still matters because real teams enforce cost and governance at the management-group level.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000405',
  '01100000-0000-4000-8000-000000000305',
  1,
  'Regions, Zones & Resource Groups',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Regions, Zones & Resource Groups</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Regions, Zones &amp; Resource Groups</h1>
  <p>When you create almost any Azure resource, you pick a <strong>region</strong>. Regions are where your data physically lives, where traffic is lowest in latency, and where your bill is calculated.</p>
  <h2>Regions</h2>
  <ul>
    <li><strong>Latency</strong> — deploy near your users to keep round trips short.</li>
    <li><strong>Compliance</strong> — data-residency laws may require a specific geography, such as EU regions.</li>
    <li><strong>Billing</strong> — prices vary by region; a West Europe VM can cost less than the same VM elsewhere.</li>
  </ul>
  <p>Most regions are paired with another region far away (<strong>region pairs</strong>) for automatic fallback and orderly recovery during outages.</p>
  <h2>Availability zones</h2>
  <p>Inside many regions, <strong>availability zones</strong> are physically separate data centers with independent power, cooling, and networking. Deploying across zones protects you if one data center fails.</p>
  <table>
    <tr><th>Strategy</th><th>Description</th><th>Outcome</th></tr>
    <tr><td>Zonal</td><td>Resources pinned to one zone</td><td>Zone outage takes that resource down</td></tr>
    <tr><td>Zone-redundant</td><td>Replicated across several zones</td><td>Survives a single-zone outage</td></tr>
  </table>
  <h2>Resource groups</h2>
  <p>A resource group is a <strong>logical container</strong> (not a physical boundary) that groups related resources for management, RBAC, and lifecycle.</p>
  <ul>
    <li>Delete the group and everything inside it goes away together.</li>
    <li>Apply locks and policies at the group level to affect every resource within.</li>
    <li>Choose a name that signals environment and owner, for example <span class="ic">rg-elearning-westus-001</span>.</li>
  </ul>
  <pre class="code-block">rg-elearning                ← resource group
├── app-elearning-demo      ← App Service
├── sqlserver-elearning     ← SQL server
│   └── sqldb-elearning     ← SQL database
└── storageelearning        ← storage account</pre>
  <div class="callout callout-info">
    <strong>Group location vs resource location</strong>
    <p>A resource group has its own region, used for storing metadata. Resources inside it can live in any region — the group location never dictates where resources are deployed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000407',
  '01100000-0000-4000-8000-000000000307',
  1,
  'Azure Virtual Machines & Scale Sets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Azure Virtual Machines & Scale Sets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Azure Virtual Machines &amp; Scale Sets</h1>
  <p>An <strong>Azure Virtual Machine</strong> is infrastructure as a service: a full computer you rent, with the operating system, disk, networking, and everything above it under your control.</p>
  <h2>When a VM is the right choice</h2>
  <ul>
    <li>You need a specific OS or legacy software that expects a machine.</li>
    <li>You are lifting and shifting an existing server without rewriting it.</li>
    <li>You must install and configure the runtime and dependencies yourself.</li>
  </ul>
  <h2>What Azure creates for you</h2>
  <p>Provisioning a VM pulls together several pieces: an <strong>image</strong>, a <strong>size</strong>, <strong>managed disks</strong>, a virtual network interface, and (optionally) a public IP. A network security group filters what traffic can reach it.</p>
  <table>
    <tr><th>Family</th><th>Use for</th><th>Example series</th></tr>
    <tr><td>General purpose</td><td>Web servers, small apps</td><td>Dv5, B-series</td></tr>
    <tr><td>Compute optimized</td><td>Batch and web tiers</td><td>Fsv2</td></tr>
    <tr><td>Memory optimized</td><td>Databases, in-memory caches</td><td>Ev5</td></tr>
    <tr><td>GPU</td><td>Training, rendering</td><td>NC, NV families</td></tr>
  </table>
  <h2>Scaling with scale sets</h2>
  <p>A <strong>virtual machine scale set</strong> runs a fleet of identical VMs and can add or remove instances automatically based on metrics such as CPU or request count, so you scale without managing servers one by one.</p>
  <pre class="code-block">az vm create --resource-group rg-elearning \
  --name vm-web-01 --image UbuntuLTS --size Standard_B2s \
  --admin-username azureuser --generate-ssh-keys</pre>
  <div class="callout callout-tip">
    <strong>You pay while it runs</strong>
    <p>A stopped-but-allocated VM still bills for its reserved capacity. Right-size your VM, use <span class="ic">deallocated</span> state for idle machines, and consider the B-series burstable SKU for quiet workloads.</p>
  </div>
  <div class="callout callout-info">
    <strong>Availability</strong>
    <p>Spread replicated VMs across availability zones, or use an availability set, so even a data-center failure leaves some instances serving traffic.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000408',
  '01100000-0000-4000-8000-000000000308',
  1,
  'Containers, Functions & App Service',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Containers, Functions & App Service</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Containers, Functions &amp; App Service</h1>
  <p>VMs give you total control, but most workloads do not need it. Azure offers three lighter-weight compute paths that handle the platform so you ship faster.</p>
  <h2>Containers</h2>
  <p>A container packages your app and its dependencies into a portable image that runs the same anywhere. Azure runs them two main ways: <strong>Azure Container Instances</strong> for simple single containers, and <strong>Azure Kubernetes Service</strong> for orchestrating many containers at enterprise scale.</p>
  <h2>Azure App Service</h2>
  <p><strong>App Service</strong> is a fully managed platform for hosting web apps, REST APIs, and background jobs. Azure patches the OS, manages the runtime, and can autoscale — you deploy code and move on.</p>
  <ul>
    <li>Deployment slots for staging a release without downtime.</li>
    <li>Built-in authentication, monitoring, and custom domains.</li>
    <li>Support for .NET, Node.js, Python, Java, PHP, and containers.</li>
  </ul>
  <h2>Serverless with Azure Functions</h2>
  <p><strong>Azure Functions</strong> runs small pieces of code in response to events — an HTTP request, a queue message, a blob upload — and scales down to nothing when idle. You are billed only for execution time.</p>
  <table>
    <tr><th>Choose</th><th>When</th><th>You manage</th></tr>
    <tr><td>VM</td><td>Full OS control needed</td><td>Everything</td></tr>
    <tr><td>App Service</td><td>Web apps and APIs, predictable traffic</td><td>Code and config</td></tr>
    <tr><td>Functions</td><td>Event-driven, bursty, small units</td><td>Only code</td></tr>
  </table>
  <pre class="code-block">Azure Functions triggers
├── HTTP trigger      → runs when a request arrives
├── Queue trigger     → runs when a message is read
├── Timer trigger     → runs on a schedule
└── Blob trigger      → runs when a file is uploaded</pre>
  <div class="callout callout-tip">
    <strong>Start simplest</strong>
    <p>Begin new apps on App Service or Functions. Move to containers when you need environment consistency, and only reach for a VM when nothing else fits.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000410',
  '01100000-0000-4000-8000-000000000310',
  1,
  'Azure Storage Accounts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Azure Storage Accounts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Azure Storage Accounts</h1>
  <p>An <strong>Azure Storage account</strong> is a durable, encrypted, internet-reachable home for many kinds of data. One account can hold blobs, files, queues, and tables, each with its own REST endpoint.</p>
  <h2>The four core services</h2>
  <table>
    <tr><th>Service</th><th>Data model</th><th>Typical use</th></tr>
    <tr><td>Blob Storage</td><td>Unstructured binary</td><td>Images, videos, backups, app files</td></tr>
    <tr><td>Azure Files</td><td>Managed file shares (SMB)</td><td>Shared drives, lift-and-shift apps</td></tr>
    <tr><td>Queue Storage</td><td>Reliable FIFO messages</td><td>Decoupling services, async tasks</td></tr>
    <tr><td>Table Storage</td><td>Key-value NoSQL</td><td>Large semi-structured datasets</td></tr>
  </table>
  <h2>Access tiers</h2>
  <p>Blobs can sit in different access tiers to match price to usage:</p>
  <ul>
    <li><span class="ic">Hot</span> — frequent access, highest storage price, lowest retrieval cost.</li>
    <li><span class="ic">Cool</span> — infrequent access, lower storage price.</li>
    <li><span class="ic">Cold</span> — rarely accessed data needing a longer retention.</li>
    <li><span class="ic">Archive</span> — offline tier for long-term backup, hours to rehydrate.</li>
  </ul>
  <h2>Redundancy options</h2>
  <table>
    <tr><th>Option</th><th>Scope of copies</th><th>Survives</th></tr>
    <tr><td>LRS</td><td>One copy in a single data center</td><td>Disk and rack failures</td></tr>
    <tr><td>ZRS</td><td>Copies across availability zones in a region</td><td>An entire zone</td></tr>
    <tr><td>GRS</td><td>Region pair, secondary is read-only</td><td>A full regional outage</td></tr>
    <tr><td>GZRS</td><td>Zones locally + region pair remotely</td><td>Zone or regional outages</td></tr>
  </table>
  <pre class="code-block">az storage account create --name storageelearning \
  --resource-group rg-elearning --location westus \
  --sku Standard_LRS --kind StorageV2</pre>
  <div class="callout callout-info">
    <strong>Endpoints</strong>
    <p>Each service gets its own URL pattern: <span class="ic">https://youraccount.blob.core.windows.net</span> for blobs, <span class="ic">.file</span>, <span class="ic">.queue</span>, and <span class="ic">.table</span> domain names for the rest.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Always encrypt</strong>
    <p>Azure Storage is encrypted at rest by default, and HTTPS is enforced on the public endpoint. Protect keys with <span class="ic">Azure Key Vault</span> and scope access with SAS tokens instead of sharing account keys.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000411',
  '01100000-0000-4000-8000-000000000311',
  1,
  'Databases: SQL, Cosmos DB & More',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Databases: SQL, Cosmos DB & More</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Databases: SQL, Cosmos DB &amp; More</h1>
  <p>Azure offers managed data platforms for every data shape, so you get backups, patching, and high availability without operating a database server yourself.</p>
  <h2>Relational options</h2>
  <ul>
    <li><strong>Azure SQL Database</strong> — a fully managed, single-database relational service built on SQL Server.</li>
    <li><strong>Azure SQL Managed Instance</strong> — near-total SQL Server compatibility for lift-and-shift.</li>
    <li><strong>Azure Database for PostgreSQL / MySQL / MariaDB</strong> — managed open-source relational engines.</li>
  </ul>
  <p>Relations work best when your data has well-defined tables, joins, and transactions — orders, users, invoices.</p>
  <h2>NoSQL with Azure Cosmos DB</h2>
  <p><strong>Azure Cosmos DB</strong> is a globally distributed, multi-model NoSQL database. You can read and write in any region with turnkey global distribution, and choose a consistency level from strong to eventual.</p>
  <pre class="code-block">{
  "id": "res-1001",
  "student": "Ana",
  "course": "Azure Fundamentals",
  "progress": 68,
  "tags": ["beginner", "cloud"]
}</pre>
  <h2>Other managed data services</h2>
  <ul>
    <li><strong>Azure Cache for Redis</strong> — a fast in-memory cache beside your app.</li>
    <li><strong>Azure Data Lake Storage</strong> — big data file storage on top of Blob Storage.</li>
    <li><strong>Azure Synapse Analytics</strong> — petabyte-scale analytics bringing together SQL and Spark.</li>
  </ul>
  <table>
    <tr><th>Need</th><th>Service</th><th>Model</th></tr>
    <tr><td>Transactional relational data</td><td>Azure SQL Database</td><td>Relational</td></tr>
    <tr><td>Global low-latency key-value</td><td>Cosmos DB</td><td>NoSQL</td></tr>
    <tr><td>Hot cache in front of data</td><td>Azure Cache for Redis</td><td>In-memory</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Prefer managed</strong>
    <p>Unless you have a hard reason to run your own database server on a VM, use a managed service. Backups, failover, and patching become someone else&rsquo;s problem.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000413',
  '01100000-0000-4000-8000-000000000313',
  1,
  'Microsoft Entra ID',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Microsoft Entra ID</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Microsoft Entra ID</h1>
  <p><strong>Microsoft Entra ID</strong> (formerly Azure Active Directory) is the cloud identity service behind Azure and Microsoft 365. It stores users and groups, verifies who they are, and issues tokens applications trust.</p>
  <h2>What lives in the directory</h2>
  <ul>
    <li><strong>Users</strong> — people in your organization who sign in to apps and Azure.</li>
    <li><strong>Groups</strong> — collections of users for assigning access or policies once.</li>
    <li><strong>Service principals</strong> — application identities that act like users for automated tools.</li>
  </ul>
  <h2>Key capabilities</h2>
  <table>
    <tr><th>Capability</th><th>What it does</th></tr>
    <tr><td>Single sign-on</td><td>One identity reaches many cloud apps without re-entering passwords</td></tr>
    <tr><td>Multi-factor authentication</td><td>Requires a second factor such as an authenticator app</td></tr>
    <tr><td>Conditional Access</td><td>Applies rules: MFA when off-network, block from risky locations</td></tr>
    <tr><td>Password protection</td><td>Blocks weak guesses and common passwords</td></tr>
  </table>
  <h2>How a sign-in flows</h2>
  <pre class="code-block">1.  Browser asks the app for access
2.  App redirects to Microsoft Entra ID
3.  User signs in (optionally with MFA)
4.  Entra ID issues a short-lived token
5.  App accepts the token and loads data</pre>
  <div class="callout callout-info">
    <strong>Entra ID vs on-premises Active Directory</strong>
    <p>Both handle identity, but the classic AD uses LDAP and Kerberos inside Windows domains, while Entra ID is a cloud service talking REST, OAuth, and SAML. They commonly coexist and sync with each other.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Defend the front door</strong>
    <p>Enabling self-service password reset, MFA, and Conditional Access blocks most credential attacks. Identity is now the most important security boundary in any cloud environment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000414',
  '01100000-0000-4000-8000-000000000314',
  1,
  'Role-Based Access Control',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Role-Based Access Control</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Role-Based Access Control</h1>
  <p><strong>RBAC</strong> decides <em>who</em> can do <em>what</em> on <em>which</em> Azure resources. It is authorization: after identity verifies you are you, RBAC decides what you may touch.</p>
  <h2>The anatomy of a role assignment</h2>
  <ul>
    <li><strong>Security principal</strong> — the who: a user, a group, or a service principal.</li>
    <li><strong>Role definition</strong> — a named set of permissions such as <span class="ic">Reader</span> or <span class="ic">Contributor</span>.</li>
    <li><strong>Scope</strong> — where it applies: management group, subscription, resource group, or an individual resource.</li>
    <li><strong>Role assignment</strong> — binding the three together; this is the only way access is granted.</li>
  </ul>
  <h2>Built-in roles you will meet</h2>
  <table>
    <tr><th>Role</th><th>Can it</th></tr>
    <tr><td>Owner</td><td>Everything, plus grant access to others</td></tr>
    <tr><td>Contributor</td><td>Create and manage resources, but not grant access</td></tr>
    <tr><td>Reader</td><td>View resources only</td></tr>
    <tr><td>User Access Administrator</td><td>Manage user access to resources</td></tr>
  </table>
  <h2>Scopes and inheritance</h2>
  <pre class="code-block">Management group  ← roles apply to every subscription below
└── Subscription  ← roles apply to every resource group below
    └── Resource group
        └── Resource     ← the finest-grained scope</pre>
  <p>A role granted at a higher scope is inherited by everything beneath it, and a more specific assignment never overrides a broader one — permissions accumulate.</p>
  <pre class="code-block">az role assignment create \
  --assignee anastudent@contoso.com \
  --role Contributor \
  --scope /subscriptions/00000000-0000-4000-8000-000000000000/resourceGroups/rg-elearning</pre>
  <div class="callout callout-tip">
    <strong>Least privilege</strong>
    <p>Start with <span class="ic">Reader</span>, add power only when a task demands it, assign roles to groups rather than individuals, and reserve <span class="ic">Owner</span> for the people who truly need it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000416',
  '01100000-0000-4000-8000-000000000316',
  1,
  'Azure Policy & Management Locks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Azure Policy & Management Locks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Azure Policy &amp; Management Locks</h1>
  <p>RBAC controls <em>who</em> can act; <strong>Azure Policy</strong> controls <em>what</em> is allowed to exist. Policies enforce organizational guardrails so a well-meaning engineer cannot create a resource outside the rules.</p>
  <h2>How policy works</h2>
  <p>A <strong>policy definition</strong> is a rule, such as <span class="ic">allowed locations</span> or <span class="ic">require HTTPS on storage accounts</span>. A <strong>policy assignment</strong> applies it to a scope. Azure then evaluates resources and reports compliance.</p>
  <ul>
    <li><span class="ic">Deny</span> — the request fails outright (build an EU-only policy, deploy outside the EU fails).</li>
    <li><span class="ic">Audit</span> — the resource is created but flagged non-compliant.</li>
    <li><span class="ic">DeployIfNotExists</span> — Azure fixes a gap automatically, such as adding a required tag.</li>
  </ul>
  <p>Multiple definitions grouped together form an <strong>initiative</strong>, so one assignment can enforce a whole standard.</p>
  <h2>Management locks</h2>
  <p>A <strong>lock</strong> protects a scope from accidental changes. Apply it to a resource, resource group, or subscription:</p>
  <table>
    <tr><th>Lock</th><th>Effect</th></tr>
    <tr><td>CanNotDelete</td><td>Resources can still be read and modified but not deleted</td></tr>
    <tr><td>ReadOnly</td><td>Resources can only be read</td></tr>
  </table>
  <pre class="code-block">az lock create --name lock-prod \
  --resource-group rg-elearning --lock-type CanNotDelete</pre>
  <div class="callout callout-info">
    <strong>RBAC vs policy vs locks</strong>
    <p>RBAC grants access to people. Policy governs resource properties. Locks guard against deletion. A production group typically gets all three: a Contributor role, a compliant-location policy, and a CanNotDelete lock.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Policies audit too</strong>
    <p>Assign an &ldquo;audit require tags&rdquo; policy in your learning subscription and watch the compliance dashboard fill in as you build the capstone.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000417',
  '01100000-0000-4000-8000-000000000317',
  1,
  'Cost Management & SLAs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cost Management & SLAs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cost Management &amp; SLAs</h1>
  <p>Cloud savings and cloud shock have the same shape: a decimal that grows in the monthly bill. Managing cost means knowing the levers, forecasting the number, and capping the damage.</p>
  <h2>The cost levers in Azure</h2>
  <ul>
    <li><strong>Right-sizing</strong> — pick the smallest SKU that meets performance; resize as demand proves out.</li>
    <li><strong>Deallocating idle compute</strong> — a stopped VM that is still allocated keeps billing.</li>
    <li><strong>Reservations and savings plans</strong> — commit to 1 or 3 years of usage for a big discount.</li>
    <li><strong>Serverless</strong> — Functions and consumption plans bill only when code runs.</li>
    <li><strong>Budgets and alerts</strong> — define a monthly limit and get alerted as you approach it.</li>
  </ul>
  <h2>Two calculators</h2>
  <table>
    <tr><th>Tool</th><th>Answers</th></tr>
    <tr><td>Azure Pricing Calculator</td><td>What will a planned workload cost per month on Azure?</td></tr>
    <tr><td>Azure TCO Calculator</td><td>How does running my current on-premises workload compare, cost-wise, on Azure?</td></tr>
  </table>
  <h2>Service level agreements</h2>
  <p>An <strong>SLA</strong> is a formal uptime commitment in writing. If the service misses it, you get a service credit — a promise backed by money — not a guarantee that nothing ever breaks.</p>
  <table>
    <tr><th>Uptime SLA</th><th>Allowed downtime per month</th><th>Downtime per year</th></tr>
    <tr><td>99%</td><td>about 7 hours 18 minutes</td><td>about 3 days 15 hours</td></tr>
    <tr><td>99.9%</td><td>about 43 minutes</td><td>about 8 hours 46 minutes</td></tr>
    <tr><td>99.99%</td><td>about 4 minutes</td><td>about 52 minutes</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Composite SLAs multiply</strong>
    <p>An app that depends on two services each with a 99.9% SLA has roughly a 99.8% combined availability. Adding dependencies erodes the guarantee — a key reason to simplify tiers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Set a budget early</strong>
    <p>In your learning subscription, create a $10 monthly budget with one alert at 50% and another at 90%. The capstone will not surprise you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000419',
  '01100000-0000-4000-8000-000000000319',
  1,
  'Azure Monitor & Log Analytics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Azure Monitor & Log Analytics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Azure Monitor &amp; Log Analytics</h1>
  <p><strong>Azure Monitor</strong> is the single control room for your workloads. It collects <em>metrics</em> (numbers over time) and <em>logs</em> (events and text records) from Azure services, virtual machines, and even apps outside Azure.</p>
  <h2>What flows through Monitor</h2>
  <table>
    <tr><th>Data</th><th>Nature</th><th>Example</th></tr>
    <tr><td>Metrics</td><td>Numeric time series</td><td>CPU percentage, request count</td></tr>
    <tr><td>Activity log</td><td>Who did what in the control plane</td><td>VM created by user</td></tr>
    <tr><td>Resource logs</td><td>Diagnostics from inside resources</td><td>App log, SQL query errors</td></tr>
    <tr><td>Application traces</td><td>In-app telemetry</td><td>Page views, failures</td></tr>
  </table>
  <h2>Log Analytics workspaces</h2>
  <p>Logs land in a <strong>Log Analytics workspace</strong>, where you query them with the <strong>Kusto Query Language</strong>. Data from many resources can be correlated across one tool.</p>
  <pre class="code-block">Heartbeat                    // agent telemetry table
| where TimeGenerated &gt; ago(1h)
| project Computer, OS, Version, TimeGenerated
| order by TimeGenerated desc
| take 50</pre>
  <div class="callout callout-tip">
    <strong>Enable diagnostics early</strong>
    <p>Resource diagnostics are off by default and cost a little. Turn them on as you create each resource in the capstone so you actually have data to alert on later.</p>
  </div>
  <div class="callout callout-info">
    <strong>Application Insights</strong>
    <p>Part of the Monitor family, Application Insights adds end-to-end tracing for web apps: requests, dependencies, and failures in one place, with a live metrics stream during development.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000420',
  '01100000-0000-4000-8000-000000000320',
  1,
  'Alerts, Service Health & Reliability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alerts, Service Health & Reliability</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Alerts, Service Health &amp; Reliability</h1>
  <p>Collecting data is useless unless it turns into action. Alerts convert a metric crossing a threshold into a notification, and Service Health tells you what Microsoft itself is doing.</p>
  <h2>The alert anatomy</h2>
  <p>An alert follows a simple pipeline: a <strong>signal</strong> (metric, log, activity event) is evaluated by a <strong>condition</strong>; when it triggers, an <strong>action group</strong> fires notifications by email, SMS, push, or webhook.</p>
  <pre class="code-block">CPU &gt; 90% for 15 minutes
        ↓
   alert rule fires
        ↓
   action group notifies on-call engineer
        ↓
   engineer investigates and fixes</pre>
  <h2>Service Health</h2>
  <p><strong>Service Health</strong> tracks the state of Azure itself so you can separate &ldquo;my problem&rdquo; from &ldquo;Microsoft&rsquo;s problem&rdquo;:</p>
  <ul>
    <li><strong>Service issues</strong> — ongoing outages and degradations.</li>
    <li><strong>Planned maintenance</strong> — upcoming work that may affect you, announced in advance.</li>
    <li><strong>Health advisories</strong> — features that changed, retired, or need attention.</li>
    <li><strong>Health history</strong> — the road map of past incidents.</li>
  </ul>
  <h2>Reliability targets</h2>
  <table>
    <tr><th>Term</th><th>Meaning</th></tr>
    <tr><td>RPO (recovery point objective)</td><td>How much data you can afford to lose, in time</td></tr>
    <tr><td>RTO (recovery time objective)</td><td>How fast you must be back online, in time</td></tr>
    <tr><td>Redundancy</td><td>Extra copies so one failure does not take you down</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Alert on user experience, not just machines</strong>
    <p>Metrics tell you a server is hot; synthetic or app telemetry tells you users are failing. A healthy stack with a broken front door is still an outage from the user&rsquo;s perspective.</p>
  </div>
  <div class="callout callout-info">
    <strong>Alerts need data</strong>
    <p>An alert is only as good as the metric feeding it. If diagnostics were never enabled, the CPU signal simply does not exist to trip on.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000422',
  '01100000-0000-4000-8000-000000000322',
  1,
  'Azure CLI, Portal & Cloud Shell',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Azure CLI, Portal & Cloud Shell</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Azure CLI, Portal &amp; Cloud Shell</h1>
  <p>You can drive Azure with a visual console, a command line, or declarative templates. Each tool has a sweet spot; knowing all four makes you faster everywhere.</p>
  <h2>The four ways to manage Azure</h2>
  <table>
    <tr><th>Tool</th><th>Best for</th><th>Level</th></tr>
    <tr><td>Azure portal</td><td>Exploring, one-off tasks, beginners</td><td>Visual</td></tr>
    <tr><td>Azure CLI</td><td>Scripting and automation</td><td>Command line</td></tr>
    <tr><td>Azure PowerShell</td><td>Teams already in PowerShell</td><td>Command line</td></tr>
    <tr><td>ARM templates / Bicep</td><td>Repeatable infrastructure as code</td><td>Declarative</td></tr>
  </table>
  <h2>Cloud Shell</h2>
  <p><strong>Cloud Shell</strong> is a browser terminal with Azure CLI and PowerShell preinstalled, authenticated for you, with a small persisted storage account. Nothing to install; type <span class="ic">az</span> and go.</p>
  <h2>A first CLI session</h2>
  <pre class="code-block">az login                            # sign in
az account show                     # confirm tenant + subscription
az group create --name rg-elearning --location westus
az group list --output table        # verify the group exists</pre>
  <div class="callout callout-tip">
    <strong>Script everything</strong>
    <p>Portal clicks are manual, reviewable, and easy to miss. CLI commands are repeatable, diffable, and reviewable in Git. For infrastructure, write Bicep; for experiments, the portal is fine.</p>
  </div>
  <div class="callout callout-info">
    <strong>Output formats</strong>
    <p>Pass <span class="ic">--output table</span> for humans, <span class="ic">--output json</span> for piping to tools, and <span class="ic">--output yaml</span> for reading deeply nested results.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000423',
  '01100000-0000-4000-8000-000000000323',
  1,
  'Security & Microsoft Defender for Cloud',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Security & Microsoft Defender for Cloud</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Security &amp; Microsoft Defender for Cloud</h1>
  <p>Cloud security is layered: physical facilities, identity, networks, platforms, and data each get their own controls, so one weakness does not collapse the whole stack.</p>
  <h2>Defense in depth</h2>
  <ul>
    <li><strong>Physical</strong> — the provider secures data centers with access controls and surveillance.</li>
    <li><strong>Identity</strong> — Entra ID, MFA, conditional access gate who gets in.</li>
    <li><strong>Network</strong> — NSGs, Azure Firewall, and DDoS protection filter what flows.</li>
    <li><strong>Data</strong> — encryption at rest, TLS in transit, secrets in Key Vault.</li>
    <li><strong>Application</strong> — secure code, patched runtimes, controlled dependencies.</li>
  </ul>
  <h2>Network security groups</h2>
  <p>An <strong>NSG</strong> is a rule list attached to a subnet or NIC that allows or denies traffic by source, port, and direction. Default-deny inbound plus narrowly allowed ports is the pattern to follow.</p>
  <pre class="code-block">az network nsg rule create \
  --resource-group rg-elearning \
  --nsg-name nsg-web \
  --name allow-https-only \
  --direction Inbound --priority 100 --protocol Tcp \
  --destination-port-range 443 --access Allow</pre>
  <h2>Microsoft Defender for Cloud</h2>
  <p><strong>Microsoft Defender for Cloud</strong> watches your subscriptions, computes a <strong>secure score</strong>, and lists recommendations from least to most critical. It is your posture report card:</p>
  <ul>
    <li>Continuous assessment against benchmarks such as CIS and Azure Security Benchmark.</li>
    <li>Recommendations with the exact fix, often click-to-remediate.</li>
    <li>Regulatory compliance dashboards for standards like ISO 27001 and SOC 2.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Watch the secure score</strong>
    <p>Treat the secure score like a health metric: raise it by fixing the cheapest, highest-severity recommendations first, and keep opening new subscriptions under the same Defender assessment.</p>
  </div>
  <div class="callout callout-info">
    <strong>Everything is encrypted</strong>
    <p>Azure encrypts data at rest by default and offers HTTPS through to storage, databases, and app services. Encryption is a baseline, not a feature you add later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000425',
  '01100000-0000-4000-8000-000000000325',
  1,
  'Capstone: Planning the Deployment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Planning the Deployment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Planning the Deployment</h1>
  <p>Time to build. The capstone is a small <strong>course catalog web app</strong>: a web front end plus a relational database that stores the catalog, deployed to Azure and shared with the class.</p>
  <h2>Goal and non-goals</h2>
  <ul>
    <li><strong>Goal</strong> — a public HTTPS web app reading catalog rows from a managed database.</li>
    <li><strong>Goal</strong> — monitoring (Application Insights) and a cost budget under $10 per month.</li>
    <li><strong>Non-goal</strong> — multi-region, auto-scaling fleets, or any custom infrastructure.</li>
  </ul>
  <h2>Resource plan</h2>
  <table>
    <tr><th>Resource</th><th>Service</th><th>Purpose</th></tr>
    <tr><td>Resource group</td><td>rg-elearning</td><td>Container for everything below</td></tr>
    <tr><td>Web app</td><td>App Service (Free F1)</td><td>Serves the catalog UI plus API</td></tr>
    <tr><td>Database</td><td>Azure SQL or PostgreSQL</td><td>Holds catalog rows</td></tr>
    <tr><td>Storage</td><td>Storage account</td><td>Static images and assets</td></tr>
    <tr><td>Telemetry</td><td>Application Insights</td><td>Requests, failures, performance</td></tr>
  </table>
  <h2>Naming convention</h2>
  <pre class="code-block">rg-elearning            ← resource group
plan-elearning          ← App Service plan (Free tier)
app-elearning-demo      ← the web app
sqlserver-elearning     ← logical SQL server
sqldb-elearning         ← the catalog database
storageelearning        ← storage account
Usage groups: [env]-[app]-[region]-[nnn] hints in every name.</pre>
  <div class="callout callout-info">
    <strong>One group, one lifecycle</strong>
    <p>Because every resource lives in a single resource group, a final <span class="ic">az group delete</span> cleans up the whole experiment at once. That is the resource-group contract in action.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pick a nearby region</strong>
    <p>Use a region close to you (for example <span class="ic">westus</span> or <span class="ic">westeurope</span>) to keep latency low and to stay inside the free tier you are targeting.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000426',
  '01100000-0000-4000-8000-000000000326',
  1,
  'Deploying in the Azure Portal',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deploying in the Azure Portal</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deploying in the Azure Portal</h1>
  <p>The portal turns every resource into a guided form. Follow this checklist exactly once — in the next lesson you will replay the whole thing with three lines of CLI.</p>
  <h2>Step 1 — Create the resource group</h2>
  <ol>
    <li>Portal home → Resource groups → <strong>Create</strong>.</li>
    <li>Name it <span class="ic">rg-elearning</span>, pick your region, and click Review + create.</li>
  </ol>
  <h2>Step 2 — App Service plan and app</h2>
  <ol>
    <li>Create a resource → <strong>Web App</strong>.</li>
    <li>Put it in <span class="ic">rg-elearning</span>, name it <span class="ic">app-elearning-demo</span>.</li>
    <li>Pick the runtime for your language and the <strong>Free F1</strong> pricing tier on Linux.</li>
  </ol>
  <h2>Step 3 — The database</h2>
  <ol>
    <li>Create a logical <strong>SQL server</strong>, then an <strong>Azure SQL Database</strong> named <span class="ic">sqldb-elearning</span>.</li>
    <li>Choose the basic tier (or the free offer where available).</li>
    <li>Add your IP under <em>Networking → Firewall rules</em> so your machine can connect for seeding.</li>
  </ol>
  <h2>Step 4 — Wire the app</h2>
  <ol>
    <li>In the web app, open <em>Configuration</em> and add a connection string pointing at <span class="ic">sqldb-elearning</span>.</li>
    <li>Deploy your code from the <em>Deployment Center</em> (Git, GitHub, or local zip).</li>
    <li>Browse the default HTTPS URL and confirm the catalog loads.</li>
  </ol>
  <table>
    <tr><th>Field</th><th>Value to set</th></tr>
    <tr><td>Resource group</td><td>rg-elearning</td></tr>
    <tr><td>Pricing tier</td><td>Free F1 wherever possible</td></tr>
    <tr><td>Region</td><td>Same as the resource group</td></tr>
    <tr><td>HTTPS only</td><td>On</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Watch the tier</strong>
    <p>Every form has a &ldquo;pricing tier&rdquo; step, and the default is rarely free. Double-check each one or your monthly bill will grow faster than your coursework.</p>
  </div>
  <div class="callout callout-info">
    <strong>Portal is great for discovery</strong>
    <p>The portal teaches you the resource anatomy: which fields exist, which SKUs are available, where the firewall settings live. Prefer it the first time, then automate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01100000-0000-4000-8000-000000000427',
  '01100000-0000-4000-8000-000000000327',
  1,
  'Deploying with Azure CLI & Cleanup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deploying with Azure CLI & Cleanup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0078d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0062ad; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e6f2fb; color: #0062ad; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e6f2fb; border-left: 4px solid #0078d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e6f2fb; color: #0062ad; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2b88d8; }
.dark .lesson-page h2 { color: #66b5f0; }
.dark .lesson-page .ic { background: #0b3550; color: #7cc0ea; }
.dark .lesson-page .callout { background: #0b3550; border-left-color: #2b88d8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #0b3550; color: #7cc0ea; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deploying with Azure CLI &amp; Cleanup</h1>
  <p>Now rebuild the exact capstone with the <strong>Azure CLI</strong>. The commands recreate the portal resources, and this time they are written down, reviewable, and reusable.</p>
  <h2>The whole deployment</h2>
  <pre class="code-block">az group create --name rg-elearning --location westus

az appservice plan create --name plan-elearning \
  --resource-group rg-elearning --sku F1 --is-linux

az webapp create --name app-elearning-demo \
  --resource-group rg-elearning --plan plan-elearning \
  --runtime "NODE|20-lts"

az sql server create --name sqlserver-elearning \
  --resource-group rg-elearning \
  --admin-user azureuser --admin-password ChangeMe1!

az sql db create --resource-group rg-elearning \
  --server sqlserver-elearning --name sqldb-elearning \
  --service-objective Basic</pre>
  <div class="callout callout-info">
    <strong>Password policy</strong>
    <p>Azure SQL requires a password with at least 8 characters and three of these four: upper case, lower case, digit, symbol. Generate one, store it in Key Vault, and never commit it to Git.</p>
  </div>
  <h2>Verifying the deployment</h2>
  <ol>
    <li><span class="ic">az webapp show --name app-elearning-demo --resource-group rg-elearning</span> returns the HTTPS hostname.</li>
    <li>Open <span class="ic">https://app-elearning-demo.azurewebsites.net</span> and confirm the catalog renders.</li>
    <li>Check <span class="ic">az monitor activity-log list --resource-group rg-elearning --output table</span> to see your own create events.</li>
  </ol>
  <h2>Monitoring the workload</h2>
  <table>
    <tr><th>Signal</th><th>How to add it</th></tr>
    <tr><td>Requests and failures</td><td>Enable Application Insights on the web app</td></tr>
    <tr><td>CPU alert</td><td>Metric alert at 80% for 15 minutes</td></tr>
    <tr><td>Cost</td><td>Budget of $10 with email alerts at 50% and 90%</td></tr>
  </table>
  <h2>Cleanup</h2>
  <pre class="code-block">az group delete --name rg-elearning --yes --no-wait</pre>
  <div class="callout callout-tip">
    <strong>One command tears it down</strong>
    <p>Because every resource sits in <span class="ic">rg-elearning</span>, deleting the group removes the web app, database, storage, and telemetry together. Land the habit: after any experiment, run the delete.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 0303 · Q4-6 for 0306 · Q7-9 for 0309 · Q10-12 for 0312
--    Q13-15 for 0315 · Q16-18 for 0318 · Q19-21 for 0321 · Q22-24 for 0324
--    Q25-29 for final assessment 0328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('01100000-0000-4000-8000-000000000501', '01100000-0000-4000-8000-000000000303',
   'Which is an essential characteristic of cloud computing?',
   'The cloud is defined by on-demand provisioning and metered, pay-as-you-go consumption.', 1),
  ('01100000-0000-4000-8000-000000000502', '01100000-0000-4000-8000-000000000303',
   'In the IaaS model, who is responsible for patching the operating system of a virtual machine?',
   'In IaaS the provider secures the physical layer; the customer manages the OS and everything above it.', 2),
  ('01100000-0000-4000-8000-000000000503', '01100000-0000-4000-8000-000000000303',
   'What does the shared responsibility model describe?',
   'It maps which security layers the provider is responsible for and which layers the customer must secure.', 3),
  ('01100000-0000-4000-8000-000000000504', '01100000-0000-4000-8000-000000000306',
   'What best describes an Azure subscription?',
   'A subscription is both a billing boundary and an access boundary for the resources inside it.', 1),
  ('01100000-0000-4000-8000-000000000505', '01100000-0000-4000-8000-000000000306',
   'What is an availability zone?',
   'Availability zones are physically separate data centers within a region with independent power and cooling.', 2),
  ('01100000-0000-4000-8000-000000000506', '01100000-0000-4000-8000-000000000306',
   'What is the primary purpose of a resource group?',
   'A resource group is a logical container that groups related resources for management and lifecycle.', 3),
  ('01100000-0000-4000-8000-000000000507', '01100000-0000-4000-8000-000000000309',
   'Which service delivers a full virtual machine with operating system level control?',
   'Azure Virtual Machines provides IaaS compute where you manage the OS and installed software.', 1),
  ('01100000-0000-4000-8000-000000000508', '01100000-0000-4000-8000-000000000309',
   'Which compute option is best for an event-driven app that runs code when a message arrives?',
   'Azure Functions is serverless and executes code in response to triggers such as queue messages.', 2),
  ('01100000-0000-4000-8000-000000000509', '01100000-0000-4000-8000-000000000309',
   'What does Azure App Service provide?',
   'App Service is a managed hosting platform for web apps and APIs with automatic patching and scaling.', 3),
  ('01100000-0000-4000-8000-000000000510', '01100000-0000-4000-8000-000000000312',
   'Which Azure Storage service is designed for unstructured binary data such as images and videos?',
   'Blob Storage stores unstructured binary objects addressed by the blob endpoint.', 1),
  ('01100000-0000-4000-8000-000000000511', '01100000-0000-4000-8000-000000000312',
   'Which of these is a fully managed relational database service?',
   'Azure SQL Database is a managed relational database; Cosmos DB is NoSQL and Redis is a cache.', 2),
  ('01100000-0000-4000-8000-000000000512', '01100000-0000-4000-8000-000000000312',
   'What is Azure Cosmos DB best known for?',
   'Cosmos DB offers global distribution and multi-model NoSQL access with turnkey multi-region writes.', 3),
  ('01100000-0000-4000-8000-000000000513', '01100000-0000-4000-8000-000000000315',
   'What is Microsoft Entra ID?',
   'Entra ID is the cloud identity and directory service that authenticates users and applications.', 1),
  ('01100000-0000-4000-8000-000000000514', '01100000-0000-4000-8000-000000000315',
   'What are the three parts of a role assignment?',
   'Every role assignment binds a security principal, a role definition, and a scope.', 2),
  ('01100000-0000-4000-8000-000000000515', '01100000-0000-4000-8000-000000000315',
   'What does the principle of least privilege mean in RBAC?',
   'Least privilege grants only the exact permissions required for a task, never more.', 3),
  ('01100000-0000-4000-8000-000000000516', '01100000-0000-4000-8000-000000000318',
   'What does an Azure Policy definition do?',
   'Policy definitions enforce rules that evaluate resource properties and report or enforce compliance.', 1),
  ('01100000-0000-4000-8000-000000000517', '01100000-0000-4000-8000-000000000318',
   'Which tool compares the expected cost of running your current on-premises workload on Azure?',
   'The Azure TCO Calculator models your existing environment and compares it with an Azure equivalent.', 2),
  ('01100000-0000-4000-8000-000000000518', '01100000-0000-4000-8000-000000000318',
   'Which statement about service level agreements is correct?',
   'An SLA is a formal uptime commitment with a service credit if the availability target is missed.', 3),
  ('01100000-0000-4000-8000-000000000519', '01100000-0000-4000-8000-000000000321',
   'Which service collects metrics and logs from Azure resources into one place?',
   'Azure Monitor aggregates metrics and logs so alerts and dashboards can use them together.', 1),
  ('01100000-0000-4000-8000-000000000520', '01100000-0000-4000-8000-000000000321',
   'What is a Log Analytics workspace used for?',
   'It is a central repository where collected log data is queried with the Kusto Query Language.', 2),
  ('01100000-0000-4000-8000-000000000521', '01100000-0000-4000-8000-000000000321',
   'What is a metric alert in Azure Monitor?',
   'A metric alert evaluates a metric continuously and fires when it crosses a defined threshold.', 3),
  ('01100000-0000-4000-8000-000000000522', '01100000-0000-4000-8000-000000000324',
   'Which is the correct Azure CLI command to create a resource group?',
   'az group create with a name and location creates the resource group.', 1),
  ('01100000-0000-4000-8000-000000000523', '01100000-0000-4000-8000-000000000324',
   'Which service provides security recommendations and a secure score for your workloads?',
   'Microsoft Defender for Cloud assesses posture and lists prioritized recommendations.', 2),
  ('01100000-0000-4000-8000-000000000524', '01100000-0000-4000-8000-000000000324',
   'What does a network security group do?',
   'An NSG contains rules that allow or deny inbound and outbound traffic to resources.', 3),
  ('01100000-0000-4000-8000-000000000525', '01100000-0000-4000-8000-000000000328',
   'What is a benefit of the public cloud deployment model?',
   'Public cloud pricing scales with actual usage, avoiding large upfront capital purchases.', 1),
  ('01100000-0000-4000-8000-000000000526', '01100000-0000-4000-8000-000000000328',
   'What happens when you delete a resource group?',
   'Deleting a resource group deletes every resource contained in it at once.', 2),
  ('01100000-0000-4000-8000-000000000527', '01100000-0000-4000-8000-000000000328',
   'Which Azure feature enforces that resources may only be created in approved regions?',
   'Azure Policy can deny deployments outside an allowed-locations assignment.', 3),
  ('01100000-0000-4000-8000-000000000528', '01100000-0000-4000-8000-000000000328',
   'What is one purpose of a management lock?',
   'A lock prevents accidental deletion or modification of a subscription, resource group, or resource.', 4),
  ('01100000-0000-4000-8000-000000000529', '01100000-0000-4000-8000-000000000328',
   'You deploy a web app and need to be notified when CPU stays above 90% for 15 minutes. What do you need?',
   'A metric alert with an action group to notify you when the CPU threshold is breached.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): essential characteristic
  ('01100000-0000-4000-8000-000000001001', '01100000-0000-4000-8000-000000000501', 'On-demand self-service with pay-as-you-go metering', TRUE,  1),
  ('01100000-0000-4000-8000-000000001002', '01100000-0000-4000-8000-000000000501', 'Fixed capacity purchased years in advance', FALSE, 2),
  ('01100000-0000-4000-8000-000000001003', '01100000-0000-4000-8000-000000000501', 'Dedicated on-premises servers owned by you', FALSE, 3),
  ('01100000-0000-4000-8000-000000001004', '01100000-0000-4000-8000-000000000501', 'A one-time perpetual software license', FALSE, 4),
  -- Q1 (501)q2: IaaS OS patching
  ('01100000-0000-4000-8000-000000001005', '01100000-0000-4000-8000-000000000502', 'The customer', TRUE,  1),
  ('01100000-0000-4000-8000-000000001006', '01100000-0000-4000-8000-000000000502', 'The cloud provider', FALSE, 2),
  ('01100000-0000-4000-8000-000000001007', '01100000-0000-4000-8000-000000000502', 'The network carrier', FALSE, 3),
  ('01100000-0000-4000-8000-000000001008', '01100000-0000-4000-8000-000000000502', 'No one', FALSE, 4),
  -- Q1 (501)q3: shared responsibility
  ('01100000-0000-4000-8000-000000001009', '01100000-0000-4000-8000-000000000503', 'How security duties are split between provider and customer', TRUE,  1),
  ('01100000-0000-4000-8000-000000001010', '01100000-0000-4000-8000-000000000503', 'How physical network cables are laid out', FALSE, 2),
  ('01100000-0000-4000-8000-000000001011', '01100000-0000-4000-8000-000000000503', 'How cloud bills are divided between teams', FALSE, 3),
  ('01100000-0000-4000-8000-000000001012', '01100000-0000-4000-8000-000000000503', 'How SLAs are calculated', FALSE, 4),
  -- Q2 (504): subscription
  ('01100000-0000-4000-8000-000000001013', '01100000-0000-4000-8000-000000000504', 'A billing and access boundary for a collection of resources', TRUE,  1),
  ('01100000-0000-4000-8000-000000001014', '01100000-0000-4000-8000-000000000504', 'A single physical server in a data center', FALSE, 2),
  ('01100000-0000-4000-8000-000000001015', '01100000-0000-4000-8000-000000000504', 'A type of virtual machine size', FALSE, 3),
  ('01100000-0000-4000-8000-000000001016', '01100000-0000-4000-8000-000000000504', 'A network security appliance', FALSE, 4),
  -- Q2 (504)q2: availability zone
  ('01100000-0000-4000-8000-000000001017', '01100000-0000-4000-8000-000000000505', 'A physically separated data center within a region with independent power and cooling', TRUE,  1),
  ('01100000-0000-4000-8000-000000001018', '01100000-0000-4000-8000-000000000505', 'A second Azure account for backups', FALSE, 2),
  ('01100000-0000-4000-8000-000000001019', '01100000-0000-4000-8000-000000000505', 'A flavor of storage redundancy', FALSE, 3),
  ('01100000-0000-4000-8000-000000001020', '01100000-0000-4000-8000-000000000505', 'A discount for reserved capacity', FALSE, 4),
  -- Q2 (504)q3: resource group
  ('01100000-0000-4000-8000-000000001021', '01100000-0000-4000-8000-000000000506', 'A logical container that groups related resources for management and lifecycle', TRUE,  1),
  ('01100000-0000-4000-8000-000000001022', '01100000-0000-4000-8000-000000000506', 'A data center inside a region', FALSE, 2),
  ('01100000-0000-4000-8000-000000001023', '01100000-0000-4000-8000-000000000506', 'A network address space', FALSE, 3),
  ('01100000-0000-4000-8000-000000001024', '01100000-0000-4000-8000-000000000506', 'A storage pricing tier', FALSE, 4),
  -- Q3 (507): VM
  ('01100000-0000-4000-8000-000000001025', '01100000-0000-4000-8000-000000000507', 'Azure Virtual Machines', TRUE,  1),
  ('01100000-0000-4000-8000-000000001026', '01100000-0000-4000-8000-000000000507', 'Azure Functions', FALSE, 2),
  ('01100000-0000-4000-8000-000000001027', '01100000-0000-4000-8000-000000000507', 'Azure Blob Storage', FALSE, 3),
  ('01100000-0000-4000-8000-000000001028', '01100000-0000-4000-8000-000000000507', 'Azure Front Door', FALSE, 4),
  -- Q3 (507)q2: functions
  ('01100000-0000-4000-8000-000000001029', '01100000-0000-4000-8000-000000000508', 'Azure Functions', TRUE,  1),
  ('01100000-0000-4000-8000-000000001030', '01100000-0000-4000-8000-000000000508', 'Azure SQL Database', FALSE, 2),
  ('01100000-0000-4000-8000-000000001031', '01100000-0000-4000-8000-000000000508', 'A virtual network', FALSE, 3),
  ('01100000-0000-4000-8000-000000001032', '01100000-0000-4000-8000-000000000508', 'Application Insights', FALSE, 4),
  -- Q3 (507)q3: app service
  ('01100000-0000-4000-8000-000000001033', '01100000-0000-4000-8000-000000000509', 'A managed hosting platform for web apps and APIs with automatic patching', TRUE,  1),
  ('01100000-0000-4000-8000-000000001034', '01100000-0000-4000-8000-000000000509', 'A NoSQL document store', FALSE, 2),
  ('01100000-0000-4000-8000-000000001035', '01100000-0000-4000-8000-000000000509', 'An identity provider', FALSE, 3),
  ('01100000-0000-4000-8000-000000001036', '01100000-0000-4000-8000-000000000509', 'A content delivery network', FALSE, 4),
  -- Q4 (510): blob
  ('01100000-0000-4000-8000-000000001037', '01100000-0000-4000-8000-000000000510', 'Blob Storage', TRUE,  1),
  ('01100000-0000-4000-8000-000000001038', '01100000-0000-4000-8000-000000000510', 'Table Storage', FALSE, 2),
  ('01100000-0000-4000-8000-000000001039', '01100000-0000-4000-8000-000000000510', 'Queue Storage', FALSE, 3),
  ('01100000-0000-4000-8000-000000001040', '01100000-0000-4000-8000-000000000510', 'Azure Files', FALSE, 4),
  -- Q4 (510)q2: managed relational
  ('01100000-0000-4000-8000-000000001041', '01100000-0000-4000-8000-000000000511', 'Azure SQL Database', TRUE,  1),
  ('01100000-0000-4000-8000-000000001042', '01100000-0000-4000-8000-000000000511', 'Azure Cosmos DB', FALSE, 2),
  ('01100000-0000-4000-8000-000000001043', '01100000-0000-4000-8000-000000000511', 'Azure Cache for Redis', FALSE, 3),
  ('01100000-0000-4000-8000-000000001044', '01100000-0000-4000-8000-000000000511', 'Azure Content Delivery Network', FALSE, 4),
  -- Q4 (510)q3: cosmos
  ('01100000-0000-4000-8000-000000001045', '01100000-0000-4000-8000-000000000512', 'Globally distributed NoSQL access with multi-region writes', TRUE,  1),
  ('01100000-0000-4000-8000-000000001046', '01100000-0000-4000-8000-000000000512', 'A Linux distribution', FALSE, 2),
  ('01100000-0000-4000-8000-000000001047', '01100000-0000-4000-8000-000000000512', 'An email delivery service', FALSE, 3),
  ('01100000-0000-4000-8000-000000001048', '01100000-0000-4000-8000-000000000512', 'A firewall product', FALSE, 4),
  -- Q5 (513): entra id
  ('01100000-0000-4000-8000-000000001049', '01100000-0000-4000-8000-000000000513', 'The cloud identity and directory service for users and applications', TRUE,  1),
  ('01100000-0000-4000-8000-000000001050', '01100000-0000-4000-8000-000000000513', 'A virtual network gateway', FALSE, 2),
  ('01100000-0000-4000-8000-000000001051', '01100000-0000-4000-8000-000000000513', 'A backup vault for virtual machines', FALSE, 3),
  ('01100000-0000-4000-8000-000000001052', '01100000-0000-4000-8000-000000000513', 'A public DNS resolver', FALSE, 4),
  -- Q5 (513)q2: role assignment parts
  ('01100000-0000-4000-8000-000000001053', '01100000-0000-4000-8000-000000000514', 'Security principal, role definition, and scope', TRUE,  1),
  ('01100000-0000-4000-8000-000000001054', '01100000-0000-4000-8000-000000000514', 'User, password, and region', FALSE, 2),
  ('01100000-0000-4000-8000-000000001055', '01100000-0000-4000-8000-000000000514', 'VM, disk, and network interface', FALSE, 3),
  ('01100000-0000-4000-8000-000000001056', '01100000-0000-4000-8000-000000000514', 'Policy, initiative, and lock', FALSE, 4),
  -- Q5 (513)q3: least privilege
  ('01100000-0000-4000-8000-000000001057', '01100000-0000-4000-8000-000000000515', 'Grant only the exact permissions needed for a task', TRUE,  1),
  ('01100000-0000-4000-8000-000000001058', '01100000-0000-4000-8000-000000000515', 'Grant every role to every user', FALSE, 2),
  ('01100000-0000-4000-8000-000000001059', '01100000-0000-4000-8000-000000000515', 'Remove all roles at all times', FALSE, 3),
  ('01100000-0000-4000-8000-000000001060', '01100000-0000-4000-8000-000000000515', 'Only owners may access any resource', FALSE, 4),
  -- Q6 (516): policy
  ('01100000-0000-4000-8000-000000001061', '01100000-0000-4000-8000-000000000516', 'Enforces rules that evaluate resource properties for compliance', TRUE,  1),
  ('01100000-0000-4000-8000-000000001062', '01100000-0000-4000-8000-000000000516', 'Sets a price for compute resources', FALSE, 2),
  ('01100000-0000-4000-8000-000000001063', '01100000-0000-4000-8000-000000000516', 'Replicates data across regions', FALSE, 3),
  ('01100000-0000-4000-8000-000000001064', '01100000-0000-4000-8000-000000000516', 'Balances network traffic', FALSE, 4),
  -- Q6 (516)q2: TCO calculator
  ('01100000-0000-4000-8000-000000001065', '01100000-0000-4000-8000-000000000517', 'The Azure TCO Calculator', TRUE,  1),
  ('01100000-0000-4000-8000-000000001066', '01100000-0000-4000-8000-000000000517', 'The Azure Pricing Calculator', FALSE, 2),
  ('01100000-0000-4000-8000-000000001067', '01100000-0000-4000-8000-000000000517', 'The Service Health dashboard', FALSE, 3),
  ('01100000-0000-4000-8000-000000001068', '01100000-0000-4000-8000-000000000517', 'Azure Advisor', FALSE, 4),
  -- Q6 (516)q3: SLA
  ('01100000-0000-4000-8000-000000001069', '01100000-0000-4000-8000-000000000518', 'A formal uptime commitment with a service credit if missed', TRUE,  1),
  ('01100000-0000-4000-8000-000000001070', '01100000-0000-4000-8000-000000000518', 'A guarantee of 100% uptime', FALSE, 2),
  ('01100000-0000-4000-8000-000000001071', '01100000-0000-4000-8000-000000000518', 'Applied only to networking services', FALSE, 3),
  ('01100000-0000-4000-8000-000000001072', '01100000-0000-4000-8000-000000000518', 'A replacement for monitoring', FALSE, 4),
  -- Q7 (519): azure monitor
  ('01100000-0000-4000-8000-000000001073', '01100000-0000-4000-8000-000000000519', 'Azure Monitor', TRUE,  1),
  ('01100000-0000-4000-8000-000000001074', '01100000-0000-4000-8000-000000000519', 'Azure Front Door', FALSE, 2),
  ('01100000-0000-4000-8000-000000001075', '01100000-0000-4000-8000-000000000519', 'Azure App Service', FALSE, 3),
  ('01100000-0000-4000-8000-000000001076', '01100000-0000-4000-8000-000000000519', 'Azure DNS', FALSE, 4),
  -- Q7 (519)q2: log analytics
  ('01100000-0000-4000-8000-000000001077', '01100000-0000-4000-8000-000000000520', 'A central repository for querying logs with the Kusto Query Language', TRUE,  1),
  ('01100000-0000-4000-8000-000000001078', '01100000-0000-4000-8000-000000000520', 'A service that runs virtual machines', FALSE, 2),
  ('01100000-0000-4000-8000-000000001079', '01100000-0000-4000-8000-000000000520', 'A web page hosting platform', FALSE, 3),
  ('01100000-0000-4000-8000-000000001080', '01100000-0000-4000-8000-000000000520', 'A place to define RBAC scopes', FALSE, 4),
  -- Q7 (519)q3: metric alert
  ('01100000-0000-4000-8000-000000001081', '01100000-0000-4000-8000-000000000521', 'A rule that evaluates a metric and fires when a threshold is crossed', TRUE,  1),
  ('01100000-0000-4000-8000-000000001082', '01100000-0000-4000-8000-000000000521', 'A monthly billing report', FALSE, 2),
  ('01100000-0000-4000-8000-000000001083', '01100000-0000-4000-8000-000000000521', 'A DNS record for a domain', FALSE, 3),
  ('01100000-0000-4000-8000-000000001084', '01100000-0000-4000-8000-000000000521', 'A packaged container image', FALSE, 4),
  -- Q8 (522): cli create rg
  ('01100000-0000-4000-8000-000000001085', '01100000-0000-4000-8000-000000000522', 'az group create --name rg-demo --location westus', TRUE,  1),
  ('01100000-0000-4000-8000-000000001086', '01100000-0000-4000-8000-000000000522', 'az vm list --output table', FALSE, 2),
  ('01100000-0000-4000-8000-000000001087', '01100000-0000-4000-8000-000000000522', 'az account show', FALSE, 3),
  ('01100000-0000-4000-8000-000000001088', '01100000-0000-4000-8000-000000000522', 'az group delete --name rg-demo', FALSE, 4),
  -- Q8 (522)q2: defender for cloud
  ('01100000-0000-4000-8000-000000001089', '01100000-0000-4000-8000-000000000523', 'Microsoft Defender for Cloud', TRUE,  1),
  ('01100000-0000-4000-8000-000000001090', '01100000-0000-4000-8000-000000000523', 'Azure Load Balancer', FALSE, 2),
  ('01100000-0000-4000-8000-000000001091', '01100000-0000-4000-8000-000000000523', 'Azure Content Delivery Network', FALSE, 3),
  ('01100000-0000-4000-8000-000000001092', '01100000-0000-4000-8000-000000000523', 'Azure Cosmos DB', FALSE, 4),
  -- Q8 (522)q3: NSG
  ('01100000-0000-4000-8000-000000001093', '01100000-0000-4000-8000-000000000524', 'Filters inbound and outbound traffic to and from resources', TRUE,  1),
  ('01100000-0000-4000-8000-000000001094', '01100000-0000-4000-8000-000000000524', 'Compresses stored disks', FALSE, 2),
  ('01100000-0000-4000-8000-000000001095', '01100000-0000-4000-8000-000000000524', 'Manages user passwords', FALSE, 3),
  ('01100000-0000-4000-8000-000000001096', '01100000-0000-4000-8000-000000000524', 'Hosts web applications', FALSE, 4),
  -- Q9 (525): public cloud benefit
  ('01100000-0000-4000-8000-000000001097', '01100000-0000-4000-8000-000000000525', 'Pay-as-you-go pricing scales with actual usage', TRUE,  1),
  ('01100000-0000-4000-8000-000000001098', '01100000-0000-4000-8000-000000000525', 'Capital expenditure is required before any usage', FALSE, 2),
  ('01100000-0000-4000-8000-000000001099', '01100000-0000-4000-8000-000000000525', 'Capacity is fixed for several years', FALSE, 3),
  ('01100000-0000-4000-8000-000000001100', '01100000-0000-4000-8000-000000000525', 'No internet connection is required', FALSE, 4),
  -- Q9 (525)q2: delete resource group
  ('01100000-0000-4000-8000-000000001101', '01100000-0000-4000-8000-000000000526', 'Every resource inside it is deleted together', TRUE,  1),
  ('01100000-0000-4000-8000-000000001102', '01100000-0000-4000-8000-000000000526', 'Only the group name and metadata are removed', FALSE, 2),
  ('01100000-0000-4000-8000-000000001103', '01100000-0000-4000-8000-000000000526', 'Billing stops but the resources remain', FALSE, 3),
  ('01100000-0000-4000-8000-000000001104', '01100000-0000-4000-8000-000000000526', 'A snapshot fee is charged automatically', FALSE, 4),
  -- Q9 (525)q3: allowed regions
  ('01100000-0000-4000-8000-000000001105', '01100000-0000-4000-8000-000000000527', 'Azure Policy', TRUE,  1),
  ('01100000-0000-4000-8000-000000001106', '01100000-0000-4000-8000-000000000527', 'Azure DNS', FALSE, 2),
  ('01100000-0000-4000-8000-000000001107', '01100000-0000-4000-8000-000000000527', 'Azure Front Door', FALSE, 3),
  ('01100000-0000-4000-8000-000000001108', '01100000-0000-4000-8000-000000000527', 'A storage account access tier', FALSE, 4),
  -- Q9 (525)q4: management lock
  ('01100000-0000-4000-8000-000000001109', '01100000-0000-4000-8000-000000000528', 'Prevents accidental deletion or modification of a scope', TRUE,  1),
  ('01100000-0000-4000-8000-000000001110', '01100000-0000-4000-8000-000000000528', 'Locks the screen of a virtual machine', FALSE, 2),
  ('01100000-0000-4000-8000-000000001111', '01100000-0000-4000-8000-000000000528', 'Encrypts network traffic', FALSE, 3),
  ('01100000-0000-4000-8000-000000001112', '01100000-0000-4000-8000-000000000528', 'Restarts a failed service', FALSE, 4),
  -- Q9 (525)q5: CPU alert
  ('01100000-0000-4000-8000-000000001113', '01100000-0000-4000-8000-000000000529', 'A metric alert with an action group', TRUE,  1),
  ('01100000-0000-4000-8000-000000001114', '01100000-0000-4000-8000-000000000529', 'A virtual machine scale set', FALSE, 2),
  ('01100000-0000-4000-8000-000000001115', '01100000-0000-4000-8000-000000000529', 'A blob access tier change', FALSE, 3),
  ('01100000-0000-4000-8000-000000001116', '01100000-0000-4000-8000-000000000529', 'A DNS CNAME record', FALSE, 4)
ON CONFLICT (id) DO NOTHING;