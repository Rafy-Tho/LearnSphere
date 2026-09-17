-- ============================================================================
-- SEED 050: Complete course — "Mobile UI/UX Design"
-- ----------------------------------------------------------------------------
-- Instructor : Marcus Johnson     (10000000-0000-4000-8000-000000000002)
-- Category   : Mobile Development (20000000-0000-4000-8000-000000000007)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Design Foundations        → C1 Understanding Mobile UX & UI · C2 Researching Mobile Users
--   M2 Structure & Concept       → C3 Information Architecture · C4 Wireframes & Prototypes
--   M3 Visual & Platform Design  → C5 Design Systems & Visual Style · C6 iOS & Android Patterns
--   M4 Interaction & Quality     → C7 Interaction Design · C8 Testing & Iteration
--   M5 Capstone: Habit App       → C9 Capstone Planning · C10 Capstone Build & Handoff
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
  '03200000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  '20000000-0000-4000-8000-000000000007',
  'Mobile UI/UX Design',
  'mobile-ui-ux-design',
  'Master mobile UI/UX design from first principles to handoff. Learn how UX and UI differ on mobile, research real users, organize information, wireframe and prototype, apply iOS and Android design patterns, and build accessible interfaces — then usability test and design a complete habit-tracking app from brief to shipped prototype.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  48
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03200000-0000-4000-8000-000000000011', '03200000-0000-4000-8000-000000000001', 'Explain the boundary between UX and UI and why mobile changes both disciplines.', 1),
  ('03200000-0000-4000-8000-000000000012', '03200000-0000-4000-8000-000000000001', 'Run user research and turn findings into personas and journey maps grounded in real mobile contexts.', 2),
  ('03200000-0000-4000-8000-000000000013', '03200000-0000-4000-8000-000000000001', 'Organize information with architecture and navigation patterns built for small touch screens.', 3),
  ('03200000-0000-4000-8000-000000000014', '03200000-0000-4000-8000-000000000001', 'Create wireframes, design systems, and platform-aware visual designs using iOS and Android patterns.', 4),
  ('03200000-0000-4000-8000-000000000015', '03200000-0000-4000-8000-000000000001', 'Prototype, usability test, and iterate a complete habit-tracking app from brief to developer handoff.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03200000-0000-4000-8000-000000000101', '03200000-0000-4000-8000-000000000001', 1, 'Design Foundations',          'Understand mobile UX and UI and how they differ from desktop and web design.', 'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000102', '03200000-0000-4000-8000-000000000001', 2, 'Structure & Concept',         'Organize information, wireframe layouts, and prototype interactions early.',   'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000103', '03200000-0000-4000-8000-000000000001', 3, 'Visual & Platform Design',    'Build design systems and apply iOS and Android platform patterns.',             'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000104', '03200000-0000-4000-8000-000000000001', 4, 'Interaction & Quality',      'Design gestures, motion, and accessibility, then test and iterate the product.', 'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000105', '03200000-0000-4000-8000-000000000001', 5, 'Capstone: Habit App',        'Design a complete habit-tracking app from brief to tested prototype and handoff.','PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03200000-0000-4000-8000-000000000201', '03200000-0000-4000-8000-000000000101', 1, 'Understanding Mobile UX & UI', 'Core concepts of user experience and interface design on small screens.',  'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000202', '03200000-0000-4000-8000-000000000101', 2, 'Researching Mobile Users',     'Research methods, personas, and journey maps for the mobile context.',      'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000203', '03200000-0000-4000-8000-000000000102', 1, 'Information Architecture',     'Organizing content and navigation for limited screen space.',                'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000204', '03200000-0000-4000-8000-000000000102', 2, 'Wireframes & Prototypes',     'Exploring layout and interaction before any visual design happens.',         'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000205', '03200000-0000-4000-8000-000000000103', 1, 'Design Systems & Visual Style','Components, tokens, color, type, and spacing that keep an app consistent.',   'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000206', '03200000-0000-4000-8000-000000000103', 2, 'iOS & Android Patterns',      'Native navigation and component patterns for both major platforms.',         'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000207', '03200000-0000-4000-8000-000000000104', 1, 'Interaction Design',          'Touch targets, gestures, motion, feedback, and accessibility.',              'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000208', '03200000-0000-4000-8000-000000000104', 2, 'Testing & Iteration',         'Usability testing, analytics, and feedback loops that improve the product.',  'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000209', '03200000-0000-4000-8000-000000000105', 1, 'Capstone Planning',           'Define the brief, target users, scope, and success metrics for the app.',     'PUBLISHED'),
  ('03200000-0000-4000-8000-000000000210', '03200000-0000-4000-8000-000000000105', 2, 'Capstone Build & Handoff',    'Design the flows, prototype, usability test, and prepare files for developers.','PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03200000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03200000-0000-4000-8000-000000000301', '03200000-0000-4000-8000-000000000201', 1, 'UX vs UI on Mobile',              'Understand the difference between user experience and user interface for mobile products.', 'TEXT', 'PUBLISHED', 'FREE', 10,  6),
  ('03200000-0000-4000-8000-000000000302', '03200000-0000-4000-8000-000000000201', 2, 'Why Mobile Design Differs',       'Explore the constraints and opportunities of designing for small touch screens.',          'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('03200000-0000-4000-8000-000000000303', '03200000-0000-4000-8000-000000000201', 3, 'Mobile UX & UI Basics Quiz',      'Check your understanding of mobile UX and UI fundamentals.',                              'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000304', '03200000-0000-4000-8000-000000000202', 1, 'User Research Methods',           'Choose and run the right methods to understand your mobile users.',                        'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000305', '03200000-0000-4000-8000-000000000202', 2, 'Personas & User Journeys',        'Turn research into personas and journey maps that guide every design decision.',           'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000306', '03200000-0000-4000-8000-000000000202', 3, 'User Research Quiz',              'Test your knowledge of research methods, personas, and journeys.',                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000307', '03200000-0000-4000-8000-000000000203', 1, 'Information Architecture',        'Organize content and features so users always find what they need.',                       'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000308', '03200000-0000-4000-8000-000000000203', 2, 'Mobile Navigation Patterns',      'Select navigation patterns that fit small screens and one-handed use.',                    'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000309', '03200000-0000-4000-8000-000000000203', 3, 'Information Architecture Quiz',   'Verify your ability to structure and navigate mobile apps.',                              'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000310', '03200000-0000-4000-8000-000000000204', 1, 'Wireframing for Mobile',          'Sketch low-fidelity layouts to explore space, hierarchy, and flow early.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000311', '03200000-0000-4000-8000-000000000204', 2, 'Prototyping',                    'Turn wireframes into interactive prototypes that behave like a real app.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000312', '03200000-0000-4000-8000-000000000204', 3, 'Wireframes & Prototyping Quiz',   'Check your wireframing and prototyping skills.',                                           'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000313', '03200000-0000-4000-8000-000000000205', 1, 'Design Systems for Mobile',       'Build reusable components and tokens that keep every screen consistent.',                  'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000314', '03200000-0000-4000-8000-000000000205', 2, 'Color, Typography & Spacing',     'Apply mobile-friendly color, type, and spacing that stay readable and usable.',            'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000315', '03200000-0000-4000-8000-000000000205', 3, 'Design Systems Quiz',             'Test your visual design and system knowledge.',                                             'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000316', '03200000-0000-4000-8000-000000000206', 1, 'iOS Design Patterns',             'Apply Apple Human Interface Guidelines to design native-feeling iOS apps.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000317', '03200000-0000-4000-8000-000000000206', 2, 'Android Design Patterns',         'Use Material Design patterns that work across the Android ecosystem.',                      'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000318', '03200000-0000-4000-8000-000000000206', 3, 'Platform Patterns Quiz',          'Check your iOS and Android platform knowledge.',                                            'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000319', '03200000-0000-4000-8000-000000000207', 1, 'Gestures, Touch & Motion',        'Design intuitive gestures, comfortable touch targets, and responsive feedback.',            'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000320', '03200000-0000-4000-8000-000000000207', 2, 'Accessibility & Inclusive Design','Make mobile apps usable by everyone, including assistive technology users.',                'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000321', '03200000-0000-4000-8000-000000000207', 3, 'Interaction & Accessibility Quiz','Verify your gesture and accessibility knowledge.',                                          'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000322', '03200000-0000-4000-8000-000000000208', 1, 'Mobile Usability Testing',        'Plan and run usability tests that surface real issues before launch.',                      'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03200000-0000-4000-8000-000000000323', '03200000-0000-4000-8000-000000000208', 2, 'Analytics & Design Iteration',    'Use metrics, experiments, and feedback loops to improve the product.',                      'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03200000-0000-4000-8000-000000000324', '03200000-0000-4000-8000-000000000208', 3, 'Testing & Iteration Quiz',        'Check your testing and iteration knowledge.',                                               'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03200000-0000-4000-8000-000000000325', '03200000-0000-4000-8000-000000000209', 1, 'Capstone: Design Brief & Planning','Define a habit-tracking concept, user base, scope, and success metrics.',                  'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03200000-0000-4000-8000-000000000326', '03200000-0000-4000-8000-000000000210', 1, 'Capstone: Flows & Screen Design','Design the full navigation flow and every screen of your habit app.',                      'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('03200000-0000-4000-8000-000000000327', '03200000-0000-4000-8000-000000000210', 2, 'Capstone: Prototype, Test & Handoff','Wire the prototype, run usability tests, and prepare files for developers.',              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03200000-0000-4000-8000-000000000328', '03200000-0000-4000-8000-000000000210', 3, 'Final Assessment',               'Prove your mastery of mobile UI/UX design across the whole course.',                        'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03200000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
--    Accent: violet — Mobile UI/UX Design.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03200000-0000-4000-8000-000000000401',
  '03200000-0000-4000-8000-000000000301',
  1,
  'UX vs UI on Mobile',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UX vs UI on Mobile</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>UX vs UI on Mobile</h1>
  <p>A mobile app succeeds when it is both <strong>useful</strong> and <strong>pleasant</strong>. Those two qualities map to two disciplines that people constantly confuse: <strong>user experience (UX)</strong> and <strong>user interface (UI)</strong>. Understanding the boundary — and how the boundary shifts on a phone — is the foundation of this course.</p>
  <h2>The two layers</h2>
  <p>User experience design owns the <em>entire journey</em>: who the user is, what they want to do, how the screens connect, what the app says while it loads, and what happens when something fails. User interface design owns the <em>visible, tactile surface</em>: layout, color, type, spacing, icons, buttons, and the states the surface shows.</p>
  <table>
    <tr><th>Layer</th><th>What it owns</th><th>Example decision</th></tr>
    <tr><td>UX</td><td>The end-to-end journey</td><td>Should checkout take one screen or five?</td></tr>
    <tr><td>UI</td><td>The visible surface</td><td>Which color makes the action unmissable?</td></tr>
  </table>
  <h2>Why mobile changes the balance</h2>
  <p>On a desktop browser a page can carry a lot of visual complexity and still work. On a phone the interface <em>is</em> the experience: one screen, one primary action, one thumb. A confusing icon and a broken flow both feel identically bad.</p>
  <ul>
    <li>The viewport is small, so hierarchy must be ruthless.</li>
    <li>Touch replaces the cursor, so targets need real size.</li>
    <li>Users are frequently interrupted, so state must be recoverable.</li>
  </ul>
  <div class="callout">
    <strong>Rule of thumb</strong>
    <p>Great UI makes a screen beautiful. Great UX makes the whole product obvious. An app needs both, but confused flows will kill a pretty UI every time.</p>
  </div>
  <pre class="code-block">A useful check for any mobile screen:

  1. Can a new user explain the page in five seconds?
  2. Is there exactly one primary action per screen?
  3. Can all key actions be reached with one thumb?
  4. Does the user always know what happened after touching?</pre>
  <h2>One team, two mindsets</h2>
  <p>On a product team, UX designers research and structure; UI designers craft the visual surface. In many mobile teams one person wears both hats. Either way the skills feed each other — decide an experience is wrong to see its UI defect, and polish a screen to expose a flow problem.</p>
  <div class="callout callout-tip">
    <strong>Mindset for this course</strong>
    <p>You will practice both. Early lessons build the UX toolkit (research, structure, flows); later lessons build the UI toolkit (systems, patterns, visuals); the capstone combines them into one shipped prototype.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000402',
  '03200000-0000-4000-8000-000000000302',
  1,
  'Why Mobile Design Differs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Mobile Design Differs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Why Mobile Design Differs</h1>
  <p>You cannot resize a desktop site and call it mobile design. A phone is a different <em>physical and behavioral context</em>: held in one hand, used for seconds at a time, out in sunlight, and surrounded by interruptions. Every one of those differences changes a design decision.</p>
  <h2>The five differences that matter</h2>
  <table>
    <tr><th>Constraint</th><th>Design consequence</th></tr>
    <tr><td>Small viewport</td><td>One idea per screen, progressive disclosure</td></tr>
    <tr><td>Touch input</td><td>Large targets, gestures, forgiving hit areas</td></tr>
    <tr><td>One-handed use</td><td>Primary actions in the thumb zone</td></tr>
    <tr><td>Short sessions</td><td>Fast task start, instant resume</td></tr>
    <tr><td>Unstable context</td><td>Reduce reliance on memory; keep state</td></tr>
  </table>
  <h2>Progressively disclose, never cascade</h2>
  <p>Desktop pages present many options at once; mobile screens should reveal complexity only when the user needs it. The pattern is called <strong>progressive disclosure</strong>: the surface shows the essentials, and detail appears on demand through taps, expandable sections, and separate screens.</p>
  <pre class="code-block">Desktop mentality:      Mobile mentality:
  everything visible      essentials first
  hover to reveal         tap to expand
  sidebar of options      bottom sheet on demand
  deep tree of menus      two taps to most tasks</pre>
  <h2>Attention is fragments, not sessions</h2>
  <p>The average phone session lasts a couple of minutes — sometimes seconds, often interrupted. Users return to the app repeatedly, so <strong>resumeability</strong> matters: remember filter choices, reopen on the last screen, and never force users to rebuild their state after a notification pull them away.</p>
  <ul>
    <li>Torch-free: keep the mental model small between visits.</li>
    <li>Autosave drafts and settings changes immediately.</li>
    <li>Support undo where an accidental tap is common.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Context of use</strong>
    <p>Mobile is where the person lives: standing in a queue, riding a bus, one-handed with coffee. Ask &ldquo;where is my user?&rdquo; for every screen, not just &ldquo;what does the user see?&rdquo;.</p>
  </div>
  <h2>Constraints are design material</h2>
  <p>Small screens do not just force cuts — they produce focus. Instagram hides complexity behind a plus button; your bank app fits eleven actions under one thumb. Treat every constraint as a chance to decide what truly matters.</p>
  <div class="callout callout-tip">
    <strong>Design for the interruptible moment</strong>
    <p>If a user must remember three things to finish a task, the phone wins. Break tasks into steps, surface progress, and always answer: where am I, what just happened, what can I do next?</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000404',
  '03200000-0000-4000-8000-000000000304',
  1,
  'User Research Methods',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Research Methods</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>User Research Methods</h1>
  <p>Designing without research is guessing with a nice grid. Research replaces opinions with evidence about what mobile users actually do, struggle with, and expect. The good news: you rarely need a big lab — a few well-chosen methods answer most questions.</p>
  <h2>Qualitative vs quantitative</h2>
  <p><strong>Qualitative</strong> research explains <em>why</em> people behave a certain way: interviews, diary studies, field observation, usability tests. <strong>Quantitative</strong> research measures <em>how much</em>: analytics, surveys, and A/B tests. Great teams use both — stories to generate hypotheses, numbers to confirm them.</p>
  <table>
    <tr><th>Method</th><th>Type</th><th>Best for</th></tr>
    <tr><td>One-on-one interviews</td><td>Qualitative</td><td>Attitudes, motivations, unmet needs</td></tr>
    <tr><td>Diary studies</td><td>Qualitative</td><td>Repeated mobile behaviors over time</td></tr>
    <tr><td>Think-aloud tests</td><td>Qualitative</td><td>Where a flow breaks and why</td></tr>
    <tr><td>Surveys</td><td>Quantitative</td><td>Priorities and preferences at scale</td></tr>
    <tr><td>Analytics</td><td>Quantitative</td><td>Actual behavior in the wild</td></tr>
  </table>
  <h2>Recruiting the right people</h2>
  <p>Screening for <strong>behavioral fit</strong> matters more than raw numbers. Five participants who genuinely track habits will teach you more than thirty who only think they might. Ask screening questions about the <em>actual task</em>, then invite the people whose behavior matches your target segment.</p>
  <div class="callout callout-info">
    <strong>The five-user myth</strong>
    <p>Five users saturate a usability study for one flow, but research questions — needs, habits, feature priorities — usually need more like 8 to 15 interviews before answers repeat.</p>
  </div>
  <h2>Asking better questions</h2>
  <pre class="code-block">Weak:      Would you use a reminder feature?
Better:    Walk me through what you did the last
           time you forgot to follow through.
Follow-up: What else was going on that day?
Follow-up: How did you feel right after?</pre>
  <p>Ask about the <em>past</em>, not hypotheticals. Users predict their future behavior badly but describe their past accurately. Keep questions open, and let silence do the work — users fill it with useful detail.</p>
  <div class="callout callout-tip">
    <strong>Thomas&rsquo;s research checklist</strong>
    <p>Define the question, recruit by behavior, pick one primary method, schedule 8–15 sessions, take notes verbatim, look for repeated patterns, and save everything. Patterns across people are your design input.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000405',
  '03200000-0000-4000-8000-000000000305',
  1,
  'Personas & User Journeys',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Personas & User Journeys</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Personas &amp; User Journeys</h1>
  <p>Raw research is messy. Two artifacts make it usable and shared: <strong>personas</strong>, which compress who you design for into memorable, grounded characters, and <strong>journey maps</strong>, which plot what those people experience over time. Both turn scattered notes into decisions.</p>
  <h2>Building a persona</h2>
  <p>A persona is not a stereotype or a fictional biography — it is a <em>research synthesis</em> clustered around real behavior. Build 2 to 3 of them, each named and sized by its share of your audience.</p>
  <pre class="code-block">Persona:  Maya, the Streak Keeper
Segment : Habit beginners (about 40%)
Context : Logs habits over coffee, one hand,
          before notifications distract her
Behavior: Thrives on streaks, reboots after
          one missed day, deletes and restarts
Goal    : A low-friction Monday-to-Friday rhythm
Frustration: Missing a day feels like total failure</pre>
  <div class="callout">
    <strong>Personas must be falsifiable</strong>
    <p>Ground every trait in a real quote or observation. If a teammate cannot trace a persona trait back to research, it is an assumption wearing a costume.</p>
  </div>
  <h2>Mapping the journey</h2>
  <p>A journey map walks one persona through a task across time, listing <strong>actions</strong>, <strong>thoughts</strong>, <strong>touchpoints</strong>, and <strong>emotion</strong> at each step. The dip in the emotion line is your goldmine: it shows exactly where to design.</p>
  <table>
    <tr><th>Step</th><th>Action</th><th>Touchpoint</th><th>Emotion</th></tr>
    <tr><td>Morning</td><td>Opens app from notification</td><td>Notification</td><td>Curious</td></tr>
    <tr><td>Logging</td><td>Finds the check-in control</td><td>Home screen</td><td>Annoyed — hidden</td></tr>
    <tr><td>Review</td><td>Sees streak and stats</td><td>Progress tab</td><td>Motivated</td></tr>
    <tr><td>Evening</td><td>Backfires on a missed day</td><td>Streak widget</td><td>Disappointed</td></tr>
  </table>
  <h2>The mobile journey is non-linear</h2>
  <p>Desktop journeys are often goal-directed: research, then buy. Mobile journeys fragment across the day — a notification start, a glance, a later return. Your journey map should reflect that rhythm, which is why <strong>diary studies</strong> pair so well with mapping.</p>
  <div class="callout callout-tip">
    <strong>Journeys drive requirements</strong>
    <p>Every red-emotion step is a design brief. Turn &ldquo;annoyed — hidden control&rdquo; into &ldquo;one primary action, thumb reach, on the home screen.&rdquo; Now you have a spec, not just a story.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000407',
  '03200000-0000-4000-8000-000000000307',
  1,
  'Information Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Information Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Information Architecture</h1>
  <p><strong>Information architecture (IA)</strong> is the invisible skeleton that decides whether users find things. It organizes content and features into groups, labels, and relationships. When IA is good, users never notice it; when it is bad, every screen feels like a wrong turn.</p>
  <h2>The mobile IA constraint</h2>
  <p>Desktop chrome can show many sections at once. A phone screen cannot, so mobile IA relies on <strong>reduced surface + clear mental model</strong>: fewer top-level groups, predictable naming, and depth of two to three screens to any goal.</p>
  <pre class="code-block">Deep, desktop tree:            Mobile depth:
  Home                          Home
  └─ Shop                       ├─ Today
     └─ Categories              ├─ Explore
        └─ Electronics          ├─ Activity
           └─ Headphones        └─ Profile
     (4+ taps to go deep)       (2 taps to most)
                                → groups collapse
                                → labels do the work</pre>
  <h2>Card sorting reveals mental models</h2>
  <p><strong>Card sorting</strong> asks participants to group and label features on cards. The clusters that repeat across people tell you how users naturally organize your product — use them to define sections, not your org chart.</p>
  <ol>
    <li>Write every feature or content type on a card.</li>
    <li>Ask participants to sort cards into groups and name the groups.</li>
    <li>Run 8–15 sorts; cluster the results.</li>
    <li>Derive top-level sections and their labels.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Labels are interface copy</strong>
    <p>&ldquo;Journey&rdquo; and &ldquo;Activity&rdquo; may organize the same data, but one matches the user and the other the product team. Validate labels with the same research you use for features.</p>
  </div>
  <h2>Designing a mobile sitemap</h2>
  <p>A sitemap states depth, grouping, and pathways before any screen is drawn. Keep each branch shallow, keep navigation global and persistent, and put the most frequent destination one tap away.</p>
  <div class="callout callout-tip">
    <strong>IA is a testable assumption</strong>
    <p>Run a &ldquo;find the object&rdquo; exercise: ask users where they would find a feature in your sitemap. If more than a fifth hesitate, the structure — not the screen — needs a change.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000408',
  '03200000-0000-4000-8000-000000000308',
  1,
  'Mobile Navigation Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mobile Navigation Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Mobile Navigation Patterns</h1>
  <p>Navigation is the thread users pull through your IA. Mobile offers a small set of battle-tested patterns; picking the right one matters more than styling it. The default should be <strong>bottom navigation</strong> — visible, reachable by the thumb, and habit-forming.</p>
  <h2>The core patterns</h2>
  <table>
    <tr><th>Pattern</th><th>Use when</th><th>Trade-off</th></tr>
    <tr><td>Bottom tab bar</td><td>3–5 top-level destinations</td><td>Discoverable, thumb-friendly</td></tr>
    <tr><td>Navigation drawer</td><td>Many destinations</td><td>Hides options; adds a swipe</td></tr>
    <tr><td>Top-level hamburger</td><td>Content surfaces</td><td>Weak discoverability</td></tr>
    <tr><td>Search-first</td><td>Content-heavy apps</td><td>Great for known items</td></tr>
    <tr><td>Back and hierarchical</td><td>Detail flows</td><td>Familiar; context lost on deep paths</td></tr>
  </table>
  <h2>Bottom navigation first</h2>
  <p>Research consistently shows bottom navigation outperforms top-left menus for frequent tasks: it is always visible, sits in the thumb zone, and trains the user to switch sections in one tap. Reserve it for your most important destinations and keep the count humble.</p>
  <pre class="code-block">Bottom tab bar — good:
  [Home] [Activity] [Statistics] [Profile]
  Always visible · Thumb reach · Max 5 items

Hamburger menu — use with care:
  =  Home
     Activity      ← hidden until tapped
     Statistics        (discoverability cost)
     Profile</pre>
  <div class="callout">
    <strong>Beware the app drawer antipattern</strong>
    <p>Flat header links on a phone hide every destination behind a menu. Use bottom tabs for the primary three to five sections and save drawers or stack navigation for secondary ones.</p>
  </div>
  <h2>Navigating inside a flow</h2>
  <p>Once users enter a task — filling a form, browsing a list — lean on the platform stack: a back control (or system back gesture), clear titles, and breadcrumb-like progress for multi-step forms. The user should always know where they are and how to retreat.</p>
  <div class="callout callout-tip">
    <strong>Match platform conventions</strong>
    <p>iOS users expect the back control top-left; Android users expect the system back. Design your flows to respect both, and your users will navigate without thinking about it — which is exactly the point.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000410',
  '03200000-0000-4000-8000-000000000310',
  1,
  'Wireframing for Mobile',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wireframing for Mobile</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Wireframing for Mobile</h1>
  <p>Before any color or icon, decide <strong>layout</strong>. Wireframes are low-fidelity blueprints that test structure: what sits where, what is bigger, what is clickable. On mobile the discipline sharpens because every misplaced element wastes precious vertical space.</p>
  <h2>Gray before glory</h2>
  <p>Wireframes use boxes, lines, and placeholder text. This is a feature: with no visual polish, reviewers must argue about <em>structure</em> instead of whether they like the green. Save aesthetics for later and make the skeleton survive a room of skeptics.</p>
  <pre class="code-block">Home screen wireframe (thumb-first):

  ┌──────────────────────────┐
  │ ⏰ Good morning, Maya     │  header: time + greeting
  │ Today 16 · Streak 12      │  status line
  ├──────────────────────────┤
  │ [+ What did you do today?]│  PRIMARY: big target
  ├──────────────────────────┤
  │ Check-in card (3 habits)  │  top content
  ├──────────────────────────┤
  │ Quote/slow moment         │  secondary content
  ├──────────────────────────┤
  │ [Home][Activity][Stats]   │  bottom tab bar</pre>
  <h2>The mobile wireframing rules</h2>
  <ul>
    <li>Draw on a <span class="ic">375 × 812</span> artboard (an iPhone class size) with realistic text length.</li>
    <li>Use an <strong>8-point grid</strong> for every margin and gap.</li>
    <li>Keep one primary action per screen and give it visual weight.</li>
    <li>Respect safe areas: status bar top, home indicator bottom.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Lo-fi vs hi-fi</strong>
    <p>Lo-fi (paper, gray boxes) is for exploring many ideas fast. Hi-fi wireframes add real text and refined spacing but still avoid color and imagery. Move from lo-fi to hi-fi only when structure is agreed.</p>
  </div>
  <h2>Wireframe to content</h2>
  <p>Use the real content length, not &ldquo;lorem ipsum&rdquo; that collapses into three words on a phone. A shrunk all-caps title and a 40-character paragraph behave very differently — placeholder text that is too short hides overflowing layouts.</p>
  <div class="callout callout-tip">
    <strong>Grid = consistency</strong>
    <p>Vertical rhythm from the 8-point grid means aligned cards, even breathing room, and identical spacing across screens. It also makes the later design-system work nearly free.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000411',
  '03200000-0000-4000-8000-000000000311',
  1,
  'Prototyping',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prototyping</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Prototyping</h1>
  <p>A prototype makes the design <em>behave</em>. Where a wireframe is a still photo, a prototype is the trailer: users tap, swipe, see feedback, and land on the next screen. Testing a prototype costs almost nothing compared to reworking shipped code.</p>
  <h2>Fidelity ladder</h2>
  <table>
    <tr><th>Level</th><th>What it tests</th><th>Tools</th></tr>
    <tr><td>Paper</td><td>Flow and layout</td><td>Pen, paper</td></tr>
    <tr><td>Clickable lo-fi</td><td>Navigation, hierarchy</td><td>Figma, Balsamiq</td></tr>
    <tr><td>High-fidelity</td><td>Interaction, visuals, motion</td><td>Figma, ProtoPie</td></tr>
    <tr><td>Working code</td><td>Performance, real data</td><td>React Native, Swift</td></tr>
  </table>
  <p>Jump as high as the question demands: testing whether the checkout flow works calls for lo-fi clickable; testing whether the onboarding <em>feels</em> right calls for high-fidelity with motion.</p>
  <h2>What to prototype on mobile</h2>
  <ul>
    <li><strong>User flows</strong> — every tap path from entry to completion.</li>
    <li><strong>Empty, loading, and error states</strong> — the design you forget until QA.</li>
    <li><strong>Gesture interactions</strong> — swipe to delete, pull to refresh, long press.</li>
    <li><strong>Transitions</strong> — how screens connect signals where users are.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Prototype on a real device</strong>
    <p>Download the prototype to a phone and let users hold it. Screen-only testing misses thumb reach, accidental touches, and the feel of the back gesture — all mobile realities.</p>
  </div>
  <h2>Design for the happy path first</h2>
  <pre class="code-block">Prototype order (capstone app):
  1. Happy path:  open → today → check in → streak up
  2. Secondary:   activity list → filter → detail
  3. Edge cases:  empty week, missed day, offline
  4. Admin/utility: settings → notifications</pre>
  <p>Prototyping forces you to enumerate every state a screen can be in. That enumeration is the single best source of developer requirements you will ever produce.</p>
  <div class="callout callout-tip">
    <strong>Every prototype is disposable</strong>
    <p>Do not fall in love. The point is to learn cheaply: if the flow fails in testing, redraw it. Wasted design moves are souvenirs; shipped broken flows are debt.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000413',
  '03200000-0000-4000-8000-000000000313',
  1,
  'Design Systems for Mobile',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Design Systems for Mobile</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Design Systems for Mobile</h1>
  <p>A <strong>design system</strong> is the single source of truth for your interface: tokens, components, and patterns that teams reuse instead of reinventing. On mobile, where repeated small elements dominate, a system is not a luxury — it is how an app stays consistent at scale.</p>
  <h2>Tokens first</h2>
  <p><strong>Design tokens</strong> are named primitive values: colors, spacing, radii, type sizes, motion durations. Screens never contain raw values like <span class="ic">#6D28D9</span> or <span class="ic">16</span>; they reference <span class="ic">color.brand.primary</span> and <span class="ic">spacing.md</span>. Change the token and the whole app follows.</p>
  <pre class="code-block">tokens.json (abridged):
  {
    "color": {
      "brand":   { "primary": "#6D28D9", "onPrimary": "#FFFFFF" },
      "surface": { "base": "#FFFFFF", "muted": "#F5F3FF" }
    },
    "spacing": { "sm": 8, "md": 16, "lg": 24 },
    "type":    { "size": { "body": 16, "title": 22 } },
    "radius":  { "card": 12, "pill": 24 }
  }</pre>
  <h2>Components with states</h2>
  <p>A component (button, card, input, sheet) is a token assembly with every <strong>state</strong> designed: default, pressed, focused, disabled, loading, and error. Mobile emphasizes the pressed state as immediate tactile feedback — it confirms the tap landed.</p>
  <div class="callout callout-info">
    <strong>Platform support in one system</strong>
    <p>Keep the core system shared, then adapt presentation per platform: iOS gets thicker iOS-style navigation, Android gets Material surfaces. One set of decisions, two platform skins.</p>
  </div>
  <h2>Dark mode is part of the system</h2>
  <p>Supporting dark mode is much cheaper if tokens carry light and dark values from the start. Query the system theme, swap tokens, and the whole app adapts — provided colors were tokenized, not hard-coded screen by screen.</p>
  <div class="callout callout-tip">
    <strong>Govern or decay</strong>
    <p>A system without owners rots. Assign a review step so new screens reuse components, and treat every one-off style as a bug in the system rather than a creative flourish.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000414',
  '03200000-0000-4000-8000-000000000314',
  1,
  'Color, Typography & Spacing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Color, Typography & Spacing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Color, Typography &amp; Spacing</h1>
  <p>Visual design is where an app starts to feel like a product. But on mobile, aesthetics must first survive three functional tests: <strong>contrast</strong> in sunlight, <strong>readability</strong> at small sizes, and <strong>touchability</strong> at real distances. Style that fails those fails everyone.</p>
  <h2>Color that works</h2>
  <p>Build a restrained palette: one brand color, neutrals, a semantic set for success, warning, and error, plus dark-mode counterparts. Contrast is a legal requirement of readability — body text needs a <strong>4.5:1</strong> ratio, large text <strong>3:1</strong> under WCAG.</p>
  <table>
    <tr><th>Role</th><th>Typical token</th><th>Usage</th></tr>
    <tr><td>Brand primary</td><td>#6D28D9</td><td>Primary actions, active tab</td></tr>
    <tr><td>On primary</td><td>#FFFFFF</td><td>Text on brand buttons</td></tr>
    <tr><td>Text primary</td><td>#111827</td><td>Headings and body</td></tr>
    <tr><td>Text muted</td><td>#6B7280</td><td>Captions, metadata</td></tr>
    <tr><td>Semantic error</td><td>#DC2626</td><td>Validation messages</td></tr>
  </table>
  <h2>Type for a phone</h2>
  <ul>
    <li>Prefer <strong>system fonts</strong> — they are tuned for the device, feel native, and load instantly.</li>
    <li>Keep body size at <span class="ic">16</span> points or larger; the eye compensates poorly below that.</li>
    <li>Limit line length to roughly <strong>45–60 characters</strong> so paragraphs stay restful.</li>
    <li>Use a type <strong>scale</strong> (body, caption, title, display) instead of inventing sizes ad hoc.</li>
  </ul>
  <h2>Spacing as rhythm</h2>
  <p>The <strong>8-point grid</strong> gives every gap a reason: margins and paddings in multiples of 8 (small screens may drop to 4 for dense lists). Consistent rhythm reads as calm; inconsistent spacing reads as random even if every color is lovely.</p>
  <pre class="code-block">8-point rhythm on a list screen:
  screen margin        16
  card padding         16
  gap between cards    12 (8 + half-step)
  section heading gap  24
  card corner radius   12
  touch target min     48</pre>
  <div class="callout callout-info">
    <strong>Real content check</strong>
    <p>Design type and spacing around the longest realistic string (&ldquo;Meditation streak saved&rdquo;), not the shortest. Truncation and wrapping are visual decisions — make them on purpose.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Dark mode checklist</strong>
    <p>Never invert blindly. Dark surfaces want desaturated accents, softer shadows, and slightly lower contrast ratios than pure black-on-white — your tokens should hold both palettes deliberately.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000416',
  '03200000-0000-4000-8000-000000000316',
  1,
  'iOS Design Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>iOS Design Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>iOS Design Patterns</h1>
  <p>Apple&rsquo;s <strong>Human Interface Guidelines</strong> (HIG) define the iOS vocabulary: navigation bars, tab bars, sheets, and a careful graphic language. iOS users have deep habits — respect them and the app feels native; break them and it feels foreign even if it looks pretty.</p>
  <h2>Navigation anatomy</h2>
  <p>iOS navigation centers on the <strong>navigation bar</strong> at the top (title, back control, actions) and the <strong>tab bar</strong> at the bottom for top-level sections. The back control appears automatically when you drill down; use it, and let the system back-swipe work too.</p>
  <pre class="code-block">iOS screen anatomy (top to bottom):
  ─ status bar (time, signal) ───────────
  ─ navigation bar:   Back | Title | + ───
  ─ content ─────────────────────────────
  ─ bottom:  tab bar  Home  Activity ────
  ─ home indicator / safe area ──────────

Touch target guidance: at least 44 × 44 pt.</pre>
  <h2>Signature components</h2>
  <table>
    <tr><th>Component</th><th>When it fits</th></tr>
    <tr><td>Tab bar</td><td>2–5 top-level destinations</td></tr>
    <tr><td>Navigation bar</td><td>Every pushed screen needs its title</td></tr>
    <tr><td>Action sheets</td><td>Choose among consequential actions</td></tr>
    <tr><td>Modals</td><td>Screens that end a task (compose, form)</td></tr>
    <tr><td>Context menus</td><td>Long-press power features</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Use system ingredients</strong>
    <p>SF Symbols for icons, the system typeface for text, system colors and materials — all adapt across devices, densities, and the user&rsquo;s accessibility settings at no extra effort. Custom everything costs support.</p>
  </div>
  <h2>Modal vs push decision</h2>
  <p>Push <strong>drills deeper</strong> into the hierarchy (detail, lists, forms that are part of the flow). Present <strong>modally</strong> to focus a self-contained task that the user must finish, cancel, or dismiss — composing a message, editing a profile, choosing a date for a habit.</p>
  <div class="callout callout-tip">
    <strong>Skeuomorphic habits persist</strong>
    <p>Apple keeps apps behaviorally consistent: map apps zoom, messages show bubbles, settings expose toggles. Match those expectations in your category and the learning curve disappears.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000417',
  '03200000-0000-4000-8000-000000000317',
  1,
  'Android Design Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Android Design Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Android Design Patterns</h1>
  <p>Android&rsquo;s open design language is <strong>Material Design</strong>, with its signature surfaces, elevation, and the floating action button. Material adapts across a huge range of devices and brands, and Android&rsquo;s own navigation conventions — the system back, the app bars, predictive gestures — define how users expect to move.</p>
  <h2>App bars and the FAB</h2>
  <p>The <strong>top app bar</strong> holds the screen title and primary actions; it may collapse or expand with scroll. Below it, the <strong>floating action button</strong> floats above content as the promoted key action — check in, compose, add. Use one sparingly and only for the screen&rsquo;s single most important action.</p>
  <pre class="code-block">Material default composition (top to bottom):
  ─ status bar (notifications) ───────────
  ─ top app bar:  Title        [Actions] ─
  ─ content ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ─
  ─                            [ FAB ]  ─
  ─ bottom navigation (if ≤ 5 sections) ─
  ─ system navigation bar (gesture) ──────

Touch target guidance: at least 48 × 48 dp.</pre>
  <h2>Navigation on Android</h2>
  <table>
    <tr><th>Pattern</th><th>Position</th><th>When to use</th></tr>
    <tr><td>Bottom navigation</td><td>Bottom</td><td>3–5 top sections</td></tr>
    <tr><td>Navigation drawer</td><td>Extends from edge</td><td>Many destinations</td></tr>
    <tr><td>Tabs</td><td>Under app bar</td><td>Related views on one screen</td></tr>
    <tr><td>System back</td><td>OS gesture</td><td>Drill-down and escape</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Predictive back &amp; fragments</strong>
    <p>Modern Android animates a predictive back progress as the user swipes. Design your flows so back means &ldquo;one step closer to exit&rdquo; predictably, and never trap users in deep stacks they cannot retrace by gesture.</p>
  </div>
  <h2>Material You and personalization</h2>
  <p>Material&rsquo;s dynamic color can theme apps from the user&rsquo;s wallpaper. The lesson: design with <strong>tokenized color roles</strong> rather than fixed brand values so the system stays legible when users restyle it. Your hierarchy must survive any palette.</p>
  <div class="callout callout-tip">
    <strong>Test on small and large</strong>
    <p>Android spans foldables, phablets, and tiny budget screens. Design at the smallest supported size, then confirm layouts flex — never fix layouts to one bezel.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000419',
  '03200000-0000-4000-8000-000000000319',
  1,
  'Gestures, Touch & Motion',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestures, Touch & Motion</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Gestures, Touch &amp; Motion</h1>
  <p>Touch is the entire interface on mobile: no hover, no cursor, no right-click. That makes <strong>touch targets</strong>, <strong>gestures</strong>, and <strong>motion feedback</strong> core design materials rather than details. Get them wrong and the whole app feels fumbly; get them right and users do not notice them at all.</p>
  <h2>Comfortable touch targets</h2>
  <p>Fingers are blunt. Apple recommends at least <strong>44 × 44 pt</strong> targets; Android recommends <strong>48 × 48 dp</strong>. Small targets hurt precision and accessibility alike — the action&rsquo;s visual size and its tappable area can (and should) differ.</p>
  <pre class="code-block">Hit area rules:
  - Visual control can be 32, tappable area 48.
  - Gap between nearby targets: at least 8.
  - Never stack two targets so tightly that
    the wrong one is the easier hit.
  - List rows: make the whole row tappable.

Gesture map (habit app):
  Tap        → open details / toggle checkbox
  Long press → reorder habits, edit
  Swipe      → delete (with undo), dismiss sheet
  Pull down  → refresh the dashboard</pre>
  <h2>Gestures must be discoverable</h2>
  <p>Hidden gestures are a trap. A user cannot swipe an option they cannot see — pair gestures with <strong>visible affordances</strong> (edit modes, handles, labels) or provide alternate tap paths. Swipe-to-delete always needs an undo escape hatch, because fingers slip.</p>
  <div class="callout callout-info">
    <strong>Motion has a job</strong>
    <p>Every animation should answer one of three questions: where did that come from? what just happened? what happens next? Cast transitions, confirm feedback, and guide the eye — decoration is optional.</p>
  </div>
  <h2>Feedback and haptics</h2>
  <ul>
    <li><strong>Pressed state</strong> on every press — never make users wonder if the tap landed.</li>
    <li><strong>Loading indicators</strong> for anything slower than a blink.</li>
    <li><strong>Subtle haptics</strong> reinforce completion (streak saved) without clattering.</li>
    <li><strong>Errors</strong> explain what happened and how to fix it, in place.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Speed and respect</strong>
    <p>Motion for mobile stays fast — 150–300 ms for feedback, less for micro-joins — and always respects reduced-motion accessibility settings. An elegant app never makes the user wait on a flourish.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000420',
  '03200000-0000-4000-8000-000000000320',
  1,
  'Accessibility & Inclusive Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Accessibility & Inclusive Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Accessibility &amp; Inclusive Design</h1>
  <p>Accessible design is design that works regardless of ability: low vision, color blindness, limited motor control, or reliance on <strong>assistive technology</strong> such as screen readers and switch devices. It is also simply good design — the same choices help everyone on a blinking, one-thumb commute.</p>
  <h2>The WCAG baseline for mobile</h2>
  <table>
    <tr><th>Guideline</th><th>Mobile-friendly target</th></tr>
    <tr><td>Contrast (1.4.3)</td><td>4.5:1 body · 3:1 large text</td></tr>
    <tr><td>Text resize (1.4.4)</td><td>Layout survives 200% type scaling</td></tr>
    <tr><td>Non-text contrast (1.4.11)</td><td>3:1 for icons and borders</td></tr>
    <tr><td>Target size (2.5.8)</td><td>44 × 44 pt minimum</td></tr>
    <tr><td>Error identification (3.3.1)</td><td>Errors named, not color-coded alone</td></tr>
  </table>
  <h2>Designing for assistive tech</h2>
  <ul>
    <li><strong>Labels every control:</strong> an icon button without a label reads as &ldquo;unlabeled button.&rdquo;</li>
    <li><strong>Describe images:</strong> meaningful images get descriptive alt text; decorative ones are ignored.</li>
    <li><strong>Logical order:</strong> screen readers follow the order you declare. Group and sequence intentionally.</li>
    <li><strong>Focus is visible:</strong> keyboard and switch users need to see where they are.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Do not split by color</strong>
    <p>If status lives only in color (&ldquo;green = done&rdquo;), color-blind users inherit nothing. Pair color with an icon, a label, or a text change — redundancy is the point.</p>
  </div>
  <h2>Touch, motion, and dynamic type</h2>
  <pre class="code-block">The accessibility pass, screen by screen:
  1. Turn on Dynamic Type / Font scale (largest).
  2. Run a screen reader over every element.
  3. Reflow check: no clipped, no hidden content.
  4. Contrast audit on icons and text.
  5. Reduce motion: all animation has a calm fallback.
  6. Verify every target is ≥ 44 pt.</pre>
  <p>Dynamic type in iOS and font scaling in Android change your layout. Design flexible, text-driven layouts that reflow, and test at the extreme sizes — the screen that survives the largest type usually survives the real world too.</p>
  <div class="callout callout-tip">
    <strong>Accessibility is a feature list</strong>
    <p>Put accessibility checks in your process like any other requirement: tokens for contrast-safe colors, required labels, and a QA step. Products that treat it as an afterthought get an expensive retrofit instead.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000422',
  '03200000-0000-4000-8000-000000000322',
  1,
  'Mobile Usability Testing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mobile Usability Testing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Mobile Usability Testing</h1>
  <p>Usability testing answers one question that analytics cannot: <strong>do real people accomplish real tasks?</strong> Watching someone tap through your app reveals what no dashboard ever will — the hesitation, the wrong guess, the silent apology to the screen.</p>
  <h2>Moderated vs unmoderated</h2>
  <table>
    <tr><th>Type</th><th>How</th><th>Best for</th></tr>
    <tr><td>Moderated, in person</td><td>Facilitator guides + thinks aloud</td><td>Deep diagnosis, early prototypes</td></tr>
    <tr><td>Moderated, remote</td><td>Video call with device mirroring</td><td>Geographic spread</td></tr>
    <tr><td>Unmoderated</td><td>Participants complete tasks solo</td><td>Large samples, screens at scale</td></tr>
  </table>
  <h2>Five users, focused tasks</h2>
  <p>Around <strong>five participants per round</strong> surfaces most major problems in a flow. Test on <em>real devices</em> (a phone handed to a participant behaves differently from a mockup on a laptop), with realistic tasks phrased as goals, not UI actions.</p>
  <pre class="code-block">Weak task:   &ldquo;Click the check-in button.&rdquo;
Better task: &ldquo;You finished your morning run.
             Record that you did it, then check
             your week&rsquo;s progress.&rdquo;

Measure:
  task success (pass / fail / partial)
  time on task
  errors and recoveries
  participant confidence</pre>
  <div class="callout callout-info">
    <strong>Let them struggle safely</strong>
    <p>Resist rescuing. The frustrated path you witness is the exact path your users take every day. Only step in to keep a session productive, and log the moment.</p>
  </div>
  <h2>Turning findings into fixes</h2>
  <ol>
    <li>Cluster issues by severity and frequency.</li>
    <li>Write fixable statements: &ldquo;check-in control is below the thumb fold.&rdquo;</li>
    <li>Prioritize by impact × confidence.</li>
    <li>Update the prototype and re-run a quick round.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Test the states users will actually hit</strong>
    <p>Include empty, loading, error, and offline flows in your scripts. Users hit them constantly; designers draw them rarely. Testing the broken paths is where the biggest surprises hide.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000423',
  '03200000-0000-4000-8000-000000000323',
  1,
  'Analytics & Design Iteration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Analytics & Design Iteration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Analytics &amp; Design Iteration</h1>
  <p>Usability tests tell you <em>why</em> a flow misbehaves; analytics tell you <em>how many</em> people hit it. Neither is enough alone. The mature loop is: metrics surface a suspicion, research explains it, design fixes it, and the next metric release validates it.</p>
  <h2>Metrics that matter on mobile</h2>
  <table>
    <tr><th>Metric</th><th>What it signals</th></tr>
    <tr><td>Task completion</td><td>Functional success defined by the app</td></tr>
    <tr><td>Day-one retention</td><td>Does the first visit convince a return?</td></tr>
    <tr><td>Session count per day</td><td>Habit formation, engagement rhythm</td></tr>
    <tr><td>Funnel conversion</td><td>Where the happy path leaks</td></tr>
    <tr><td>Crash / error rate</td><td>Quality red flags</td></tr>
  </table>
  <h2>Read funnels, not just headers</h2>
  <p>A funnel is only useful if each step is a real decision. Map the check-in flow and watch where users drop: opening the app, reaching the control, completing the tap, seeing confirmation. The biggest drop names your next design problem — and your next usability task.</p>
  <div class="callout callout-info">
    <strong>Retention beats downloads</strong>
    <p>A habit app judged by installs is designed for marketing. Judged by 7-day and 30-day retention, it is designed for the daily loop — notifications, streaks, and the one-minute check-in. Pick the metric that matches the product.</p>
  </div>
  <h2>Experiment with A/B tests</h2>
  <p>When unsure between two designs, let users vote with behavior. Keep experiments small, change one variable, and give the test enough sessions to matter. Beware the trap of testing your way into redesigning everything — variants drift, users churn.</p>
  <pre class="code-block">A/B rules of thumb:
  - One hypothesis, one variable.
  - Define the metric before you launch.
  - Run long enough for a stable signal.
  - Ship the winner, archive the loser, repeat.</pre>
  <h2>Closing the loop</h2>
  <ol>
    <li>Metric drops → write a hypothesis.</li>
    <li>Research explains the drop with real users.</li>
    <li>Redesign the flow in the prototype.</li>
    <li>Usability test the change with five users.</li>
    <li>Ship, measure, and compare against baseline.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Iterate the loop, not just the screen</strong>
    <p>Design is the loop itself. The moment a team treats analytics and research as recurring verbs — not a phase — the product improves continuously instead of leap-frogging between launches.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000425',
  '03200000-0000-4000-8000-000000000325',
  1,
  'Capstone: Design Brief & Planning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Design Brief & Planning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Design Brief &amp; Planning</h1>
  <p>Your capstone: design a complete <strong>habit-tracking app</strong> and carry it from brief to a tested, handoff-ready prototype. Success here is process, not art — follow the full loop you have practiced and produce artifacts a real team could build from.</p>
  <h2>One-page design brief</h2>
  <pre class="code-block">BRIEF — &ldquo;HabitLoop&rdquo;
  Problem:   Habit apps punish a missed day;
             users abandon after one break.
  Users:     Habit beginners on mobile, logging
             in short sessions around daily life.
  Core loop: Open → check in → see streak grow.
  Musts:     One-minute check-in, streak + reset,
             weekly review, gentle reminders.
  Non-goals: Social features, coach chat, payments.
  Success:   Week-two retention and check-in rate.</pre>
  <h2>Define, then restrain</h2>
  <p>The brief decides <strong>scope</strong>: what is in the product and, equally important, what is out. A focused habit app with one excellent loop beats a lifestyle suite with eight mediocre tabs. Write non-goals as deliberately as goals — they protect the design.</p>
  <div class="callout callout-info">
    <strong>Persona is your compass</strong>
    <p>Return to Maya, the Streak Keeper. Every screen should answer a question she asks out loud: &ldquo;How do I record today?&rdquo;, &ldquo;Am I keeping it up?&rdquo;, &ldquo;What resets me?&rdquo; If a screen serves another persona, it waits.</p>
  </div>
  <h2>Metrics before pixels</h2>
  <p>Pick success metrics now, before any screen exists — check-in rate, week-two retention, streak completion. Metrics declared early become design targets: the layout is not &ldquo;nice&rdquo;, it is engineered to get the check-in done in under a minute.</p>
  <h2>Plan the design sprint</h2>
  <ol>
    <li>Sketch the core loop and user journey (30 min).</li>
    <li>Wireframe all screens against the journey.</li>
    <li>Apply the design system and platform patterns.</li>
    <li>Prototype end to end, including empty states.</li>
    <li>Usability test with five users and iterate.</li>
    <li>Prepare the developer handoff.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Time-box exploration</strong>
    <p>Great designers diverge then converge. Give yourself a strict exploration window, then commit to one direction. Perfect is the enemy of the finished, testable prototype.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000426',
  '03200000-0000-4000-8000-000000000326',
  1,
  'Capstone: Flows & Screen Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Flows & Screen Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Flows &amp; Screen Design</h1>
  <p>Now the brief becomes screens. Start from the <strong>flow map</strong>, walk every path the persona takes, and only then draw each screen against the grid and the design system. Screens designed in isolation create apps that feel like a drawer of unrelated pages.</p>
  <h2>Flow map first</h2>
  <pre class="code-block">HabitLoop core flows:

  Launch ──────────────────────────────┐
    ├─ First run → Onboarding (3 steps) │
    ├─ Daily    → Today → Check-in ✓   │ → confirmation
    ├─ Review   → Activity → Filter/week│
    └─ Setup    → Profile → Manage habits
  Every path returns to Today within 2 taps.</pre>
  <h2>Screen-by-screen requirements</h2>
  <table>
    <tr><th>Screen</th><th>Job it must do</th></tr>
    <tr><td>Today</td><td>Show status at a glance; primary check-in</td></tr>
    <tr><td>Activity</td><td>Filter by habit and week; celebrate trends</td></tr>
    <tr><td>Statistics</td><td>Streaks, completion rate, best week</td></tr>
    <tr><td>Profile</td><td>Manage habits, reminders, accessibility</td></tr>
    <tr><td>Detail states</td><td>Empty week, missed day, loading, offline</td></tr>
  </table>
  <h2>Design the states, not just the happy screen</h2>
  <p>Every screen in the flow needs its states designed: <strong>empty</strong> (tip + first action), <strong>loading</strong> (skeleton, not a blank flash), <strong>error</strong> (what happened + the fix), and <strong>offline</strong>. These states are where habit apps actually live after the first week.</p>
  <div class="callout callout-info">
    <strong>Consistency from the system</strong>
    <p>Pull every screen from tokens and components: 8-point spacing, one type scale, a restrained palette, and one primary-action pattern. Screens that reuse the system look finished the first time you draw them.</p>
  </div>
  <h2>Platform-appropriate details</h2>
  <ul>
    <li>iOS: navigation bar titles, tab bar, back-swipe, modals for quick edits.</li>
    <li>Android: top app bar, FAB for the check-in, system back, edge-to-edge surfaces.</li>
    <li>Both: safe areas, dynamic type tolerance, 44+ pt targets, dark mode.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>One primary action per screen</strong>
    <p>If you cannot name a single action a screen exists for, the screen is two screens. Check-in gets the FAB-sized attention; everything else stays quiet behind it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03200000-0000-4000-8000-000000000427',
  '03200000-0000-4000-8000-000000000327',
  1,
  'Capstone: Prototype, Test & Handoff',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Prototype, Test & Handoff</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6d28d9; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #5b21b6; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #5b21b6; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #6d28d9; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #5b21b6; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Prototype, Test &amp; Handoff</h1>
  <p>The last stretch turns designed screens into evidence: a clickable prototype, a usability test that proves the flow, and a handoff that developers can build from. This is where the course loop pays off — every lesson feeds the final artifact.</p>
  <h2>Link the prototype end to end</h2>
  <p>Wire every screen: onboarding, the check-in cycle, the streak celebration, settings, and all the empty and error states. Test the prototype on a phone, not a browser preview, and record the core flows for your review.</p>
  <pre class="code-block">Prototype check list:
  [ ] First-run onboarding reaches Today
  [ ] Check-in updates the streak with feedback
  [ ] Missed-day and empty-week states exist
  [ ] Activity filters and drill-down work
  [ ] Back gesture returns as expected
  [ ] Reduced-motion and large-type variants run</pre>
  <h2>Usability test the flow</h2>
  <ol>
    <li>Recruit five people who match the persona.</li>
    <li>Task: &ldquo;Record your morning habit, then check your week.&rdquo;</li>
    <li>Watch the check-in path: time, errors, emotion.</li>
    <li>Fix the top two issues in the prototype.</li>
    <li>Re-run a quick validation round (2–3 users).</li>
  </ol>
  <div class="callout callout-info">
    <strong>Evidence beats opinion</strong>
    <p>Write the test result into the handoff: &ldquo;five of five completed the check-in in under a minute.&rdquo; That sentence is worth more than a hundred style discussions in a build review.</p>
  </div>
  <h2>The developer handoff</h2>
  <p>A professional handoff answers: what should I build, at what size, in what state, and why. Developers do not need your vibe — they need decisions.</p>
  <table>
    <tr><th>Deliverable</th><th>Contents</th></tr>
    <tr><td>Screen specs</td><td>Annotated screens with spacing, radii, text</td></tr>
    <tr><td>Design tokens</td><td>Colors, type scale, spacing, motion durations</td></tr>
    <tr><td>Component states</td><td>Each control in default / pressed / disabled</td></tr>
    <tr><td>Flow documentation</td><td>Screen map + where each state appears</td></tr>
    <tr><td>Assets</td><td>Icons (SF Symbols / Material), exports, light+dark</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Review against the brief</strong>
    <p>Before you call it done, re-read the one-page brief. Does the prototype serve Maya&rsquo;s core loop, protect the non-goals, and target the success metrics? If yes — you designed a product, not a portfolio piece.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 · Q4-6 for 306 · Q7-9 for 309 · Q10-12 for 312
--    Q13-15 for 315 · Q16-18 for 318 · Q19-21 for 321 · Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03200000-0000-4000-8000-000000000501', '03200000-0000-4000-8000-000000000303',
   'What is the main difference between UX and UI on mobile?',
   'UX covers the overall journey and flow; UI is the visible interface the user sees and touches.', 1),
  ('03200000-0000-4000-8000-000000000502', '03200000-0000-4000-8000-000000000303',
   'Why does mobile UX require a different approach than desktop?',
   'Small screens, touch input, and a fragmented attention context change every design decision.', 2),
  ('03200000-0000-4000-8000-000000000503', '03200000-0000-4000-8000-000000000303',
   'What is the most important goal of mobile UX?',
   'Mobile UX exists to help users complete priority tasks quickly with minimal friction.', 3),
  ('03200000-0000-4000-8000-000000000504', '03200000-0000-4000-8000-000000000306',
   'Which research method has a person verbalize their actions while using an app?',
   'A think-aloud session reveals decisions and frustrations in real time.', 1),
  ('03200000-0000-4000-8000-000000000505', '03200000-0000-4000-8000-000000000306',
   'What is the main value of a user persona?',
   'A persona turns research into a shared reference that focuses design decisions on a representative user.', 2),
  ('03200000-0000-4000-8000-000000000506', '03200000-0000-4000-8000-000000000306',
   'What does a journey map capture?',
   'It plots the steps, touchpoints, thoughts, and emotions a person experiences across a task.', 3),
  ('03200000-0000-4000-8000-000000000507', '03200000-0000-4000-8000-000000000309',
   'What does information architecture organize?',
   'IA structures content and features into a findable and predictable hierarchy.', 1),
  ('03200000-0000-4000-8000-000000000508', '03200000-0000-4000-8000-000000000309',
   'What is a bottom tab bar best for in a mobile app?',
   'Bottom tabs keep a few top-level destinations one thumb tap away and always visible.', 2),
  ('03200000-0000-4000-8000-000000000509', '03200000-0000-4000-8000-000000000309',
   'During a card sort, what do participants do?',
   'Participants group content cards by how they expect the items to relate, revealing mental models.', 3),
  ('03200000-0000-4000-8000-000000000510', '03200000-0000-4000-8000-000000000312',
   'Which fidelity is best for early exploration of layout?',
   'Low-fidelity wireframes focus on structure and hierarchy instead of polished visuals.', 1),
  ('03200000-0000-4000-8000-000000000511', '03200000-0000-4000-8000-000000000312',
   'What makes a clickable prototype most useful?',
   'Users can tap through realistic flows and testers can observe real behavior before expensive builds.', 2),
  ('03200000-0000-4000-8000-000000000512', '03200000-0000-4000-8000-000000000312',
   'When should you prototype a mobile flow?',
   'Prototype before development to validate flows and interactions at the lowest possible cost.', 3),
  ('03200000-0000-4000-8000-000000000513', '03200000-0000-4000-8000-000000000315',
   'What is a design token?',
   'A token is a named value such as a color, spacing, or type size that components consume.', 1),
  ('03200000-0000-4000-8000-000000000514', '03200000-0000-4000-8000-000000000315',
   'Why does WCAG recommend a 4.5:1 contrast ratio for body text?',
   'Body-sized text needs 4.5:1 contrast to stay readable, with 3:1 allowed only for large text.', 2),
  ('03200000-0000-4000-8000-000000000515', '03200000-0000-4000-8000-000000000315',
   'What is a good basis for consistent mobile spacing rhythm?',
   'An 8-point grid gives every margin and gap a reason and keeps screens consistent.', 3),
  ('03200000-0000-4000-8000-000000000516', '03200000-0000-4000-8000-000000000318',
   'Which element is standard for top-level navigation in iOS?',
   'The tab bar sits at the bottom and switches between top-level sections.', 1),
  ('03200000-0000-4000-8000-000000000517', '03200000-0000-4000-8000-000000000318',
   'What is the floating action button in Android Material Design?',
   'It is the promoted key action that floats above content, used sparingly on a screen.', 2),
  ('03200000-0000-4000-8000-000000000518', '03200000-0000-4000-8000-000000000318',
   'What is the Android navigation drawer?',
   'It is a slide-out panel for many destinations that do not fit in bottom navigation.', 3),
  ('03200000-0000-4000-8000-000000000519', '03200000-0000-4000-8000-000000000321',
   'What is the recommended minimum mobile touch target size?',
   'Apple and Google both recommend targets around 44 to 48 points for comfortable tapping.', 1),
  ('03200000-0000-4000-8000-000000000520', '03200000-0000-4000-8000-000000000321',
   'Why is motion feedback important in mobile UIs?',
   'Motion communicates state and guides attention, showing cause and effect and system status.', 2),
  ('03200000-0000-4000-8000-000000000521', '03200000-0000-4000-8000-000000000321',
   'How do screen readers announce an image on a phone?',
   'They read the accessibility label you provide, so meaningful images need descriptive alt text.', 3),
  ('03200000-0000-4000-8000-000000000522', '03200000-0000-4000-8000-000000000324',
   'How many participants typically reveal most usability issues in one test round?',
   'Around five users per round surface most major problems, so iterate in small cycles.', 1),
  ('03200000-0000-4000-8000-000000000523', '03200000-0000-4000-8000-000000000324',
   'What does task success rate measure?',
   'It measures the share of participants who finish a given task correctly.', 2),
  ('03200000-0000-4000-8000-000000000524', '03200000-0000-4000-8000-000000000324',
   'What is an A/B test?',
   'It compares two design variants with real users to see which performs better on a chosen metric.', 3),
  ('03200000-0000-4000-8000-000000000525', '03200000-0000-4000-8000-000000000328',
   'Which order best describes a mobile design process?',
   'Research, structure, design, prototype, test, iterate, and hand off.', 1),
  ('03200000-0000-4000-8000-000000000526', '03200000-0000-4000-8000-000000000328',
   'Why define success metrics before designing the capstone app?',
   'Metrics turn vague goals into measurable design targets and a way to judge improvement.', 2),
  ('03200000-0000-4000-8000-000000000527', '03200000-0000-4000-8000-000000000328',
   'Why prototype the full end-to-end flow in the capstone?',
   'It validates the complete journey including onboarding, check-in, states, and settings.', 3),
  ('03200000-0000-4000-8000-000000000528', '03200000-0000-4000-8000-000000000328',
   'What should a developer handoff deliver?',
   'Annotated screens, design tokens, component states, and flow documentation.', 4),
  ('03200000-0000-4000-8000-000000000529', '03200000-0000-4000-8000-000000000328',
   'After usability testing the capstone, what is missing if you only fix a label?',
   'You must update the prototype, re-run a quick test, and document the change.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the correct answer is flagged is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): UX vs UI
  ('03200000-0000-4000-8000-000000001001', '03200000-0000-4000-8000-000000000501', 'UX is the overall journey; UI is the visible interface', TRUE,  1),
  ('03200000-0000-4000-8000-000000001002', '03200000-0000-4000-8000-000000000501', 'UX is only the color palette', FALSE, 2),
  ('03200000-0000-4000-8000-000000001003', '03200000-0000-4000-8000-000000000501', 'UI is the backend server logic', FALSE, 3),
  ('03200000-0000-4000-8000-000000001004', '03200000-0000-4000-8000-000000000501', 'They mean exactly the same thing', FALSE, 4),
  -- Q1 (501)q2: mobile differs
  ('03200000-0000-4000-8000-000000001005', '03200000-0000-4000-8000-000000000502', 'Small screens, touch input, and context on the go', TRUE,  1),
  ('03200000-0000-4000-8000-000000001006', '03200000-0000-4000-8000-000000000502', 'Mobile apps have no browser', FALSE, 2),
  ('03200000-0000-4000-8000-000000001007', '03200000-0000-4000-8000-000000000502', 'Users always read more text on phones', FALSE, 3),
  ('03200000-0000-4000-8000-000000001008', '03200000-0000-4000-8000-000000000502', 'Resolution is the only factor', FALSE, 4),
  -- Q1 (501)q3: mobile UX goal
  ('03200000-0000-4000-8000-000000001009', '03200000-0000-4000-8000-000000000503', 'Finish priority tasks quickly with minimal friction', TRUE,  1),
  ('03200000-0000-4000-8000-000000001010', '03200000-0000-4000-8000-000000000503', 'Show the most beautiful animations', FALSE, 2),
  ('03200000-0000-4000-8000-000000001011', '03200000-0000-4000-8000-000000000503', 'Display as much content as possible', FALSE, 3),
  ('03200000-0000-4000-8000-000000001012', '03200000-0000-4000-8000-000000000503', 'Match every desktop feature', FALSE, 4),
  -- Q2 (504): think-aloud
  ('03200000-0000-4000-8000-000000001013', '03200000-0000-4000-8000-000000000504', 'Think-aloud usability session', TRUE,  1),
  ('03200000-0000-4000-8000-000000001014', '03200000-0000-4000-8000-000000000504', 'Summary card sort', FALSE, 2),
  ('03200000-0000-4000-8000-000000001015', '03200000-0000-4000-8000-000000000504', 'Server log analysis', FALSE, 3),
  ('03200000-0000-4000-8000-000000001016', '03200000-0000-4000-8000-000000000504', 'Competitor screenshot review', FALSE, 4),
  -- Q2 (504)q2: persona value
  ('03200000-0000-4000-8000-000000001017', '03200000-0000-4000-8000-000000000505', 'It focuses design decisions on a representative user', TRUE,  1),
  ('03200000-0000-4000-8000-000000001018', '03200000-0000-4000-8000-000000000505', 'It replaces usability testing', FALSE, 2),
  ('03200000-0000-4000-8000-000000001019', '03200000-0000-4000-8000-000000000505', 'It automatically ranks features', FALSE, 3),
  ('03200000-0000-4000-8000-000000001020', '03200000-0000-4000-8000-000000000505', 'It is a marketing biography', FALSE, 4),
  -- Q2 (504)q3: journey map
  ('03200000-0000-4000-8000-000000001021', '03200000-0000-4000-8000-000000000506', 'Every step, touchpoint, and emotion across a task', TRUE,  1),
  ('03200000-0000-4000-8000-000000001022', '03200000-0000-4000-8000-000000000506', 'Only the final purchase amount', FALSE, 2),
  ('03200000-0000-4000-8000-000000001023', '03200000-0000-4000-8000-000000000506', 'The competitive pricing of the app', FALSE, 3),
  ('03200000-0000-4000-8000-000000001024', '03200000-0000-4000-8000-000000000506', 'The team sprint velocity', FALSE, 4),
  -- Q3 (507): IA
  ('03200000-0000-4000-8000-000000001025', '03200000-0000-4000-8000-000000000507', 'Content and features into a findable hierarchy', TRUE,  1),
  ('03200000-0000-4000-8000-000000001026', '03200000-0000-4000-8000-000000000507', 'The pixel spacing on one screen', FALSE, 2),
  ('03200000-0000-4000-8000-000000001027', '03200000-0000-4000-8000-000000000507', 'The server database indexes', FALSE, 3),
  ('03200000-0000-4000-8000-000000001028', '03200000-0000-4000-8000-000000000507', 'The color palette of the brand', FALSE, 4),
  -- Q3 (507)q2: bottom tabs
  ('03200000-0000-4000-8000-000000001029', '03200000-0000-4000-8000-000000000508', 'Five or fewer top-level destinations', TRUE,  1),
  ('03200000-0000-4000-8000-000000001030', '03200000-0000-4000-8000-000000000508', 'Deep nested settings pages', FALSE, 2),
  ('03200000-0000-4000-8000-000000001031', '03200000-0000-4000-8000-000000000508', 'Long-form article reading', FALSE, 3),
  ('03200000-0000-4000-8000-000000001032', '03200000-0000-4000-8000-000000000508', 'Sign-up and onboarding steps', FALSE, 4),
  -- Q3 (507)q3: card sort
  ('03200000-0000-4000-8000-000000001033', '03200000-0000-4000-8000-000000000509', 'Group content cards by expected relationships', TRUE,  1),
  ('03200000-0000-4000-8000-000000001034', '03200000-0000-4000-8000-000000000509', 'Build payment forms', FALSE, 2),
  ('03200000-0000-4000-8000-000000001035', '03200000-0000-4000-8000-000000000509', 'Write navigation copy', FALSE, 3),
  ('03200000-0000-4000-8000-000000001036', '03200000-0000-4000-8000-000000000509', 'Set up analytics events', FALSE, 4),
  -- Q4 (510): lo-fi wireframes
  ('03200000-0000-4000-8000-000000001037', '03200000-0000-4000-8000-000000000510', 'Low-fidelity wireframes', TRUE,  1),
  ('03200000-0000-4000-8000-000000001038', '03200000-0000-4000-8000-000000000510', 'Production pixel-perfect UI', FALSE, 2),
  ('03200000-0000-4000-8000-000000001039', '03200000-0000-4000-8000-000000000510', 'Published app store assets', FALSE, 3),
  ('03200000-0000-4000-8000-000000001040', '03200000-0000-4000-8000-000000000510', 'Animated brand illustrations', FALSE, 4),
  -- Q4 (510)q2: clickable prototype
  ('03200000-0000-4000-8000-000000001041', '03200000-0000-4000-8000-000000000511', 'Users can tap through realistic flows', TRUE,  1),
  ('03200000-0000-4000-8000-000000001042', '03200000-0000-4000-8000-000000000511', 'It replaces the production database', FALSE, 2),
  ('03200000-0000-4000-8000-000000001043', '03200000-0000-4000-8000-000000000511', 'It guarantees no usability issues', FALSE, 3),
  ('03200000-0000-4000-8000-000000001044', '03200000-0000-4000-8000-000000000511', 'It only works on Android', FALSE, 4),
  -- Q4 (510)q3: when to prototype
  ('03200000-0000-4000-8000-000000001045', '03200000-0000-4000-8000-000000000512', 'Before development to validate flows cheaply', TRUE,  1),
  ('03200000-0000-4000-8000-000000001046', '03200000-0000-4000-8000-000000000512', 'Only after release to customers', FALSE, 2),
  ('03200000-0000-4000-8000-000000001047', '03200000-0000-4000-8000-000000000512', 'Only when the budget is empty', FALSE, 3),
  ('03200000-0000-4000-8000-000000001048', '03200000-0000-4000-8000-000000000512', 'Never, just write code directly', FALSE, 4),
  -- Q5 (513): design token
  ('03200000-0000-4000-8000-000000001049', '03200000-0000-4000-8000-000000000513', 'A named value for color, spacing, or type', TRUE,  1),
  ('03200000-0000-4000-8000-000000001050', '03200000-0000-4000-8000-000000000513', 'A marketing slogan', FALSE, 2),
  ('03200000-0000-4000-8000-000000001051', '03200000-0000-4000-8000-000000000513', 'A hardware chip in the phone', FALSE, 3),
  ('03200000-0000-4000-8000-000000001052', '03200000-0000-4000-8000-000000000513', 'A server authentication key', FALSE, 4),
  -- Q5 (513)q2: contrast
  ('03200000-0000-4000-8000-000000001053', '03200000-0000-4000-8000-000000000514', 'It keeps body text readable under WCAG', TRUE,  1),
  ('03200000-0000-4000-8000-000000001054', '03200000-0000-4000-8000-000000000514', 'It looks trendy to designers', FALSE, 2),
  ('03200000-0000-4000-8000-000000001055', '03200000-0000-4000-8000-000000000514', 'It saves battery power', FALSE, 3),
  ('03200000-0000-4000-8000-000000001056', '03200000-0000-4000-8000-000000000514', 'It is required by the App Store only', FALSE, 4),
  -- Q5 (513)q3: spacing grid
  ('03200000-0000-4000-8000-000000001057', '03200000-0000-4000-8000-000000000515', 'An 8-point grid', TRUE,  1),
  ('03200000-0000-4000-8000-000000001058', '03200000-0000-4000-8000-000000000515', 'Arbitrary 3-point steps', FALSE, 2),
  ('03200000-0000-4000-8000-000000001059', '03200000-0000-4000-8000-000000000515', 'Full screen fold heights', FALSE, 3),
  ('03200000-0000-4000-8000-000000001060', '03200000-0000-4000-8000-000000000515', 'Twice the screen width', FALSE, 4),
  -- Q6 (516): iOS tab bar
  ('03200000-0000-4000-8000-000000001061', '03200000-0000-4000-8000-000000000516', 'A bottom tab bar', TRUE,  1),
  ('03200000-0000-4000-8000-000000001062', '03200000-0000-4000-8000-000000000516', 'A hamburger menu', FALSE, 2),
  ('03200000-0000-4000-8000-000000001063', '03200000-0000-4000-8000-000000000516', 'A floating action button', FALSE, 3),
  ('03200000-0000-4000-8000-000000001064', '03200000-0000-4000-8000-000000000516', 'An app drawer', FALSE, 4),
  -- Q6 (516)q2: FAB
  ('03200000-0000-4000-8000-000000001065', '03200000-0000-4000-8000-000000000517', 'The promoted key action above content', TRUE,  1),
  ('03200000-0000-4000-8000-000000001066', '03200000-0000-4000-8000-000000000517', 'The bottom navigation bar', FALSE, 2),
  ('03200000-0000-4000-8000-000000001067', '03200000-0000-4000-8000-000000000517', 'An iOS navigation bar', FALSE, 3),
  ('03200000-0000-4000-8000-000000001068', '03200000-0000-4000-8000-000000000517', 'A splash video', FALSE, 4),
  -- Q6 (516)q3: drawer
  ('03200000-0000-4000-8000-000000001069', '03200000-0000-4000-8000-000000000518', 'A slide-out panel for many destinations', TRUE,  1),
  ('03200000-0000-4000-8000-000000001070', '03200000-0000-4000-8000-000000000518', 'A hidden settings page', FALSE, 2),
  ('03200000-0000-4000-8000-000000001071', '03200000-0000-4000-8000-000000000518', 'A gesture-only keyboard', FALSE, 3),
  ('03200000-0000-4000-8000-000000001072', '03200000-0000-4000-8000-000000000518', 'A third-party widget', FALSE, 4),
  -- Q7 (519): touch target
  ('03200000-0000-4000-8000-000000001073', '03200000-0000-4000-8000-000000000519', 'Around 44 to 48 points', TRUE,  1),
  ('03200000-0000-4000-8000-000000001074', '03200000-0000-4000-8000-000000000519', 'Exactly 12 points', FALSE, 2),
  ('03200000-0000-4000-8000-000000001075', '03200000-0000-4000-8000-000000000519', 'Half the font size', FALSE, 3),
  ('03200000-0000-4000-8000-000000001076', '03200000-0000-4000-8000-000000000519', 'The full screen width', FALSE, 4),
  -- Q7 (519)q2: motion feedback
  ('03200000-0000-4000-8000-000000001077', '03200000-0000-4000-8000-000000000520', 'It communicates state and guides attention', TRUE,  1),
  ('03200000-0000-4000-8000-000000001078', '03200000-0000-4000-8000-000000000520', 'It slows the app down deliberately', FALSE, 2),
  ('03200000-0000-4000-8000-000000001079', '03200000-0000-4000-8000-000000000520', 'It replaces all text labels', FALSE, 3),
  ('03200000-0000-4000-8000-000000001080', '03200000-0000-4000-8000-000000000520', 'It hides navigation for fun', FALSE, 4),
  -- Q7 (519)q3: screen readers
  ('03200000-0000-4000-8000-000000001081', '03200000-0000-4000-8000-000000000521', 'The accessibility label you provide', TRUE,  1),
  ('03200000-0000-4000-8000-000000001082', '03200000-0000-4000-8000-000000000521', 'The file byte size', FALSE, 2),
  ('03200000-0000-4000-8000-000000001083', '03200000-0000-4000-8000-000000000521', 'The image resolution', FALSE, 3),
  ('03200000-0000-4000-8000-000000001084', '03200000-0000-4000-8000-000000000521', 'The user authentication token', FALSE, 4),
  -- Q8 (522): five users
  ('03200000-0000-4000-8000-000000001085', '03200000-0000-4000-8000-000000000522', 'About five users per round', TRUE,  1),
  ('03200000-0000-4000-8000-000000001086', '03200000-0000-4000-8000-000000000522', 'At least fifty users', FALSE, 2),
  ('03200000-0000-4000-8000-000000001087', '03200000-0000-4000-8000-000000000522', 'Exactly one thousand', FALSE, 3),
  ('03200000-0000-4000-8000-000000001088', '03200000-0000-4000-8000-000000000522', 'None, testing is useless', FALSE, 4),
  -- Q8 (522)q2: task success
  ('03200000-0000-4000-8000-000000001089', '03200000-0000-4000-8000-000000000523', 'The share of participants who finish a task correctly', TRUE,  1),
  ('03200000-0000-4000-8000-000000001090', '03200000-0000-4000-8000-000000000523', 'How fast the server responds', FALSE, 2),
  ('03200000-0000-4000-8000-000000001091', '03200000-0000-4000-8000-000000000523', 'The number of app downloads', FALSE, 3),
  ('03200000-0000-4000-8000-000000001092', '03200000-0000-4000-8000-000000000523', 'The crash count at launch', FALSE, 4),
  -- Q8 (522)q3: A/B test
  ('03200000-0000-4000-8000-000000001093', '03200000-0000-4000-8000-000000000524', 'Comparing two variants with real users', TRUE,  1),
  ('03200000-0000-4000-8000-000000001094', '03200000-0000-4000-8000-000000000524', 'A design review meeting', FALSE, 2),
  ('03200000-0000-4000-8000-000000001095', '03200000-0000-4000-8000-000000000524', 'A color contrast check', FALSE, 3),
  ('03200000-0000-4000-8000-000000001096', '03200000-0000-4000-8000-000000000524', 'A usability recruiting email', FALSE, 4),
  -- Q9 (525): process order
  ('03200000-0000-4000-8000-000000001097', '03200000-0000-4000-8000-000000000525', 'Research, structure, design, prototype, test, iterate, hand off', TRUE,  1),
  ('03200000-0000-4000-8000-000000001098', '03200000-0000-4000-8000-000000000525', 'Code, ship, then research', FALSE, 2),
  ('03200000-0000-4000-8000-000000001099', '03200000-0000-4000-8000-000000000525', 'Prototype, delete, restart', FALSE, 3),
  ('03200000-0000-4000-8000-000000001100', '03200000-0000-4000-8000-000000000525', 'Launch, then collect colors', FALSE, 4),
  -- Q9 (525)q2: metrics
  ('03200000-0000-4000-8000-000000001101', '03200000-0000-4000-8000-000000000526', 'They turn vague goals into measurable targets', TRUE,  1),
  ('03200000-0000-4000-8000-000000001102', '03200000-0000-4000-8000-000000000526', 'They replace user interviews', FALSE, 2),
  ('03200000-0000-4000-8000-000000001103', '03200000-0000-4000-8000-000000000526', 'They are required by the store', FALSE, 3),
  ('03200000-0000-4000-8000-000000001104', '03200000-0000-4000-8000-000000000526', 'They make the app run faster', FALSE, 4),
  -- Q9 (525)q3: end-to-end flow
  ('03200000-0000-4000-8000-000000001105', '03200000-0000-4000-8000-000000000527', 'It validates the complete journey before development', TRUE,  1),
  ('03200000-0000-4000-8000-000000001106', '03200000-0000-4000-8000-000000000527', 'It uploads the app to the store', FALSE, 2),
  ('03200000-0000-4000-8000-000000001107', '03200000-0000-4000-8000-000000000527', 'It prints the design document', FALSE, 3),
  ('03200000-0000-4000-8000-000000001108', '03200000-0000-4000-8000-000000000527', 'It speeds up the device', FALSE, 4),
  -- Q9 (525)q4: handoff
  ('03200000-0000-4000-8000-000000001109', '03200000-0000-4000-8000-000000000528', 'Annotated screens, tokens, and interaction specs', TRUE,  1),
  ('03200000-0000-4000-8000-000000001110', '03200000-0000-4000-8000-000000000528', 'An empty folder', FALSE, 2),
  ('03200000-0000-4000-8000-000000001111', '03200000-0000-4000-8000-000000000528', 'A list of passwords', FALSE, 3),
  ('03200000-0000-4000-8000-000000001112', '03200000-0000-4000-8000-000000000528', 'A single compressed logo', FALSE, 4),
  -- Q9 (525)q5: fix and validate
  ('03200000-0000-4000-8000-000000001113', '03200000-0000-4000-8000-000000000529', 'Updating the prototype and validating the fix', TRUE,  1),
  ('03200000-0000-4000-8000-000000001114', '03200000-0000-4000-8000-000000000529', 'Nothing, text is enough', FALSE, 2),
  ('03200000-0000-4000-8000-000000001115', '03200000-0000-4000-8000-000000000529', 'Deleting the research notes', FALSE, 3),
  ('03200000-0000-4000-8000-000000001116', '03200000-0000-4000-8000-000000000529', 'Increasing the font for fun', FALSE, 4)
ON CONFLICT (id) DO NOTHING;