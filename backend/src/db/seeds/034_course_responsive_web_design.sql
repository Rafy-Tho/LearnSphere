-- ============================================================================
-- SEED 034: Complete course — "Responsive Web Design"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Responsive Foundations     → C1 The Viewport & Design Philosophy · C2 Units & Fluid Layouts
--   M2 Media Queries & Workflow   → C3 Mobile-First & Images · C4 Flexbox & Grid Patterns
--   M3 Layout Patterns            → C5 Typography & Components · C6 Navigation, Forms & Tables
--   M4 Accessibility & Polish     → C7 Performance & Accessibility · C8 Modern CSS & Testing
--   M5 Capstone: Portfolio        → C9 Project Planning · C10 Building & Launch
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
-- Accent: rose (distinct from amber/indigo/emerald/teal used by other courses).
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
  '02200000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'Responsive Web Design',
  'responsive-web-design',
  'Build sites that look right on every screen. Master fluid layouts, media queries, mobile-first CSS, responsive images, flexbox and grid patterns, fluid typography, and performance — then ship a fully responsive portfolio from scratch.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  32
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02200000-0000-4000-8000-000000000011', '02200000-0000-4000-8000-000000000001', 'Explain responsive design and control the viewport with the right CSS units.', 1),
  ('02200000-0000-4000-8000-000000000012', '02200000-0000-4000-8000-000000000001', 'Build fluid layouts with media queries and a mobile-first workflow.',              2),
  ('02200000-0000-4000-8000-000000000013', '02200000-0000-4000-8000-000000000001', 'Serve sharp, fast responsive images without layout shift.',                       3),
  ('02200000-0000-4000-8000-000000000014', '02200000-0000-4000-8000-000000000001', 'Use flexbox, grid, and clamp() to make layouts, components, and type adapt.',     4),
  ('02200000-0000-4000-8000-000000000015', '02200000-0000-4000-8000-000000000001', 'Build, test, and ship an accessible, high-performance responsive portfolio.',     5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02200000-0000-4000-8000-000000000101', '02200000-0000-4000-8000-000000000001', 1, 'Responsive Foundations',     'Fluid grids, the viewport, and the responsive mindset.',             'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000102', '02200000-0000-4000-8000-000000000001', 2, 'Media Queries & Workflow',   'Media queries, mobile-first CSS, and responsive images.',            'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000103', '02200000-0000-4000-8000-000000000001', 3, 'Layout Patterns',             'Flexbox and grid patterns that adapt without media queries.',        'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000104', '02200000-0000-4000-8000-000000000001', 4, 'Accessibility & Polish',     'Fluid type, resilient components, and accessible interfaces.',       'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000105', '02200000-0000-4000-8000-000000000001', 5, 'Performance & Capstone',     'Ship a fast, accessible responsive portfolio.',                      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02200000-0000-4000-8000-000000000201', '02200000-0000-4000-8000-000000000101', 1, 'The Viewport & Design Philosophy', 'What responsive means and how browsers size the page.',          'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000202', '02200000-0000-4000-8000-000000000101', 2, 'Units & Fluid Layouts',            'Relative units and fluid, proportion-based layouts.',            'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000203', '02200000-0000-4000-8000-000000000102', 1, 'Mobile-First & Responsive Images', 'Progressive enhancement and images that scale with the layout.', 'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000204', '02200000-0000-4000-8000-000000000102', 2, 'Flexbox & Grid Patterns',          'Layout patterns that reflow on their own.',                      'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000205', '02200000-0000-4000-8000-000000000103', 1, 'Typography & Components',          'Fluid type and content-driven component breakpoints.',           'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000206', '02200000-0000-4000-8000-000000000103', 2, 'Navigation, Forms & Tables',       'Adaptive navigation, forms, and data tables.',                   'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000207', '02200000-0000-4000-8000-000000000104', 1, 'Performance & Accessibility',      'A fast, accessible experience on every device.',                 'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000208', '02200000-0000-4000-8000-000000000104', 2, 'Modern CSS & Testing',             'Container queries, logical properties, and verification.',       'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000209', '02200000-0000-4000-8000-000000000105', 1, 'Project Planning',                 'Plan and scaffold the capstone portfolio.',                      'PUBLISHED'),
  ('02200000-0000-4000-8000-000000000210', '02200000-0000-4000-8000-000000000105', 2, 'Building & Launch',                'Build, polish, test, and ship the portfolio.',                   'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02200000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02200000-0000-4000-8000-000000000301', '02200000-0000-4000-8000-000000000201', 1, 'What is Responsive Web Design?',  'Understand what responsive design is and where it came from.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('02200000-0000-4000-8000-000000000302', '02200000-0000-4000-8000-000000000201', 2, 'The Viewport & CSS Units',        'Learn how browsers size the page and which CSS units to trust.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02200000-0000-4000-8000-000000000303', '02200000-0000-4000-8000-000000000201', 3, 'Responsive Foundations Quiz',      'Check your understanding of responsive fundamentals.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000304', '02200000-0000-4000-8000-000000000202', 1, 'Fluid Layouts',                   'Build proportion-based grids that survive any screen width.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000305', '02200000-0000-4000-8000-000000000202', 2, 'Media Queries',                   'Write media queries that only fire when you need them.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02200000-0000-4000-8000-000000000306', '02200000-0000-4000-8000-000000000202', 3, 'Units & Media Queries Quiz',      'Test your grasp of fluid layouts and media queries.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000307', '02200000-0000-4000-8000-000000000203', 1, 'Mobile-First CSS',                'Style the small screen first and enhance upward.',                              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02200000-0000-4000-8000-000000000308', '02200000-0000-4000-8000-000000000203', 2, 'Responsive Images',               'Serve images that are sharp, small, and never cause layout shift.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000309', '02200000-0000-4000-8000-000000000203', 3, 'Mobile-First & Images Quiz',      'Verify your mobile-first and responsive image skills.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000310', '02200000-0000-4000-8000-000000000204', 1, 'Flexbox Responsive Patterns',     'Let flexbox reflow cards, rows, and toolbars without media queries.',           'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02200000-0000-4000-8000-000000000311', '02200000-0000-4000-8000-000000000204', 2, 'CSS Grid Responsive Patterns',    'Build fluid grids with auto-fit, minmax(), and template areas.',                'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02200000-0000-4000-8000-000000000312', '02200000-0000-4000-8000-000000000204', 3, 'Responsive Layout Quiz',          'Test your flexbox and grid responsive patterns.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000313', '02200000-0000-4000-8000-000000000205', 1, 'Responsive Typography',           'Size text fluidly with clamp() and keep it readable everywhere.',               'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02200000-0000-4000-8000-000000000314', '02200000-0000-4000-8000-000000000205', 2, 'Responsive Components & Breakpoints','Choose content-driven breakpoints and design components that adapt.',         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02200000-0000-4000-8000-000000000315', '02200000-0000-4000-8000-000000000205', 3, 'Typography & Components Quiz',    'Check your typography and breakpoint knowledge.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000316', '02200000-0000-4000-8000-000000000206', 1, 'Responsive Navigation',           'Adapt navigation to small screens with patterns users recognize.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000317', '02200000-0000-4000-8000-000000000206', 2, 'Responsive Forms & Tables',       'Keep forms usable and tables legible on any width.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000318', '02200000-0000-4000-8000-000000000206', 3, 'Patterns Quiz',                    'Test your responsive pattern knowledge.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000319', '02200000-0000-4000-8000-000000000207', 1, 'Responsive Performance',          'Make the responsive site fast on the networks that matter.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000320', '02200000-0000-4000-8000-000000000207', 2, 'Responsive Design & Accessibility','Make responsiveness serve accessibility for every user.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000321', '02200000-0000-4000-8000-000000000207', 3, 'Performance & Accessibility Quiz','Check your performance and accessibility understanding.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000322', '02200000-0000-4000-8000-000000000208', 1, 'Container Queries & Modern CSS',  'Size components by their container instead of the viewport.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02200000-0000-4000-8000-000000000323', '02200000-0000-4000-8000-000000000208', 2, 'Testing Responsive Designs',      'Verify layouts across real devices, zoom, and automated checks.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02200000-0000-4000-8000-000000000324', '02200000-0000-4000-8000-000000000208', 3, 'Modern CSS & Testing Quiz',        'Test your modern CSS and testing knowledge.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02200000-0000-4000-8000-000000000325', '02200000-0000-4000-8000-000000000209', 1, 'Capstone: Planning & Setup',      'Plan and scaffold the capstone responsive portfolio.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000326', '02200000-0000-4000-8000-000000000210', 1, 'Capstone: Building the Portfolio','Build a mobile-first portfolio layout with fluid type and grids.',              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02200000-0000-4000-8000-000000000327', '02200000-0000-4000-8000-000000000210', 2, 'Capstone: Polishing & Launch',    'Polish, test, and launch the final portfolio.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02200000-0000-4000-8000-000000000328', '02200000-0000-4000-8000-000000000210', 3, 'Final Assessment',                 'Prove what you learned across the whole course.',                                'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02200000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02200000-0000-4000-8000-000000000401',
  '02200000-0000-4000-8000-000000000301',
  1,
  'What is Responsive Web Design?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Responsive Web Design?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Responsive Web Design?</h1>
  <p><strong>Responsive web design</strong> is the practice of building one page that adapts to any screen, from a 320&nbsp;px phone to a 4K monitor. Content reflows, images rescale, and navigation reorganizes. One URL, one codebase, many presentations.</p>
  <p>Ethan Marcotte coined the term in 2010 around three techniques that still define the field: <strong>fluid grids</strong>, <strong>flexible media</strong>, and <strong>media queries</strong>.</p>
  <h2>Responsive vs adaptive</h2>
  <p>People often mix these up. A responsive layout reflows continuously; an adaptive layout serves one of several fixed designs selected for a detected size.</p>
  <table>
    <tr><th>Characteristic</th><th>Responsive</th><th>Adaptive</th></tr>
    <tr><td>Approach</td><td>A single fluid codebase</td><td>Several fixed layouts</td></tr>
    <tr><td>Behavior</td><td>Continuous reflow</td><td>Snaps at preset sizes</td></tr>
    <tr><td>Maintenance</td><td>One codebase</td><td>Each layout evolves separately</td></tr>
    <tr><td>In-between sizes</td><td>Graceful</td><td>Not always</td></tr>
  </table>
  <h2>The three pillars</h2>
  <ul>
    <li><strong>Fluid grids</strong> — widths in relative units (<span class="ic">%</span>, <span class="ic">fr</span>) adapt to the container instead of hard-coded pixels.</li>
    <li><strong>Flexible media</strong> — images and video scale within their containers, never overflowing.</li>
    <li><strong>Media queries</strong> — CSS that applies only within a chosen viewport range.</li>
  </ul>
  <h2>Why one design for every screen?</h2>
  <p>Devices are not a ladder of fixed widths; there is a continuous spectrum from wearables to television. A single responsive URL is best for SEO and sharing, and a single codebase is cheapest to maintain.</p>
  <div class="callout callout-info">
    <strong>Remember the viewport tag</strong>
    <p>On mobile, pages render <em>wider</em> than the screen unless you add <span class="ic">&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</span> in the <span class="ic">&lt;head&gt;</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Do not design for devices</strong>
    <p>Design for <em>available space</em>. A phone in landscape, a split-screen laptop, a foldable tablet — the real question is always: how much width does this page have right now?</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000402',
  '02200000-0000-4000-8000-000000000302',
  1,
  'The Viewport & CSS Units',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Viewport & CSS Units</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Viewport &amp; CSS Units</h1>
  <p>Every responsive layout starts with understanding <strong>what the browser is drawing on</strong> — the viewport — and the <strong>units</strong> you measure it with.</p>
  <h2>The layout viewport</h2>
  <p>On a phone, the browser creates a layout viewport wider than the physical screen so that non-responsive pages can fit. The viewport meta tag resets it so CSS pixels match the device width:</p>
  <pre class="code-block">&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</pre>
  <p><span class="ic">width=device-width</span> sizes the layout viewport to the device; <span class="ic">initial-scale=1</span> maps one CSS pixel to one device pixel (or a multiple of it on retina screens).</p>
  <div class="callout">
    <strong>Pixels are not physical</strong>
    <p>A CSS <span class="ic">px</span> is an abstract unit. On a high-density phone, each CSS pixel may be painted by 2 or 3 physical pixels. Always design in CSS pixels.</p>
  </div>
  <h2>Absolute, relative, and viewport units</h2>
  <table>
    <tr><th>Unit</th><th>Relative to</th><th>Typical use</th></tr>
    <tr><td>px</td><td>nothing (absolute)</td><td>borders, small fixed detail</td></tr>
    <tr><td>%</td><td>the parent box</td><td>fluid widths, layout columns</td></tr>
    <tr><td>em</td><td>the element font-size</td><td>padding that scales with text</td></tr>
    <tr><td>rem</td><td>the root font-size</td><td>spacing and font sizes</td></tr>
    <tr><td>vw / vh</td><td>the viewport</td><td>full-bleed sections</td></tr>
    <tr><td>ch</td><td>the width of "0"</td><td>line length (measure)</td></tr>
  </table>
  <h2>rem and em together</h2>
  <pre class="code-block">:root { font-size: 16px; }        /* the browser default */
.card  { font-size: 1rem; }       /* 16px — always predictable */
.card  { padding: 1em; }          /* 16px here, scales if .card grows */
.card h3 { font-size: 1.5rem; }   /* 24px regardless of ancestors */</pre>
  <p><span class="ic">rem</span> is the safest sizing unit: one value, the root, always predictable. Reserve <span class="ic">em</span> for values that should scale with a particular element.</p>
  <h2>Viewport units with care</h2>
  <p><span class="ic">100vh</span> is taller than the <em>visible</em> area on mobile browsers with collapsing URL bars, which can cut off footers. Prefer <span class="ic">100dvh</span> (dynamic) or <span class="ic">min-height: 100svh</span> for full-screen sections.</p>
  <div class="callout callout-tip">
    <strong>Start with rem and %</strong>
    <p>About 90% of a responsive layout can be built from <span class="ic">rem</span> and <span class="ic">%</span>. Add <span class="ic">vw/vh</span> only when you truly want viewport-proportional sizing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000404',
  '02200000-0000-4000-8000-000000000304',
  1,
  'Fluid Layouts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fluid Layouts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Fluid Layouts</h1>
  <p>A <strong>fluid layout</strong> uses proportional widths so columns stretch and squeeze with the container instead of staying fixed. It is the foundation — the layer under your media queries.</p>
  <h2>box-sizing: border-box first</h2>
  <p>With the default <span class="ic">content-box</span> model, padding adds to a declared width, so two 50% cards plus padding overflow. One global rule fixes this:</p>
  <pre class="code-block">*, *::before, *::after { box-sizing: border-box; }</pre>
  <p>Now <span class="ic">width</span> means <em>everything inside the border</em>, and percentage math stays honest.</p>
  <h2>Percentages and max-width</h2>
  <pre class="code-block">.container { max-width: 1200px; margin-inline: auto; padding: 1rem; }
.main      { width: 66.666%; }   /* two-thirds column */
.side      { width: 33.333%; }   /* one-third column */</pre>
  <p><span class="ic">max-width</span> prevents a fluid container from becoming an unreadable full-width slab on huge monitors. Above it the width stops; below it, the layout flows.</p>
  <div class="callout">
    <strong>Percentages nest</strong>
    <p>A percentage always refers to the <em>parent</em> width. A 50% column inside a 50% column is 25% of the page. Keep the chain predictable.</p>
  </div>
  <h2>calc() for the leftovers</h2>
  <pre class="code-block">.sidebar { width: 260px; }
.content { width: calc(100% - 260px); }   /* fluid remainder */</pre>
  <p>Mixing a fixed sidebar with a fluid content area is the canonical <span class="ic">calc()</span> use case.</p>
  <h2>Say no to fixed-width columns</h2>
  <p>A <span class="ic">width: 400px</span> column on a 320&nbsp;px screen causes <strong>horizontal scrolling</strong> — the classic mobile bug. Every width you set should be a percentage, a min/max bound, or a space-aware flex or grid track.</p>
  <div class="callout callout-tip">
    <strong>Check for overflow</strong>
    <p>Open DevTools, set the viewport to 320&nbsp;px, and scroll horizontally. If anything moves sideways, an element is wider than its container — an overflow problem, not a breakpoint problem.</p>
  </div>
  <h2>Intrinsic sizing</h2>
  <p>Modern CSS also offers non-pixel options: <span class="ic">fit-content</span>, <span class="ic">min-content</span>, and <span class="ic">max-width: fit-content</span> size boxes by what is inside them. They combine beautifully with the flexbox and grid patterns in module&nbsp;3.</p>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000405',
  '02200000-0000-4000-8000-000000000305',
  1,
  'Media Queries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Media Queries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Media Queries</h1>
  <p><strong>Media queries</strong> check conditions — viewport width, orientation, color scheme, motion preference — and apply a block of CSS only when they hold. They are the third pillar of responsive design.</p>
  <h2>Anatomy of a media query</h2>
  <pre class="code-block">@media (min-width: 48rem) {
  .card { display: grid; grid-template-columns: 1fr 1fr; }
}</pre>
  <p>Everything inside the block applies only while the condition holds. Newer CSS also allows bare range syntax such as <span class="ic">@media (width &gt; 48rem)</span>.</p>
  <h2>min-width vs max-width</h2>
  <p>Prefer <span class="ic">min-width</span> queries — styles that apply <em>at or above</em> a width:</p>
  <pre class="code-block">/* base: one column */
.grid { display: grid; gap: 1rem; }

/* at >= 48rem: two columns */
@media (min-width: 48rem) { .grid { grid-template-columns: repeat(2, 1fr); } }
/* at >= 72rem: three columns */
@media (min-width: 72rem) { .grid { grid-template-columns: repeat(3, 1fr); } }</pre>
  <p><span class="ic">max-width</span> queries apply <em>at or below</em> a width and tend to pile up conflicting overrides. <span class="ic">min-width</span> keeps the cascade additive — later rules build on earlier ones.</p>
  <div class="callout">
    <strong>A number is not a strategy</strong>
    <p>Do not sprinkle raw pixel breakpoints through the file. Choose a few per layout, name them once (custom properties work well), and reuse them — you will do this in the capstone.</p>
  </div>
  <h2>Common features</h2>
  <table>
    <tr><th>Feature</th><th>Example</th><th>Use</th></tr>
    <tr><td>Width</td><td>(min-width: 48rem)</td><td>breakpoint layouts</td></tr>
    <tr><td>Orientation</td><td>(orientation: landscape)</td><td>charts, games, tables</td></tr>
    <tr><td>Color scheme</td><td>(prefers-color-scheme: dark)</td><td>dark mode</td></tr>
    <tr><td>Motion</td><td>(prefers-reduced-motion: reduce)</td><td>accessibility</td></tr>
    <tr><td>Pointer type</td><td>(hover: hover)</td><td>touch adjustments</td></tr>
  </table>
  <h2>Logical operators</h2>
  <pre class="code-block">/* and: both conditions must hold */
@media (min-width: 48rem) and (orientation: landscape) { ... }
/* or: comma-separated lists of queries */
@media (min-width: 72rem), (prefers-color-scheme: dark) { ... }
/* not: exclude a range */
@media not (max-width: 30rem) { ... }</pre>
  <div class="callout callout-tip">
    <strong>Test at the boundary</strong>
    <p>Resize gently past a breakpoint. Overlapping rules hide exactly at the boundary lines — the most common source of "it works on my screen" bugs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000407',
  '02200000-0000-4000-8000-000000000307',
  1,
  'Mobile-First CSS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mobile-First CSS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Mobile-First CSS</h1>
  <p><strong>Mobile-first</strong> means you write the small-screen layout first as your base styles, then enhance for larger screens with <span class="ic">min-width</span> queries. It forces content priority, is faster on phones, and keeps the cascade simple.</p>
  <h2>Desktop-first vs mobile-first</h2>
  <table>
    <tr><th>Aspect</th><th>Desktop-first</th><th>Mobile-first</th></tr>
    <tr><td>Base styles target</td><td>large screens</td><td>small screens</td></tr>
    <tr><td>Media queries</td><td>max-width (subtract)</td><td>min-width (add)</td></tr>
    <tr><td>Phone users download</td><td>desktop CSS and overrides</td><td>the base, nothing extra</td></tr>
    <tr><td>Content focus</td><td>design first, squeeze later</td><td>essential first, expand later</td></tr>
  </table>
  <h2>The workflow</h2>
  <ol>
    <li>Write the single-column experience <em>without</em> any media query — it is the default.</li>
    <li>Add layout and roomy surroundings at <span class="ic">min-width: 48rem</span>.</li>
    <li>Add the wide multi-column experience at <span class="ic">min-width: 72rem</span>.</li>
  </ol>
  <pre class="code-block">/* 1. base — content-first, single column */
.card { padding: 1rem; }

/* 2. more space available */
@media (min-width: 48rem) {
  .card-row { display: grid; gap: 1rem; grid-template-columns: repeat(2, 1fr); }
}

/* 3. wide layout */
@media (min-width: 72rem) {
  .card-row { grid-template-columns: repeat(3, 1fr); }
}</pre>
  <div class="callout callout-info">
    <strong>Media queries are layers</strong>
    <p>With <span class="ic">min-width</span>, later rules <em>override</em> earlier ones because they appear later in the cascade. Sorted small-to-large, the queries read like one continuous story.</p>
  </div>
  <h2>Why base styles are mobile styles</h2>
  <p>Base styles load on every screen. If your base is the desktop layout, a phone downloads desktop CSS and then fights it with overrides. If your base is the mobile layout, every device starts minimal and large screens are enhanced — less CSS, faster phones, clearer code.</p>
  <h2>Set content priority for free</h2>
  <p>Small screens are a forcing function: what does the user need first? The action, the message, and the navigation surface on top; supporting detail stays in the flow and is re-positioned — never hidden without a good reason.</p>
  <div class="callout callout-tip">
    <strong>Nobody is "hiding content on mobile"</strong>
    <p>Prefer reflowing content to <span class="ic">display: none</span>. Hidden content still lives in the document and hurts screen-reader and SEO users alike.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000408',
  '02200000-0000-4000-8000-000000000308',
  1,
  'Responsive Images',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Images</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Images</h1>
  <p>Responsive layouts need responsive images: sharp on retina, small on slow phones, and never a cause of layout shift. Two HTML tools handle this: <span class="ic">srcset</span> for resolution switching and the <span class="ic">&lt;picture&gt;</span> element for art direction.</p>
  <h2>srcset — let the browser choose</h2>
  <pre class="code-block">&lt;img src="lake.jpg"
     srcset="lake-640.jpg 640w, lake-1024.jpg 1024w, lake-1920.jpg 1920w"
     sizes="(min-width: 60rem) 50vw, 100vw"
     alt="Sunrise over the lake"&gt;</pre>
  <ul>
    <li><span class="ic">srcset</span> lists candidate files with their intrinsic width (<span class="ic">640w</span>) or device-pixel-ratio (<span class="ic">2x</span>).</li>
    <li><span class="ic">sizes</span> tells the browser how wide the image will render, so it can pick the right file.</li>
    <li>The browser decides — it knows the viewport, the pixel ratio, and the network.</li>
  </ul>
  <div class="callout">
    <strong>Reserve the space</strong>
    <p>Images without reserved space cause <strong>layout shift</strong> (a core Web Vital). Set real <span class="ic">width</span> and <span class="ic">height</span> attributes or an <span class="ic">aspect-ratio</span>, then let CSS keep it responsive: <span class="ic">img { height: auto; max-width: 100%; }</span>.</p>
  </div>
  <h2>The picture element — art direction</h2>
  <pre class="code-block">&lt;picture&gt;
  &lt;source media="(min-width: 40rem)" srcset="wide.jpg"&gt;
  &lt;img src="tall.jpg" alt="A hiking trail"&gt;
&lt;/picture&gt;</pre>
  <p><span class="ic">&lt;picture&gt;</span> serves entirely different crops per layout — landscape on desktop, portrait on mobile. Use it when the <em>content frame</em> differs, not just the resolution.</p>
  <h2>Modern formats</h2>
  <p>WebP and AVIF compress far better than JPEG and PNG. Offer them through a fallback chain inside <span class="ic">&lt;picture&gt;</span>:</p>
  <pre class="code-block">&lt;picture&gt;
  &lt;source type="image/avif" srcset="lake.avif"&gt;
  &lt;source type="image/webp" srcset="lake.webp"&gt;
  &lt;img src="lake.jpg" alt="Sunrise over the lake"&gt;
&lt;/picture&gt;</pre>
  <h2>Lazy loading and preloading</h2>
  <pre class="code-block">&lt;!-- below-the-fold images load on demand -->
&lt;img ... loading="lazy" decoding="async"&gt;

&lt;!-- the hero matters; fetch it early -->
&lt;link rel="preload" as="image" href="hero.jpg"&gt;</pre>
  <div class="callout callout-tip">
    <strong>Let a tool resize</strong>
    <p>Never upload one giant image and scale it with CSS. A CDN or your build pipeline can crunch the 640/1024/1920 variants for you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000410',
  '02200000-0000-4000-8000-000000000310',
  1,
  'Flexbox Responsive Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flexbox Responsive Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Flexbox Responsive Patterns</h1>
  <p>Flexbox is a one-dimensional layout model — a row or a column at a time. Its superpower for responsive sites: items can <strong>wrap</strong> and <strong>grow or shrink</strong> automatically, so many layouts adapt with zero media queries.</p>
  <h2>The wrapping row</h2>
  <pre class="code-block">.cards { display: flex; flex-wrap: wrap; gap: 1rem; }
.card  { flex: 1 1 220px; }   /* grow · shrink · base */</pre>
  <p>Each card starts at 220&nbsp;px. If cards do not fit, they wrap; if a line has leftover space, cards grow to share it. One rule, any number of columns, on every screen.</p>
  <div class="callout callout-info">
    <strong>flex shorthand</strong>
    <p><span class="ic">flex: 1 1 220px</span> means "grow allowed, shrink allowed, base 220&nbsp;px". Interpreting <span class="ic">flex-basis</span> as the smallest sensible width is the key to this pattern.</p>
  </div>
  <h2>When you need real control</h2>
  <pre class="code-block">.toolbar { display: flex; align-items: center; gap: 0.75rem; }
.toolbar .spacer { flex: 1; }             /* pushes the rest right */
@media (min-width: 40rem) {
  .toolbar .search { flex: 0 0 240px; }   /* fixed search on desktop */
}</pre>
  <p>Combining a wrapping flexbox with a media query for <em>exceptions</em> — not the whole layout — is the pragmatic everyday pattern.</p>
  <h2>Order and source order</h2>
  <pre class="code-block">.row { display: flex; }
.cta { order: -1; }          /* first visually, last in HTML */</pre>
  <p>On small screens you may want the price above the description without moving HTML. <span class="ic">order</span> reorders flex items; keep the HTML readable and use it sparingly because it detaches visible order from source order.</p>
  <div class="callout">
    <strong>Flexbox is one-dimensional</strong>
    <p>When you find yourself nesting rows <em>and</em> columns, you are building a grid. That is exactly what the <span class="ic">display: grid</span> module in the next lesson is for.</p>
  </div>
  <div class="callout callout-tip">
    <strong>gap replaces margins</strong>
    <p><span class="ic">gap</span> on the flex container spaces items without first- and last-child margin hacks — and it works in flexbox, grid, and multi-column layouts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000411',
  '02200000-0000-4000-8000-000000000311',
  1,
  'CSS Grid Responsive Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSS Grid Responsive Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CSS Grid Responsive Patterns</h1>
  <p>Grid is the <strong>two-dimensional</strong> layout system: rows and columns together. Its crown jewel for responsive sites is <span class="ic">auto-fill</span>/<span class="ic">auto-fit</span> combined with <span class="ic">minmax()</span> — fluid columns that need no media queries at all.</p>
  <h2>The media-query-free grid</h2>
  <pre class="code-block">.gallery { display: grid; gap: 1rem;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); }</pre>
  <p>This creates as many tracks as fit — each at least 260&nbsp;px, stretching anything leftover. A 320&nbsp;px phone shows one column; a 1200&nbsp;px desktop shows four. The layout responds without a single media query.</p>
  <div class="callout callout-info">
    <strong>auto-fill vs auto-fit</strong>
    <p><span class="ic">auto-fill</span> keeps empty tracks (ghost columns); <span class="ic">auto-fit</span> folds them away so tracks stretch wider. Use <span class="ic">auto-fit</span> for cards and galleries you want to fill the row.</p>
  </div>
  <h2>Whole-page layouts with template areas</h2>
  <pre class="code-block">.layout { display: grid; grid-template-columns: 1fr; grid-template-areas:
  "header" "main" "sidebar" "footer"; }
