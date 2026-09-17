-- ============================================================================
-- SEED 024: Complete course — "Modern CSS Layouts: Flexbox & Grid"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Layout Foundations       → C1 The Box Model · C2 Display & Normal Flow
--   M2 Flexbox                  → C3 Flex Containers · C4 Flex Items & Alignment
--   M3 CSS Grid                 → C5 Tracks & Placement · C6 Areas & Alignment
--   M4 Modern Layout Tools      → C7 Subgrid & Container Queries · C8 Responsive Patterns
--   M5 Capstone: Course Landing → C9 Page Structure · C10 Building & Polishing
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
  '01800000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'Modern CSS Layouts: Flexbox & Grid',
  'modern-css-layouts-flexbox-grid',
  'Master layout on the modern web. Learn the box model and normal flow, then build real interfaces with Flexbox and CSS Grid — and finish with subgrid, container queries, and a complete responsive page layout.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  22
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01800000-0000-4000-8000-000000000011', '01800000-0000-4000-8000-000000000001', 'Predict how any element renders by reasoning about the box model and normal flow.', 1),
  ('01800000-0000-4000-8000-000000000012', '01800000-0000-4000-8000-000000000001', 'Build one-dimensional layouts with flex containers, flex items, and alignment.',     2),
  ('01800000-0000-4000-8000-000000000013', '01800000-0000-4000-8000-000000000001', 'Construct two-dimensional page layouts with grid tracks and named areas.',            3),
  ('01800000-0000-4000-8000-000000000014', '01800000-0000-4000-8000-000000000001', 'Apply subgrid, container queries, and responsive patterns to real components.',      4),
  ('01800000-0000-4000-8000-000000000015', '01800000-0000-4000-8000-000000000001', 'Assemble and refine a complete responsive landing page layout from scratch.',        5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01800000-0000-4000-8000-000000000101', '01800000-0000-4000-8000-000000000001', 1, 'Layout Foundations',          'Understand the box model and normal flow.',            'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000102', '01800000-0000-4000-8000-000000000001', 2, 'Flexbox',                     'Master one-dimensional layout with flex containers.',  'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000103', '01800000-0000-4000-8000-000000000001', 3, 'CSS Grid',                    'Build two-dimensional layouts with tracks and areas.', 'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000104', '01800000-0000-4000-8000-000000000001', 4, 'Modern Layout Tools',         'Level up with subgrid and container queries.',         'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000105', '01800000-0000-4000-8000-000000000001', 5, 'Capstone: Course Landing',    'Assemble a complete responsive page layout.',          'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01800000-0000-4000-8000-000000000201', '01800000-0000-4000-8000-000000000101', 1, 'The Box Model',            'Content, padding, border, and margin.',                    'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000202', '01800000-0000-4000-8000-000000000101', 2, 'Display & Normal Flow',     'How block, inline, and flex shape layout.',                'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000203', '01800000-0000-4000-8000-000000000102', 1, 'Flex Containers',           'Creating flex contexts and ordering content.',             'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000204', '01800000-0000-4000-8000-000000000102', 2, 'Flex Items & Alignment',    'Sizing, wrapping, and aligning flex items.',               'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000205', '01800000-0000-4000-8000-000000000103', 1, 'Tracks & Placement',        'Columns, rows, and placing items.',                        'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000206', '01800000-0000-4000-8000-000000000103', 2, 'Areas & Alignment',         'Named areas and box alignment.',                           'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000207', '01800000-0000-4000-8000-000000000104', 1, 'Subgrid & Container Queries', 'Nested grids and size queries.',                          'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000208', '01800000-0000-4000-8000-000000000104', 2, 'Responsive Patterns',       'Fluid flex and grid systems.',                             'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000209', '01800000-0000-4000-8000-000000000105', 1, 'Page Structure',            'Structuring the capstone page.',                           'PUBLISHED'),
  ('01800000-0000-4000-8000-000000000210', '01800000-0000-4000-8000-000000000105', 2, 'Building & Polishing',      'Assembling and refining the layout.',                      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01800000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01800000-0000-4000-8000-000000000301', '01800000-0000-4000-8000-000000000201', 1, 'The Box Model',                         'See how content, padding, border, and margin make up every element.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000302', '01800000-0000-4000-8000-000000000201', 2, 'Normal Flow & the Display Property',     'Understand block and inline flow and how display reshapes it.',        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000303', '01800000-0000-4000-8000-000000000201', 3, 'Layout Foundations Quiz',                'Check your box model and normal flow knowledge.',                      'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000304', '01800000-0000-4000-8000-000000000202', 1, 'Block, Inline & Centering',              'Compare layout modes and center content horizontally.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000305', '01800000-0000-4000-8000-000000000202', 2, 'Why Flexbox?',                           'See the problem flexbox solves and meet its two axes.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000306', '01800000-0000-4000-8000-000000000202', 3, 'Display & Flexbox Intro Quiz',            'Test block, inline, and flexbox basics.',                              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000307', '01800000-0000-4000-8000-000000000203', 1, 'Flex Containers & the Main Axis',        'Create a flex context and direct items along the main axis.',          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000308', '01800000-0000-4000-8000-000000000203', 2, 'Flex Direction, Wrap & Gap',             'Reorder and wrap items with flex-flow, wrap, and gap.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('01800000-0000-4000-8000-000000000309', '01800000-0000-4000-8000-000000000203', 3, 'Flex Containers Quiz',                   'Verify your container-level flex skills.',                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000310', '01800000-0000-4000-8000-000000000204', 1, 'Flex Items: grow, shrink & basis',       'Control how items size themselves inside the row.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('01800000-0000-4000-8000-000000000311', '01800000-0000-4000-8000-000000000204', 2, 'Aligning Flex Items',                    'Align items on the cross and main axes.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('01800000-0000-4000-8000-000000000312', '01800000-0000-4000-8000-000000000204', 3, 'Flex Items & Alignment Quiz',            'Prove you can size and align flex items.',                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000313', '01800000-0000-4000-8000-000000000205', 1, 'Grid Tracks: Rows & Columns',            'Define columns and rows with fr, minmax, and repeat.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('01800000-0000-4000-8000-000000000314', '01800000-0000-4000-8000-000000000205', 2, 'Placing Grid Items',                     'Place items with line numbers, span, and grid-area.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000315', '01800000-0000-4000-8000-000000000205', 3, 'Grid Tracks & Placement Quiz',           'Test your track and placement knowledge.',                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000316', '01800000-0000-4000-8000-000000000206', 1, 'Grid Template Areas',                    'Name layout regions and place content with areas.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('01800000-0000-4000-8000-000000000317', '01800000-0000-4000-8000-000000000206', 2, 'Aligning Grid Items',                    'Apply box alignment inside grid cells and tracks.',                    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000318', '01800000-0000-4000-8000-000000000206', 3, 'CSS Grid Quiz',                          'Check your grid areas and alignment skills.',                          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000319', '01800000-0000-4000-8000-000000000207', 1, 'Subgrid',                                 'Align nested child grids to their parent tracks.',                     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01800000-0000-4000-8000-000000000320', '01800000-0000-4000-8000-000000000207', 2, 'Container Queries',                      'Style components from their own container size.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000321', '01800000-0000-4000-8000-000000000207', 3, 'Subgrid & Container Queries Quiz',       'Verify advanced nesting and component queries.',                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000322', '01800000-0000-4000-8000-000000000208', 1, 'Responsive Flex Patterns',               'Build fluid navigation, cards, and splits with flex.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000323', '01800000-0000-4000-8000-000000000208', 2, 'Responsive Grid Patterns',               'Create fluid grids with auto-fit, minmax, and clamp.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000324', '01800000-0000-4000-8000-000000000208', 3, 'Responsive Layouts Quiz',                'Check your responsive pattern knowledge.',                             'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01800000-0000-4000-8000-000000000325', '01800000-0000-4000-8000-000000000209', 1, 'Capstone: Page Structure & Design Tokens','Set up the capstone HTML skeleton and CSS variables.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  9),
  ('01800000-0000-4000-8000-000000000326', '01800000-0000-4000-8000-000000000210', 1, 'Capstone: Nav, Cards & Flex Layouts',    'Build the header, nav, and card grid with flex.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 11),
  ('01800000-0000-4000-8000-000000000327', '01800000-0000-4000-8000-000000000210', 2, 'Capstone: Assembling the Grid',          'Combine grid areas and responsive rules into the full page.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01800000-0000-4000-8000-000000000328', '01800000-0000-4000-8000-000000000210', 3, 'Final Assessment',                       'Test your understanding across the whole course.',                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01800000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01800000-0000-4000-8000-000000000401',
  '01800000-0000-4000-8000-000000000301',
  1,
  'The Box Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Box Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>The Box Model</h1>
  <p>Every element rendered by the browser is a <strong>box</strong>. Understanding how that box is assembled is the single biggest unlock for predictable CSS layout.</p>
  <h2>The four layers</h2>
  <p>Working from the inside out, each box has four parts:</p>
  <ul>
    <li><strong>Content</strong> — the text, image, or nested elements; sized by <span class="ic">width</span> and <span class="ic">height</span>.</li>
    <li><strong>Padding</strong> — space <em>inside</em> the border, around the content; it is part of the visible box.</li>
    <li><strong>Border</strong> — the line (visible or transparent) around the padding.</li>
    <li><strong>Margin</strong> — space <em>outside</em> the border that separates the box from its neighbors.</li>
  </ul>
  <pre class="code-block">.card {
  width: 300px;
  padding: 16px;          /* space inside the border  */
  border: 1px solid #d1d5db;
  margin: 24px auto;      /* space outside the border */
}</pre>
  <table>
    <tr><th>Part</th><th>Location</th><th>Notes</th></tr>
    <tr><td>content</td><td>innermost</td><td>sized by width, height, and min/max sizes</td></tr>
    <tr><td>padding</td><td>around content</td><td>the background covers padding too</td></tr>
    <tr><td>border</td><td>around padding</td><td>width, style, and color</td></tr>
    <tr><td>margin</td><td>outside the border</td><td>transparent — never shows a background</td></tr>
  </table>
  <h2>content-box vs border-box</h2>
  <p>With the default <span class="ic">box-sizing: content-box</span>, a declared <span class="ic">width: 300px</span> sizes only the content; padding and border are <em>added</em> on top. That arithmetic causes endless surprises. <span class="ic">border-box</span> makes the declared width include everything up to the border edge:</p>
  <pre class="code-block">*,
*::before,
*::after {
  box-sizing: border-box;
}</pre>
  <div class="callout callout-tip">
    <strong>Global reset</strong>
    <p>Apply <span class="ic">border-box</span> to every element once at the top of your stylesheet. You will never add padding and border widths by hand again.</p>
  </div>
  <h2>Margins that overlap</h2>
  <p>Adjacent vertical margins in normal flow <strong>collapse</strong> — the larger of the two wins instead of the sum. Padding and borders never collapse, which is why padding is often the safer spacing tool.</p>
  <div class="callout callout-info">
    <strong>DevTools to the rescue</strong>
    <p>The box model diagram in browser DevTools paints each layer in a different color and shows the computed size of every part. When a layout misbehaves, inspect it first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000402',
  '01800000-0000-4000-8000-000000000302',
  1,
  'Normal Flow & the Display Property',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Normal Flow & the Display Property</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Normal Flow &amp; the Display Property</h1>
  <p>Before any layout module, browsers place elements in <strong>normal flow</strong>: block boxes stack top to bottom, while inline boxes flow horizontally inside a line like words.</p>
  <h2>Block boxes</h2>
  <ul>
    <li>Fill the width of their parent by default.</li>
    <li>Stack one above the other.</li>
    <li>Respect <span class="ic">width</span>, <span class="ic">height</span>, and all margins and padding.</li>
    <li>Examples: <span class="ic">&lt;div&gt;</span>, <span class="ic">&lt;p&gt;</span>, <span class="ic">&lt;h1&gt;</span>, <span class="ic">&lt;section&gt;</span>.</li>
  </ul>
  <h2>Inline boxes</h2>
  <ul>
    <li>Flow left to right within text.</li>
    <li>Ignore <span class="ic">width</span> and <span class="ic">height</span>.</li>
    <li>Apply horizontal padding and margins; vertical ones do not push neighbors.</li>
    <li>Examples: <span class="ic">&lt;span&gt;</span>, <span class="ic">&lt;a&gt;</span>, <span class="ic">&lt;strong&gt;</span>.</li>
  </ul>
  <table>
    <tr><th>Behavior</th><th>Block</th><th>Inline</th></tr>
    <tr><td>default width</td><td>fills parent</td><td>shrinks to content</td></tr>
    <tr><td>width / height</td><td>applied</td><td>ignored</td></tr>
    <tr><td>vertical margins</td><td>applied (may collapse)</td><td>not applied</td></tr>
    <tr><td>stacking</td><td>new line after</td><td>same line</td></tr>
  </table>
  <h2>Switching with display</h2>
  <p><span class="ic">display</span> changes how an element participates in flow. Turning a <span class="ic">&lt;li&gt;</span> into <span class="ic">inline-block</span> lays nav links on one line while still honoring width and vertical margins:</p>
  <pre class="code-block">nav a {
  display: inline-block;
  padding: 6px 12px;
}</pre>
  <div class="callout callout-info">
    <strong>The inline-block gap</strong>
    <p>Inline and inline-block boxes render the whitespace between tags, producing tiny gaps. Flexbox and grid, coming later, remove that problem entirely.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Modern default</strong>
    <p>Reach for flex or grid for real layout work. <span class="ic">display: inline-block</span> survives mainly as a simple utility.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000404',
  '01800000-0000-4000-8000-000000000304',
  1,
  'Block, Inline & Centering',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Block, Inline & Centering</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Block, Inline &amp; Centering</h1>
  <p>Centering is where beginners fight the box model. The trick is choosing the right technique per axis and per display mode.</p>
  <h2>Centering a block box</h2>
  <p>A block box fills its parent, so to center it you must constrain its width, then let the browser split the leftover margin equally:</p>
  <pre class="code-block">.container {
  width: min(720px, 100%);
  margin-left: auto;
  margin-right: auto;
}</pre>
  <p><span class="ic">margin: 0 auto</span> is the shorthand. Without a width, a block is already full-width, so there is no leftover space to auto-distribute.</p>
  <h2>Centering inline content</h2>
  <p>Text and inline children center with <span class="ic">text-align: center</span> on the parent:</p>
  <pre class="code-block">.hero {
  text-align: center;
}</pre>
  <h2>The vertical version</h2>
  <p>Vertical centering is a different beast: margins will not auto-center in the block axis, and <span class="ic">height</span> on a container rarely matches its content height. Flexbox solves this with <span class="ic">align-items: center</span> — proven in module 2.</p>
  <table>
    <tr><th>What you want centered</th><th>Technique</th></tr>
    <tr><td>block box in a parent</td><td>width + margin auto</td></tr>
    <tr><td>text / inline children</td><td>text-align center</td></tr>
    <tr><td>a flex container child</td><td>justify-content + align-items</td></tr>
  </table>
  <div class="callout">
    <strong>Auto only centers one axis</strong>
    <p><span class="ic">margin: auto</span> distributes free space horizontally. It does nothing vertically, because block flow lets height grow to its content.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Sneak preview</strong>
    <p><span class="ic">display: flex</span> on a parent centers any child in both axes with two properties. That is the subject of the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000405',
  '01800000-0000-4000-8000-000000000305',
  1,
  'Why Flexbox?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Flexbox?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Why Flexbox?</h1>
  <p>For twenty years, developers hacked floats and tables to line things up. Flexbox is the first CSS layout model designed around distribution along a single line.</p>
  <h2>What flexbox is for</h2>
  <p>Flexbox lays out items in <strong>one dimension</strong> at a time — a row or a column — and gives you fine control over how space is distributed and how items shrink and wrap. It is ideal for navigations, toolbars, card rows, and centering.</p>
  <h2>Turning a container into flex</h2>
  <pre class="code-block">.toolbar {
  display: flex;
  gap: 12px;
}</pre>
  <p>That single declaration makes <span class="ic">.toolbar</span> a <em>flex container</em> and its children <em>flex items</em>. The items stop padding out the full width and line up side by side.</p>
  <h2>Two axes</h2>
  <p>Flexbox always works along two perpendicular axes:</p>
  <ul>
    <li><strong>Main axis</strong> — the direction items flow, set by <span class="ic">flex-direction</span>.</li>
    <li><strong>Cross axis</strong> — the perpendicular direction.</li>
  </ul>
  <pre class="code-block">.stack {
  display: flex;
  flex-direction: column;   /* main axis becomes vertical */
  align-items: center;      /* align on the cross axis     */
}</pre>
  <div class="callout callout-tip">
    <strong>Remember the pair</strong>
    <p><span class="ic">justify-content</span> distributes on the <em>main</em> axis; <span class="ic">align-items</span> positions on the <em>cross</em> axis. Two properties cover most flex layouts.</p>
  </div>
  <div class="callout callout-info">
    <strong>No more floats</strong>
    <p>Flexbox replaces float-based rows and clearfixes. Components you once built with <span class="ic">float: left</span> are now a single clean container.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000407',
  '01800000-0000-4000-8000-000000000307',
  1,
  'Flex Containers & the Main Axis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flex Containers & the Main Axis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Flex Containers &amp; the Main Axis</h1>
  <p>A flex container controls the flow of its items. Its single most important decision is the <strong>main axis</strong>.</p>
  <h2>flex-direction</h2>
  <p><span class="ic">flex-direction</span> decides how items read: <span class="ic">row</span> (left to right, the default), <span class="ic">row-reverse</span>, <span class="ic">column</span> (top to bottom), or <span class="ic">column-reverse</span>.</p>
  <pre class="code-block">.sidebar-items {
  display: flex;
  flex-direction: column;   /* stack like a list */
}</pre>
  <table>
    <tr><th>Value</th><th>Main axis</th><th>Items read</th></tr>
    <tr><td>row</td><td>horizontal</td><td>left to right</td></tr>
    <tr><td>row-reverse</td><td>horizontal</td><td>right to left</td></tr>
    <tr><td>column</td><td>vertical</td><td>top to bottom</td></tr>
    <tr><td>column-reverse</td><td>vertical</td><td>bottom to top</td></tr>
  </table>
  <h2>Distributing on the main axis</h2>
  <p>Once the axis is chosen, <span class="ic">justify-content</span> spreads the items along it:</p>
  <pre class="code-block">.nav {
  display: flex;
  justify-content: space-between;  /* first and last at the edges */
}</pre>
  <ul>
    <li><span class="ic">flex-start</span> — pack at the start (default).</li>
    <li><span class="ic">flex-end</span> — pack at the end.</li>
    <li><span class="ic">center</span> — clump in the middle.</li>
    <li><span class="ic">space-between</span> — equal gaps, edges flush.</li>
    <li><span class="ic">space-around</span> — half-gaps at the edges.</li>
    <li><span class="ic">space-evenly</span> — equal gaps everywhere.</li>
  </ul>
  <div class="callout">
    <strong>Axes move with direction</strong>
    <p>In a column, the main axis is vertical: <span class="ic">justify-content: center</span> centers vertically, which ordinary block layout cannot do.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Nav recipe</strong>
    <p><span class="ic">space-between</span> gives a navigation its classic logo-left / menu-right look with a single property.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000408',
  '01800000-0000-4000-8000-000000000308',
  1,
  'Flex Direction, Wrap & Gap',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flex Direction, Wrap & Gap</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Flex Direction, Wrap &amp; Gap</h1>
  <p>Three container properties handle the daily chores of flex layout: wrapping overflow, writing less, and spacing items without margin hacks.</p>
  <h2>flex-wrap</h2>
  <p>By default items squeeze onto one line and shrink. <span class="ic">flex-wrap: wrap</span> lets items flow onto additional lines when they no longer fit:</p>
  <pre class="code-block">.chip-row {
  display: flex;
  flex-wrap: wrap;         /* chips flow to a new line */
  gap: 8px;
}</pre>
  <h2>flex-flow shorthand</h2>
  <p><span class="ic">flex-flow</span> sets direction and wrap in one declaration:</p>
  <pre class="code-block">.toolbar {
  display: flex;
  flex-flow: row wrap;     /* direction + wrap together */
}</pre>
  <h2>gap</h2>
  <p><span class="ic">gap</span> adds space <em>between</em> items without pushing the outer edges — the old margin hack required trimming the first and last child:</p>
  <pre class="code-block">.cards {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;               /* row-gap and column-gap work too */
}</pre>
  <table>
    <tr><th>Property</th><th>Controls</th></tr>
    <tr><td>flex-wrap</td><td>single line or wrapping</td></tr>
    <tr><td>flex-flow</td><td>direction + wrap shorthand</td></tr>
    <tr><td>gap</td><td>space between items</td></tr>
    <tr><td>row-gap / column-gap</td><td>spacing per axis</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>gap is universal</strong>
    <p>The same <span class="ic">gap</span> property works in grid and multi-column layouts, and every modern browser supports it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Wrap + basis = responsive</strong>
    <p>Combine wrapping with a flex-basis per item and you get a row of cards that reflows to two or three columns automatically as space shrinks.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000410',
  '01800000-0000-4000-8000-000000000310',
  1,
  'Flex Items: grow, shrink & basis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flex Items: grow, shrink & basis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Flex Items: grow, shrink &amp; basis</h1>
  <p>Container properties set the context; the three item properties decide how each item uses space. Together they form flex sizing.</p>
  <h2>flex-grow</h2>
  <p><span class="ic">flex-grow: 1</span> tells an item to take a share of leftover space. With two items both at <span class="ic">1</span>, they split the extra space equally; a value of <span class="ic">2</span> takes twice the share.</p>
  <h2>flex-shrink</h2>
  <p>When items overflow, <span class="ic">flex-shrink</span> decides who gives up space. The default <span class="ic">1</span> lets items shrink; <span class="ic">0</span> refuses to shrink.</p>
  <h2>flex-basis</h2>
  <p><span class="ic">flex-basis</span> sets the starting size along the main axis before grow or shrink run. Use a length like <span class="ic">260px</span> or <span class="ic">auto</span> to fall back to the content size.</p>
  <pre class="code-block">.sidebar { flex: 0 0 260px; }      /* fixed width, no grow, no shrink */
.card    { flex: 1 1 260px; }      /* grow, shrink, start at 260px     */
.logo    { flex: 0 1 auto; }       /* never grow, may shrink minimally */</pre>
  <h2>The flex shorthand</h2>
  <p><span class="ic">flex: &lt;grow&gt; &lt;shrink&gt; &lt;basis&gt;</span> is the standard form. <span class="ic">flex: 1</span> means <span class="ic">1 1 0</span> — grow equally and share the whole line evenly.</p>
  <table>
    <tr><th>Declaration</th><th>Meaning</th></tr>
    <tr><td>flex: 1</td><td>grow 1, shrink 1, basis 0 — equal columns</td></tr>
    <tr><td>flex: 0 0 260px</td><td>fixed 260px, never grows or shrinks</td></tr>
    <tr><td>flex: 1 1 220px</td><td>base 220px, then grow or shrink to fit</td></tr>
    <tr><td>flex: 2 1 0</td><td>twice the share of a neighbor set to flex: 1</td></tr>
  </table>
  <div class="callout">
    <strong>The min-width trap</strong>
    <p>Flex items refuse to shrink below their content by default. Long text can force overflow; <span class="ic">min-width: 0</span> (or a basis of <span class="ic">0</span>) lets them actually shrink.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Equal-button recipe</strong>
    <p>Give siblings <span class="ic">flex: 1 1 0</span> plus a <span class="ic">gap</span> on the container and every button shares the row equally — the most common flex sizing pattern.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000411',
  '01800000-0000-4000-8000-000000000311',
  1,
  'Aligning Flex Items',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aligning Flex Items</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Aligning Flex Items</h1>
  <p>With the main axis set, the cross axis is where items line up. Which alignment property you need depends on whether items wrapped or not.</p>
  <h2>align-items (cross axis, one line)</h2>
  <p><span class="ic">align-items</span> positions items across the perpendicular axis. The default <span class="ic">stretch</span> fills the container; <span class="ic">center</span>, <span class="ic">flex-start</span>, <span class="ic">flex-end</span>, and <span class="ic">baseline</span> are the common alternatives.</p>
  <pre class="code-block">.row {
  display: flex;
  align-items: center;      /* vertical centering in a row */
}</pre>
  <h2>Per-item alignment</h2>
  <p><span class="ic">align-self</span> overrides <span class="ic">align-items</span> for a single child — handy for a badge that should drop to the bottom of a row.</p>
  <h2>align-content (cross axis, wrapped)</h2>
  <p>When items wrap onto several lines, <span class="ic">align-content</span> distributes the <em>lines themselves</em>: <span class="ic">flex-start</span>, <span class="ic">center</span>, <span class="ic">space-between</span>, and so on.</p>
  <pre class="code-block">.gallery {
  display: flex;
  flex-wrap: wrap;
  align-content: center;    /* lines clump vertically */
}</pre>
  <h2>The margin-auto spacer</h2>
  <p>An item with <span class="ic">margin-left: auto</span> absorbs all free space to its left, pushing it to the far edge — the classic way to move one nav link to the right side.</p>
  <table>
    <tr><th>Property</th><th>Axis</th><th>Applies to</th></tr>
    <tr><td>justify-content</td><td>main</td><td>the whole line(s)</td></tr>
    <tr><td>align-items</td><td>cross</td><td>every item</td></tr>
    <tr><td>align-self</td><td>cross</td><td>one item</td></tr>
    <tr><td>align-content</td><td>cross</td><td>wrapped lines</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Baseline alignment</strong>
    <p><span class="ic">align-items: baseline</span> lines up the first line of text across items, keeping mixed-size headings and paragraphs on a shared line.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Center anything</strong>
    <p><span class="ic">display: flex; justify-content: center; align-items: center;</span> is the shortest reliable recipe for dead-center content.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000413',
  '01800000-0000-4000-8000-000000000313',
  1,
  'Grid Tracks: Rows & Columns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Grid Tracks: Rows & Columns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Grid Tracks: Rows &amp; Columns</h1>
  <p>CSS Grid is the two-dimensional layout engine. It turns a container into a fixed set of <strong>tracks</strong> — rows and columns — and lets you place items in any of the resulting cells.</p>
  <h2>Defining tracks</h2>
  <pre class="code-block">.layout {
  display: grid;
  grid-template-columns: 200px 1fr 1fr;  /* three columns */
  grid-template-rows: auto 1fr auto;      /* three rows     */
  gap: 16px;
}</pre>
  <h2>Track sizing tools</h2>
  <ul>
    <li><span class="ic">px / rem</span> — a fixed size that never changes.</li>
    <li><span class="ic">fr</span> — a flexible fraction that shares the remaining free space.</li>
    <li><span class="ic">auto</span> — fits the largest content in that track.</li>
    <li><span class="ic">minmax(min, max)</span> — a track that can swing between two sizes.</li>
  </ul>
  <pre class="code-block">.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
}</pre>
  <p><span class="ic">repeat()</span> saves typing — <span class="ic">repeat(12, 1fr)</span> is a classic 12-column grid. <span class="ic">minmax(240px, 1fr)</span> keeps a column at least 240px but lets it grow.</p>
  <h2>Implicit rows</h2>
  <p>Items beyond your declared rows create implicit tracks. Size them with <span class="ic">grid-auto-rows</span>:</p>
  <pre class="code-block">.feed {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: minmax(120px, auto);
}</pre>
  <table>
    <tr><th>Function</th><th>Behavior</th></tr>
    <tr><td>200px</td><td>fixed track</td></tr>
    <tr><td>1fr</td><td>shares free space after fixed tracks</td></tr>
    <tr><td>repeat(12, 1fr)</td><td>twelve equal columns</td></tr>
    <tr><td>minmax(240px, 1fr)</td><td>grows between a floor and a ceiling</td></tr>
    <tr><td>auto</td><td>fits content</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>fr is not a percentage</strong>
    <p><span class="ic">1fr</span> distributes leftover space after fixed and content tracks — unlike percentages, it does not overflow when gaps are added.</p>
  </div>
  <div class="callout callout-tip">
    <strong>minmax(0, 1fr) safety</strong>
    <p>Very long words or wide images can push a column beyond its share. <span class="ic">minmax(0, 1fr)</span> lets the track shrink below content size and prevents blowout.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000414',
  '01800000-0000-4000-8000-000000000314',
  1,
  'Placing Grid Items',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Placing Grid Items</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Placing Grid Items</h1>
  <p>Grid lines separate the tracks. They are numbered from <span class="ic">1</span> at the start and from <span class="ic">-1</span> at the end, and items are placed by reference to them.</p>
  <h2>Line-based placement</h2>
  <p><span class="ic">grid-column</span> and <span class="ic">grid-row</span> take a start and an end line:</p>
  <pre class="code-block">.hero {
  grid-column: 1 / 3;   /* from line 1 to line 3: spans 2 tracks */
  grid-row: 1 / 2;
}</pre>
  <h2>span</h2>
  <p><span class="ic">span</span> counts tracks instead of lines, which is resilient to later edits:</p>
  <pre class="code-block">.sidebar {
  grid-column: span 2;   /* always two columns wide */
}</pre>
  <p>Negative lines count from the end: <span class="ic">grid-column: 2 / -1</span> runs from the second line to the last.</p>
  <h2>The grid-area shorthand</h2>
  <p><span class="ic">grid-area</span> bundles row start, column start, row end, column end:</p>
  <pre class="code-block">.footer {
  grid-area: 3 / 1 / 4 / -1;   /* row 3, all columns */
}</pre>
  <h2>Auto placement</h2>
  <p>Items without explicit placement flow automatically into the next empty cell, row by row. You write placement rules only for special items, such as the hero and the aside.</p>
  <table>
    <tr><th>Syntax</th><th>Meaning</th></tr>
    <tr><td>grid-column: 1 / 5</td><td>lines 1 through 5 (4 tracks)</td></tr>
    <tr><td>grid-column: span 3</td><td>three tracks, wherever it lands</td></tr>
    <tr><td>grid-area: 2 / 1 / 3 / 4</td><td>rows 2 to 3, columns 1 to 4</td></tr>
    <tr><td>grid-row: 1 / -1</td><td>first to last line</td></tr>
  </table>
  <div class="callout">
    <strong>span counts tracks, not lines</strong>
    <p><span class="ic">1 / 3</span> touches lines 1 and 3, which wraps two tracks. Beginners expect two columns and get one; count the elapsed tracks instead.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Explicit for structure, auto for lists</strong>
    <p>Place the page skeleton with lines; let cards and feed items auto-place themselves — fewer rules, and the flow adapts to new content.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000416',
  '01800000-0000-4000-8000-000000000316',
  1,
  'Grid Template Areas',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Grid Template Areas</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Grid Template Areas</h1>
  <p>Named areas hide the line arithmetic behind a picture of the layout. You draw the page with ASCII art, then attach children to names.</p>
  <h2>Describing the layout</h2>
  <pre class="code-block">.page {
  display: grid;
  grid-template-columns: 240px 1fr;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
}</pre>
  <h2>Assigning items</h2>
  <p>Every child uses <span class="ic">grid-area</span> to claim its region:</p>
  <pre class="code-block">.page-header { grid-area: header; }
.page-side   { grid-area: sidebar; }
.page-main   { grid-area: main; }
.page-footer { grid-area: footer; }</pre>
  <h2>Empty cells</h2>
  <p>A dot marks an unclaimed cell:</p>
  <pre class="code-block">grid-template-areas:
  "header header header"
  ".      main   aside "
  "footer footer footer";</pre>
  <h2>Responsive re-form</h2>
  <p>Because areas describe shape, a media query just redraws the picture. A one-column phone layout is the same structure with a single column:</p>
  <pre class="code-block">@media (max-width: 720px) {
  .page {
    grid-template-columns: 1fr;
    grid-template-areas:
      "header"
      "main"
      "footer";
  }
}</pre>
  <div class="callout">
    <strong>Areas must be rectangular</strong>
    <p>Every named region occupies a contiguous rectangle. There are no L-shaped or split areas — split those across two names.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Mobile-first ASCII</strong>
    <p>Start from a single-column area map, then add columns as the viewport grows. The map reads like the final page, so each breakpoint stays obvious.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000417',
  '01800000-0000-4000-8000-000000000317',
  1,
  'Aligning Grid Items',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aligning Grid Items</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Aligning Grid Items</h1>
  <p>Grid alignment uses the same box-alignment vocabulary as flexbox, but it happens inside a two-dimensional cell — so each axis has an alignment option: <span class="ic">align-*</span> for the block axis and <span class="ic">justify-*</span> for the inline axis.</p>
  <h2>Inside the cell</h2>
  <p>By default every item stretches to fill its cell. <span class="ic">align-items</span> and <span class="ic">justify-items</span> change that for all items; the item-level <span class="ic">align-self</span> and <span class="ic">justify-self</span> override a single item:</p>
  <pre class="code-block">.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
}
.grid .icon { align-self: center; justify-self: center; }</pre>
  <h2>Aligning the whole grid</h2>
  <p>When the grid is smaller than its container, <span class="ic">align-content</span> and <span class="ic">justify-content</span> move the tracks as a unit:</p>
  <pre class="code-block">.stage {
  display: grid;
  place-content: center;   /* centers the entire grid */
}</pre>
  <h2>Shorthands</h2>
  <table>
    <tr><th>Shorthand</th><th>Longhand</th></tr>
    <tr><td>place-items</td><td>align-items + justify-items</td></tr>
    <tr><td>place-self</td><td>align-self + justify-self</td></tr>
    <tr><td>place-content</td><td>align-content + justify-content</td></tr>
  </table>
  <pre class="code-block">.avatar { place-self: center; }            /* centered in its cell */
.hero   { place-content: center; }          /* grid centered in hero */</pre>
  <div class="callout callout-info">
    <strong>Stretch is the default</strong>
    <p><span class="ic">align-items: stretch</span> fills the cell, so equal-height cards happen automatically — no height rules required.</p>
  </div>
  <div class="callout callout-tip">
    <strong>place-content: center</strong>
    <p>For a grid smaller than its container, <span class="ic">place-content: center</span> dead-centers the whole grid inside it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000419',
  '01800000-0000-4000-8000-000000000319',
  1,
  'Subgrid',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subgrid</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Subgrid</h1>
  <p>A normal nested grid uses its own, independent track sizes. Subgrid lets a nested grid adopt the <em>parent</em> tracks, so children across sections line up perfectly.</p>
  <h2>The alignment problem</h2>
  <p>Imagine a dashboard row where three panels each contain a mini-grid. Every inner grid sizes tracks from its own panel, so similarly intended columns drift apart. Subgrid locks them to the shared column lines of the outer grid.</p>
  <h2>Using subgrid</h2>
  <p>A grid item becomes a subgrid by setting its track definition to <span class="ic">subgrid</span>:</p>
  <pre class="code-block">.summary {
  display: grid;
  grid-template-columns: subgrid;   /* inherit parent column lines */
  grid-column: 1 / 4;               /* span the shared columns     */
}</pre>
  <p>The nested rows are defined normally, and its children now sit on the outer grid lines. The same works for rows with <span class="ic">grid-template-rows: subgrid</span>.</p>
  <h2>When to reach for it</h2>
  <ul>
    <li>Card rows where every card must show aligned label columns.</li>
    <li>Form layouts split across grid regions.</li>
    <li>Tables of self-contained widgets in a dashboard.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Support note</strong>
    <p>Subgrid is supported in every evergreen browser since 2023. Where unsupported, the nested grid falls back to its own tracks — usable, just looser.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>If inner content must align to outer lines, use subgrid. If the inner layout is independent, a plain nested grid is simpler.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000420',
  '01800000-0000-4000-8000-000000000320',
  1,
  'Container Queries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Container Queries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Container Queries</h1>
  <p>Media queries style a page from the <em>viewport</em> out. Container queries style a component from its <em>own size</em>, so a reusable card adapts no matter where it appears.</p>
  <h2>Setting up a container</h2>
  <p>A container is any element that opts in with <span class="ic">container-type</span>. Its descendants become styleable from its inline size:</p>
  <pre class="code-block">.widget {
  container-type: inline-size;
}</pre>
  <h2>Querying it</h2>
  <pre class="code-block">.widget .title { font-size: 1.1rem; }

@container (min-width: 400px) {
  .widget { padding: 32px; }
  .widget .title { font-size: 1.5rem; }
}</pre>
  <p>Narrow widgets get compact styling; wide ones get the enlarged version — and the same component on the page and in a sidebar each reacts to its own width.</p>
  <h2>Container units</h2>
  <table>
    <tr><th>Unit</th><th>Meaning</th></tr>
    <tr><td>cqw</td><td>1% of the container width</td></tr>
    <tr><td>cqh</td><td>1% of the container height</td></tr>
    <tr><td>cqi</td><td>1% of the container inline size</td></tr>
    <tr><td>cqmin / cqmax</td><td>the smaller / larger of cqi and cqb</td></tr>
  </table>
  <pre class="code-block">.badge {
  font-size: 3cqi;   /* scales with the container, not the viewport */
}</pre>
  <h2>Naming containers</h2>
  <p>When several containers nest, <span class="ic">container-name</span> targets the right one:</p>
  <pre class="code-block">.panel { container: sidebar / inline-size; }
@container sidebar (min-width: 300px) { ... }</pre>
  <div class="callout callout-info">
    <strong>Why inline-size</strong>
    <p>Querying height can loop: content affects height affects layout. <span class="ic">container-type: inline-size</span> queries only width and stays stable.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Components first</strong>
    <p>Container queries make true component libraries possible — one card style that works in a hero, a sidebar, and a footer. Prefer them over page-level media queries for reusable pieces.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000422',
  '01800000-0000-4000-8000-000000000322',
  1,
  'Responsive Flex Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Flex Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Responsive Flex Patterns</h1>
  <p>Flexbox pairs brilliantly with responsive design: wrap and basis reflow the layout while the container properties stay untouched.</p>
  <h2>Responsive navigation</h2>
  <pre class="code-block">.site-nav {
  display: flex;
  flex-wrap: wrap;
  gap: 8px 24px;
}
.site-nav .cta { margin-left: auto; }   /* spacer pushes CTA right */</pre>
  <h2>Card rows that reflow</h2>
  <p>Give every card the same basis and let wrap decide how many columns fit:</p>
  <pre class="code-block">.card-row {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
}
.card-row .card {
  flex: 1 1 260px;   /* at least 260px, grows to share the line */
}</pre>
  <p>The row shows one column on narrow phones, two on tablets, and as many as fit on desktops — with zero media queries for the count.</p>
  <h2>Direction flips</h2>
  <p>For pieces that genuinely restructure, one media query can flip a column into a row:</p>
  <pre class="code-block">.hero {
  display: flex;
  flex-direction: column;   /* stacked on phones */
  gap: 24px;
}
@media (min-width: 760px) {
  .hero { flex-direction: row; justify-content: space-between; }
}</pre>
  <table>
    <tr><th>Pattern</th><th>Technique</th></tr>
    <tr><td>nav collapse</td><td>flex-wrap + gap</td></tr>
    <tr><td>card grid</td><td>flex: 1 1 basis + wrap</td></tr>
    <tr><td>hero flip</td><td>media query on flex-direction</td></tr>
    <tr><td>spacers</td><td>margin auto per item</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Basis in clamp</strong>
    <p><span class="ic">flex: 1 1 clamp(200px, 30%, 320px)</span> keeps cards in a pleasant size band at every width.</p>
  </div>
  <div class="callout callout-info">
    <strong>Component vs page</strong>
    <p>Flex handles the one-dimensional pieces; page-level regions usually belong to grid. The two work best together.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000423',
  '01800000-0000-4000-8000-000000000323',
  1,
  'Responsive Grid Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Grid Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Responsive Grid Patterns</h1>
  <p>Grids give you the page frame; a few track idioms keep that frame fluid at every size.</p>
  <h2>auto-fit with minmax</h2>
  <p>The workhorse of responsive grids is one declaration:</p>
  <pre class="code-block">.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
}</pre>
  <p>The browser counts how many 240px-minimum columns fit and repeats them; leftover space is distributed by <span class="ic">1fr</span>.</p>
  <h2>auto-fit vs auto-fill</h2>
  <ul>
    <li><span class="ic">auto-fill</span> keeps the empty tracks at the end.</li>
    <li><span class="ic">auto-fit</span> collapses the empty tracks so items stretch across.</li>
  </ul>
  <p>For card grids you almost always want <span class="ic">auto-fit</span>.</p>
  <h2>Page regions at breakpoints</h2>
  <pre class="code-block">.layout {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-areas:
    "header"
    "main"
    "footer";
}
@media (min-width: 760px) {
  .layout {
    grid-template-columns: 220px 1fr;
    grid-template-areas:
      "header header"
      "sidebar main"
      "footer footer";
  }
}</pre>
  <h2>Clamp for fluid type</h2>
  <p><span class="ic">clamp(min, preferred, max)</span> grows a value with the viewport between two bounds:</p>
  <pre class="code-block">h2 { font-size: clamp(1.25rem, 2vw + 0.75rem, 2rem); }</pre>
  <table>
    <tr><th>Pattern</th><th>Produced effect</th></tr>
    <tr><td>repeat(auto-fit, minmax(240px, 1fr))</td><td>fluid card columns</td></tr>
    <tr><td>media query on areas</td><td>page composition flips</td></tr>
    <tr><td>clamp()</td><td>fluid font sizes</td></tr>
    <tr><td>minmax(0, 1fr)</td><td>no overflow from long content</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>One grid, many columns</strong>
    <p>Pair areas with auto-fit tracks and breakpoints appear only where the composition genuinely changes shape.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000425',
  '01800000-0000-4000-8000-000000000325',
  1,
  'Capstone: Page Structure & Design Tokens',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Page Structure & Design Tokens</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Capstone: Page Structure &amp; Design Tokens</h1>
  <p>The capstone rebuilds a course landing page from scratch: a header with navigation, a hero split, a card grid, a sidebar-with-content layout, and a footer. This lesson lays the foundation.</p>
  <h2>The semantic skeleton</h2>
  <pre class="code-block">&lt;body&gt;
  &lt;header class="site-header"&gt;
    &lt;nav class="site-nav"&gt;
      &lt;a href="#"&gt;Logo&lt;/a&gt;
      &lt;a href="#"&gt;Features&lt;/a&gt;
      &lt;a href="#" class="cta"&gt;Get Started&lt;/a&gt;
    &lt;/nav&gt;
  &lt;/header&gt;
  &lt;main&gt;
    &lt;section class="hero"&gt;
      &lt;div class="hero-copy"&gt;&lt;h1&gt;Learn CSS Layout&lt;/h1&gt;&lt;p&gt;…&lt;/p&gt;&lt;/div&gt;
      &lt;div class="hero-visual"&gt;&lt;/div&gt;
    &lt;/section&gt;
    &lt;section class="card-grid" aria-label="Topics"&gt;&lt;!-- cards --&gt;&lt;/section&gt;
  &lt;/main&gt;
  &lt;footer class="site-footer"&gt;&lt;!-- columns --&gt;&lt;/footer&gt;
&lt;/body&gt;</pre>
  <h2>Design tokens</h2>
  <p>Custom properties on <span class="ic">:root</span> form the single source of truth for spacing and color:</p>
  <pre class="code-block">:root {
  --space-1: 4px;  --space-2: 8px;  --space-4: 16px;  --space-8: 32px;
  --radius: 12px;
  --color-brand: #7c3aed;
  --color-text: #1f2937;
}</pre>
  <h2>Minimal reset</h2>
  <p>Start every project with the layout reality we proved in module 1:</p>
  <pre class="code-block">*, *::before, *::after { box-sizing: border-box; }
body { margin: 0; line-height: 1.6; }
img { max-width: 100%; display: block; }</pre>
  <div class="callout callout-tip">
    <strong>Tokens scale</strong>
    <p>Change one <span class="ic">--color-brand</span> and the entire page retheme. Spacing tokens keep every gap, padding, and margin on a scale.</p>
  </div>
  <div class="callout callout-info">
    <strong>Semantics first</strong>
    <p>Header, nav, main, section, and footer describe the content. Screen readers and search engines benefit even before one line of layout runs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000426',
  '01800000-0000-4000-8000-000000000326',
  1,
  'Capstone: Nav, Cards & Flex Layouts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Nav, Cards & Flex Layouts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Capstone: Nav, Cards &amp; Flex Layouts</h1>
  <p>Every component-level region in the capstone is a flex problem. Solving them here reuses exactly what module two taught.</p>
  <h2>The header and nav</h2>
  <pre class="code-block">.site-nav {
  display: flex;
  align-items: center;
  gap: 24px;
  flex-wrap: wrap;
  padding: var(--space-4) var(--space-8);
}
.site-nav .cta { margin-left: auto; }</pre>
  <p>The logo sits left, the call-to-action presses right, and on small screens the whole nav wraps gracefully.</p>
  <h2>The hero split</h2>
  <pre class="code-block">.hero {
  display: flex;
  flex-direction: column;
  gap: var(--space-8);
  padding: var(--space-8);
}
@media (min-width: 820px) {
  .hero { flex-direction: row; align-items: center; }
  .hero-copy   { flex: 1 1 60%; }
  .hero-visual { flex: 1 1 40%; }
}</pre>
  <h2>The card component</h2>
  <pre class="code-block">.card {
  display: flex;
  flex-direction: column;   /* image, title, text, footer */
  gap: var(--space-2);
  padding: var(--space-4);
}
.card .card-meta { margin-top: auto; }   /* pinned to the bottom */</pre>
  <p><span class="ic">margin-top: auto</span> absorbs free space above the metadata, so short and tall cards still align their bottom rows.</p>
  <h2>The card row</h2>
  <pre class="code-block">.card-grid {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-4);
}
.card-grid .card { flex: 1 1 240px; }</pre>
  <div class="callout callout-tip">
    <strong>Gap everywhere</strong>
    <p>Every spacing rule here uses <span class="ic">gap</span> or margin auto — no negative margins, no trimming the first or last child.</p>
  </div>
  <div class="callout callout-info">
    <strong>Wrap + basis did the work</strong>
    <p>The card grid has no media queries, yet it reflows from one to four columns because basis and wrap negotiate the container width.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01800000-0000-4000-8000-000000000427',
  '01800000-0000-4000-8000-000000000327',
  1,
  'Capstone: Assembling the Grid',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Assembling the Grid</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
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
  <h1>Capstone: Assembling the Grid</h1>
  <p>The final step puts the frame around the pieces: a full-viewport grid, a content region with a sidebar, and a footer — each promoting from one column to more as space allows.</p>
  <h2>The app frame</h2>
  <pre class="code-block">.site {
  display: grid;
  grid-template-rows: auto 1fr auto;   /* header, main, footer */
  min-height: 100dvh;
}</pre>
  <h2>The content region</h2>
  <pre class="code-block">.layout {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-areas:
    "content"
    "aside";
  gap: var(--space-8);
  padding: var(--space-8);
}
@media (min-width: 900px) {
  .layout {
    grid-template-columns: minmax(0, 1fr) 280px;
    grid-template-areas: "content aside";
  }
}
.layout .content { grid-area: content; }
.layout .aside   { grid-area: aside; }</pre>
  <p><span class="ic">minmax(0, 1fr)</span> keeps the wide column from blowing out on long code samples.</p>
  <h2>The footer</h2>
  <pre class="code-block">.site-footer {
  display: grid;
  gap: var(--space-4);
  padding: var(--space-8);
  grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
}</pre>
  <h2>Final polish checklist</h2>
  <ul>
    <li>Scroll each breakpoint and watch for horizontal <span class="ic">overflow</span>.</li>
    <li>Give focusable items a visible outline.</li>
    <li>Let images use <span class="ic">max-width: 100%</span>.</li>
    <li>Keep interactive targets at least 44px tall.</li>
    <li>Verify color contrast between text and backgrounds.</li>
  </ul>
  <div class="callout">
    <strong>The mental model that carried the course</strong>
    <p>The box model sizes boxes; normal flow places them; flex arranges a line of them; grid frames the whole page; subgrid, container queries, and tokens keep the system composable.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Ship it</strong>
    <p>Test with the DevTools device toolbar, open the console for errors, and resize the window slowly. A page that survives resizing is a page you can trust.</p>
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
  ('01800000-0000-4000-8000-000000000501', '01800000-0000-4000-8000-000000000303',
   'Which layer of the box model sits directly around the content?',
   'Padding wraps the content and holds the border at a distance.', 1),
  ('01800000-0000-4000-8000-000000000502', '01800000-0000-4000-8000-000000000303',
   'With box-sizing: border-box, the declared width includes what?',
   'border-box counts content, padding, and border inside the declared width.', 2),
  ('01800000-0000-4000-8000-000000000503', '01800000-0000-4000-8000-000000000303',
   'Which two spaces can collapse against each other in normal flow?',
   'Adjacent vertical margins merge. Padding and borders never collapse.', 3),
  ('01800000-0000-4000-8000-000000000504', '01800000-0000-4000-8000-000000000306',
   'Which display value keeps inline flow but honors width and height?',
   'inline-block flows inside text yet accepts box properties.', 1),
  ('01800000-0000-4000-8000-000000000505', '01800000-0000-4000-8000-000000000306',
   'In normal flow, block-level boxes…',
   'Block boxes stack top to bottom by default.', 2),
  ('01800000-0000-4000-8000-000000000506', '01800000-0000-4000-8000-000000000306',
   'What does display: flex turn the element into?',
   'It becomes a flex container; its children become flex items.', 3),
  ('01800000-0000-4000-8000-000000000507', '01800000-0000-4000-8000-000000000309',
   'Which property chooses the main axis direction?',
   'flex-direction sets row or column and their reverses.', 1),
  ('01800000-0000-4000-8000-000000000508', '01800000-0000-4000-8000-000000000309',
   'Which property distributes space along the main axis?',
   'justify-content packs and spreads items across the main axis.', 2),
  ('01800000-0000-4000-8000-000000000509', '01800000-0000-4000-8000-000000000309',
   'How do you let flex items flow onto multiple lines?',
   'flex-wrap: wrap allows items to wrap onto new lines.', 3),
  ('01800000-0000-4000-8000-000000000510', '01800000-0000-4000-8000-000000000312',
   'flex: 1 1 0% expands to which declaration set?',
   'It sets grow to 1, shrink to 1, and basis to 0 — the equal-share recipe.', 1),
  ('01800000-0000-4000-8000-000000000511', '01800000-0000-4000-8000-000000000312',
   'Which property lets an item take a share of leftover space?',
   'flex-grow divides free space between items by weight.', 2),
  ('01800000-0000-4000-8000-000000000512', '01800000-0000-4000-8000-000000000312',
   'A flex item that must not shrink below its content needs…',
   'min-width: 0 lets an item shrink below its content size.', 3),
  ('01800000-0000-4000-8000-000000000513', '01800000-0000-4000-8000-000000000315',
   'Which unit shares leftover space between grid tracks?',
   '1fr distributes free space proportionally among fr tracks.', 1),
  ('01800000-0000-4000-8000-000000000514', '01800000-0000-4000-8000-000000000315',
   'Which function repeats a track definition many times?',
   'repeat(12, 1fr) is the classic twelve-column preamble.', 2),
  ('01800000-0000-4000-8000-000000000515', '01800000-0000-4000-8000-000000000315',
   'grid-column: 1 / 3 makes an item stretch across…',
   'Lines 1 to 3 enclose two tracks.', 3),
  ('01800000-0000-4000-8000-000000000516', '01800000-0000-4000-8000-000000000318',
   'Which property draws a layout map with names?',
   'grid-template-areas describes regions as ASCII rows.', 1),
  ('01800000-0000-4000-8000-000000000517', '01800000-0000-4000-8000-000000000318',
   'Which token marks an empty cell in grid-template-areas?',
   'A single dot stands for an unclaimed cell.', 2),
  ('01800000-0000-4000-8000-000000000518', '01800000-0000-4000-8000-000000000318',
   'Which shorthand centers one item on both axes of a cell?',
   'place-self aligns one item on both axes at once.', 3),
  ('01800000-0000-4000-8000-000000000519', '01800000-0000-4000-8000-000000000321',
   'How does a nested grid adopt the parent track lines?',
   'grid-template-columns: subgrid shares the parent tracks.', 1),
  ('01800000-0000-4000-8000-000000000520', '01800000-0000-4000-8000-000000000321',
   'Which property registers an element as a size container?',
   'container-type: inline-size lets descendants query its width.', 2),
  ('01800000-0000-4000-8000-000000000521', '01800000-0000-4000-8000-000000000321',
   'An @container (min-width: 400px) rule applies when…',
   'The nearest size container is at least 400px wide.', 3),
  ('01800000-0000-4000-8000-000000000522', '01800000-0000-4000-8000-000000000324',
   'Which declaration produces a fluid card grid?',
   'repeat(auto-fit, minmax(240px, 1fr)) fits as many columns as possible.', 1),
  ('01800000-0000-4000-8000-000000000523', '01800000-0000-4000-8000-000000000324',
   'How does auto-fit differ from auto-fill?',
   'auto-fit collapses empty tracks so items span the full row.', 2),
  ('01800000-0000-4000-8000-000000000524', '01800000-0000-4000-8000-000000000324',
   'Which function keeps a font size between two bounds?',
   'clamp() picks a value between a minimum and a maximum.', 3),
  ('01800000-0000-4000-8000-000000000525', '01800000-0000-4000-8000-000000000328',
   'Which box-sizing is the recommended global default?',
   'border-box includes padding and border in the declared width.', 1),
  ('01800000-0000-4000-8000-000000000526', '01800000-0000-4000-8000-000000000328',
   'For a page layout with sidebar and content, the best tool is…',
   'CSS Grid frames two-dimensional page regions with ease.', 2),
  ('01800000-0000-4000-8000-000000000527', '01800000-0000-4000-8000-000000000328',
   'Which flex trick pushes one item to the far edge?',
   'margin-left: auto absorbs the available space on the left.', 3),
  ('01800000-0000-4000-8000-000000000528', '01800000-0000-4000-8000-000000000328',
   'A container query measures…',
   'It responds to the nearest size container, not the viewport.', 4),
  ('01800000-0000-4000-8000-000000000529', '01800000-0000-4000-8000-000000000328',
   'Which mental model pairs flex and grid correctly?',
   'Flex arranges along one axis; grid handles two-dimensional regions.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): padding around content
  ('01800000-0000-4000-8000-000000001001', '01800000-0000-4000-8000-000000000501', 'padding', TRUE,  1),
  ('01800000-0000-4000-8000-000000001002', '01800000-0000-4000-8000-000000000501', 'margin', FALSE, 2),
  ('01800000-0000-4000-8000-000000001003', '01800000-0000-4000-8000-000000000501', 'border', FALSE, 3),
  ('01800000-0000-4000-8000-000000001004', '01800000-0000-4000-8000-000000000501', 'box-shadow', FALSE, 4),
  -- Q1 (501)q2: border-box
  ('01800000-0000-4000-8000-000000001005', '01800000-0000-4000-8000-000000000502', 'only the content area', FALSE, 1),
  ('01800000-0000-4000-8000-000000001006', '01800000-0000-4000-8000-000000000502', 'padding and border', TRUE,  2),
  ('01800000-0000-4000-8000-000000001007', '01800000-0000-4000-8000-000000000502', 'only the border', FALSE, 3),
  ('01800000-0000-4000-8000-000000001008', '01800000-0000-4000-8000-000000000502', 'margin and border', FALSE, 4),
  -- Q1 (501)q3: collapse
  ('01800000-0000-4000-8000-000000001009', '01800000-0000-4000-8000-000000000503', 'vertical margins', TRUE,  1),
  ('01800000-0000-4000-8000-000000001010', '01800000-0000-4000-8000-000000000503', 'horizontal margins', FALSE, 2),
  ('01800000-0000-4000-8000-000000001011', '01800000-0000-4000-8000-000000000503', 'padding', FALSE, 3),
  ('01800000-0000-4000-8000-000000001012', '01800000-0000-4000-8000-000000000503', 'borders', FALSE, 4),
  -- Q2 (504): inline-block
  ('01800000-0000-4000-8000-000000001013', '01800000-0000-4000-8000-000000000504', 'block', FALSE, 1),
  ('01800000-0000-4000-8000-000000001014', '01800000-0000-4000-8000-000000000504', 'inline', FALSE, 2),
  ('01800000-0000-4000-8000-000000001015', '01800000-0000-4000-8000-000000000504', 'inline-block', TRUE,  3),
  ('01800000-0000-4000-8000-000000001016', '01800000-0000-4000-8000-000000000504', 'none', FALSE, 4),
  -- Q2 (504)q2: block flow
  ('01800000-0000-4000-8000-000000001017', '01800000-0000-4000-8000-000000000505', 'stack vertically', TRUE,  1),
  ('01800000-0000-4000-8000-000000001018', '01800000-0000-4000-8000-000000000505', 'flow horizontally', FALSE, 2),
  ('01800000-0000-4000-8000-000000001019', '01800000-0000-4000-8000-000000000505', 'overlap the previous box', FALSE, 3),
  ('01800000-0000-4000-8000-000000001020', '01800000-0000-4000-8000-000000000505', 'shrink to their text width', FALSE, 4),
  -- Q2 (504)q3: display flex
  ('01800000-0000-4000-8000-000000001021', '01800000-0000-4000-8000-000000000506', 'a grid container', FALSE, 1),
  ('01800000-0000-4000-8000-000000001022', '01800000-0000-4000-8000-000000000506', 'a flex container', TRUE,  2),
  ('01800000-0000-4000-8000-000000001023', '01800000-0000-4000-8000-000000000506', 'an inline element', FALSE, 3),
  ('01800000-0000-4000-8000-000000001024', '01800000-0000-4000-8000-000000000506', 'a table row', FALSE, 4),
  -- Q3 (507): flex-direction
  ('01800000-0000-4000-8000-000000001025', '01800000-0000-4000-8000-000000000507', 'flex-direction', TRUE,  1),
  ('01800000-0000-4000-8000-000000001026', '01800000-0000-4000-8000-000000000507', 'justify-content', FALSE, 2),
  ('01800000-0000-4000-8000-000000001027', '01800000-0000-4000-8000-000000000507', 'align-items', FALSE, 3),
  ('01800000-0000-4000-8000-000000001028', '01800000-0000-4000-8000-000000000507', 'flex-wrap', FALSE, 4),
  -- Q3 (507)q2: justify-content
  ('01800000-0000-4000-8000-000000001029', '01800000-0000-4000-8000-000000000508', 'align-items', FALSE, 1),
  ('01800000-0000-4000-8000-000000001030', '01800000-0000-4000-8000-000000000508', 'justify-content', TRUE,  2),
  ('01800000-0000-4000-8000-000000001031', '01800000-0000-4000-8000-000000000508', 'align-content', FALSE, 3),
  ('01800000-0000-4000-8000-000000001032', '01800000-0000-4000-8000-000000000508', 'gap', FALSE, 4),
  -- Q3 (507)q3: flex-wrap
  ('01800000-0000-4000-8000-000000001033', '01800000-0000-4000-8000-000000000509', 'flex-direction: column', FALSE, 1),
  ('01800000-0000-4000-8000-000000001034', '01800000-0000-4000-8000-000000000509', 'flex: 1', FALSE, 2),
  ('01800000-0000-4000-8000-000000001035', '01800000-0000-4000-8000-000000000509', 'flex-wrap: wrap', TRUE,  3),
  ('01800000-0000-4000-8000-000000001036', '01800000-0000-4000-8000-000000000509', 'overflow: visible', FALSE, 4),
  -- Q4 (510): flex 1 1 0
  ('01800000-0000-4000-8000-000000001037', '01800000-0000-4000-8000-000000000510', 'grow 1, shrink 1, basis 0', TRUE,  1),
  ('01800000-0000-4000-8000-000000001038', '01800000-0000-4000-8000-000000000510', 'grow 0, shrink 1, basis 1%', FALSE, 2),
  ('01800000-0000-4000-8000-000000001039', '01800000-0000-4000-8000-000000000510', 'grow 1, shrink 0, basis 0', FALSE, 3),
  ('01800000-0000-4000-8000-000000001040', '01800000-0000-4000-8000-000000000510', 'grow 1, shrink 1, basis 1fr', FALSE, 4),
  -- Q4 (510)q2: flex-grow
  ('01800000-0000-4000-8000-000000001041', '01800000-0000-4000-8000-000000000511', 'flex-shrink', FALSE, 1),
  ('01800000-0000-4000-8000-000000001042', '01800000-0000-4000-8000-000000000511', 'flex-basis', FALSE, 2),
  ('01800000-0000-4000-8000-000000001043', '01800000-0000-4000-8000-000000000511', 'flex-grow', TRUE,  3),
  ('01800000-0000-4000-8000-000000001044', '01800000-0000-4000-8000-000000000511', 'gap', FALSE, 4),
  -- Q4 (510)q3: min-width 0
  ('01800000-0000-4000-8000-000000001045', '01800000-0000-4000-8000-000000000512', 'flex-grow: 1', FALSE, 1),
  ('01800000-0000-4000-8000-000000001046', '01800000-0000-4000-8000-000000000512', 'min-width: 0', TRUE,  2),
  ('01800000-0000-4000-8000-000000001047', '01800000-0000-4000-8000-000000000512', 'align-self: center', FALSE, 3),
  ('01800000-0000-4000-8000-000000001048', '01800000-0000-4000-8000-000000000512', 'flex-direction: column', FALSE, 4),
  -- Q5 (513): 1fr
  ('01800000-0000-4000-8000-000000001049', '01800000-0000-4000-8000-000000000513', '1fr', TRUE,  1),
  ('01800000-0000-4000-8000-000000001050', '01800000-0000-4000-8000-000000000513', 'px', FALSE, 2),
  ('01800000-0000-4000-8000-000000001051', '01800000-0000-4000-8000-000000000513', 'em', FALSE, 3),
  ('01800000-0000-4000-8000-000000001052', '01800000-0000-4000-8000-000000000513', 'vh', FALSE, 4),
  -- Q5 (513)q2: repeat
  ('01800000-0000-4000-8000-000000001053', '01800000-0000-4000-8000-000000000514', 'repeat()', TRUE,  1),
  ('01800000-0000-4000-8000-000000001054', '01800000-0000-4000-8000-000000000514', 'minmax()', FALSE, 2),
  ('01800000-0000-4000-8000-000000001055', '01800000-0000-4000-8000-000000000514', 'calc()', FALSE, 3),
  ('01800000-0000-4000-8000-000000001056', '01800000-0000-4000-8000-000000000514', 'clamp()', FALSE, 4),
  -- Q5 (513)q3: 1/3 spans two tracks
  ('01800000-0000-4000-8000-000000001057', '01800000-0000-4000-8000-000000000515', 'three tracks', FALSE, 1),
  ('01800000-0000-4000-8000-000000001058', '01800000-0000-4000-8000-000000000515', 'two tracks', TRUE,  2),
  ('01800000-0000-4000-8000-000000001059', '01800000-0000-4000-8000-000000000515', 'one track', FALSE, 3),
  ('01800000-0000-4000-8000-000000001060', '01800000-0000-4000-8000-000000000515', 'the whole grid', FALSE, 4),
  -- Q6 (516): grid-template-areas
  ('01800000-0000-4000-8000-000000001061', '01800000-0000-4000-8000-000000000516', 'grid-template-areas', TRUE,  1),
  ('01800000-0000-4000-8000-000000001062', '01800000-0000-4000-8000-000000000516', 'grid-template-columns', FALSE, 2),
  ('01800000-0000-4000-8000-000000001063', '01800000-0000-4000-8000-000000000516', 'grid-auto-flow', FALSE, 3),
  ('01800000-0000-4000-8000-000000001064', '01800000-0000-4000-8000-000000000516', 'place-items', FALSE, 4),
  -- Q6 (516)q2: dot placeholder
  ('01800000-0000-4000-8000-000000001065', '01800000-0000-4000-8000-000000000517', 'an asterisk (*)', FALSE, 1),
  ('01800000-0000-4000-8000-000000001066', '01800000-0000-4000-8000-000000000517', 'a dot (.)', TRUE,  2),
  ('01800000-0000-4000-8000-000000001067', '01800000-0000-4000-8000-000000000517', 'the word none', FALSE, 3),
  ('01800000-0000-4000-8000-000000001068', '01800000-0000-4000-8000-000000000517', 'a dash (-)', FALSE, 4),
  -- Q6 (516)q3: place-self
  ('01800000-0000-4000-8000-000000001069', '01800000-0000-4000-8000-000000000518', 'justify-content', FALSE, 1),
  ('01800000-0000-4000-8000-000000001070', '01800000-0000-4000-8000-000000000518', 'align-content', FALSE, 2),
  ('01800000-0000-4000-8000-000000001071', '01800000-0000-4000-8000-000000000518', 'place-self', TRUE,  3),
  ('01800000-0000-4000-8000-000000001072', '01800000-0000-4000-8000-000000000518', 'float', FALSE, 4),
  -- Q7 (519): subgrid
  ('01800000-0000-4000-8000-000000001073', '01800000-0000-4000-8000-000000000519', 'grid-template-columns: subgrid', TRUE,  1),
  ('01800000-0000-4000-8000-000000001074', '01800000-0000-4000-8000-000000000519', 'grid-auto-flow: dense', FALSE, 2),
  ('01800000-0000-4000-8000-000000001075', '01800000-0000-4000-8000-000000000519', 'grid-template-rows: auto', FALSE, 3),
  ('01800000-0000-4000-8000-000000001076', '01800000-0000-4000-8000-000000000519', 'place-items: stretch', FALSE, 4),
  -- Q7 (519)q2: container-type
  ('01800000-0000-4000-8000-000000001077', '01800000-0000-4000-8000-000000000520', 'container-type', TRUE,  1),
  ('01800000-0000-4000-8000-000000001078', '01800000-0000-4000-8000-000000000520', 'contain', FALSE, 2),
  ('01800000-0000-4000-8000-000000001079', '01800000-0000-4000-8000-000000000520', 'isolation', FALSE, 3),
  ('01800000-0000-4000-8000-000000001080', '01800000-0000-4000-8000-000000000520', 'display: grid', FALSE, 4),
  -- Q7 (519)q3: container query
  ('01800000-0000-4000-8000-000000001081', '01800000-0000-4000-8000-000000000521', 'the viewport is at least 400px wide', FALSE, 1),
  ('01800000-0000-4000-8000-000000001082', '01800000-0000-4000-8000-000000000521', 'the nearest container is at least 400px wide', TRUE,  2),
  ('01800000-0000-4000-8000-000000001083', '01800000-0000-4000-8000-000000000521', 'the element has 400px of padding', FALSE, 3),
  ('01800000-0000-4000-8000-000000001084', '01800000-0000-4000-8000-000000000521', 'the parent has a 400px font size', FALSE, 4),
  -- Q8 (522): auto-fit
  ('01800000-0000-4000-8000-000000001085', '01800000-0000-4000-8000-000000000522', 'repeat(auto-fit, minmax(240px, 1fr))', TRUE,  1),
  ('01800000-0000-4000-8000-000000001086', '01800000-0000-4000-8000-000000000522', 'grid-template-columns: 3fr 1fr', FALSE, 2),
  ('01800000-0000-4000-8000-000000001087', '01800000-0000-4000-8000-000000000522', 'flex-direction: row', FALSE, 3),
  ('01800000-0000-4000-8000-000000001088', '01800000-0000-4000-8000-000000000522', 'columns: 240px', FALSE, 4),
  -- Q8 (522)q2: auto-fit vs auto-fill
  ('01800000-0000-4000-8000-000000001089', '01800000-0000-4000-8000-000000000523', 'auto-fit collapses empty tracks', TRUE,  1),
  ('01800000-0000-4000-8000-000000001090', '01800000-0000-4000-8000-000000000523', 'auto-fit adds fixed gaps', FALSE, 2),
  ('01800000-0000-4000-8000-000000001091', '01800000-0000-4000-8000-000000000523', 'auto-fill never creates tracks', FALSE, 3),
  ('01800000-0000-4000-8000-000000001092', '01800000-0000-4000-8000-000000000523', 'auto-fill requires minmax(0, 1fr)', FALSE, 4),
  -- Q8 (522)q3: clamp
  ('01800000-0000-4000-8000-000000001093', '01800000-0000-4000-8000-000000000524', 'clamp()', TRUE,  1),
  ('01800000-0000-4000-8000-000000001094', '01800000-0000-4000-8000-000000000524', 'calc()', FALSE, 2),
  ('01800000-0000-4000-8000-000000001095', '01800000-0000-4000-8000-000000000524', 'round()', FALSE, 3),
  ('01800000-0000-4000-8000-000000001096', '01800000-0000-4000-8000-000000000524', 'var()', FALSE, 4),
  -- Q9 (525): border-box
  ('01800000-0000-4000-8000-000000001097', '01800000-0000-4000-8000-000000000525', 'border-box', TRUE,  1),
  ('01800000-0000-4000-8000-000000001098', '01800000-0000-4000-8000-000000000525', 'content-box', FALSE, 2),
  ('01800000-0000-4000-8000-000000001099', '01800000-0000-4000-8000-000000000525', 'padding-box', FALSE, 3),
  ('01800000-0000-4000-8000-000000001100', '01800000-0000-4000-8000-000000000525', 'auto', FALSE, 4),
  -- Q9 (525)q2: grid for page
  ('01800000-0000-4000-8000-000000001101', '01800000-0000-4000-8000-000000000526', 'CSS Grid', TRUE,  1),
  ('01800000-0000-4000-8000-000000001102', '01800000-0000-4000-8000-000000000526', 'inline-block', FALSE, 2),
  ('01800000-0000-4000-8000-000000001103', '01800000-0000-4000-8000-000000000526', 'float: left', FALSE, 3),
  ('01800000-0000-4000-8000-000000001104', '01800000-0000-4000-8000-000000000526', 'display: none', FALSE, 4),
  -- Q9 (525)q3: margin auto spacer
  ('01800000-0000-4000-8000-000000001105', '01800000-0000-4000-8000-000000000527', 'margin-left: auto', TRUE,  1),
  ('01800000-0000-4000-8000-000000001106', '01800000-0000-4000-8000-000000000527', 'float: right', FALSE, 2),
  ('01800000-0000-4000-8000-000000001107', '01800000-0000-4000-8000-000000000527', 'justify-content: center', FALSE, 3),
  ('01800000-0000-4000-8000-000000001108', '01800000-0000-4000-8000-000000000527', 'flex-grow: 0', FALSE, 4),
  -- Q9 (525)q4: container query measures
  ('01800000-0000-4000-8000-000000001109', '01800000-0000-4000-8000-000000000528', 'the nearest container size', TRUE,  1),
  ('01800000-0000-4000-8000-000000001110', '01800000-0000-4000-8000-000000000528', 'the whole viewport width', FALSE, 2),
  ('01800000-0000-4000-8000-000000001111', '01800000-0000-4000-8000-000000000528', 'the document width', FALSE, 3),
  ('01800000-0000-4000-8000-000000001112', '01800000-0000-4000-8000-000000000528', 'the element font size', FALSE, 4),
  -- Q9 (525)q5: flex vs grid model
  ('01800000-0000-4000-8000-000000001113', '01800000-0000-4000-8000-000000000529', 'flex for one axis, grid for two', TRUE,  1),
  ('01800000-0000-4000-8000-000000001114', '01800000-0000-4000-8000-000000000529', 'grid for one axis, flex for two', FALSE, 2),
  ('01800000-0000-4000-8000-000000001115', '01800000-0000-4000-8000-000000000529', 'flex for pages, grid for text', FALSE, 3),
  ('01800000-0000-4000-8000-000000001116', '01800000-0000-4000-8000-000000000529', 'the two are interchangeable', FALSE, 4)
ON CONFLICT (id) DO NOTHING;