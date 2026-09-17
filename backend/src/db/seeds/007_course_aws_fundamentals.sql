-- ============================================================================
-- SEED 007: Complete course — "AWS Cloud Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim        (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing  (20000000-0000-4000-8000-000000000004)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Cloud & AWS Foundations   → C1 Cloud Computing Concepts · C2 AWS Global Infrastructure & IAM
--   M2 Compute & Storage         → C3 Amazon EC2 · C4 Amazon S3
--   M3 Databases & Networking    → C5 Amazon RDS & DynamoDB · C6 VPC & Networking Basics
--   M4 Architecture & Pricing    → C7 Serverless with Lambda · C8 Monitoring, Pricing & Cost
--   M5 Capstone: Static Site     → C9 Project Setup & Planning · C10 Deploying & Polishing
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
  '70000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'AWS Cloud Fundamentals',
  'aws-cloud-fundamentals',
  'Go from zero to confident on Amazon Web Services. Launch EC2 servers, store data on S3, design databases and networks, run serverless code with Lambda — and secure it all with IAM and the shared responsibility model. Finish by deploying your own static website live on S3.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  5
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('70000000-0000-4000-8000-000000000011', '70000000-0000-4000-8000-000000000001', 'Explain cloud computing concepts, service models, and the shared responsibility model.', 1),
  ('70000000-0000-4000-8000-000000000012', '70000000-0000-4000-8000-000000000001', 'Provision and manage core AWS services: EC2, S3, RDS, and DynamoDB.',       2),
  ('70000000-0000-4000-8000-000000000013', '70000000-0000-4000-8000-000000000001', 'Design secure VPC networking with subnets, gateways, and security groups.', 3),
  ('70000000-0000-4000-8000-000000000014', '70000000-0000-4000-8000-000000000001', 'Apply IAM, the shared responsibility model, and CloudWatch to secure and observe workloads.', 4),
  ('70000000-0000-4000-8000-000000000015', '70000000-0000-4000-8000-000000000001', 'Build, deploy, and publish a static website hosted on Amazon S3.',          5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('70000000-0000-4000-8000-000000000101', '70000000-0000-4000-8000-000000000001', 1, 'Cloud & AWS Foundations',     'Learn cloud concepts, AWS global infrastructure, and IAM security essentials.', 'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000102', '70000000-0000-4000-8000-000000000001', 2, 'Compute & Storage',           'Launch virtual servers on EC2 and store objects at scale on S3.',               'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000103', '70000000-0000-4000-8000-000000000001', 3, 'Databases & Networking',      'Run managed relational and NoSQL databases inside secure virtual networks.',    'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000104', '70000000-0000-4000-8000-000000000001', 4, 'Architecture & Pricing',      'Go serverless with Lambda, then monitor resources and optimize cloud costs.',   'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000105', '70000000-0000-4000-8000-000000000001', 5, 'Capstone: Static Website on S3',  'Plan, build, and publish a real static website hosted on Amazon S3.',      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('70000000-0000-4000-8000-000000000201', '70000000-0000-4000-8000-000000000101', 1, 'Cloud Computing Concepts',       'What cloud computing is, its service models, and how it changes operations.', 'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000202', '70000000-0000-4000-8000-000000000101', 2, 'AWS Global Infrastructure & IAM',  'Regions, availability zones, and identity-based security with IAM.',         'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000203', '70000000-0000-4000-8000-000000000102', 1, 'Amazon EC2',                      'Launch, secure, and pay for virtual servers on demand.',                      'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000204', '70000000-0000-4000-8000-000000000102', 2, 'Amazon S3',                       'Store, organize, and version unlimited objects in the cloud.',                'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000205', '70000000-0000-4000-8000-000000000103', 1, 'Amazon RDS & DynamoDB',           'Run managed relational and NoSQL databases with almost no administration.',   'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000206', '70000000-0000-4000-8000-000000000103', 2, 'VPC & Networking Basics',         'Design secure virtual networks with subnets, gateways, and firewalls.',       'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000207', '70000000-0000-4000-8000-000000000104', 1, 'Serverless with Lambda',          'Run code without servers and react to events across AWS.',                    'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000208', '70000000-0000-4000-8000-000000000104', 2, 'Monitoring, Pricing & Cost',      'Observe workloads with CloudWatch and spend wisely on AWS.',                  'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000209', '70000000-0000-4000-8000-000000000105', 1, 'Project Setup & Planning',        'Plan the capstone static website and prepare your AWS account.',              'PUBLISHED'),
  ('70000000-0000-4000-8000-000000000210', '70000000-0000-4000-8000-000000000105', 2, 'Deploying & Polishing',           'Build, deploy, and polish a static website hosted on Amazon S3.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 70000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('70000000-0000-4000-8000-000000000301', '70000000-0000-4000-8000-000000000201', 1, 'Cloud Computing Concepts',            'Define cloud computing and understand its core value proposition.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('70000000-0000-4000-8000-000000000302', '70000000-0000-4000-8000-000000000201', 2, 'Cloud Service & Deployment Models',   'Compare IaaS, PaaS, and SaaS plus public, private, and hybrid deployment.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000303', '70000000-0000-4000-8000-000000000201', 3, 'Cloud Concepts Quiz',                 'Check your understanding of cloud fundamentals.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000304', '70000000-0000-4000-8000-000000000202', 1, 'AWS Global Infrastructure',           'Explore Regions, Availability Zones, and edge locations across AWS.',              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('70000000-0000-4000-8000-000000000305', '70000000-0000-4000-8000-000000000202', 2, 'IAM: Users, Groups, Roles & Policies','Manage access securely with IAM identities, policies, and best practices.',        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000306', '70000000-0000-4000-8000-000000000202', 3, 'Infrastructure & IAM Quiz',           'Test your knowledge of AWS infrastructure and identity management.',               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000307', '70000000-0000-4000-8000-000000000203', 1, 'Launching Your First EC2 Instance',   'Provision a virtual server, connect to it, and understand instance lifecycle.',    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000308', '70000000-0000-4000-8000-000000000203', 2, 'EC2 Storage, Security & Pricing',    'Attach storage, lock down access, and choose the right EC2 pricing model.',        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000309', '70000000-0000-4000-8000-000000000203', 3, 'Amazon EC2 Quiz',                     'Verify your EC2 instance, storage, and pricing skills.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000310', '70000000-0000-4000-8000-000000000204', 1, 'Amazon S3 Fundamentals',              'Create buckets, upload objects, and organize storage with keys and prefixes.',      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000311', '70000000-0000-4000-8000-000000000204', 2, 'S3 Storage Classes & Versioning',    'Match storage classes to access patterns and protect data with versioning.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000312', '70000000-0000-4000-8000-000000000204', 3, 'Amazon S3 Quiz',                      'Check your S3 storage and management knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000313', '70000000-0000-4000-8000-000000000205', 1, 'Relational Databases with RDS',      'Launch managed relational databases and understand Multi-AZ, backups, and backups.', 'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000314', '70000000-0000-4000-8000-000000000205', 2, 'NoSQL with DynamoDB',                 'Design scalable key-value tables with partitions, indexes, and on-demand capacity.', 'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000315', '70000000-0000-4000-8000-000000000205', 3, 'Databases Quiz',                      'Test your RDS and DynamoDB knowledge.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000316', '70000000-0000-4000-8000-000000000206', 1, 'VPC & Subnet Design',                 'Design isolated networks with CIDR blocks, subnets, and route tables.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000317', '70000000-0000-4000-8000-000000000206', 2, 'Security Groups, NACLs & DNS',        'Control traffic with security groups and network ACLs, and use Route 53 for DNS.', 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000318', '70000000-0000-4000-8000-000000000206', 3, 'VPC & Networking Quiz',               'Check your virtual network and firewall knowledge.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000319', '70000000-0000-4000-8000-000000000207', 1, 'Serverless with AWS Lambda',          'Run code on demand without provisioning or managing servers.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000320', '70000000-0000-4000-8000-000000000207', 2, 'Event-Driven Architecture',           'Trigger Lambda functions from S3, API Gateway, SQS, and EventBridge.',             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000321', '70000000-0000-4000-8000-000000000207', 3, 'Serverless Quiz',                     'Verify your Lambda and event-driven skills.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000322', '70000000-0000-4000-8000-000000000208', 1, 'Monitoring with CloudWatch',          'Collect metrics, logs, and alarms to observe your AWS resources.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000323', '70000000-0000-4000-8000-000000000208', 2, 'Pricing Models & Cost Optimization',  'Understand AWS pricing, the Free Tier, and ways to reduce spend.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000324', '70000000-0000-4000-8000-000000000208', 3, 'Monitoring & Pricing Quiz',           'Test your CloudWatch and cost management knowledge.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('70000000-0000-4000-8000-000000000325', '70000000-0000-4000-8000-000000000209', 1, 'Capstone: Planning & Setup',          'Plan the static website architecture and prepare your S3 bucket.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000326', '70000000-0000-4000-8000-000000000210', 1, 'Building the Static Site',            'Create the HTML and CSS for your website and enable static hosting on S3.',        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('70000000-0000-4000-8000-000000000327', '70000000-0000-4000-8000-000000000210', 2, 'Deploying & Polishing',               'Upload the site, make it public, and polish with a custom domain.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('70000000-0000-4000-8000-000000000328', '70000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove what you learned across the whole course.',                                  'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 70000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '70000000-0000-4000-8000-000000000401',
  '70000000-0000-4000-8000-000000000301',
  1,
  'Cloud Computing Concepts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Computing Concepts</title>
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
  <h1>Cloud Computing Concepts</h1>
  <p>Cloud computing is the <strong>on-demand delivery</strong> of computing power, storage, databases, and software over the internet, billed only for what you use. Instead of owning physical servers, you rent them by the second from providers such as Amazon Web Services.</p>
  <p>Think of it like a utility: you do not build a power plant to use electricity, and you do not buy a server to run a website — you connect to a shared grid and pay for usage.</p>
  <h2>Five essential characteristics</h2>
  <table>
    <thead>
      <tr><th>Characteristic</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td>On-demand self-service</td><td>Provision resources without human interaction.</td></tr>
      <tr><td>Broad network access</td><td>Reach resources from anywhere over the network.</td></tr>
      <tr><td>Resource pooling</td><td>Providers share infrastructure across many customers.</td></tr>
      <tr><td>Rapid elasticity</td><td>Scale up or down quickly, sometimes automatically.</td></tr>
      <tr><td>Measured service</td><td>Usage is metered and billed proportionally.</td></tr>
    </tbody>
  </table>
  <p>These five traits are the official definition of cloud computing and the reason organizations adopt it: near-infinite scale on demand, no upfront capital, and a global footprint without building data centers.</p>
  <h2>On-premises versus cloud</h2>
  <pre class="code-block">On-premises  →  buy hardware, wait for delivery, maintain it for years
Cloud        →  click a button, scale instantly, pay as you go</pre>
  <div class="callout callout-info">
    <strong>Remember</strong>
    <p>The cloud is not a single anxious server "somewhere" — it is thousands of data centers operated by AWS, presenting one uniform API. You never touch the physical hardware.</p>
  </div>
  <h2>Why organizations move to the cloud</h2>
  <ul>
    <li>Convert capital expense into operating expense.</li>
    <li>Stop guessing capacity — grow and shrink on demand.</li>
    <li>Deploy globally with low latency from dozens of regions.</li>
    <li>Focus engineers on features, not rack-and-stack operations.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>In the AWS Cloud, expect to hear "the hands are the last thing you manage." Almost every service in this course is managed for you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000402',
  '70000000-0000-4000-8000-000000000302',
  1,
  'Cloud Service & Deployment Models',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloud Service &amp; Deployment Models</title>
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
  <h1>Cloud Service &amp; Deployment Models</h1>
  <p>Not all cloud is equal — it depends on <strong>how much you manage</strong> (the service model) and <strong>who owns the infrastructure</strong> (the deployment model).</p>
  <h2>The three service models</h2>
  <table>
    <thead>
      <tr><th>Model</th><th>What you get</th><th>What you manage</th></tr>
    </thead>
    <tbody>
      <tr><td>IaaS</td><td>Virtual servers, networks, storage</td><td>OS, apps, and everything above</td></tr>
      <tr><td>PaaS</td><td>A platform and runtime</td><td>Only your application and data</td></tr>
      <tr><td>SaaS</td><td>A finished application</td><td>Nothing — the vendor runs it</td></tr>
    </tbody>
  </table>
  <ul>
    <li><strong>IaaS</strong> (Infrastructure as a Service) — <span class="ic">Amazon EC2</span>: you get a virtual machine and patch the operating system yourself.</li>
    <li><strong>PaaS</strong> (Platform as a Service) — <span class="ic">Elastic Beanstalk</span>: the platform runs your code; the servers are invisible.</li>
    <li><strong>SaaS</strong> (Software as a Service) — <span class="ic">Amazon WorkDocs</span>: users open an app and never think about servers.</li>
  </ul>
  <h2>Deployment models</h2>
  <table>
    <thead>
      <tr><th>Model</th><th>Description</th></tr>
    </thead>
    <tbody>
      <tr><td>Public cloud</td><td>Vendor-owned infrastructure shared on demand (AWS, Azure, GCP).</td></tr>
      <tr><td>Private cloud</td><td>Dedicated infrastructure used by a single organization.</td></tr>
      <tr><td>Hybrid cloud</td><td>Public and private environments connected to share data and workloads.</td></tr>
      <tr><td>Multi-cloud</td><td>Using more than one public provider to avoid lock-in.</td></tr>
    </tbody>
  </table>
  <h2>The shared responsibility model</h2>
  <p>AWS secures <strong>of</strong> the cloud: physical data centers, hardware, and the global network. You secure <strong>in</strong> the cloud: your data, identity and access, applications, and operating systems on EC2.</p>
  <pre class="code-block">AWS            →  hardware, data centers, managed services
Customer        →  data, IAM permissions, EC2 OS, applications</pre>
  <div class="callout callout-danger">
    <strong>Key exam concept</strong>
    <p>The shared responsibility model is decisive: you are always responsible for your data, your configurations, and who can access your AWS account.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Matching a workload to the right service model saves effort. Move from IaaS to PaaS to SaaS as the service fits, and you stop patching servers forever.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000403',
  '70000000-0000-4000-8000-000000000304',
  1,
  'AWS Global Infrastructure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AWS Global Infrastructure</title>
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
  <h1>AWS Global Infrastructure</h1>
  <p>AWS runs on a global network of <strong>Regions</strong>, each containing multiple <strong>Availability Zones (AZs)</strong>, all backed by <strong>edge locations</strong>. Understanding this three-tier geography helps you design for speed, resilience, and regulatory compliance.</p>
  <h2>Regions</h2>
  <p>A Region is a discrete geographic area with the full set of AWS services — for example <span class="ic">us-east-1</span> (N. Virginia), <span class="ic">eu-west-1</span> (Ireland), and <span class="ic">ap-southeast-2</span> (Sydney). Choose a Region to get you close to users and meet data-residency laws.</p>
  <h2>Availability Zones</h2>
  <p>Each Region has between two and six AZs. An AZ is one or more isolated data centers with independent power, cooling, and networking. Deploy across multiple AZs to survive a data center failure.</p>
  <table>
    <thead>
      <tr><th>Layer</th><th>Purpose</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>Region</td><td>Independent geographic footprint</td><td>us-east-1</td></tr>
      <tr><td>Availability Zone</td><td>Isolated data centers inside a Region</td><td>us-east-1a</td></tr>
      <tr><td>Edge location</td><td>Cache content for low latency</td><td>CloudFront PoP</td></tr>
    </tbody>
  </table>
  <h2>Edge locations</h2>
  <p>Edge locations are small caching sites distributed worldwide that power <span class="ic">Amazon CloudFront</span> (CDN) and DNS caching. They bring static content, video, and API responses closer to users even when your compute lives in one Region.</p>
  <h2>How to check Regions yourself</h2>
  <pre class="code-block">aws ec2 describe-regions --output table
aws ec2 describe-availability-zones --region us-east-1</pre>
  <div class="callout callout-info">
    <strong>Dedicated or not</strong>
    <p>Not every service exists in every Region. Before designing, check <span class="ic">Regional table</span> on the AWS website for the services you plan to use.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Exam tip</strong>
    <p>It is a fact pattern, not logic: a Region is a geographic area, an AZ is a building (or group of buildings), an edge location is a cache. Committing per second is wrong — that is not how they relate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000404',
  '70000000-0000-4000-8000-000000000305',
  1,
  'IAM: Users, Groups, Roles & Policies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IAM: Users, Groups, Roles &amp; Policies</title>
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
  <h1>IAM: Users, Groups, Roles &amp; Policies</h1>
  <p><span class="ic">AWS Identity and Access Management (IAM)</span> is the service that controls <em>who</em> can access your account and <em>what</em> they can do. There is no separate hardware — IAM is a free, global service built into every API call.</p>
  <h2>The IAM building blocks</h2>
  <table>
    <thead>
      <tr><th>Entity</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td>User</td><td>A person or application with long-term credentials.</td></tr>
      <tr><td>Group</td><td>A collection of users sharing the same permissions.</td></tr>
      <tr><td>Role</td><td>Temporary credentials assumed by users or AWS services.</td></tr>
      <tr><td>Policy</td><td>A JSON document granting (or denying) permissions.</td></tr>
    </tbody>
  </table>
  <h2>Policies are JSON</h2>
  <pre class="code-block">{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::my-bucket"
    }
  ]
}</pre>
  <p>Policies bind to a user, group, or role. <span class="ic">Effect</span> is either <span class="ic">Allow</span> or <span class="ic">Deny</span>, <span class="ic">Action</span> names the API action, and <span class="ic">Resource</span> names the target ARN.</p>
  <h2>Roles are for trust</h2>
  <p>Give an <span class="ic">EC2 instance</span> a role named <span class="ic">EC2S3ReadOnly</span> and it can read S3 buckets without embedding a password inside the machine. Roles issue temporary, short-lived credentials automatically.</p>
  <pre class="code-block">aws iam create-role --role-name EC2S3ReadOnly \
  --assume-role-policy-document file://trust-policy.json</pre>
  <h2>Security best practices</h2>
  <ul>
    <li>Do not use the <strong>root account</strong> except to create your first admin.</li>
    <li>Enable <strong>MFA</strong> on the root account and admin users.</li>
    <li>Follow <strong>least privilege</strong> — grant only what is needed.</li>
    <li>Prefer roles over long-lived access keys.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Why IAM matters</strong>
    <p>A stolen key with full admin access is the fastest route to a data breach. IAM is the front door of your entire AWS account — design it carefully.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Create policies for groups, not individual users. Add a person to a group and the permissions follow; remove them and access disappears instantly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000405',
  '70000000-0000-4000-8000-000000000307',
  1,
  'Launching Your First EC2 Instance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Launching Your First EC2 Instance</title>
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
  <h1>Launching Your First EC2 Instance</h1>
  <p><span class="ic">Amazon EC2</span> (Elastic Compute Cloud) gives you resizable virtual servers called <strong>instances</strong>. You choose an operating system (an <strong>AMI</strong>), a hardware size (an <strong>instance type</strong>), and a way to get in (a <strong>key pair</strong>).</p>
  <h2>The ingredients of an instance</h2>
  <table>
    <thead>
      <tr><th>Component</th><th>What it decides</th></tr>
    </thead>
    <tbody>
      <tr><td>AMI</td><td>The OS and preinstalled software.</td></tr>
      <tr><td>Instance type</td><td>CPU, memory, storage mix.</td></tr>
      <tr><td>Key pair</td><td>The private key for SSH into Linux.</td></tr>
      <tr><td>Network</td><td>Which VPC and subnet the machine joins.</td></tr>
    </tbody>
  </table>
  <h2>Instance families</h2>
  <pre class="code-block">t3.micro  →  general purpose, free tier eligible
c6i.large →  compute optimized
r6i.large →  memory optimized</pre>
  <p>The first letter is the family (general purpose, compute, memory, storage optimized); the number/words after select generation and size.</p>
  <h2>Launch from the CLI</h2>
  <pre class="code-block">aws ec2 run-instances \
  --image-id ami-0abcdef1234567890 \
  --instance-type t3.micro \
  --key-name my-key-pair \
  --security-group-ids sg-0123456789abcdef0</pre>
  <h2>Instance lifecycle</h2>
  <ul>
    <li><strong>Pending</strong> — booting; you are not billed yet.</li>
    <li><strong>Running</strong> — actively billed by the second.</li>
    <li><strong>Stopped</strong> — storage persists; compute billing stops.</li>
    <li><strong>Terminated</strong> — the instance is deleted.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Free tier</strong>
    <p>New accounts get 750 hours/month of <span class="ic">t3.micro</span> (or <span class="ic">t2.micro</span>) for 12 months — enough to follow along without spending.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Log in over SSH with the private key: <span class="ic">ssh -i my-key.pem ec2-user@PUBLIC_IP</span>. Keep that key file private — it never leaves your machine.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000406',
  '70000000-0000-4000-8000-000000000308',
  1,
  'EC2 Storage, Security & Pricing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EC2 Storage, Security &amp; Pricing</title>
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
  <h1>EC2 Storage, Security &amp; Pricing</h1>
  <p>An EC2 instance needs storage, protection, and a payment plan. These three choices shape both the cost and the reliability of everything you run.</p>
  <h2>Storage options</h2>
  <table>
    <thead>
      <tr><th>Option</th><th>Best for</th><th>Lifetime</th></tr>
    </thead>
    <tbody>
      <tr><td>EBS (Elastic Block Store)</td><td>Durable databases and app data</td><td>Persists after stop/terminate</td></tr>
      <tr><td>Instance store</td><td>Ephemeral caches, temp files</td><td>Lost when the instance stops</td></tr>
      <tr><td>EFS (file share)</td><td>Shared files across instances</td><td>Persists independently</td></tr>
    </tbody>
  </table>
  <p><span class="ic">EBS</span> behaves like a hard drive in a drawer: detach it, move it to another instance, or snapshot it for backup. <span class="ic">Instance store</span> is physically attached but volatile — do not keep the only copy there.</p>
  <h2>Secure the instance</h2>
  <p>A <strong>security group</strong> is a stateful virtual firewall around the instance. Rules are allow-only; if no rule matches, traffic is dropped.</p>
  <pre class="code-block">aws ec2 authorize-security-group-ingress \
  --group-id sg-0123456789abcdef0 \
  --protocol tcp --port 22 --cidr 0.0.0.0/0</pre>
  <div class="callout callout-danger">
    <strong>Security flag</strong>
    <p>Opening port 22 (SSH) or 3389 (RDP) to <span class="ic">0.0.0.0/0</span> invites brute-force attacks. Restrict to your office IP range whenever possible.</p>
  </div>
  <h2>Pricing models</h2>
  <table>
    <thead>
      <tr><th>Model</th><th>Use it when</th></tr>
    </thead>
    <tbody>
      <tr><td>On-Demand</td><td>Unpredictable or short-term workloads.</td></tr>
      <tr><td>Reserved</td><td>Steady, known capacity for 1–3 years.</td></tr>
      <tr><td>Spot</td><td>Fault-tolerant workloads bidding on spare capacity.</td></tr>
      <tr><td>Savings Plans</td><td>Commit to a $/hour usage amount for flexible compute.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pair EBS snapshots with automated lifecycle rules. A nightly snapshot is the cheapest insurance against accidental corruption — and it restores in minutes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000407',
  '70000000-0000-4000-8000-000000000310',
  1,
  'Amazon S3 Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Amazon S3 Fundamentals</title>
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
  <h1>Amazon S3 Fundamentals</h1>
  <p><span class="ic">Amazon Simple Storage Service (S3)</span> is object storage for the internet. It stores unlimited <strong>objects</strong> (files and metadata) in <strong>buckets</strong>, designed for 99.999999999% (11 nines) durability.</p>
  <h2>Buckets, objects, and keys</h2>
  <table>
    <thead>
      <tr><th>Concept</th><th>Explanation</th></tr>
    </thead>
    <tbody>
      <tr><td>Bucket</td><td>A container, globally unique name, tied to a Region.</td></tr>
      <tr><td>Object</td><td>The file plus its metadata.</td></tr>
      <tr><td>Key</td><td>The full path inside the bucket, e.g. images/logo.png.</td></tr>
    </tbody>
  </table>
  <h2>Working with S3 from the CLI</h2>
  <pre class="code-block">aws s3 mb s3://my-course-bucket        # make a bucket
aws s3 cp website/index.html s3://my-course-bucket/
aws s3 ls s3://my-course-bucket        # list objects</pre>
  <p>S3 is a global namespace for bucket names but data lives in one Region. The console and CLI both enforce naming rules like lowercase letters and no underscores.</p>
  <h2>What you can do with S3</h2>
  <ul>
    <li>Host static websites (HTML, CSS, JS) — your capstone!</li>
    <li>Store backups, media, and user uploads.</li>
    <li>Serve data to EC2, Lambda, and analytics pipelines.</li>
    <li>Version objects to recover from accidental deletion.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Buckets are not folders</strong>
    <p>The console shows folders, but S3 has no real directories — a key like <span class="ic">images/logo.png</span> is just a name with a slash. Prefixes help you organize, not nest.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Durability</strong>
    <p>S3 replicates objects across at least three AZs in a Region. If a single data center vanishes, your object survives. That is the 11-nines promise.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000408',
  '70000000-0000-4000-8000-000000000311',
  1,
  'S3 Storage Classes & Versioning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>S3 Storage Classes &amp; Versioning</title>
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
  <h1>S3 Storage Classes &amp; Versioning</h1>
  <p>Not all data needs the same speed. S3 offers <strong>storage classes</strong> from hot (<span class="ic">S3 Standard</span>) to archival (<span class="ic">S3 Glacier Deep Archive</span>), plus <strong>versioning</strong> to protect every copy of an object.</p>
  <h2>Choosing a storage class</h2>
  <table>
    <thead>
      <tr><th>Class</th><th>Access pattern</th></tr>
    </thead>
    <tbody>
      <tr><td>S3 Standard</td><td>Frequent, low-latency access.</td></tr>
      <tr><td>S3 Intelligent-Tiering</td><td>Unknown patterns; auto-tiers.</td></tr>
      <tr><td>S3 Standard-IA / One Zone-IA</td><td>Infrequent but retrievable data.</td></tr>
      <tr><td>S3 Glacier / Glacier Deep Archive</td><td>Long-term archive; slow retrieval.</td></tr>
    </tbody>
  </table>
  <p>Cheaper classes trade storage cost for retrieval time and fees. Match the class to how often you actually read the object.</p>
  <h2>Versioning</h2>
  <p>Turn on versioning and every <span class="ic">PUT</span> creates a new version instead of overwriting. Old versions are preserved, so an accidental delete or overwrite is reversible.</p>
  <pre class="code-block">aws s3api put-bucket-versioning \
  --bucket my-course-bucket \
  --versioning-configuration Status=Enabled</pre>
  <h2>Lifecycle rules</h2>
  <p>Automate class transitions with lifecycle rules: move old logs to <span class="ic">Standard-IA</span> after 30 days, then to <span class="ic">Glacier</span> after 90.</p>
  <pre class="code-block">aws s3api put-bucket-lifecycle-configuration \
  --bucket my-course-bucket \
  --lifecycle-configuration file://lifecycle.json</pre>
  <div class="callout callout-info">
    <strong>Versioning + delete</strong>
    <p>With versioning on, "deleting" an object leaves a delete marker — the data still exists and can be restored. Permanently removing requires deleting every version.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Cost tip</strong>
    <p>Versioning stores every copy you ever write. Pair it with lifecycle rules so old versions age into cheap storage instead of piling up in Standard.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000409',
  '70000000-0000-4000-8000-000000000313',
  1,
  'Relational Databases with RDS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Relational Databases with RDS</title>
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
  <h1>Relational Databases with RDS</h1>
  <p><span class="ic">Amazon Relational Database Service (RDS)</span> is a managed service that sets up, patches, and backs up relational databases for you. You pick an engine, a size, and a Region — AWS handles the rest.</p>
  <h2>Supported engines</h2>
  <ul>
    <li>Amazon Aurora (MySQL/PostgreSQL compatible)</li>
    <li>MySQL and MariaDB</li>
    <li>PostgreSQL</li>
    <li>Oracle and Microsoft SQL Server</li>
  </ul>
  <h2>What RDS manages</h2>
  <table>
    <thead>
      <tr><th>Component</th><th>Manager</th></tr>
    </thead>
    <tbody>
      <tr><td>Hardware and OS patching</td><td>AWS</td></tr>
      <tr><td>Automated backups &amp; snapshots</td><td>AWS</td></tr>
      <tr><td>Multi-AZ failover</td><td>AWS</td></tr>
      <tr><td>Schema and queries</td><td>You</td></tr>
    </tbody>
  </table>
  <h2>Multi-AZ and read replicas</h2>
  <p><strong>Multi-AZ</strong> keeps a synchronous standby in another availability zone — if the primary fails, AWS promotes the standby with near-zero downtime. <strong>Read replicas</strong> scale reads by copying queries to additional instances.</p>
  <h2>Create a database from the CLI</h2>
  <pre class="code-block">aws rds create-db-instance \
  --db-instance-identifier appdb \
  --db-instance-class db.t3.micro \
  --engine mysql --allocated-storage 20 \
  --master-username admin --master-user-password 'ChangeMe123!'</pre>
  <div class="callout callout-info">
    <strong>Managed does not mean hands-off</strong>
    <p>You still own the data model, queries, backups retention settings, and security groups. RDS removes operational grunt work, not responsibility.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Exam tip</strong>
    <p>Multi-AZ is about <em>availability</em> (failover). Read replicas are about <em>performance</em> (reading at scale). They are different features — do not blur them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000410',
  '70000000-0000-4000-8000-000000000314',
  1,
  'NoSQL with DynamoDB',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoSQL with DynamoDB</title>
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
  <h1>NoSQL with DynamoDB</h1>
  <p><span class="ic">Amazon DynamoDB</span> is a key-value and document database that delivers single-digit millisecond performance at any scale. There are no servers to patch, and no capacity is locked into a single node — data spreads across partitions automatically.</p>
  <h2>DynamoDB vocabulary</h2>
  <table>
    <thead>
      <tr><th>Term</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td>Table</td><td>A collection of items.</td></tr>
      <tr><td>Item</td><td>A single record — a set of attributes.</td></tr>
      <tr><td>Partition key</td><td>Decides which physical partition holds an item.</td></tr>
      <tr><td>Sort key</td><td>Orders items within a partition.</td></tr>
    </tbody>
  </table>
  <p>Design your primary key around how you query. A common pattern is <span class="ic">partiton = user id</span>, optional <span class="ic">sort = timestamp</span>.</p>
  <h2>Read and write capacity</h2>
  <ul>
    <li><strong>On-demand</strong> — pay per request; perfect for spiky traffic.</li>
    <li><strong>Provisioned</strong> — set read/write units; add auto-scaling.</li>
  </ul>
  <p>On-demand capacity is the friendliest starting point: no guessing, no throttling, just per-request billing.</p>
  <h2>Working with items from the CLI</h2>
  <pre class="code-block">aws dynamodb put-item \
  --table-name Users \
  --item '{"id": {"S": "u-1001"}, "name": {"S": "David"}}'

aws dynamodb get-item \
  --table-name Users \
  --key '{"id": {"S": "u-1001"}}'</pre>
  <h2>Secondary indexes</h2>
  <p>Already have a primary key and need a different access pattern? A <strong>global secondary index</strong> (GSI) lets you query by another attribute without duplicating a table.</p>
  <div class="callout callout-info">
    <strong>Serverless from day one</strong>
    <p>DynamoDB has no minimum cluster size and scales to any workload. Small apps pay cents; massive platforms run without breaking the model.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Design first</strong>
    <p>Think about your access patterns before the table. Choose a partition key that spreads evenly — a hot key like country="USA" will bottleneck writes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000411',
  '70000000-0000-4000-8000-000000000316',
  1,
  'VPC & Subnet Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VPC &amp; Subnet Design</title>
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
  <h1>VPC &amp; Subnet Design</h1>
  <p>A <span class="ic">Virtual Private Cloud (VPC)</span> is your own logically isolated section of AWS. Inside it you define IP ranges (<strong>CIDR blocks</strong>), split them into <strong>subnets</strong>, and steer traffic with <strong>route tables</strong>.</p>
  <h2>The layers of a VPC</h2>
  <table>
    <thead>
      <tr><th>Layer</th><th>Job</th></tr>
    </thead>
    <tbody>
      <tr><td>VPC</td><td>The private envelope; one Region, ranged by CIDR.</td></tr>
      <tr><td>Subnet</td><td>A slice of the VPC in one AZ — public or private.</td></tr>
      <tr><td>Route table</td><td>Decides where traffic goes (local, internet, NAT).</td></tr>
      <tr><td>Internet gateway</td><td>The door between a public subnet and the internet.</td></tr>
      <tr><td>NAT gateway</td><td>Lets private instances reach out without receiving inbound traffic.</td></tr>
    </tbody>
  </table>
  <h2>CIDR blocks</h2>
  <p>A CIDR block defines the range, such as <span class="ic">10.0.0.0/16</span> for the VPC and <span class="ic">10.0.1.0/24</span> for a subnet. Larger prefix = smaller range. AWS reserves a few addresses per subnet.</p>
  <pre class="code-block">aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 create-subnet --vpc-id vpc-0123456789abcdef0 \
  --cidr-block 10.0.1.0/24 --availability-zone us-east-1a</pre>
  <h2>Public vs private subnets</h2>
  <p>A <strong>public subnet</strong> has a route to the internet gateway; a <strong>private subnet</strong> does not. Put web servers in public subnets and databases in private ones.</p>
  <div class="callout callout-info">
    <strong>Reachability, not ownership</strong>
    <p>"Public" means "has a route to the internet," not "anyone can get in." The security group still blocks everything you did not explicitly allow.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Plan your ranges first</strong>
    <p>Give every environment (prod, staging, dev) its own VPC with non-overlapping CIDRs. Ranges are painful to change later — decide once, up front.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000412',
  '70000000-0000-4000-8000-000000000317',
  1,
  'Security Groups, NACLs & DNS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Security Groups, NACLs &amp; DNS</title>
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
  <h1>Security Groups, NACLs &amp; DNS</h1>
  <p>Firewalls and DNS decide what can reach your workloads and how users find them. Two firewall layers protect a VPC, and <span class="ic">Route 53</span> names your resources for the world.</p>
  <h2>Security groups vs network ACLs</h2>
  <table>
    <thead>
      <tr><th>Feature</th><th>Security Group</th><th>Network ACL</th></tr>
    </thead>
    <tbody>
      <tr><td>Level</td><td>Instance-level (default)</td><td>Subnet-level</td></tr>
      <tr><td>State</td><td>Stateful</td><td>Stateless</td></tr>
      <tr><td>Rules</td><td>Allow only</td><td>Allow + deny, numbered</td></tr>
      <tr><td>Default</td><td>Blocks everything unless allowed</td><td>Allows all by default</td></tr>
    </tbody>
  </table>
  <p>Because security groups are <em>stateful</em>, return traffic is allowed automatically. NACLs are <em>stateless</em> — you must write both inbound and outbound rules.</p>
  <h2>Apply a security group rule</h2>
  <pre class="code-block">aws ec2 authorize-security-group-ingress \
  --group-id sg-0123456789abcdef0 \
  --protocol tcp --port 80 \
  --cidr 0.0.0.0/0</pre>
  <h2>DNS with Route 53</h2>
  <p><span class="ic">Amazon Route 53</span> is the AWS DNS service. It maps friendly names (<span class="ic">example.com</span>) to resources and supports health checks and routing policies like failover and latency-based routing.</p>
  <div class="callout callout-info">
    <strong>Rule of thumb</strong>
    <p>Use security groups as your primary firewall. Add network ACLs as a coarse second layer for subnet-wide blocks, like quarantining a compromised range.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Exam tip</strong>
    <p>Think <em>stateful = security group</em>, <em>stateless = network ACL</em>. Getting this pairing right answers many VPC exam questions instantly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000413',
  '70000000-0000-4000-8000-000000000319',
  1,
  'Serverless with AWS Lambda',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Serverless with AWS Lambda</title>
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
  <h1>Serverless with AWS Lambda</h1>
  <p><span class="ic">AWS Lambda</span> runs your code in response to events — without you provisioning, patching, or scaling any server. You upload a function, give it an IAM role, define a trigger, and AWS executes it on demand.</p>
  <h2>Anatomy of a Lambda function</h2>
  <pre class="code-block">def handler(event, context):
    name = event.get("name", "World")
    return {"message": "Hello " + name + "!"}</pre>
  <p>Language runtimes include Python, Node.js, Java, Go, Ruby, and .NET. The <span class="ic">handler</span> receives the event payload and a context object.</p>
  <h2>Invoke it directly</h2>
  <pre class="code-block">aws lambda invoke \
  --function-name hello-world \
  --payload '{"name": "AWS"}' \
  response.json</pre>
  <h2>How billing works</h2>
  <table>
    <thead>
      <tr><th>Criterion</th><th>Charge</th></tr>
    </thead>
    <tbody>
      <tr><td>Requests</td><td>First 1M free, then per million.</td></tr>
      <tr><td>Compute time</td><td>GB-seconds (memory × runtime).</td></tr>
      <tr><td>Idle time</td><td>Free — no servers, no waiting.</td></tr>
    </tbody>
  </table>
  <h2>Why go serverless</h2>
  <ul>
    <li>Zero infrastructure to manage.</li>
    <li>Scales automatically with traffic — even to zero.</li>
    <li>Pay only when your code actually runs.</li>
    <li>Pairs naturally with S3, DynamoDB, API Gateway, and more.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Stateless by default</strong>
    <p>A Lambda function has no persistent memory between runs. Keep state in S3 or DynamoDB and design handlers to be short and idempotent.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Cold starts</strong>
    <p>The first call after an idle period pays a small setup penalty (a cold start). For latency-critical paths, keep functions warm with scheduled invokes or lighter runtimes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000414',
  '70000000-0000-4000-8000-000000000320',
  1,
  'Event-Driven Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event-Driven Architecture</title>
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
  <h1>Event-Driven Architecture</h1>
  <p>In an event-driven system, components do not call each other directly — they <em>react</em> to events. AWS services emit events, and Lambda (or another consumer) runs code each time one arrives.</p>
  <h2>Common event sources for Lambda</h2>
  <table>
    <thead>
      <tr><th>Source</th><th>Example event</th></tr>
    </thead>
    <tbody>
      <tr><td>S3</td><td>An object is uploaded or deleted.</td></tr>
      <tr><td>API Gateway</td><td>An HTTP request hits your API.</td></tr>
      <tr><td>SQS</td><td>A message arrives in a queue.</td></tr>
      <tr><td>SNS</td><td>A notification is published to a topic.</td></tr>
      <tr><td>EventBridge</td><td>A scheduled event or AWS service change.</td></tr>
      <tr><td>DynamoDB Streams</td><td>An item is created or modified.</td></tr>
    </tbody>
  </table>
  <h2>React to an S3 upload</h2>
  <pre class="code-block">def handler(event, context):
    for record in event["Records"]:
        bucket = record["s3"]["bucket"]["name"]
        key = record["s3"]["object"]["key"]
        print("New object:", bucket, key)
    return {"statusCode": 200}</pre>
  <h2>Decoupling with queues</h2>
  <p>Put work on an <span class="ic">SQS queue</span> and a Lambda function drains it at its own pace. The producer never waits, and bursts are absorbed automatically — the queue is the shock absorber.</p>
  <pre class="code-block">aws sqs send-message \
  --queue-url https://sqs.us-east-1.amazonaws.com/1234/my-queue \
  --message-body "process this file"</pre>
  <div class="callout callout-info">
    <strong>At-least-once delivery</strong>
    <p>Event sources may deliver an event more than once. Make handlers idempotent — running twice should produce the same result.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Design pattern</strong>
    <p>Use EventBridge to watch for changes across many AWS services and fan them out to Grand Calls. One rule can trigger Lambda, SQS, and SNS simultaneously.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000415',
  '70000000-0000-4000-8000-000000000322',
  1,
  'Monitoring with CloudWatch',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monitoring with CloudWatch</title>
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
  <h1>Monitoring with CloudWatch</h1>
  <p>You cannot manage what you cannot measure. <span class="ic">Amazon CloudWatch</span> collects metrics, logs, and events from almost every AWS service — then alerts you when something goes wrong.</p>
  <h2>The CloudWatch toolset</h2>
  <table>
    <thead>
      <tr><th>Feature</th><th>Use it for</th></tr>
    </thead>
    <tbody>
      <tr><td>Metrics</td><td>CPU, memory, latency, error counts by default.</td></tr>
      <tr><td>Alarms</td><td>React when a metric crosses a threshold.</td></tr>
      <tr><td>Logs</td><td>Collect, search, and analyze application logs.</td></tr>
      <tr><td>Logs Insights</td><td>Query logs with a SQL-like language.</td></tr>
      <tr><td>Dashboards</td><td>Visualize many metrics on one screen.</td></tr>
    </tbody>
  </table>
  <h2>Create an alarm</h2>
  <pre class="code-block">aws cloudwatch put-metric-alarm \
  --alarm-name HighCPU \
  --alarm-description "Alert when CPU exceeds 80 percent" \
  --metric-name CPUUtilization --namespace AWS/EC2 \
  --statistic Average --period 300 --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 2</pre>
  <p>When the alarm enters <span class="ic">ALARM</span> state it can publish to SNS, run an autoscaling action, or trigger Lambda for automated fixes.</p>
  <h2>Important EC2 metrics</h2>
  <ul>
    <li><strong>CPUUtilization</strong> — how busy the CPU is.</li>
    <li><strong>NetworkIn / NetworkOut</strong> — traffic volume.</li>
    <li><strong>StatusCheckFailed</strong> — instance and system health.</li>
    <li><strong>Memory usage</strong> — requires the CloudWatch agent.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Pick the right resolution</strong>
    <p>Standard EC2 metrics arrive every 5 minutes; detailed monitoring every 1 minute (at an extra cost). Choose detail where you need fast reaction.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Beyond basics</strong>
    <p>Install the CloudWatch agent on EC2 to stream memory and disk metrics, then alarm on the same dashboard as everything else.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000416',
  '70000000-0000-4000-8000-000000000323',
  1,
  'Pricing Models & Cost Optimization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pricing Models &amp; Cost Optimization</title>
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
  <h1>Pricing Models &amp; Cost Optimization</h1>
  <p>AWS charges you per usage, but you have control over how that meter ticks. Understanding pricing models and cost tools keeps your bill predictable and low.</p>
  <h2>Three ways to pay for compute</h2>
  <table>
    <thead>
      <tr><th>Model</th><th>Trade-off</th></tr>
    </thead>
    <tbody>
      <tr><td>On-Demand</td><td>Maximum flexibility, highest price.</td></tr>
      <tr><td>Reserved / Savings Plans</td><td>Commit 1–3 years for big discounts.</td></tr>
      <tr><td>Spot</td><td>Cheapest, but capacity can be reclaimed.</td></tr>
    </tbody>
  </table>
  <h2>The AWS Free Tier</h2>
  <p>New accounts get a limited free allowance for 12 months, including 750 hours of EC2, 5 GB of S3 storage, and 1M Lambda requests. Perfect for this course — read the includes carefully.</p>
  <h2>Cost tools</h2>
  <pre class="code-block">aws ce get-cost-and-usage \
  --time-period Start=2026-01-01,End=2026-02-01 \
  --granularity MONTHLY \
  --metrics BlendedCost</pre>
  <p><strong>Cost Explorer</strong> visualizes spend; <strong>Budgets</strong> alert you when you cross a threshold; <strong>Cost Anomaly Detection</strong> flags unexpected jumps.</p>
  <h2>Five quick wins</h2>
  <ol>
    <li>Turn off dev instances outside work hours.</li>
    <li>Rightsize — the t3.micro may be all you need.</li>
    <li>Move cold data to cheaper S3 classes.</li>
    <li>Prefer managed services (no OS to patch).</li>
    <li>Set a budget the first week — do not discover costs in month three.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Prudent tenet</strong>
    <p>AWS prices per second, but your commitment decisions compound. A 3-year Reserved Instance is a lock-in — buy it only for workloads you know will run.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use the Pricing Calculator before you build anything. The 10 minutes spent estimating beats a shocking first invoice every time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000417',
  '70000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Planning & Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Planning &amp; Setup</title>
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
  <h1>Capstone: Planning &amp; Setup</h1>
  <p>Time to build. Your capstone is a <strong>static website hosted on Amazon S3</strong> — no EC2, no server, just a bucket serving HTML, CSS, and images to the world. It is the classic "serverless website" every AWS beginner should ship.</p>
  <h2>What you will build</h2>
  <ul>
    <li>An <span class="ic">index.html</span> homepage with your profile.</li>
    <li>A <span class="ic">styles.css</span> file for a clean design.</li>
    <li>Optional images and a <span class="ic">404.html</span> page.</li>
    <li>A publicly accessible bucket with a bucket policy.</li>
  </ul>
  <h2>Architecture at a glance</h2>
  <pre class="code-block">Browser
   ↓  (HTTPS / HTTP)
Amazon S3 bucket (static website hosting)
   ↓
index.html + styles.css + images</pre>
  <h2>Setup checklist</h2>
  <table>
    <thead>
      <tr><th>Step</th><th>Action</th></tr>
    </thead>
    <tbody>
      <tr><td>1</td><td>Create an AWS account (or reuse one).</td></tr>
      <tr><td>2</td><td>Pick a Region close to you.</td></tr>
      <tr><td>3</td><td>Choose a globally unique bucket name.</td></tr>
      <tr><td>4</td><td>Create the files locally before uploading.</td></tr>
    </tbody>
  </table>
  <pre class="code-block">aws s3 mb s3://my-aws-capstone-site</pre>
  <div class="callout callout-info">
    <strong>Not everything is serverless</strong>
    <p>S3 static hosting is perfect for content that changes rarely. If you need forms, logins, or dynamic pages, you will add Lambda and API Gateway later.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Naming matters</strong>
    <p>Bucket names are public and globally unique — the internet can see them. Choose something professional like <span class="ic">yourname-portfolio</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000418',
  '70000000-0000-4000-8000-000000000326',
  1,
  'Building the Static Site',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Static Site</title>
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
  <h1>Building the Static Site</h1>
  <p>With the bucket ready, you create the files locally, enable <strong>static website hosting</strong>, and upload. S3 does the rest.</p>
  <h2>Create the files</h2>
  <pre class="code-block">my-aws-capstone-site/
├── index.html
├── styles.css
└── images/
    └── profile.jpg</pre>
  <p>A minimal <span class="ic">index.html</span>:</p>
  <pre class="code-block">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;meta name="viewport" content="width=device-width"&gt;
  &lt;title&gt;My AWS Capstone&lt;/title&gt;
  &lt;link rel="stylesheet" href="styles.css"&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;main&gt;
    &lt;h1&gt;Hello, I build on AWS!&lt;/h1&gt;
    &lt;p&gt;Welcome to my cloud-hosted website.&lt;/p&gt;
  &lt;/main&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
  <h2>Enable static website hosting</h2>
  <pre class="code-block">aws s3 website s3://my-aws-capstone-site/ \
  --index-document index.html \
  --error-document 404.html</pre>
  <p>This activates the website endpoint: <span class="ic">http://my-aws-capstone-site.s3-website-us-east-1.amazonaws.com</span> — not to be confused with the REST API endpoint. One serves pages, the other serves API calls.</p>
  <div class="callout callout-info">
    <strong>Two endpoints</strong>
    <p>S3 exposes a REST endpoint (<span class="ic">s3.amazonaws.com</span>) and a website endpoint (<span class="ic">s3-website-region.amazonaws.com</span>). Static hosting uses the website endpoint.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test locally first</strong>
    <p>Open <span class="ic">index.html</span> in a browser on your machine before uploading. Fixing mistakes locally is faster than round-tripping through AWS.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '70000000-0000-4000-8000-000000000419',
  '70000000-0000-4000-8000-000000000327',
  1,
  'Deploying & Polishing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deploying &amp; Polishing</title>
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
  <h1>Deploying &amp; Polishing</h1>
  <p>Your site is built locally — now upload it, open it to the public safely, and add the finishing touches that make it feel like the real cloud product you planned.</p>
  <h2>Upload the files</h2>
  <pre class="code-block">aws s3 sync ./my-aws-capstone-site s3://my-aws-capstone-site</pre>
  <p><span class="ic">s3 sync</span> uploads only changed files — perfect for iterative deploys. Re-run it after every edit.</p>
  <h2>Make it public with a bucket policy</h2>
  <pre class="code-block">{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-aws-capstone-site/*"
    }
  ]
}</pre>
  <p>This allows anyone to read objects (the website) while keeping write access with your IAM credentials.</p>
  <h2>Verify the deployment</h2>
  <pre class="code-block">aws s3 ls s3://my-aws-capstone-site
curl http://my-aws-capstone-site.s3-website-us-east-1.amazonaws.com</pre>
  <h2>Polish options</h2>
  <table>
    <thead>
      <tr><th>Improvement</th><th>How</th></tr>
    </thead>
    <tbody>
      <tr><td>Custom domain</td><td>Route 53 record pointing to the bucket.</td></tr>
      <tr><td>HTTPS</td><td>CloudFront in front of the bucket with SSL.</td></tr>
      <tr><td>Faster loads</td><td>CloudFront edge caching and compressed images.</td></tr>
      <tr><td>Safety net</td><td>Turn on versioning to recover overwritten files.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Keep the bucket private to writes</strong>
    <p>The policy above grants read to everyone, but only your IAM identity (or CLI credentials) can upload. Never give public write access.</p>
  </div>
  <div class="callout callout-tip">
    <strong>You shipped it</strong>
    <p>You just deployed a live website on S3 — using everything from IAM to CLI to storage classes. Add your own pages, re-run <span class="ic">s3 sync</span>, and take the final assessment.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (502) · Q3 → L9 (503) · Q4 → L12 (504)
--    Q5 → L15 (505)  · Q6 → L18 (506) · Q7 → L21 (507) · Q8 → L24 (508)
--    Q9 → L28 (509)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('70000000-0000-4000-8000-000000000501', '70000000-0000-4000-8000-000000000303',
   'What does AWS stand for?',
   'AWS expands to Amazon Web Services, the cloud platform this course teaches.', 1),
  ('70000000-0000-4000-8000-000000000502', '70000000-0000-4000-8000-000000000303',
   'Which characteristic of cloud computing lets you scale resources up and down automatically?',
   'Rapid elasticity allows resources to grow and shrink on demand, often automatically.', 2),
  ('70000000-0000-4000-8000-000000000503', '70000000-0000-4000-8000-000000000303',
   'Under the shared responsibility model, who secures the physical data centers?',
   'AWS secures the physical infrastructure; customers secure their data and configurations.', 3),
  ('70000000-0000-4000-8000-000000000504', '70000000-0000-4000-8000-000000000306',
   'What is an Availability Zone?',
   'An Availability Zone is a group of isolated data centers within a Region.', 1),
  ('70000000-0000-4000-8000-000000000505', '70000000-0000-4000-8000-000000000306',
   'Which IAM entity provides temporary credentials to an AWS service?',
   'Roles are assumed by services and issue short-lived credentials automatically.', 2),
  ('70000000-0000-4000-8000-000000000506', '70000000-0000-4000-8000-000000000306',
   'Which of the following is the recommended first action when creating a new AWS account?',
   'Secure the root account with MFA and create an admin user instead of using root daily.', 3),
  ('70000000-0000-4000-8000-000000000507', '70000000-0000-4000-8000-000000000309',
   'Which service provides resizable virtual servers in the cloud?',
   'Amazon EC2 provides the resizable virtual machines known as instances.', 1),
  ('70000000-0000-4000-8000-000000000508', '70000000-0000-4000-8000-000000000309',
   'What is an Amazon Machine Image (AMI)?',
   'An AMI is a template containing the OS and configuration used to launch an instance.', 2),
  ('70000000-0000-4000-8000-000000000509', '70000000-0000-4000-8000-000000000309',
   'Which EC2 pricing option offers the largest discount for interruptible workloads?',
   'Spot Instances offer the deepest discounts on spare capacity, but the instance can be reclaimed.', 3),
  ('70000000-0000-4000-8000-000000000510', '70000000-0000-4000-8000-000000000312',
   'What is the fundamental container for objects in Amazon S3?',
   'A bucket is the container that holds objects, with a globally unique name.', 1),
  ('70000000-0000-4000-8000-000000000511', '70000000-0000-4000-8000-000000000312',
   'Which S3 feature preserves every version of an object so you can recover overwrites?',
   'Versioning keeps old versions of each object and makes deletions recoverable.', 2),
  ('70000000-0000-4000-8000-000000000512', '70000000-0000-4000-8000-000000000312',
   'Which S3 storage class is best for rarely accessed archive data at the lowest cost?',
   'S3 Glacier and Glacier Deep Archive store archival data at the lowest cost with slower retrieval.', 3),
  ('70000000-0000-4000-8000-000000000513', '70000000-0000-4000-8000-000000000315',
   'Which AWS service is a fully managed relational database service?',
   'Amazon RDS provisions and manages relational databases such as MySQL and PostgreSQL.', 1),
  ('70000000-0000-4000-8000-000000000514', '70000000-0000-4000-8000-000000000315',
   'Which feature of RDS provides automatic failover to a synchronous standby?',
   'Multi-AZ keeps a standby in another AZ and fails over automatically.', 2),
  ('70000000-0000-4000-8000-000000000515', '70000000-0000-4000-8000-000000000315',
   'What determines which partition stores an item in DynamoDB?',
   'The partition key decides the physical partition for each item.', 3),
  ('70000000-0000-4000-8000-000000000516', '70000000-0000-4000-8000-000000000318',
   'Which component connects a public subnet to the internet?',
   'An internet gateway provides the route between a public subnet and the internet.', 1),
  ('70000000-0000-4000-8000-000000000517', '70000000-0000-4000-8000-000000000318',
   'What does a CIDR block define for a VPC?',
   'A CIDR block defines the private IP address range the VPC can use.', 2),
  ('70000000-0000-4000-8000-000000000518', '70000000-0000-4000-8000-000000000318',
   'Which is true about security groups compared with network ACLs?',
   'Security groups are stateful and allow-only; network ACLs are stateless and support deny rules.', 3),
  ('70000000-0000-4000-8000-000000000519', '70000000-0000-4000-8000-000000000321',
   'Which AWS service runs your code without provisioning servers?',
   'AWS Lambda executes functions on demand and scales automatically with no servers to manage.', 1),
  ('70000000-0000-4000-8000-000000000520', '70000000-0000-4000-8000-000000000321',
   'Which of the following can directly trigger a Lambda function?',
   'Event sources like API Gateway, S3, SQS, SNS, and EventBridge all can trigger Lambda.', 2),
  ('70000000-0000-4000-8000-000000000521', '70000000-0000-4000-8000-000000000321',
   'What is the maximum timeout for a single AWS Lambda function by default?',
   'By default a Lambda function times out after 3 seconds (configurable up to 15 minutes).', 3),
  ('70000000-0000-4000-8000-000000000522', '70000000-0000-4000-8000-000000000324',
   'Which AWS service collects metrics and logs from your resources?',
   'Amazon CloudWatch gathers metrics, logs, and events and powers alarms and dashboards.', 1),
  ('70000000-0000-4000-8000-000000000523', '70000000-0000-4000-8000-000000000324',
   'Which pricing model charges per-second usage with no upfront commitment?',
   'On-Demand pricing bills for what you use with no upfront payment or long-term commitment.', 2),
  ('70000000-0000-4000-8000-000000000524', '70000000-0000-4000-8000-000000000324',
   'Which AWS tool alerts you when your spending crosses a threshold you set?',
   'AWS Budgets notifies you when actual or forecast usage exceeds the budget amount.', 3),
  ('70000000-0000-4000-8000-000000000525', '70000000-0000-4000-8000-000000000328',
   'Which AWS service is ideal for hosting a static website?',
   'Amazon S3 static website hosting serves HTML, CSS, and images without servers.', 1),
  ('70000000-0000-4000-8000-000000000526', '70000000-0000-4000-8000-000000000328',
   'Which action do you take to make S3 objects readable by the public for your website?',
   'Attach a bucket policy granting s3:GetObject with Principal "*" for the bucket.', 2),
  ('70000000-0000-4000-8000-000000000527', '70000000-0000-4000-8000-000000000328',
   'Which service provides a content delivery network with edge locations?',
   'Amazon CloudFront caches content at edge locations to reduce latency globally.', 3),
  ('70000000-0000-4000-8000-000000000528', '70000000-0000-4000-8000-000000000328',
   'Where does the icon of the AWS console live that manages users and permissions?',
   'IAM is the service that manages users, groups, roles, and policies.', 4),
  ('70000000-0000-4000-8000-000000000529', '70000000-0000-4000-8000-000000000328',
   'Which EC2 pricing model is best for fault-tolerant batch workloads that can tolerate interruption?',
   'Spot Instances buy spare capacity at a large discount for fault-tolerant jobs.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the first listed (position of the correct
--    answer) varies. Correct answers are flagged with is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096
--    Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): What does AWS stand for?
  ('70000000-0000-4000-8000-000000001001', '70000000-0000-4000-8000-000000000501', 'Amazon Web Services', TRUE,  1),
  ('70000000-0000-4000-8000-000000001002', '70000000-0000-4000-8000-000000000501', 'Advanced Web Systems', FALSE, 2),
  ('70000000-0000-4000-8000-000000001003', '70000000-0000-4000-8000-000000000501', 'Applied Web Solutions', FALSE, 3),
  ('70000000-0000-4000-8000-000000001004', '70000000-0000-4000-8000-000000000501', 'Automated Workflow Services', FALSE, 4),
  -- Q1 (501)q2: rapid elasticity
  ('70000000-0000-4000-8000-000000001005', '70000000-0000-4000-8000-000000000502', 'Rapid elasticity', TRUE,  1),
  ('70000000-0000-4000-8000-000000001006', '70000000-0000-4000-8000-000000000502', 'Fixed capacity planning', FALSE, 2),
  ('70000000-0000-4000-8000-000000001007', '70000000-0000-4000-8000-000000000502', 'Manual provisioning', FALSE, 3),
  ('70000000-0000-4000-8000-000000001008', '70000000-0000-4000-8000-000000000502', 'Vendor lock-in', FALSE, 4),
  -- Q1 (501)q3: shared responsibility data centers
  ('70000000-0000-4000-8000-000000001009', '70000000-0000-4000-8000-000000000503', 'AWS', TRUE,  1),
  ('70000000-0000-4000-8000-000000001010', '70000000-0000-4000-8000-000000000503', 'The customer', FALSE, 2),
  ('70000000-0000-4000-8000-000000001011', '70000000-0000-4000-8000-000000000503', 'A third-party auditor', FALSE, 3),
  ('70000000-0000-4000-8000-000000001012', '70000000-0000-4000-8000-000000000503', 'Both equally', FALSE, 4),
  -- Q2 (504): Availability Zone
  ('70000000-0000-4000-8000-000000001013', '70000000-0000-4000-8000-000000000504', 'A group of isolated data centers within a Region', TRUE,  1),
  ('70000000-0000-4000-8000-000000001014', '70000000-0000-4000-8000-000000000504', 'A single physical server', FALSE, 2),
  ('70000000-0000-4000-8000-000000001015', '70000000-0000-4000-8000-000000000504', 'A global edge location', FALSE, 3),
  ('70000000-0000-4000-8000-000000001016', '70000000-0000-4000-8000-000000000504', 'A content delivery network', FALSE, 4),
  -- Q2 (504)q2: roles
  ('70000000-0000-4000-8000-000000001017', '70000000-0000-4000-8000-000000000505', 'Role', TRUE,  1),
  ('70000000-0000-4000-8000-000000001018', '70000000-0000-4000-8000-000000000505', 'Group', FALSE, 2),
  ('70000000-0000-4000-8000-000000001019', '70000000-0000-4000-8000-000000000505', 'Service control policy', FALSE, 3),
  ('70000000-0000-4000-8000-000000001020', '70000000-0000-4000-8000-000000000505', 'Access key', FALSE, 4),
  -- Q2 (504)q3: root account best practice
  ('70000000-0000-4000-8000-000000001021', '70000000-0000-4000-8000-000000000506', 'Secure root with MFA and create an admin user', TRUE,  1),
  ('70000000-0000-4000-8000-000000001022', '70000000-0000-4000-8000-000000000506', 'Share the root password with the whole team', FALSE, 2),
  ('70000000-0000-4000-8000-000000001023', '70000000-0000-4000-8000-000000000506', 'Use root for every daily task', FALSE, 3),
  ('70000000-0000-4000-8000-000000001024', '70000000-0000-4000-8000-000000000506', 'Disable MFA to speed up login', FALSE, 4),
  -- Q3 (507): EC2 servers
  ('70000000-0000-4000-8000-000000001025', '70000000-0000-4000-8000-000000000507', 'Amazon EC2', TRUE,  1),
  ('70000000-0000-4000-8000-000000001026', '70000000-0000-4000-8000-000000000507', 'Amazon S3', FALSE, 2),
  ('70000000-0000-4000-8000-000000001027', '70000000-0000-4000-8000-000000000507', 'AWS Lambda', FALSE, 3),
  ('70000000-0000-4000-8000-000000001028', '70000000-0000-4000-8000-000000000507', 'Amazon RDS', FALSE, 4),
  -- Q3 (507)q2: AMI
  ('70000000-0000-4000-8000-000000001029', '70000000-0000-4000-8000-000000000508', 'A template with the OS and configuration', TRUE,  1),
  ('70000000-0000-4000-8000-000000001030', '70000000-0000-4000-8000-000000000508', 'A network access list', FALSE, 2),
  ('70000000-0000-4000-8000-000000001031', '70000000-0000-4000-8000-000000000508', 'A backup of the VPC', FALSE, 3),
  ('70000000-0000-4000-8000-000000001032', '70000000-0000-4000-8000-000000000508', 'A billing report', FALSE, 4),
  -- Q3 (507)q3: spot instances
  ('70000000-0000-4000-8000-000000001033', '70000000-0000-4000-8000-000000000509', 'Spot Instances', TRUE,  1),
  ('70000000-0000-4000-8000-000000001034', '70000000-0000-4000-8000-000000000509', 'On-Demand Instances', FALSE, 2),
  ('70000000-0000-4000-8000-000000001035', '70000000-0000-4000-8000-000000000509', 'Dedicated Instances', FALSE, 3),
  ('70000000-0000-4000-8000-000000001036', '70000000-0000-4000-8000-000000000509', 'Reserved Instances', FALSE, 4),
  -- Q4 (510): S3 container
  ('70000000-0000-4000-8000-000000001037', '70000000-0000-4000-8000-000000000510', 'Bucket', TRUE,  1),
  ('70000000-0000-4000-8000-000000001038', '70000000-0000-4000-8000-000000000510', 'Volume', FALSE, 2),
  ('70000000-0000-4000-8000-000000001039', '70000000-0000-4000-8000-000000000510', 'Snapshot', FALSE, 3),
  ('70000000-0000-4000-8000-000000001040', '70000000-0000-4000-8000-000000000510', 'Cluster', FALSE, 4),
  -- Q4 (510)q2: versioning
  ('70000000-0000-4000-8000-000000001041', '70000000-0000-4000-8000-000000000511', 'Versioning', TRUE,  1),
  ('70000000-0000-4000-8000-000000001042', '70000000-0000-4000-8000-000000000511', 'Lifecycle rules', FALSE, 2),
  ('70000000-0000-4000-8000-000000001043', '70000000-0000-4000-8000-000000000511', 'Static website hosting', FALSE, 3),
  ('70000000-0000-4000-8000-000000001044', '70000000-0000-4000-8000-000000000511', 'Transfer acceleration', FALSE, 4),
  -- Q4 (510)q3: glacier
  ('70000000-0000-4000-8000-000000001045', '70000000-0000-4000-8000-000000000512', 'S3 Glacier', TRUE,  1),
  ('70000000-0000-4000-8000-000000001046', '70000000-0000-4000-8000-000000000512', 'S3 Standard', FALSE, 2),
  ('70000000-0000-4000-8000-000000001047', '70000000-0000-4000-8000-000000000512', 'S3 Intelligent-Tiering', FALSE, 3),
  ('70000000-0000-4000-8000-000000001048', '70000000-0000-4000-8000-000000000512', 'S3 One Zone-IA', FALSE, 4),
  -- Q5 (513): RDS
  ('70000000-0000-4000-8000-000000001049', '70000000-0000-4000-8000-000000000513', 'Amazon RDS', TRUE,  1),
  ('70000000-0000-4000-8000-000000001050', '70000000-0000-4000-8000-000000000513', 'Amazon S3', FALSE, 2),
  ('70000000-0000-4000-8000-000000001051', '70000000-0000-4000-8000-000000000513', 'Amazon CloudFront', FALSE, 3),
  ('70000000-0000-4000-8000-000000001052', '70000000-0000-4000-8000-000000000513', 'AWS Lambda', FALSE, 4),
  -- Q5 (513)q2: Multi-AZ
  ('70000000-0000-4000-8000-000000001053', '70000000-0000-4000-8000-000000000514', 'Multi-AZ', TRUE,  1),
  ('70000000-0000-4000-8000-000000001054', '70000000-0000-4000-8000-000000000514', 'Read replicas', FALSE, 2),
  ('70000000-0000-4000-8000-000000001055', '70000000-0000-4000-8000-000000000514', 'Auto-scaling groups', FALSE, 3),
  ('70000000-0000-4000-8000-000000001056', '70000000-0000-4000-8000-000000000514', 'Snapshot shipping', FALSE, 4),
  -- Q5 (513)q3: partition key
  ('70000000-0000-4000-8000-000000001057', '70000000-0000-4000-8000-000000000515', 'Partition key', TRUE,  1),
  ('70000000-0000-4000-8000-000000001058', '70000000-0000-4000-8000-000000000515', 'Sort key', FALSE, 2),
  ('70000000-0000-4000-8000-000000001059', '70000000-0000-4000-8000-000000000515', 'Secondary index', FALSE, 3),
  ('70000000-0000-4000-8000-000000001060', '70000000-0000-4000-8000-000000000515', 'Stream record', FALSE, 4),
  -- Q6 (516): internet gateway
  ('70000000-0000-4000-8000-000000001061', '70000000-0000-4000-8000-000000000516', 'Internet gateway', TRUE,  1),
  ('70000000-0000-4000-8000-000000001062', '70000000-0000-4000-8000-000000000516', 'Network ACL', FALSE, 2),
  ('70000000-0000-4000-8000-000000001063', '70000000-0000-4000-8000-000000000516', 'VPN connection', FALSE, 3),
  ('70000000-0000-4000-8000-000000001064', '70000000-0000-4000-8000-000000000516', 'Subnet route', FALSE, 4),
  -- Q6 (516)q2: CIDR
  ('70000000-0000-4000-8000-000000001065', '70000000-0000-4000-8000-000000000517', 'The private IP range the VPC can use', TRUE,  1),
  ('70000000-0000-4000-8000-000000001066', '70000000-0000-4000-8000-000000000517', 'The instance type to launch', FALSE, 2),
  ('70000000-0000-4000-8000-000000001067', '70000000-0000-4000-8000-000000000517', 'The AWS Region name', FALSE, 3),
  ('70000000-0000-4000-8000-000000001068', '70000000-0000-4000-8000-000000000517', 'The billing currency', FALSE, 4),
  -- Q6 (516)q3: security groups vs NACLs
  ('70000000-0000-4000-8000-000000001069', '70000000-0000-4000-8000-000000000518', 'Security groups are stateful; NACLs are stateless', TRUE,  1),
  ('70000000-0000-4000-8000-000000001070', '70000000-0000-4000-8000-000000000518', 'Security groups are stateless; NACLs are stateful', FALSE, 2),
  ('70000000-0000-4000-8000-000000001071', '70000000-0000-4000-8000-000000000518', 'Both are stateless', FALSE, 3),
  ('70000000-0000-4000-8000-000000001072', '70000000-0000-4000-8000-000000000518', 'Both use deny by default', FALSE, 4),
  -- Q7 (519): Lambda
  ('70000000-0000-4000-8000-000000001073', '70000000-0000-4000-8000-000000000519', 'AWS Lambda', TRUE,  1),
  ('70000000-0000-4000-8000-000000001074', '70000000-0000-4000-8000-000000000519', 'Amazon EC2', FALSE, 2),
  ('70000000-0000-4000-8000-000000001075', '70000000-0000-4000-8000-000000000519', 'Amazon S3', FALSE, 3),
  ('70000000-0000-4000-8000-000000001076', '70000000-0000-4000-8000-000000000519', 'Amazon RDS', FALSE, 4),
  -- Q7 (519)q2: Lambda triggers
  ('70000000-0000-4000-8000-000000001077', '70000000-0000-4000-8000-000000000520', 'API Gateway', TRUE,  1),
  ('70000000-0000-4000-8000-000000001078', '70000000-0000-4000-8000-000000000520', 'Amazon Lightsail', FALSE, 2),
  ('70000000-0000-4000-8000-000000001079', '70000000-0000-4000-8000-000000000520', 'AWS Compute Optimizer', FALSE, 3),
  ('70000000-0000-4000-8000-000000001080', '70000000-0000-4000-8000-000000000520', 'Amazon WorkSpaces', FALSE, 4),
  -- Q7 (519)q3: Lambda timeout
  ('70000000-0000-4000-8000-000000001081', '70000000-0000-4000-8000-000000000521', '3 seconds', TRUE,  1),
  ('70000000-0000-4000-8000-000000001082', '70000000-0000-4000-8000-000000000521', '30 seconds', FALSE, 2),
  ('70000000-0000-4000-8000-000000001083', '70000000-0000-4000-8000-000000000521', '5 minutes', FALSE, 3),
  ('70000000-0000-4000-8000-000000001084', '70000000-0000-4000-8000-000000000521', '30 minutes', FALSE, 4),
  -- Q8 (522): CloudWatch
  ('70000000-0000-4000-8000-000000001085', '70000000-0000-4000-8000-000000000522', 'Amazon CloudWatch', TRUE,  1),
  ('70000000-0000-4000-8000-000000001086', '70000000-0000-4000-8000-000000000522', 'Amazon CloudFront', FALSE, 2),
  ('70000000-0000-4000-8000-000000001087', '70000000-0000-4000-8000-000000000522', 'AWS Config', FALSE, 3),
  ('70000000-0000-4000-8000-000000001088', '70000000-0000-4000-8000-000000000522', 'Amazon GuardDuty', FALSE, 4),
  -- Q8 (522)q2: on-demand pricing
  ('70000000-0000-4000-8000-000000001089', '70000000-0000-4000-8000-000000000523', 'On-Demand', TRUE,  1),
  ('70000000-0000-4000-8000-000000001090', '70000000-0000-4000-8000-000000000523', 'Reserved Instances', FALSE, 2),
  ('70000000-0000-4000-8000-000000001091', '70000000-0000-4000-8000-000000000523', 'Savings Plans', FALSE, 3),
  ('70000000-0000-4000-8000-000000001092', '70000000-0000-4000-8000-000000000523', 'Spot Instances', FALSE, 4),
  -- Q8 (522)q3: budgets
  ('70000000-0000-4000-8000-000000001093', '70000000-0000-4000-8000-000000000524', 'AWS Budgets', TRUE,  1),
  ('70000000-0000-4000-8000-000000001094', '70000000-0000-4000-8000-000000000524', 'AWS Trusted Advisor', FALSE, 2),
  ('70000000-0000-4000-8000-000000001095', '70000000-0000-4000-8000-000000000524', 'AWS Cost Explorer', FALSE, 3),
  ('70000000-0000-4000-8000-000000001096', '70000000-0000-4000-8000-000000000524', 'Amazon CloudWatch Logs', FALSE, 4),
  -- Q9 (525): static site hosting
  ('70000000-0000-4000-8000-000000001097', '70000000-0000-4000-8000-000000000525', 'Amazon S3', TRUE,  1),
  ('70000000-0000-4000-8000-000000001098', '70000000-0000-4000-8000-000000000525', 'Amazon RDS', FALSE, 2),
  ('70000000-0000-4000-8000-000000001099', '70000000-0000-4000-8000-000000000525', 'Amazon DynamicDB', FALSE, 3),
  ('70000000-0000-4000-8000-000000001100', '70000000-0000-4000-8000-000000000525', 'Amazon Simple Queue', FALSE, 4),
  -- Q9 (525)q2: bucket policy public read
  ('70000000-0000-4000-8000-000000001101', '70000000-0000-4000-8000-000000000526', 'Attach a bucket policy granting s3:GetObject to everyone', TRUE,  1),
  ('70000000-0000-4000-8000-000000001102', '70000000-0000-4000-8000-000000000526', 'Grant the world write permission', FALSE, 2),
  ('70000000-0000-4000-8000-000000001103', '70000000-0000-4000-8000-000000000526', 'Delete the bucket and recreate it', FALSE, 3),
  ('70000000-0000-4000-8000-000000001104', '70000000-0000-4000-8000-000000000526', 'Move the site to a private subnet', FALSE, 4),
  -- Q9 (525)q3: CloudFront
  ('70000000-0000-4000-8000-000000001105', '70000000-0000-4000-8000-000000000527', 'Amazon CloudFront', TRUE,  1),
  ('70000000-0000-4000-8000-000000001106', '70000000-0000-4000-8000-000000000527', 'Amazon CloudWatch', FALSE, 2),
  ('70000000-0000-4000-8000-000000001107', '70000000-0000-4000-8000-000000000527', 'Amazon Cloud9', FALSE, 3),
  ('70000000-0000-4000-8000-000000001108', '70000000-0000-4000-8000-000000000527', 'AWS CodeCommit', FALSE, 4),
  -- Q9 (525)q4: IAM service
  ('70000000-0000-4000-8000-000000001109', '70000000-0000-4000-8000-000000000528', 'IAM', TRUE,  1),
  ('70000000-0000-4000-8000-000000001110', '70000000-0000-4000-8000-000000000528', 'S3', FALSE, 2),
  ('70000000-0000-4000-8000-000000001111', '70000000-0000-4000-8000-000000000528', 'EC2', FALSE, 3),
  ('70000000-0000-4000-8000-000000001112', '70000000-0000-4000-8000-000000000528', 'Lambda', FALSE, 4),
  -- Q9 (525)q5: spot instances
  ('70000000-0000-4000-8000-000000001113', '70000000-0000-4000-8000-000000000529', 'Spot Instances', TRUE,  1),
  ('70000000-0000-4000-8000-000000001114', '70000000-0000-4000-8000-000000000529', 'On-Demand Instances', FALSE, 2),
  ('70000000-0000-4000-8000-000000001115', '70000000-0000-4000-8000-000000000529', 'Reserved Instances', FALSE, 3),
  ('70000000-0000-4000-8000-000000001116', '70000000-0000-4000-8000-000000000529', 'Dedicated Hosts', FALSE, 4)
ON CONFLICT (id) DO NOTHING;