@media (min-width: 60rem) {
  .layout { grid-template-columns: 1fr 320px; grid-template-areas:
    "header header" "main sidebar" "footer footer"; }
}
.layout header { grid-area: header; }   /* ...and so on */</pre>
  <p><span class="ic">grid-template-areas</span> is the most readable way to describe a whole-page layout — the ASCII diagram doubles as documentation.</p>
  <h2>12-column systems without frameworks</h2>
  <pre class="code-block">.row { display: grid; grid-template-columns: repeat(12, 1fr); gap: 1rem; }
.col-3 { grid-column: span 3; }
.col-6 { grid-column: span 6; }
@media (max-width: 40rem) { .col-3, .col-6 { grid-column: span 12; } }</pre>
  <h2>Placing items anywhere</h2>
  <pre class="code-block">.panel { grid-column: 2 / 4; grid-row: 1 / 3; }   /* columns 2—3, rows 1—2 */</pre>
  <div class="callout callout-tip">
    <strong>Stack sources read in order</strong>
    <p>Set the small-screen layout first (single column), then let media queries <em>upgrade</em> to areas at larger widths. Screen readers and search engines follow HTML order — keep it logical.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000413',
  '02200000-0000-4000-8000-000000000313',
  1,
  'Responsive Typography',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Typography</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Typography</h1>
  <p>If layout is the skeleton, typography is the skin. Fluid type keeps headlines readable from phone to projector <em>without</em> a query per size — and with respect for what users set in their own browser.</p>
  <h2>Discover clamp()</h2>
  <pre class="code-block">.hero h1 { font-size: clamp(2rem, 5vw + 1rem, 4rem); }</pre>
  <p><span class="ic">clamp(MIN, PREFERRED, MAX)</span> is a range: below the minimum it holds, above the maximum it stops, and in between it scales fluidly. It replaces half a dozen media queries.</p>
  <h2>Base size and rem</h2>
  <pre class="code-block">html { font-size: 100%; }          /* keep the user setting */
h1   { font-size: 2rem; }
p    { font-size: 1rem; }
.small { font-size: 0.875rem; }</pre>
  <p>Size text with <span class="ic">rem</span> so larger global settings scale the whole site. Never hard-set <span class="ic">html { font-size: 62.5% }</span> and force pixel math — it overrides a user preference with an arbitrary 10&nbsp;px.</p>
  <div class="callout callout-info">
    <strong>Fluid type is for headings</strong>
    <p>Long body copy does not need fluid sizing — a steady, comfortable <span class="ic">1rem</span> (or so) with good line-height is easier to read than text that never stops moving.</p>
  </div>
  <h2>Line length and line-height</h2>
  <pre class="code-block">.prose { max-width: 65ch; line-height: 1.6; }
h1, h2, h3 { line-height: 1.2; }</pre>
  <p><span class="ic">ch</span> measures the width of the glyph "0" — capping paragraphs at <span class="ic">65ch</span> keeps lines a comfortable length on desktop while the fluid container shrinks them on mobile.</p>
  <h2>A fluid type scale</h2>
  <table>
    <tr><th>Element</th><th>clamp()</th><th>Feels like</th></tr>
    <tr><td>h1</td><td>clamp(2rem, 4vw + 1rem, 3.25rem)</td><td>28–52 px</td></tr>
    <tr><td>h2</td><td>clamp(1.5rem, 2vw + 1rem, 2.25rem)</td><td>24–36 px</td></tr>
    <tr><td>h3</td><td>clamp(1.25rem, 1vw + 1rem, 1.5rem)</td><td>20–24 px</td></tr>
    <tr><td>body</td><td>1rem</td><td>16 px</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Test with zoom</strong>
    <p>Users zoom to 200%, so your page must not. Open the page at 200% — if anything scratches off-screen, that is a reflow failure, not a type problem.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000414',
  '02200000-0000-4000-8000-000000000314',
  1,
  'Responsive Components & Breakpoints',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Components & Breakpoints</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Components &amp; Breakpoints</h1>
  <p>Big decisions happen once: how the main layout changes width. But most responsive problems are <strong>component</strong> problems — a card, a table, a nav — that break on their own schedules. Breakpoints belong to layouts; components get their own rules.</p>
  <h2>Content-driven breakpoints</h2>
  <p>The classic mistake is breakpoints at device widths (768, 1024). Instead, resize the browser and note exactly where the layout stops looking right. That spot is your breakpoint.</p>
  <ul>
    <li>Breakpoints mark where the <em>content</em> forced a decision, not where a phone ends.</li>
    <li>Every site needs only a handful — usually two or three.</li>
    <li>New content may force a new breakpoint later — that is normal.</li>
  </ul>
  <pre class="code-block">:root {
  --bp-narrow: 30rem;   /* 480px  — stack utilities */
  --bp-wide:   60rem;   /* 960px  — whole-page grid */
}</pre>
  <h2>Redesign vs reflow</h2>
  <p>At small widths a card usually <strong>reflows</strong> (image above, text below). Only at a component breakpoint does it <strong>redesign</strong> (image left, text right). Do not redesign what you can reflow.</p>
  <h2>A component that adapts</h2>
  <pre class="code-block">.feature { display: grid; gap: 1rem; }
@media (min-width: 36rem) {
  .feature { grid-template-columns: 8rem 1fr; align-items: start; }
}</pre>
  <h2>Breakpoints in design systems</h2>
  <p>In design systems, components each carry their own breakpoints. That is healthy — a nav change should not force a card change. Keep them next to the component and you can ship components independently.</p>
  <div class="callout">
    <strong>Breakpoints are not design requirements</strong>
    <p>Your job is not "make it work at 768px". Your job is "make it work at every size between 320&nbsp;px and the largest screen you care about." Breakpoints are just where the rules change.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Meet container queries</strong>
    <p>A component that must respect its own panel — not the whole page — is exactly the case <span class="ic">@container</span> solves later in module&nbsp;4. Component breakpoints and container queries are the same idea in two eras of CSS.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000416',
  '02200000-0000-4000-8000-000000000316',
  1,
  'Responsive Navigation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Navigation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Navigation</h1>
  <p>Navigation is the first thing that breaks when space shrinks. The menu has more work than any other component: it must stay findable, readable, and operable with fingers all the way down to 320&nbsp;px.</p>
  <h2>Pattern 1 — the wrapping row</h2>
  <pre class="code-block">.nav { display: flex; flex-wrap: wrap; gap: 0.5rem 1rem; }
.nav a { padding: 0.5rem 0.75rem; }
@media (min-width: 48rem) { .nav { justify-content: space-between; } }</pre>
  <p>Best when there are few links. It needs no JavaScript and never hides links. Use this as the default for small sites.</p>
  <h2>Pattern 2 — the toggle ("hamburger")</h2>
  <pre class="code-block">&lt;button class="nav-toggle" aria-expanded="false" aria-controls="menu"&gt;
  &lt;span class="sr-only"&gt;Menu&lt;/span&gt;
&lt;/button&gt;
&lt;nav id="menu" hidden&gt; ...links... &lt;/nav&gt;</pre>
  <p>The button shows on small screens; clicks toggle <span class="ic">hidden</span> on the menu. The state lives in <span class="ic">aria-expanded</span> so assistive tech announces open and closed turns.</p>
  <div class="callout">
    <strong>Never visible-only</strong>
    <p>A hamburger with <span class="ic">display: none</span> CSS is invisible but still focusable — keyboard users get stuck. Use the <span class="ic">hidden</span> attribute and let the toggle manage it.</p>
  </div>
  <h2>Pattern 3 — footer navigation</h2>
  <p>On small screens, a long menu can simply reflow to the footer, where vertical space is less precious:</p>
  <pre class="code-block">.site-nav { display: grid; gap: 0.25rem; }
@media (min-width: 40rem) { .site-nav { display: flex; } }</pre>
  <h2>Focus management by hand</h2>
  <pre class="code-block">menu.addEventListener('transitionend', () =&gt; {
  if (isOpen) closeBtn.focus();
});</pre>
  <p>When a drawer opens, move focus into it; when it closes, return focus to the toggle. Small screens have no hover to signal where focus lives.</p>
  <div class="callout callout-tip">
    <strong>Think fingers</strong>
    <p>Every link needs a touch target near 44&nbsp;px. Sparse padding and tiny type are the two most common mobile usability failures in navigation.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000417',
  '02200000-0000-4000-8000-000000000317',
  1,
  'Responsive Forms & Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Forms & Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Forms &amp; Tables</h1>
  <p>Forms and tables are the two most stubborn components on small screens. Forms because inputs look fixed; tables because rows outgrow widths. Both yield to the same mindset: shrink the chrome, keep the content.</p>
  <h2>Forms: full-width and stacked</h2>
  <pre class="code-block">.field { display: grid; gap: 0.375rem; }
input, select, textarea {
  width: 100%;               /* fluid — never fixed */
  min-height: 2.75rem;       /* touch-friendly */
  padding: 0.5rem 0.75rem;
  box-sizing: border-box;    /* keeps 100% honest */
}
@media (min-width: 40rem) {
  .field-row { display: flex; gap: 1rem; }
  .field-row .field { flex: 1; }
}</pre>
  <ul>
    <li>Labels above inputs on small screens; inline layouts only where space exists.</li>
    <li><span class="ic">type</span> attributes (<span class="ic">email</span>, <span class="ic">tel</span>, <span class="ic">number</span>) give mobile keyboards the right layout.</li>
    <li><span class="ic">autocomplete</span> attributes cut typing on every screen size.</li>
  </ul>
  <h2>Tables: the scroll wrapper</h2>
  <pre class="code-block">&lt;div class="table-wrap"&gt;
  &lt;table&gt; ... &lt;/table&gt;
&lt;/div&gt;
.table-wrap { overflow-x: auto; }</pre>
  <p>The cheapest fix and often the right one when every column matters. Add a subtle edge shadow so users notice more columns exist.</p>
  <h2>Tables: reflow into cards</h2>
  <p>When only some columns are critical, transform rows into stacked cards with CSS:</p>
  <pre class="code-block">@media (max-width: 40rem) {
  table, thead, tbody, tr, td { display: block; }
  tr { margin-bottom: 1.5rem; padding: 1rem; border: 1px solid #d1d5db; }
  td::before { content: attr(data-label); font-weight: 700; }
}
/* HTML cells carry their label: &lt;td data-label="Price"&gt; */</pre>
  <div class="callout">
    <strong>Hide chrome, keep information</strong>
    <p>If a column is decorative — icons, dates, secondary numbers — demote it last or hide it with a small-screen query. Hidden data is the first thing auditors flag.</p>
  </div>
  <h2>Long labels and input sizing</h2>
  <pre class="code-block">input { max-width: 100%; }
::placeholder { opacity: 0.6; }   /* never rely on placeholder to carry meaning */</pre>
  <div class="callout callout-tip">
    <strong>One column is fine</strong>
    <p>Keep the form column roughly 60-90 characters wide. A single-column form at 45&nbsp;rem is rarely the thing that overflows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000419',
  '02200000-0000-4000-8000-000000000319',
  1,
  'Responsive Performance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Performance</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Performance</h1>
  <p>Phones are not slower computers — they are computers with less bandwidth, cache, and battery. A responsive site must be a <strong>lean</strong> site: fewer bytes, less blocking, less layout work.</p>
  <h2>Why it is a responsive concern</h2>
  <p>The same page is served to a phone over a radio link and to a desktop over fiber. Every kilobyte you skip is a kilobyte your mobile users never wait for.</p>
  <table>
    <tr><th>Metric</th><th>What it measures</th><th>Typical mobile cause</th></tr>
    <tr><td>LCP</td><td>how fast the main content appears</td><td>hero text waiting on CSS</td></tr>
    <tr><td>CLS</td><td>how much the layout jumps</td><td>unreserved image space</td></tr>
    <tr><td>INP</td><td>how responsive the UI feels</td><td>heavy scripts on the main thread</td></tr>
  </table>
  <h2>Cargo: images first</h2>
  <pre class="code-block">&lt;img src="hero.jpg" width="1920" height="1080"
     srcset="hero-640.jpg 640w, hero-1280.jpg 1280w, hero-1920.jpg 1920w"
     sizes="100vw" alt="..." fetchpriority="high"&gt;</pre>
  <p>Then: <span class="ic">loading="lazy"</span> for below-the-fold images, WebP or AVIF encodings, and a resizing CDN.</p>
  <h2>CSS delivery</h2>
  <pre class="code-block">&lt;link rel="stylesheet" href="base.css"&gt;
&lt;link rel="stylesheet" href="layout-wide.css" media="(min-width: 48rem)"&gt;</pre>
  <p>Inline the critical CSS for first paint and load the rest later. Users need <em>visible</em> layout within a second, not a finished site.</p>
  <div class="callout callout-info">
    <strong>Media queries are network hints</strong>
    <p>A stylesheet linked with <span class="ic">media="(min-width: 48rem)"</span> still downloads on phones, but the browser can deprioritize it. Pair it with critical CSS for a measurable render win.</p>
  </div>
  <h2>Fonts</h2>
  <pre class="code-block">@font-face { font-family: 'Lora'; font-display: swap; ... }</pre>
  <p>Self-host fonts, subset them, serve WOFF2, and set <span class="ic">font-display: swap</span> so text paints instantly instead of holding invisible space.</p>
  <div class="callout callout-tip">
    <strong>Measure, then fix</strong>
    <p>Run Lighthouse on a throttled mobile profile (<span class="ic">Slow 4G</span>) before and after each change. Let the numbers drive the fixes.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000420',
  '02200000-0000-4000-8000-000000000320',
  1,
  'Responsive Design & Accessibility',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Design & Accessibility</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Responsive Design &amp; Accessibility</h1>
  <p>Responsive design is not a cosmetic feature — it is an accessibility feature. A page that reflows keeps content usable for low-vision users zooming, motor users with large pointers, and keyboard users at any viewport.</p>
  <h2>The 200% and reflow rules</h2>
  <p>Web Content Accessibility Guidelines (WCAG 1.4.4 and 1.4.10) require text to stay readable when zoomed to 200% and content to reflow without horizontal scrolling down to 320&nbsp;px. Your responsive layout <em>is</em> the implementation of these rules.</p>
  <table>
    <tr><th>Check</th><th>Expected</th></tr>
    <tr><td>Zoom to 200%</td><td>no lost content, no clipping</td></tr>
    <tr><td>Viewport at 320 px wide</td><td>no horizontal scroll</td></tr>
    <tr><td>Keyboard-only</td><td>focus visible in order</td></tr>
    <tr><td>Touch-only</td><td>large enough targets, no hover reliance</td></tr>
  </table>
  <h2>Touch targets</h2>
  <pre class="code-block">a, button { min-height: 44px; min-width: 44px;
  display: inline-flex; align-items: center; }</pre>
  <p>44 CSS pixels is the widely adopted target size. Adjacent links need spacing or they become one fused target.</p>
  <h2>Hover is a lie on touch</h2>
  <p>Menus that open on <span class="ic">:hover</span> are disasters on phones — there is no hover. Use <span class="ic">@media (hover: hover) and (pointer: fine)</span> to add hover affordances only where they truly exist.</p>
  <pre class="code-block">.drop { display: block; }                /* taps get the dropdown */
@media (hover: hover) {                  /* real pointers only */
  .drop:hover { display: block; }
}</pre>
  <h2>Reduce motion</h2>
  <pre class="code-block">@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 0.01ms !important; }
}</pre>
  <p>Respect the user setting and soften or disable animation. Motion and auto-playing elements trigger vestibular discomfort.</p>
  <div class="callout callout-info">
    <strong>Contrast fights density</strong>
    <p>Over busy photos, in dark mode, and in tiny gray captions, contrast gets crushed. Choose an accessible palette first, then adjust CSS custom properties per scheme.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Semantics travel</strong>
    <p>Headings, landmarks, and document order are free on any screen. A responsive layout inherits an accessible document; reflow must never break your heading structure.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000422',
  '02200000-0000-4000-8000-000000000322',
  1,
  'Container Queries & Modern CSS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Container Queries & Modern CSS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Container Queries &amp; Modern CSS</h1>
  <p>Media queries answer "how big is the <em>window</em>?" Container queries answer "how big is the <em>parent</em>?" A component inside a thin sidebar can now redesign itself without knowing — or caring — about the viewport.</p>
  <h2>Declare a container</h2>
  <pre class="code-block">.panel { container-type: inline-size; container-name: gallery; }</pre>
  <p><span class="ic">container-type: inline-size</span> makes an element a query container sized by its inline (usually horizontal) dimension; <span class="ic">container-name</span> gives that scope a name.</p>
  <h2>Query the container</h2>
  <pre class="code-block">.card { display: grid; gap: 1rem; }
@container gallery (min-width: 24rem) {
  .card { grid-template-columns: 6rem 1fr; align-items: start; }
}</pre>
  <p>The same card now adapts wherever it is dropped — sidebar, carousel, or full-width page — with no knowledge of the viewport.</p>
  <div class="callout callout-info">
    <strong>Container units</strong>
    <p>Container length units (<span class="ic">cqw</span>, <span class="ic">cqi</span>) measure the container. Prefer them when a value must scale with its container rather than the viewport.</p>
  </div>
  <h2>When to use which</h2>
  <table>
    <tr><th>Situation</th><th>Use</th></tr>
    <tr><td>Whole-page layout (header, footer, order)</td><td>media queries</td></tr>
    <tr><td>Reusable component inside varied hosts</td><td>container queries</td></tr>
  </table>
  <h2>Logical properties</h2>
  <pre class="code-block">.box { margin-inline: auto; padding-block: 1rem; }
/* "inline" = horizontal in LTR, vertical in vertical writing modes */</pre>
  <p><span class="ic">margin-inline</span>, <span class="ic">padding-block</span>, and <span class="ic">inset-inline-start</span> follow the writing direction, making a layout multilingual-ready without rework.</p>
  <h2>The :has() selector</h2>
  <pre class="code-block">.card:has(img) { grid-template-columns: 8rem 1fr; }   /* parent reacts to a child */</pre>
  <p><span class="ic">:has()</span> lets components adapt based on what is inside them — the closest CSS has come to data-driven layout.</p>
  <div class="callout callout-tip">
    <strong>Progressively enhance</strong>
    <p>Modern features are additive: the layout works in older browsers (usually stacking), then improves where supported. Check with a feature query: <span class="ic">@supports (container-type: inline-size)</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000423',
  '02200000-0000-4000-8000-000000000323',
  1,
  'Testing Responsive Designs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing Responsive Designs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Testing Responsive Designs</h1>
  <p>A responsive layout is a promise across infinite widths. You test it by resizing in DevTools, but real testing means covering the continuum: continuous resizes, emulation, real devices, and automated checks.</p>
  <h2>DevTools device mode</h2>
  <pre class="code-block">/* in Chrome: F12 → toggle device toolbar → drag width, refresh */</pre>
  <ul>
    <li>Dragging the width continuously exposes breakpoints as you cross them.</li>
    <li>Presets (iPhone SE, iPad, Surface) are useful <em>samples</em>, not targets.</li>
    <li>Network throttling (Slow 4G) is free inside the same panel.</li>
  </ul>
  <h2>The non-negotiable checks</h2>
  <ol>
    <li><strong>No horizontal scroll</strong> from 320&nbsp;px through 2560&nbsp;px.</li>
    <li><strong>Text is readable</strong> without zoom — no cramped columns, no overflow.</li>
    <li><strong>Targets are tappable</strong> — 44&nbsp;px minimum, nothing overlapping.</li>
    <li><strong>Nav works with keyboard and touch</strong> — focus visible in order.</li>
  </ol>
  <h2>Real devices beat emulation</h2>
  <p>Emulation fakes the viewport but not the rendering engine, memory, or touch feel. Test on the physical devices you have; borrow a friend phone to cover both platforms.</p>
  <h2>Automated regression</h2>
  <pre class="code-block"># Playwright-style intent:
# open URL, set 375px viewport, screenshot; set 1280px, screenshot</pre>
  <p>Screenshot tools keep layouts honest over time. Diff the newest screenshots against the last known-good state and any unexpected change surfaces immediately.</p>
  <div class="callout">
    <strong>Test like a user</strong>
    <p>Rotate the phone. Zoom to 200%. Scroll with one hand. Use only the keyboard. The bugs users notice are the ones that survive smooth-resize workflows.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep a written matrix</strong>
    <p>Record it: "I checked at 320&nbsp;px, 768&nbsp;px, and 1366&nbsp;px, in Chrome and Safari." A written matrix beats a vague memory at release time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000425',
  '02200000-0000-4000-8000-000000000325',
  1,
  'Capstone: Planning & Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Planning & Setup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Planning &amp; Setup</h1>
  <p>Time to build the capstone: a fully responsive, accessible, performant <strong>personal portfolio</strong> — one page that will act as your home online. You will author every layer yourself, mobile-first.</p>
  <h2>What you will build</h2>
  <ul>
    <li>A sticky header with responsive navigation.</li>
    <li>A hero section with fluid type and an optimized image.</li>
    <li>A projects grid built on <span class="ic">auto-fit minmax()</span>.</li>
    <li>An about section, a contact form, and a footer.</li>
    <li>Light and dark themes, reduced-motion support, and a Lighthouse score to be proud of.</li>
  </ul>
  <h2>Project structure</h2>
  <pre class="code-block">portfolio/
  index.html
  styles/
    tokens.css      /* custom properties: colors, spacing, type */
    base.css        /* reset, typography, utilities */
    layout.css      /* grid + media queries */
    components.css  /* cards, nav, form */
  assets/
    hero.jpg, hero@2x.jpg
    project-1.jpg ... project-4.jpg</pre>
  <h2>Design tokens first</h2>
  <pre class="code-block">:root {
  --color-bg: #ffffff;
  --color-text: #111827;
  --color-accent: #f43f5e;
  --space-1: 0.5rem; --space-2: 1rem; --space-3: 2rem;
  --radius: 12px;
  --max-w: 68rem;
}</pre>
  <p>Tokens are the single source of truth. Change <span class="ic">--color-accent</span> once and the whole theme follows.</p>
  <h2>Plan the breakpoints</h2>
  <p>Sketch first at three widths: narrow (one column), medium (two), wide (two columns with a sidebar or gallery). You will likely need exactly two <span class="ic">min-width</span> queries.</p>
  <div class="callout callout-info">
    <strong>Mobile-first by contract</strong>
    <p>Base CSS is the single-column layout with no query. Add <span class="ic">&gt; 48rem</span> then <span class="ic">&gt; 64rem</span> only where the content asks for them.</p>
  </div>
  <h2>First commit</h2>
  <pre class="code-block">git init
git add index.html styles/*
git commit -m "Scaffold: tokens, base styles, and page skeleton"
# push to GitHub early — portfolios are built in public</pre>
  <div class="callout callout-tip">
    <strong>Purpose before pixels</strong>
    <p>Who is this site for, and what is the one action you want them to take? Write the answer in a sentence before you open an editor. It decides every layout decision.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000426',
  '02200000-0000-4000-8000-000000000326',
  1,
  'Capstone: Building the Portfolio',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Portfolio</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building the Portfolio</h1>
  <p>Assemble the pieces from the planning lesson into a working mobile-first layout, then enhance upward. Base styles first — no media query — then two <span class="ic">min-width</span> layers.</p>
  <h2>Base: single column</h2>
  <pre class="code-block">body { margin: 0; font: 1rem/1.6 system-ui, sans-serif; }
header, main, footer { max-width: var(--max-w); margin-inline: auto; padding: var(--space-2); }
.hero h1 { font-size: clamp(2rem, 5vw + 1rem, 4rem); }</pre>
  <h2>The grid that grows itself</h2>
  <pre class="code-block">.projects { display: grid; gap: var(--space-2);
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); }</pre>
  <p>Hands off — the grid picks its own columns, from 1 on phones to 4 on wide screens. This is where <span class="ic">auto-fit minmax()</span> earns its keep.</p>
  <h2>Enhance at 48rem</h2>
  <pre class="code-block">@media (min-width: 48rem) {
  .site-header { display: flex; align-items: center; justify-content: space-between; }
  .site-nav    { display: flex; gap: 1rem; }
  .about       { display: grid; grid-template-columns: 16rem 1fr; gap: var(--space-3); }
}</pre>
  <h2>Enhance at 64rem</h2>
  <pre class="code-block">@media (min-width: 64rem) {
  .hero { display: grid; grid-template-columns: 1fr 1fr; align-items: center; gap: 3rem; }
}</pre>
  <h2>Responsive image + CLS safety</h2>
  <pre class="code-block">&lt;img src="hero.jpg" width="1280" height="720"
     srcset="hero.jpg 1280w, hero-2x.jpg 2560w"
     sizes="(min-width: 64rem) 40vw, 100vw"
     alt="A photo of me working"&gt;
/* CSS */
img { max-width: 100%; height: auto; }</pre>
  <div class="callout">
    <strong>Reserve the space</strong>
    <p>Without <span class="ic">width/height</span> (or <span class="ic">aspect-ratio</span>), the hero shifts the header as it loads — a CLS penalty on every visit.</p>
  </div>
  <h2>Theme and motion</h2>
  <pre class="code-block">@media (prefers-color-scheme: dark) {
  :root { --color-bg: #111827; --color-text: #e5e7eb; }
}
@media (prefers-reduced-motion: reduce) {
  * { animation: none !important; transition: none !important; }
}</pre>
  <div class="callout callout-tip">
    <strong>Commit early, verify often</strong>
    <p>After each layer, drag the DevTools viewport across every breakpoint. If a layout change surprises you, it belongs in the next commit — with a fix.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02200000-0000-4000-8000-000000000427',
  '02200000-0000-4000-8000-000000000327',
  1,
  'Capstone: Polishing & Launch',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Polishing & Launch</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #f43f5e; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #f43f5e; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Polishing &amp; Launch</h1>
  <p>The layout works — now make it fast, accessible, and ready to share. This is the difference between a drafted portfolio and a shipped one.</p>
  <h2>Performance budget</h2>
  <pre class="code-block"># Lighthouse targets (mobile throttled):
#   Performance 90+   Accessibility 100
#   Best Practices 100   SEO 95+
#   LCP &lt; 2.5s · CLS &lt; 0.1 · INP &lt; 200ms</pre>
  <p>Run Lighthouse on the built site, not the dev server. Optimize the largest offender first — usually the hero image by weight, then fonts.</p>
  <h2>Accessibility polish</h2>
  <ul>
    <li>Add <span class="ic">aria-expanded</span> to the nav toggle and manage focus on open and close.</li>
    <li>Give images thorough <span class="ic">alt</span> text — describe, do not decorate.</li>
    <li>Confirm a skip link: the first focusable element jumps to <span class="ic">#main</span>.</li>
    <li>Check contrast in both themes, not only light.</li>
  </ul>
  <h2>Final responsive pass</h2>
  <pre class="code-block"># checklist:
# 1. 320→2560px: no horizontal scroll
# 2. Zoom 200%: no clipping, text reflows
# 3. Keyboard: visible focus, logical order
# 4. Touch: 44px targets, toggle works
# 5. Rotated phones: layout adapts gracefully
# 6. Reduced-motion: no forced animation</pre>
  <h2>Meta: the invisible page</h2>
  <pre class="code-block">&lt;title&gt;Your Name — Responsive Front-End Developer&lt;/title&gt;
&lt;meta name="description" content="Portfolio of your work"&gt;
&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</pre>
  <p>Add a favicon and an Open Graph image so shared links look intentional, not random.</p>
  <h2>Launch</h2>
  <p>Deploy to a static host — GitHub Pages, Netlify, or Vercel. Keep the repository tidy, commit meaningful messages, and re-run Lighthouse against the production URL.</p>
  <div class="callout callout-tip">
    <strong>Launch is a milestone, not a finish</strong>
    <p>Real users will find the two issues you missed within the first week. Iterate: the responsive improvement loop never ends.</p>
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
  ('02200000-0000-4000-8000-000000000501', '02200000-0000-4000-8000-000000000303',
   'What is the primary characteristic of a responsive layout?',
   'A responsive layout reflows fluidly as the viewport changes size.', 1),
  ('02200000-0000-4000-8000-000000000502', '02200000-0000-4000-8000-000000000303',
   'Which meta tag maps the layout viewport to the device width?',
   'The viewport meta tag with width=device-width and initial-scale=1.', 2),
  ('02200000-0000-4000-8000-000000000503', '02200000-0000-4000-8000-000000000303',
   'Which CSS unit scales with the root element font-size?',
   'rem is always relative to the root font-size.', 3),
  ('02200000-0000-4000-8000-000000000504', '02200000-0000-4000-8000-000000000306',
   'Why is box-sizing: border-box recommended in responsive layouts?',
   'Widths then include padding and border, so percentage math stays simple.', 1),
  ('02200000-0000-4000-8000-000000000505', '02200000-0000-4000-8000-000000000306',
   'What does a media query with max-width: 768px apply to?',
   'It applies to any viewport 768 px wide or smaller.', 2),
  ('02200000-0000-4000-8000-000000000506', '02200000-0000-4000-8000-000000000306',
   'Which syntax is the idiom of a mobile-first workflow?',
   'Base styles target small screens, then min-width queries add complexity.', 3),
  ('02200000-0000-4000-8000-000000000507', '02200000-0000-4000-8000-000000000309',
   'What does mobile-first CSS mean in practice?',
   'Base styles for small screens are enhanced upward with min-width queries.', 1),
  ('02200000-0000-4000-8000-000000000508', '02200000-0000-4000-8000-000000000309',
   'Which attribute lets the browser choose among several sized image files?',
   'srcset lists candidate files and the browser picks the best match.', 2),
  ('02200000-0000-4000-8000-000000000509', '02200000-0000-4000-8000-000000000309',
   'What is art direction in responsive images?',
   'Serving different image crops for different layouts via the picture element.', 3),
  ('02200000-0000-4000-8000-000000000510', '02200000-0000-4000-8000-000000000312',
   'Which flexbox property makes items wrap onto a new line?',
   'flex-wrap (or the flex-flow shorthand) enables wrapping.', 1),
  ('02200000-0000-4000-8000-000000000511', '02200000-0000-4000-8000-000000000312',
   'What does repeat(auto-fill, minmax(260px, 1fr)) create?',
   'As many tracks of at least 260 px as fit — with no media queries.', 2),
  ('02200000-0000-4000-8000-000000000512', '02200000-0000-4000-8000-000000000312',
   'When do you choose grid over flexbox?',
   'When a two-dimensional rows-and-columns layout is needed.', 3),
  ('02200000-0000-4000-8000-000000000513', '02200000-0000-4000-8000-000000000315',
   'What does clamp(1rem, 2vw, 1.5rem) produce?',
   'A font-size that scales fluidly between 1rem and 1.5rem.', 1),
  ('02200000-0000-4000-8000-000000000514', '02200000-0000-4000-8000-000000000315',
   'Why is rem preferred for font sizes?',
   'It respects the root font-size users can set in their browser.', 2),
  ('02200000-0000-4000-8000-000000000515', '02200000-0000-4000-8000-000000000315',
   'What is a component breakpoint?',
   'A width where one component redesigns on its own, independent of the layout.', 3),
  ('02200000-0000-4000-8000-000000000516', '02200000-0000-4000-8000-000000000318',
   'Which ARIA attribute must a navigation toggle expose?',
   'aria-expanded announces whether the menu is open or closed.', 1),
  ('02200000-0000-4000-8000-000000000517', '02200000-0000-4000-8000-000000000318',
   'What is the first-choice pattern for a wide data table on mobile?',
   'Wrap the table in a horizontally scrollable container.', 2),
  ('02200000-0000-4000-8000-000000000518', '02200000-0000-4000-8000-000000000318',
   'What is the recommended minimum touch target size?',
   '44 by 44 CSS pixels is the widely adopted minimum.', 3),
  ('02200000-0000-4000-8000-000000000519', '02200000-0000-4000-8000-000000000321',
   'What causes layout shift (CLS)?',
   'Media loading without reserved space pushes content around.', 1),
  ('02200000-0000-4000-8000-000000000520', '02200000-0000-4000-8000-000000000321',
   'Which factor matters most for performance on mobile networks?',
   'The total bytes transferred over the network.', 2),
  ('02200000-0000-4000-8000-000000000521', '02200000-0000-4000-8000-000000000321',
   'What does prefers-reduced-motion let you do?',
   'Disable or soften animations for users who ask for reduced motion.', 3),
  ('02200000-0000-4000-8000-000000000522', '02200000-0000-4000-8000-000000000324',
   'Container queries size elements relative to what?',
   'The size of their containing element, not the viewport.', 1),
  ('02200000-0000-4000-8000-000000000523', '02200000-0000-4000-8000-000000000324',
   'Which pair of logical properties adapts to writing direction?',
   'margin-inline and padding-block follow the writing direction.', 2),
  ('02200000-0000-4000-8000-000000000524', '02200000-0000-4000-8000-000000000324',
   'What is the first thing to check when a page scrolls horizontally on mobile?',
   'A fixed-width element or media overflowing the viewport.', 3),
  ('02200000-0000-4000-8000-000000000525', '02200000-0000-4000-8000-000000000328',
   'Which workflow best matches a mobile-first approach?',
   'Start with small-screen base styles and add min-width media queries upward.', 1),
  ('02200000-0000-4000-8000-000000000526', '02200000-0000-4000-8000-000000000328',
   'Why does performance matter more on mobile?',
   'Mobile networks and hardware are slower than desktop.', 2),
  ('02200000-0000-4000-8000-000000000527', '02200000-0000-4000-8000-000000000328',
   'How do you avoid images causing layout shift?',
   'Reserve their space with width, height, or aspect-ratio.', 3),
  ('02200000-0000-4000-8000-000000000528', '02200000-0000-4000-8000-000000000328',
   'What are content-driven breakpoints?',
   'Breakpoints chosen where the layout starts to look wrong, not at device sizes.', 4),
  ('02200000-0000-4000-8000-000000000529', '02200000-0000-4000-8000-000000000328',
   'Which final check must your portfolio pass?',
   'No horizontal scroll from 320 px up, with reachable touch targets.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): reflow
  ('02200000-0000-4000-8000-000000001001', '02200000-0000-4000-8000-000000000501', 'It reflows fluidly as the viewport changes size', TRUE,  1),
  ('02200000-0000-4000-8000-000000001002', '02200000-0000-4000-8000-000000000501', 'It loads one fixed layout per detected device', FALSE, 2),
  ('02200000-0000-4000-8000-000000001003', '02200000-0000-4000-8000-000000000501', 'It only works at three preset widths', FALSE, 3),
  ('02200000-0000-4000-8000-000000001004', '02200000-0000-4000-8000-000000000501', 'It requires JavaScript to adjust the layout', FALSE, 4),
  -- Q1 (501)q2: viewport tag
  ('02200000-0000-4000-8000-000000001005', '02200000-0000-4000-8000-000000000502', 'It is a CSS property on the html element', FALSE, 1),
  ('02200000-0000-4000-8000-000000001006', '02200000-0000-4000-8000-000000000502', 'It sets the browser default font size', FALSE, 2),
  ('02200000-0000-4000-8000-000000001007', '02200000-0000-4000-8000-000000000502', 'The viewport meta tag with width=device-width', TRUE,  3),
  ('02200000-0000-4000-8000-000000001008', '02200000-0000-4000-8000-000000000502', 'A meta tag that detects the device brand', FALSE, 4),
  -- Q1 (501)q3: rem
  ('02200000-0000-4000-8000-000000001009', '02200000-0000-4000-8000-000000000503', 'px', FALSE, 1),
  ('02200000-0000-4000-8000-000000001010', '02200000-0000-4000-8000-000000000503', 'rem', TRUE,  2),
  ('02200000-0000-4000-8000-000000001011', '02200000-0000-4000-8000-000000000503', '%', FALSE, 3),
  ('02200000-0000-4000-8000-000000001012', '02200000-0000-4000-8000-000000000503', 'vh', FALSE, 4),
  -- Q2 (504): border-box
  ('02200000-0000-4000-8000-000000001013', '02200000-0000-4000-8000-000000000504', 'Padding grows boxes beyond their declared width', FALSE, 1),
  ('02200000-0000-4000-8000-000000001014', '02200000-0000-4000-8000-000000000504', 'Widths then include padding and border, keeping math simple', TRUE,  2),
  ('02200000-0000-4000-8000-000000001015', '02200000-0000-4000-8000-000000000504', 'Percentages then ignore the parent width', FALSE, 3),
  ('02200000-0000-4000-8000-000000001016', '02200000-0000-4000-8000-000000000504', 'It removes borders from the layout', FALSE, 4),
  -- Q2 (504)q2: max-width 768
  ('02200000-0000-4000-8000-000000001017', '02200000-0000-4000-8000-000000000505', 'Any viewport at least 768 px wide', FALSE, 1),
  ('02200000-0000-4000-8000-000000001018', '02200000-0000-4000-8000-000000000505', 'Only desktop monitors', FALSE, 2),
  ('02200000-0000-4000-8000-000000001019', '02200000-0000-4000-8000-000000000505', 'Only tablets in landscape', FALSE, 3),
  ('02200000-0000-4000-8000-000000001020', '02200000-0000-4000-8000-000000000505', 'Any viewport 768 px wide or smaller', TRUE,  4),
  -- Q2 (504)q3: mobile-first syntax
  ('02200000-0000-4000-8000-000000001021', '02200000-0000-4000-8000-000000000506', 'min-width queries that add layout as space grows', TRUE,  1),
  ('02200000-0000-4000-8000-000000001022', '02200000-0000-4000-8000-000000000506', 'max-width queries that remove layout as space shrinks', FALSE, 2),
  ('02200000-0000-4000-8000-000000001023', '02200000-0000-4000-8000-000000000506', 'Fixed-width base styles everywhere', FALSE, 3),
  ('02200000-0000-4000-8000-000000001024', '02200000-0000-4000-8000-000000000506', 'Using vw units for every measurement', FALSE, 4),
  -- Q3 (507): mobile-first meaning
  ('02200000-0000-4000-8000-000000001025', '02200000-0000-4000-8000-000000000507', 'Desktop styles first, then overrides for phones', FALSE, 1),
  ('02200000-0000-4000-8000-000000001026', '02200000-0000-4000-8000-000000000507', 'Serving different HTML per device', FALSE, 2),
  ('02200000-0000-4000-8000-000000001027', '02200000-0000-4000-8000-000000000507', 'Base styles for small screens, enhanced upward', TRUE,  3),
  ('02200000-0000-4000-8000-000000001028', '02200000-0000-4000-8000-000000000507', 'Hiding content on small screens', FALSE, 4),
  -- Q3 (507)q2: srcset
  ('02200000-0000-4000-8000-000000001029', '02200000-0000-4000-8000-000000000508', 'srcset', TRUE,  1),
  ('02200000-0000-4000-8000-000000001030', '02200000-0000-4000-8000-000000000508', 'role', FALSE, 2),
  ('02200000-0000-4000-8000-000000001031', '02200000-0000-4000-8000-000000000508', 'alt', FALSE, 3),
  ('02200000-0000-4000-8000-000000001032', '02200000-0000-4000-8000-000000000508', 'placeholder', FALSE, 4),
  -- Q3 (507)q3: art direction
  ('02200000-0000-4000-8000-000000001033', '02200000-0000-4000-8000-000000000509', 'Serving the same file in two formats', FALSE, 1),
  ('02200000-0000-4000-8000-000000001034', '02200000-0000-4000-8000-000000000509', 'Serving different crops for different layouts', TRUE,  2),
  ('02200000-0000-4000-8000-000000001035', '02200000-0000-4000-8000-000000000509', 'Compressing images on the server', FALSE, 3),
  ('02200000-0000-4000-8000-000000001036', '02200000-0000-4000-8000-000000000509', 'Cropping one file with CSS', FALSE, 4),
  -- Q4 (510): flex-wrap
  ('02200000-0000-4000-8000-000000001037', '02200000-0000-4000-8000-000000000510', 'justify-content', FALSE, 1),
  ('02200000-0000-4000-8000-000000001038', '02200000-0000-4000-8000-000000000510', 'align-items', FALSE, 2),
  ('02200000-0000-4000-8000-000000001039', '02200000-0000-4000-8000-000000000510', 'flex-direction', FALSE, 3),
  ('02200000-0000-4000-8000-000000001040', '02200000-0000-4000-8000-000000000510', 'flex-wrap', TRUE,  4),
  -- Q4 (510)q2: auto-fill minmax
  ('02200000-0000-4000-8000-000000001041', '02200000-0000-4000-8000-000000000511', 'Fixes the grid at exactly three columns', FALSE, 1),
  ('02200000-0000-4000-8000-000000001042', '02200000-0000-4000-8000-000000000511', 'As many tracks of at least 260 px as fit', TRUE,  2),
  ('02200000-0000-4000-8000-000000001043', '02200000-0000-4000-8000-000000000511', 'Requires a media query at every width', FALSE, 3),
  ('02200000-0000-4000-8000-000000001044', '02200000-0000-4000-8000-000000000511', 'Ignores the container width', FALSE, 4),
  -- Q4 (510)q3: grid over flex
  ('02200000-0000-4000-8000-000000001045', '02200000-0000-4000-8000-000000000512', 'For two-dimensional rows and columns together', TRUE,  1),
  ('02200000-0000-4000-8000-000000001046', '02200000-0000-4000-8000-000000000512', 'For aligning a few items in one row', FALSE, 2),
  ('02200000-0000-4000-8000-000000001047', '02200000-0000-4000-8000-000000000512', 'For spacing buttons evenly in a toolbar', FALSE, 3),
  ('02200000-0000-4000-8000-000000001048', '02200000-0000-4000-8000-000000000512', 'For wrapping text around an image', FALSE, 4),
  -- Q5 (513): clamp
  ('02200000-0000-4000-8000-000000001049', '02200000-0000-4000-8000-000000000513', 'A font-size that scales fluidly between 1rem and 1.5rem', TRUE,  1),
  ('02200000-0000-4000-8000-000000001050', '02200000-0000-4000-8000-000000000513', 'A font-size locked at exactly 2vw', FALSE, 2),
  ('02200000-0000-4000-8000-000000001051', '02200000-0000-4000-8000-000000000513', 'A shorthand for media queries', FALSE, 3),
  ('02200000-0000-4000-8000-000000001052', '02200000-0000-4000-8000-000000000513', 'A color function for gradients', FALSE, 4),
  -- Q5 (513)q2: rem preference
  ('02200000-0000-4000-8000-000000001053', '02200000-0000-4000-8000-000000000514', 'It equals the viewport width', FALSE, 1),
  ('02200000-0000-4000-8000-000000001054', '02200000-0000-4000-8000-000000000514', 'It ignores browser settings', FALSE, 2),
  ('02200000-0000-4000-8000-000000001055', '02200000-0000-4000-8000-000000000514', 'It is always exactly 16 px', FALSE, 3),
  ('02200000-0000-4000-8000-000000001056', '02200000-0000-4000-8000-000000000514', 'It respects the root font-size users can set', TRUE,  4),
  -- Q5 (513)q3: component breakpoint
  ('02200000-0000-4000-8000-000000001057', '02200000-0000-4000-8000-000000000515', 'A device width like 768 px', FALSE, 1),
  ('02200000-0000-4000-8000-000000001058', '02200000-0000-4000-8000-000000000515', 'A width where one component redesigns on its own', TRUE,  2),
  ('02200000-0000-4000-8000-000000001059', '02200000-0000-4000-8000-000000000515', 'A custom property for accent color', FALSE, 3),
  ('02200000-0000-4000-8000-000000001060', '02200000-0000-4000-8000-000000000515', 'A wrapper that prevents overflow', FALSE, 4),
  -- Q6 (516): aria-expanded
  ('02200000-0000-4000-8000-000000001061', '02200000-0000-4000-8000-000000000516', 'role="menu"', FALSE, 1),
  ('02200000-0000-4000-8000-000000001062', '02200000-0000-4000-8000-000000000516', 'aria-expanded', TRUE,  2),
  ('02200000-0000-4000-8000-000000001063', '02200000-0000-4000-8000-000000000516', 'tabindex="-1"', FALSE, 3),
  ('02200000-0000-4000-8000-000000001064', '02200000-0000-4000-8000-000000000516', 'data-open', FALSE, 4),
  -- Q6 (516)q2: scroll wrapper
  ('02200000-0000-4000-8000-000000001065', '02200000-0000-4000-8000-000000000517', 'Delete columns from the HTML', FALSE, 1),
  ('02200000-0000-4000-8000-000000001066', '02200000-0000-4000-8000-000000000517', 'Rotate the table 90 degrees', FALSE, 2),
  ('02200000-0000-4000-8000-000000001067', '02200000-0000-4000-8000-000000000517', 'Wrap it in a horizontally scrollable container', TRUE,  3),
  ('02200000-0000-4000-8000-000000001068', '02200000-0000-4000-8000-000000000517', 'Scale the table down with a transform', FALSE, 4),
  -- Q6 (516)q3: touch target
  ('02200000-0000-4000-8000-000000001069', '02200000-0000-4000-8000-000000000518', '44 by 44 CSS pixels minimum', TRUE,  1),
  ('02200000-0000-4000-8000-000000001070', '02200000-0000-4000-8000-000000000518', '16 by 16 CSS pixels', FALSE, 2),
  ('02200000-0000-4000-8000-000000001071', '02200000-0000-4000-8000-000000000518', '200 by 200 CSS pixels', FALSE, 3),
  ('02200000-0000-4000-8000-000000001072', '02200000-0000-4000-8000-000000000518', 'No minimum matters on touch', FALSE, 4),
  -- Q7 (519): CLS
  ('02200000-0000-4000-8000-000000001073', '02200000-0000-4000-8000-000000000519', 'Too many colors in the palette', FALSE, 1),
  ('02200000-0000-4000-8000-000000001074', '02200000-0000-4000-8000-000000000519', 'Images loading without reserved space', TRUE,  2),
  ('02200000-0000-4000-8000-000000001075', '02200000-0000-4000-8000-000000000519', 'Slow server responses', FALSE, 3),
  ('02200000-0000-4000-8000-000000001076', '02200000-0000-4000-8000-000000000519', 'Inline CSS in the head', FALSE, 4),
  -- Q7 (519)q2: mobile perf
  ('02200000-0000-4000-8000-000000001077', '02200000-0000-4000-8000-000000000520', 'The total bytes transferred over the network', TRUE,  1),
  ('02200000-0000-4000-8000-000000001078', '02200000-0000-4000-8000-000000000520', 'The device pixel ratio', FALSE, 2),
  ('02200000-0000-4000-8000-000000001079', '02200000-0000-4000-8000-000000000520', 'The brand of the browser', FALSE, 3),
  ('02200000-0000-4000-8000-000000001080', '02200000-0000-4000-8000-000000000520', 'The time of day', FALSE, 4),
  -- Q7 (519)q3: reduced motion
  ('02200000-0000-4000-8000-000000001081', '02200000-0000-4000-8000-000000000521', 'It changes the layout colors', FALSE, 1),
  ('02200000-0000-4000-8000-000000001082', '02200000-0000-4000-8000-000000000521', 'It forces animations to run longer', FALSE, 2),
  ('02200000-0000-4000-8000-000000001083', '02200000-0000-4000-8000-000000000521', 'It lets you disable animation for users who ask', TRUE,  3),
  ('02200000-0000-4000-8000-000000001084', '02200000-0000-4000-8000-000000000521', 'It only works in Chrome', FALSE, 4),
  -- Q8 (522): container queries
  ('02200000-0000-4000-8000-000000001085', '02200000-0000-4000-8000-000000000522', 'The viewport width', FALSE, 1),
  ('02200000-0000-4000-8000-000000001086', '02200000-0000-4000-8000-000000000522', 'The device pixel ratio', FALSE, 2),
  ('02200000-0000-4000-8000-000000001087', '02200000-0000-4000-8000-000000000522', 'The root font size', FALSE, 3),
  ('02200000-0000-4000-8000-000000001088', '02200000-0000-4000-8000-000000000522', 'The size of their containing element', TRUE,  4),
  -- Q8 (522)q2: logical properties
  ('02200000-0000-4000-8000-000000001089', '02200000-0000-4000-8000-000000000523', 'margin-inline and padding-block', TRUE,  1),
  ('02200000-0000-4000-8000-000000001090', '02200000-0000-4000-8000-000000000523', 'margin-top and padding-bottom', FALSE, 2),
  ('02200000-0000-4000-8000-000000001091', '02200000-0000-4000-8000-000000000523', 'width and height', FALSE, 3),
  ('02200000-0000-4000-8000-000000001092', '02200000-0000-4000-8000-000000000523', 'left and right', FALSE, 4),
  -- Q8 (522)q3: horizontal scroll
  ('02200000-0000-4000-8000-000000001093', '02200000-0000-4000-8000-000000000524', 'A broken media query', FALSE, 1),
  ('02200000-0000-4000-8000-000000001094', '02200000-0000-4000-8000-000000000524', 'A fixed-width element or media overflowing the viewport', TRUE,  2),
  ('02200000-0000-4000-8000-000000001095', '02200000-0000-4000-8000-000000000524', 'Too few custom properties', FALSE, 3),
  ('02200000-0000-4000-8000-000000001096', '02200000-0000-4000-8000-000000000524', 'Missing WebP images', FALSE, 4),
  -- Q9 (525): mobile-first workflow
  ('02200000-0000-4000-8000-000000001097', '02200000-0000-4000-8000-000000000525', 'Start large and shrink with max-width', FALSE, 1),
  ('02200000-0000-4000-8000-000000001098', '02200000-0000-4000-8000-000000000525', 'Insert a media query for every feature', FALSE, 2),
  ('02200000-0000-4000-8000-000000001099', '02200000-0000-4000-8000-000000000525', 'Style small screens first, add min-width layers', TRUE,  3),
  ('02200000-0000-4000-8000-000000001100', '02200000-0000-4000-8000-000000000525', 'Hide non-essential features on phones', FALSE, 4),
  -- Q9 (525)q2: mobile perf
  ('02200000-0000-4000-8000-000000001101', '02200000-0000-4000-8000-000000000526', 'Mobile networks and hardware are slower than desktop', TRUE,  1),
  ('02200000-0000-4000-8000-000000001102', '02200000-0000-4000-8000-000000000526', 'Phones have bigger screens to fill', FALSE, 2),
  ('02200000-0000-4000-8000-000000001103', '02200000-0000-4000-8000-000000000526', 'Performance is only a branding concern', FALSE, 3),
  ('02200000-0000-4000-8000-000000001104', '02200000-0000-4000-8000-000000000526', 'Desktop users never scroll', FALSE, 4),
  -- Q9 (525)q3: layout shift
  ('02200000-0000-4000-8000-000000001105', '02200000-0000-4000-8000-000000000527', 'Compress images with a CDN', FALSE, 1),
  ('02200000-0000-4000-8000-000000001106', '02200000-0000-4000-8000-000000000527', 'Lazy-load every image on the page', FALSE, 2),
  ('02200000-0000-4000-8000-000000001107', '02200000-0000-4000-8000-000000000527', 'Use PNG instead of WebP', FALSE, 3),
  ('02200000-0000-4000-8000-000000001108', '02200000-0000-4000-8000-000000000527', 'Reserve space with width, height, or aspect-ratio', TRUE,  4),
  -- Q9 (525)q4: content breakpoints
  ('02200000-0000-4000-8000-000000001109', '02200000-0000-4000-8000-000000000528', 'Breakpoints chosen from a list of popular devices', FALSE, 1),
  ('02200000-0000-4000-8000-000000001110', '02200000-0000-4000-8000-000000000528', 'Breakpoints chosen where the layout starts to look wrong', TRUE,  2),
  ('02200000-0000-4000-8000-000000001111', '02200000-0000-4000-8000-000000000528', 'One breakpoint per component feature', FALSE, 3),
  ('02200000-0000-4000-8000-000000001112', '02200000-0000-4000-8000-000000000528', 'Breakpoints locked to fixed pixel values', FALSE, 4),
  -- Q9 (525)q5: final check
  ('02200000-0000-4000-8000-000000001113', '02200000-0000-4000-8000-000000000529', 'No horizontal scroll from 320 px up, touch targets reachable', TRUE,  1),
  ('02200000-0000-4000-8000-000000001114', '02200000-0000-4000-8000-000000000529', 'A valid HTML document only', FALSE, 2),
  ('02200000-0000-4000-8000-000000001115', '02200000-0000-4000-8000-000000000529', 'A favicon and a title tag', FALSE, 3),
  ('02200000-0000-4000-8000-000000001116', '02200000-0000-4000-8000-000000000529', 'A dark theme', FALSE, 4)
ON CONFLICT (id) DO NOTHING;