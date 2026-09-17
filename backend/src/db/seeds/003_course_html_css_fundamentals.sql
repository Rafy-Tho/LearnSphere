-- ============================================================================
-- SEED 003: Complete course — "HTML & CSS Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Web Development   (20000000-0000-4000-8000-000000000001)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Getting Started with HTML      → C1 Intro to HTML · C2 Core Elements
--   M2 Structuring Web Pages          → C3 Semantic HTML · C4 Tables & Forms
--   M3 CSS Fundamentals               → C5 Intro to CSS · C6 The Box Model
--   M4 Layout & Responsive Design     → C7 Flexbox · C8 Grid & Media Queries
--   M5 Capstone: Portfolio Page       → C9 Project Setup · C10 Styling & Polish
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
  '30000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000001',
  'HTML & CSS Fundamentals',
  'html-css-fundamentals',
  'Master the building blocks of the web. Learn to write clean, semantic HTML documents and style them with modern CSS — including Flexbox, Grid, and responsive design — while building a complete portfolio page.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  1
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('30000000-0000-4000-8000-000000000011', '30000000-0000-4000-8000-000000000001', 'Build valid, semantic HTML documents from scratch.',                      1),
  ('30000000-0000-4000-8000-000000000012', '30000000-0000-4000-8000-000000000001', 'Style pages with modern CSS: selectors, colors, typography, and the box model.', 2),
  ('30000000-0000-4000-8000-000000000013', '30000000-0000-4000-8000-000000000001', 'Create responsive page layouts using Flexbox and CSS Grid.',               3),
  ('30000000-0000-4000-8000-000000000014', '30000000-0000-4000-8000-000000000001', 'Apply the mobile-first design approach with media queries.',               4),
  ('30000000-0000-4000-8000-000000000015', '30000000-0000-4000-8000-000000000001', 'Design and publish a complete portfolio web page.',                         5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('30000000-0000-4000-8000-000000000101', '30000000-0000-4000-8000-000000000001', 1, 'Getting Started with HTML',         'Set up your environment and learn the fundamentals of HTML.',                    'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000102', '30000000-0000-4000-8000-000000000001', 2, 'Structuring Web Pages',              'Organize page content with semantic HTML, tables, and forms.',                   'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000103', '30000000-0000-4000-8000-000000000001', 3, 'CSS Fundamentals',                   'Learn how to style your HTML documents with CSS.',                                'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000104', '30000000-0000-4000-8000-000000000001', 4, 'CSS Layout & Responsive Design',     'Build flexible, responsive layouts with Flexbox, Grid, and media queries.',      'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000105', '30000000-0000-4000-8000-000000000001', 5, 'Capstone: Portfolio Page',           'Build and polish a complete portfolio page from scratch.',                       'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('30000000-0000-4000-8000-000000000201', '30000000-0000-4000-8000-000000000101', 1, 'Introduction to HTML',       'What HTML is and how a page is structured.',       'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000202', '30000000-0000-4000-8000-000000000101', 2, 'Core HTML Elements',         'Headings, text, lists, links, and images.',        'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000203', '30000000-0000-4000-8000-000000000102', 1, 'Semantic HTML',              'Meaningful structure with semantic elements.',     'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000204', '30000000-0000-4000-8000-000000000102', 2, 'Tables & Forms',             'Tabular data and user input with forms.',          'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000205', '30000000-0000-4000-8000-000000000103', 1, 'Introduction to CSS',        'Selectors, the cascade, colors, and typography.',  'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000206', '30000000-0000-4000-8000-000000000103', 2, 'The Box Model',              'Content, padding, borders, and margins.',          'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000207', '30000000-0000-4000-8000-000000000104', 1, 'Flexbox',                    'One-dimensional layout along rows or columns.',    'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000208', '30000000-0000-4000-8000-000000000104', 2, 'Grid & Responsive Design',   'Two-dimensional layout and mobile-first pages.',   'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000209', '30000000-0000-4000-8000-000000000105', 1, 'Project Setup & Structure',  'Scaffold the capstone portfolio project.',         'PUBLISHED'),
  ('30000000-0000-4000-8000-000000000210', '30000000-0000-4000-8000-000000000105', 2, 'Styling & Polish',           'Style, refine, and add interactive touches.',      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 30000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('30000000-0000-4000-8000-000000000301', '30000000-0000-4000-8000-000000000201', 1, 'What is HTML?',                     'Understand what HyperText Markup Language is and how the web uses it.',             'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('30000000-0000-4000-8000-000000000302', '30000000-0000-4000-8000-000000000201', 2, 'Anatomy of an HTML Document',        'Doctype, html, head, and body — the skeleton of every page.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000303', '30000000-0000-4000-8000-000000000201', 3, 'HTML Basics Quiz',                   'Check your understanding of HTML fundamentals.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000304', '30000000-0000-4000-8000-000000000202', 1, 'Headings, Paragraphs & Formatting',  'Structure text with headings, paragraphs, and inline formatting.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000305', '30000000-0000-4000-8000-000000000202', 2, 'Lists, Links & Images',              'Add unordered and ordered lists, hyperlinks, and images.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000306', '30000000-0000-4000-8000-000000000202', 3, 'Core Elements Quiz',                 'Test your grasp of headings, links, and images.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000307', '30000000-0000-4000-8000-000000000203', 1, 'Semantics & Page Landmarks',         'Give your pages meaning with header, nav, main, and footer.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000308', '30000000-0000-4000-8000-000000000203', 2, 'Sections, Articles & Grouping',      'Organize content with section, article, div, and span.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000309', '30000000-0000-4000-8000-000000000203', 3, 'Semantic HTML Quiz',                 'Verify you can pick the right semantic element.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000310', '30000000-0000-4000-8000-000000000204', 1, 'Building Tables',                    'Present tabular data with well-structured tables.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000311', '30000000-0000-4000-8000-000000000204', 2, 'Forms & Inputs',                     'Collect user input with forms, inputs, and labels.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('30000000-0000-4000-8000-000000000312', '30000000-0000-4000-8000-000000000204', 3, 'Forms Quiz',                         'Check what you know about forms and inputs.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000313', '30000000-0000-4000-8000-000000000205', 1, 'How CSS Works: Selectors & Cascade', 'Learn selectors, specificity, and the cascade.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('30000000-0000-4000-8000-000000000314', '30000000-0000-4000-8000-000000000205', 2, 'Colors, Units & Typography',         'Style color, sizing units, and readable typography.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000315', '30000000-0000-4000-8000-000000000205', 3, 'CSS Basics Quiz',                    'Test your CSS fundamentals.',                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000316', '30000000-0000-4000-8000-000000000206', 1, 'Understanding the Box Model',        'See how every element is a box of content, padding, border, and margin.',             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000317', '30000000-0000-4000-8000-000000000206', 2, 'Margin, Padding & Borders',          'Control spacing and borders with shorthand properties.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000318', '30000000-0000-4000-8000-000000000206', 3, 'Box Model Quiz',                     'Check your box model understanding.',                                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000319', '30000000-0000-4000-8000-000000000207', 1, 'Flexbox Fundamentals',               'Align items along a main and cross axis.',                                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000320', '30000000-0000-4000-8000-000000000207', 2, 'Flexbox in Practice',                'Build real layouts: a navbar and a card row.',                                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('30000000-0000-4000-8000-000000000321', '30000000-0000-4000-8000-000000000207', 3, 'Flexbox Quiz',                       'Test your Flexbox knowledge.',                                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000322', '30000000-0000-4000-8000-000000000208', 1, 'CSS Grid Basics',                    'Create two-dimensional layouts with CSS Grid.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000323', '30000000-0000-4000-8000-000000000208', 2, 'Media Queries & Mobile-First Design','Build responsive, mobile-first pages with media queries.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('30000000-0000-4000-8000-000000000324', '30000000-0000-4000-8000-000000000208', 3, 'Layout & Responsive Quiz',           'Check your layout and responsive design skills.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('30000000-0000-4000-8000-000000000325', '30000000-0000-4000-8000-000000000209', 1, 'Project Setup & Page Structure',     'Create the files and semantic skeleton for your portfolio.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('30000000-0000-4000-8000-000000000326', '30000000-0000-4000-8000-000000000210', 1, 'Styling the Portfolio Page',         'Apply a cohesive design system to your project.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('30000000-0000-4000-8000-000000000327', '30000000-0000-4000-8000-000000000210', 2, 'Adding Interactivity with CSS',      'Add hover effects, transitions, and focus states.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('30000000-0000-4000-8000-000000000328', '30000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                                   'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 30000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '30000000-0000-4000-8000-000000000401',
  '30000000-0000-4000-8000-000000000301',
  1,
  'What is HTML?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is HTML?</title>
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
  <h1>What is HTML?</h1>
  <p>HTML (HyperText Markup Language) is the standard language used to describe the <strong>structure</strong> of web pages. Every website you visit — articles, shops, dashboards, this lesson — is built on HTML under the hood.</p>
  <p>Think of building a house: HTML is the <strong>frame and walls</strong>, CSS is the <strong>paint and furniture</strong>, and JavaScript is the <strong>electricity</strong>. This course teaches you to build the frame first, then style it with CSS in later modules.</p>
  <h2>What HTML actually does</h2>
  <ul>
    <li>It marks up text with <em>tags</em> so browsers know what each part means.</li>
    <li>It defines headings, paragraphs, lists, links, images, forms, and more.</li>
    <li>It provides semantic meaning that helps search engines and assistive technologies.</li>
  </ul>
  <p>Here is the smallest possible web page:</p>
  <pre class="code-block">&lt;!DOCTYPE html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;My First Page&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;h1&gt;Hello, World!&lt;/h1&gt;
  &lt;/body&gt;
&lt;/html&gt;</pre>
  <p>A tag is written between angle brackets, like <span class="ic">&lt;h1&gt;</span>. Most tags come in pairs: an opening tag <span class="ic">&lt;p&gt;</span> and a closing tag <span class="ic">&lt;/p&gt;</span>, with the content between them.</p>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>HTML is <em>not</em> a programming language — it does not compute or decide anything. It only describes structure. You will not see conditionals or loops here, and that is perfectly normal!</p>
  </div>
  <h2>Why it matters</h2>
  <ol>
    <li>Valid HTML is the foundation of accessibility and SEO.</li>
    <li>Clean markup makes CSS and JavaScript easier to apply.</li>
    <li>Every modern framework still ultimately renders HTML.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Right-click any web page and choose <em>Inspect</em> or <em>View Source</em> to peek at the HTML behind a real site. It is the fastest way to learn.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000402',
  '30000000-0000-4000-8000-000000000302',
  1,
  'Anatomy of an HTML Document',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of an HTML Document</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
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
  <h1>Anatomy of an HTML Document</h1>
  <p>Every web page shares the same skeleton. Learning these four pieces helps you read and write any HTML page with confidence.</p>
  <pre class="code-block">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    &lt;meta charset="UTF-8"&gt;
    &lt;title&gt;Page Title&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;h1&gt;Page Content&lt;/h1&gt;
  &lt;/body&gt;
&lt;/html&gt;</pre>
  <table>
    <thead>
      <tr><th>Part</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;!DOCTYPE html&gt;</span></td><td>Tells the browser this is an HTML5 document.</td></tr>
      <tr><td><span class="ic">&lt;html&gt;</span></td><td>The root element wrapping the entire page.</td></tr>
      <tr><td><span class="ic">&lt;head&gt;</span></td><td>Metadata: title, character set, styles, links. Not displayed.</td></tr>
      <tr><td><span class="ic">&lt;body&gt;</span></td><td>Everything the user sees on the page.</td></tr>
    </tbody>
  </table>
  <h2>Inside the head</h2>
  <p>The <span class="ic">&lt;head&gt;</span> holds invisible but important instructions:</p>
  <ul>
    <li><span class="ic">&lt;meta charset="UTF-8"&gt;</span> — makes every character render correctly.</li>
    <li><span class="ic">&lt;title&gt;…&lt;/title&gt;</span> — the browser tab label and search result title.</li>
    <li><span class="ic">&lt;link rel="stylesheet" href="styles.css"&gt;</span> — attaches a CSS file.</li>
  </ul>
  <h2>Inside the body</h2>
  <p>The <span class="ic">&lt;body&gt;</span> contains your visible content: headings, paragraphs, images, links, forms — everything your learner sees.</p>
  <div class="callout callout-info">
    <strong>Accessibility</strong>
    <p>The <span class="ic">lang="en"</span> attribute on <span class="ic">&lt;html&gt;</span> tells screen readers and translation tools which language your page uses. Always set it.</p>
  </div>
  <h2>Indentation</h2>
  <p>Browsers ignore whitespace, so the indentation in the examples is purely for humans. Nested elements are indented two spaces to keep the structure readable — you will thank yourself later.</p>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000403',
  '30000000-0000-4000-8000-000000000304',
  1,
  'Headings, Paragraphs & Formatting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Headings, Paragraphs &amp; Formatting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Headings, Paragraphs &amp; Formatting</h1>
  <p>Text is the heart of most pages. HTML provides six heading levels — <span class="ic">&lt;h1&gt;</span> through <span class="ic">&lt;h6&gt;</span> — plus the humble <span class="ic">&lt;p&gt;</span> paragraph.</p>
  <pre class="code-block">&lt;h1&gt;The Main Title&lt;/h1&gt;
&lt;h2&gt;Section Heading&lt;/h2&gt;
&lt;h3&gt;Sub-Section Heading&lt;/h3&gt;
&lt;p&gt;A paragraph of supporting text.&lt;/p&gt;</pre>
  <h2>Heading levels are not just sizes</h2>
  <p>Heading levels build the <strong>outline</strong> of a page, much like chapters in a book. Screen readers let users jump between headings, and search engines use them to understand topics.</p>
  <ul>
    <li><span class="ic">&lt;h1&gt;</span> — the page title, used once.</li>
    <li><span class="ic">&lt;h2&gt;</span> — the main sections.</li>
    <li><span class="ic">&lt;h3&gt;</span> — subsections inside an <span class="ic">&lt;h2&gt;</span>.</li>
    <li>Do not skip levels just to make text smaller — that is what CSS is for.</li>
  </ul>
  <h2>Inline formatting tags</h2>
  <p>Inline elements sit inside a paragraph and emphasize part of the text:</p>
  <table>
    <thead>
      <tr><th>Tag</th><th>Meaning</th><th>Renders as</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;strong&gt;</span></td><td>Important</td><td><strong>Bold</strong></td></tr>
      <tr><td><span class="ic">&lt;em&gt;</span></td><td>Emphasis</td><td><em>Italic</em></td></tr>
      <tr><td><span class="ic">&lt;mark&gt;</span></td><td>Highlight</td><td><mark>Yellow highlight</mark></td></tr>
      <tr><td><span class="ic">&lt;code&gt;</span></td><td>Code snippet</td><td><code>monospace</code></td></tr>
    </tbody>
  </table>
  <pre class="code-block">&lt;p&gt;This is &lt;strong&gt;really important&lt;/strong&gt;, and this is &lt;em&gt;emphasized&lt;/em&gt;.&lt;/p&gt;</pre>
  <div class="callout callout-tip">
    <strong>SEO tip</strong>
    <p>Use exactly one <span class="ic">&lt;h1&gt;</span> per page and keep headings in a logical, non-skipping order. It helps both Google and people using screen readers.</p>
  </div>
  <h2>Text size vs. meaning</h2>
  <p>A common beginner mistake is choosing <span class="ic">&lt;h4&gt;</span> because the text looks the right size. Stop! Pick the element that matches the <em>meaning</em>, then adjust appearance with CSS.</p>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000404',
  '30000000-0000-4000-8000-000000000305',
  1,
  'Lists, Links & Images',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lists, Links &amp; Images</title>
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
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Lists, Links &amp; Images</h1>
  <p>Three essential ingredients bring pages to life: organized lists, clickable links, and visual images.</p>
  <h2>Unordered and ordered lists</h2>
  <p>Use <span class="ic">&lt;ul&gt;</span> when order does not matter and <span class="ic">&lt;ol&gt;</span> when it does. Each item is an <span class="ic">&lt;li&gt;</span> (list item).</p>
  <pre class="code-block">&lt;ul&gt;
  &lt;li&gt;Home&lt;/li&gt;
  &lt;li&gt;About&lt;/li&gt;
  &lt;li&gt;Projects&lt;/li&gt;
&lt;/ul&gt;

&lt;ol&gt;
  &lt;li&gt;Register&lt;/li&gt;
  &lt;li&gt;Verify email&lt;/li&gt;
  &lt;li&gt;Start learning&lt;/li&gt;
&lt;/ol&gt;</pre>
  <h2>Links</h2>
  <p>The anchor element <span class="ic">&lt;a&gt;</span> creates a hyperlink. The <span class="ic">href</span> attribute holds the destination.</p>
  <pre class="code-block">&lt;a href="https://example.com" target="_blank"&gt;Visit Example&lt;/a&gt;
&lt;a href="/about"&gt;Internal page&lt;/a&gt;</pre>
  <ul>
    <li><span class="ic">target="_blank"</span> opens the link in a new tab.</li>
    <li>Relative paths like <span class="ic">/about</span> link within your own site.</li>
    <li>Link text should describe the destination — nobody wants to click <em>click here</em>.</li>
  </ul>
  <h2>Images</h2>
  <p>The <span class="ic">&lt;img&gt;</span> element is self-closing (no closing tag). Two attributes are essential:</p>
  <pre class="code-block">&lt;img src="profile.jpg" alt="A portrait of Sarah Chen" width="200"&gt;</pre>
  <ul>
    <li><span class="ic">src</span> — the image file location.</li>
    <li><span class="ic">alt</span> — alternative text shown when the image cannot load and read aloud by screen readers.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Accessibility</strong>
    <p>Never leave <span class="ic">alt</span> empty unless the image is purely decorative. A good alt text describes the image content, not the file name.</p>
  </div>
  <div class="callout">
    <strong>Practice</strong>
    <p>Build a page with a navigation list of three links and one image. Check it in the browser, then move on to the quiz.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000405',
  '30000000-0000-4000-8000-000000000307',
  1,
  'Semantics & Page Landmarks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Semantics &amp; Page Landmarks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Semantics &amp; Page Landmarks</h1>
  <p>Semantic HTML means choosing elements that describe <em>what they contain</em>, not just how they look. Modern HTML gives us landmark elements that turn a page into a clear map for browsers, search engines, and assistive technology.</p>
  <pre class="code-block">&lt;body&gt;
  &lt;header&gt;
    &lt;nav&gt;
      &lt;ul&gt;&lt;li&gt;&lt;a href="/"&gt;Home&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;
    &lt;/nav&gt;
  &lt;/header&gt;

  &lt;main&gt;
    &lt;h1&gt;Your Content Here&lt;/h1&gt;
  &lt;/main&gt;

  &lt;footer&gt;
    &lt;p&gt;&amp;copy; 2026 DevAcademy&lt;/p&gt;
  &lt;/footer&gt;
&lt;/body&gt;</pre>
  <table>
    <thead>
      <tr><th>Landmark</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;header&gt;</span></td><td>Introductory content, often the site logo and tagline.</td></tr>
      <tr><td><span class="ic">&lt;nav&gt;</span></td><td>The primary navigation links.</td></tr>
      <tr><td><span class="ic">&lt;main&gt;</span></td><td>The dominant, unique content of the page.</td></tr>
      <tr><td><span class="ic">&lt;aside&gt;</span></td><td>Sidebar content related to the main flow.</td></tr>
      <tr><td><span class="ic">&lt;footer&gt;</span></td><td>Closing information: copyright, legal, contact.</td></tr>
    </tbody>
  </table>
  <h2>Why landmarks help</h2>
  <ul>
    <li>Screen reader users can jump directly to navigation, content, or footer.</li>
    <li>Search engines better understand the structure and hierarchy.</li>
    <li>Your code documents itself — reading it is instantly clearer.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Every page should have exactly one <span class="ic">&lt;main&gt;</span>. It tells assistive tools where the real content starts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000406',
  '30000000-0000-4000-8000-000000000308',
  1,
  'Sections, Articles & Grouping',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sections, Articles &amp; Grouping</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
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
  <h1>Sections, Articles &amp; Grouping</h1>
  <p>Besides landmarks, HTML offers neutral and semantic containers for organizing content within a page.</p>
  <h2>section and article</h2>
  <p><span class="ic">&lt;section&gt;</span> groups related content that belongs together — like the modules of this course.</p>
  <p><span class="ic">&lt;article&gt;</span> is for self-contained content that could stand alone — a blog post, a news story, a product card — and be redistributed independently.</p>
  <pre class="code-block">&lt;section&gt;
  &lt;h2&gt;Learning Path&lt;/h2&gt;
  &lt;article&gt;
    &lt;h3&gt;HTML Essentials&lt;/h3&gt;
    &lt;p&gt;Learn semantic markup from scratch.&lt;/p&gt;
  &lt;/article&gt;
  &lt;article&gt;
    &lt;h3&gt;CSS Mastery&lt;/h3&gt;
    &lt;p&gt;Style pages with modern techniques.&lt;/p&gt;
  &lt;/article&gt;
&lt;/section&gt;</pre>
  <h2>div and span</h2>
  <p>When no semantic element fits, use the generic containers:</p>
  <table>
    <thead>
      <tr><th>Element</th><th>Type</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">&lt;div&gt;</span></td><td>Block-level</td><td>Group large chunks; the workhorse for CSS layout wrappers.</td></tr>
      <tr><td><span class="ic">&lt;span&gt;</span></td><td>Inline</td><td>Wrap a small piece of text inside a paragraph.</td></tr>
    </tbody>
  </table>
  <pre class="code-block">&lt;div class="card"&gt;
  &lt;p&gt;A &lt;span class="highlight"&gt;highlighted&lt;/span&gt; word.&lt;/p&gt;
&lt;/div&gt;</pre>
  <div class="callout callout-info">
    <strong>Golden rule</strong>
    <p>Reach for a <em>semantic</em> element first (<span class="ic">article</span>, <span class="ic">section</span>, <span class="ic">nav</span>…). Use <span class="ic">&lt;div&gt;</span> only when no semantic element fits. This small habit dramatically improves your pages.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000407',
  '30000000-0000-4000-8000-000000000310',
  1,
  'Building Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Building Tables</h1>
  <p>Tables present data in rows and columns. Use them for <em>tabular data</em> — not for page layout (that job belongs to CSS).</p>
  <pre class="code-block">&lt;table&gt;
  &lt;caption&gt;Course Pricing&lt;/caption&gt;
  &lt;thead&gt;
    &lt;tr&gt;
      &lt;th&gt;Plan&lt;/th&gt;
      &lt;th&gt;Price&lt;/th&gt;
    &lt;/tr&gt;
  &lt;/thead&gt;
  &lt;tbody&gt;
    &lt;tr&gt;
      &lt;td&gt;Standard&lt;/td&gt;
      &lt;td&gt;$9/month&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;td&gt;Premium&lt;/td&gt;
      &lt;td&gt;$19/month&lt;/td&gt;
    &lt;/tr&gt;
  &lt;/tbody&gt;
&lt;/table&gt;</pre>
  <h2>The parts of a table</h2>
  <ul>
    <li><span class="ic">&lt;table&gt;</span> — the container.</li>
    <li><span class="ic">&lt;caption&gt;</span> — a title describing the table.</li>
    <li><span class="ic">&lt;thead&gt;</span> — the header row group.</li>
    <li><span class="ic">&lt;tbody&gt;</span> — the data rows.</li>
    <li><span class="ic">&lt;tr&gt;</span> — a row.</li>
    <li><span class="ic">&lt;th&gt;</span> — a header cell (bold, centered by default).</li>
    <li><span class="ic">&lt;td&gt;</span> — a data cell.</li>
  </ul>
  <h2>Merging cells</h2>
  <p>Cells can span rows or columns using <span class="ic">rowspan</span> and <span class="ic">colspan</span>:</p>
  <pre class="code-block">&lt;td colspan="2"&gt;Spans two columns&lt;/td&gt;</pre>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Always wrap the header row in <span class="ic">&lt;thead&gt;</span>. Screen readers rely on it to associate header labels with data cells.</p>
  </div>
  <div class="callout">
    <strong>Watch out</strong>
    <p>Do not build page layouts with tables. Old sites did this, but CSS Flexbox and Grid (later in this course) are far cleaner and responsive.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000408',
  '30000000-0000-4000-8000-000000000311',
  1,
  'Forms & Inputs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forms &amp; Inputs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
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
  <h1>Forms &amp; Inputs</h1>
  <p>Forms are how users send data to a server: signing up, logging in, searching, checking out. A well-built form combines structure, labels, and the right input types.</p>
  <pre class="code-block">&lt;form action="/signup" method="post"&gt;
  &lt;p&gt;
    &lt;label for="name"&gt;Full name&lt;/label&gt;
    &lt;input type="text" id="name" name="name"&gt;
  &lt;/p&gt;

  &lt;p&gt;
    &lt;label for="email"&gt;Email&lt;/label&gt;
    &lt;input type="email" id="email" name="email" required&gt;
  &lt;/p&gt;

  &lt;p&gt;
    &lt;label for="bio"&gt;Bio&lt;/label&gt;
    &lt;textarea id="bio" name="bio"&gt;&lt;/textarea&gt;
  &lt;/p&gt;

  &lt;p&gt;
    &lt;label for="plan"&gt;Plan&lt;/label&gt;
    &lt;select id="plan" name="plan"&gt;
      &lt;option value="standard"&gt;Standard&lt;/option&gt;
      &lt;option value="premium"&gt;Premium&lt;/option&gt;
    &lt;/select&gt;
  &lt;/p&gt;

  &lt;button type="submit"&gt;Create account&lt;/button&gt;
&lt;/form&gt;</pre>
  <h2>Key attributes</h2>
  <ul>
    <li><span class="ic">method</span> — <span class="ic">get</span> puts data in the URL query string; <span class="ic">post</span> sends it in the request body.</li>
    <li><span class="ic">action</span> — where the browser submits the data.</li>
    <li><span class="ic">name</span> — the key sent to the server; without it the field is ignored.</li>
    <li><span class="ic">for</span> / <span class="ic">id</span> — connect a <span class="ic">&lt;label&gt;</span> to its input.</li>
    <li><span class="ic">required</span> — browser blocks submission if empty.</li>
  </ul>
  <h2>Handy input types</h2>
  <table>
    <thead>
      <tr><th>Type</th><th>Use for</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">text</span></td><td>Short text like a name.</td></tr>
      <tr><td><span class="ic">email</span></td><td>Validated email addresses.</td></tr>
      <tr><td><span class="ic">password</span></td><td>Masked text entry.</td></tr>
      <tr><td><span class="ic">number</span></td><td>Numeric input with steppers.</td></tr>
      <tr><td><span class="ic">date</span></td><td>A calendar picker.</td></tr>
      <tr><td><span class="ic">checkbox</span></td><td>On/off or multiple choices.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Accessibility</strong>
    <p>Every input needs a <span class="ic">&lt;label&gt;</span>. Tapping a label focuses its input — crucial for touch users and screen readers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000409',
  '30000000-0000-4000-8000-000000000313',
  1,
  'How CSS Works: Selectors & Cascade',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How CSS Works</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>How CSS Works: Selectors &amp; the Cascade</h1>
  <p>CSS (Cascading Style Sheets) controls the <em>appearance</em> of HTML. A stylesheet is a list of rules, each made of a selector and a declaration block.</p>
  <pre class="code-block">p {
  color: #1f2937;
  line-height: 1.7;
  margin-bottom: 12px;
}</pre>
  <p>Here <span class="ic">p</span> is the selector — it targets every paragraph — and the braces contain declarations of <span class="ic">property: value</span> pairs.</p>
  <h2>The three ways to add CSS</h2>
  <table>
    <thead>
      <tr><th>Method</th><th>Example</th><th>Best for</th></tr>
    </thead>
    <tbody>
      <tr><td>External file</td><td><span class="ic">&lt;link rel="stylesheet" href="style.css"&gt;</span></td><td>Real projects (favorite)</td></tr>
      <tr><td>Style block</td><td><span class="ic">&lt;style&gt;…&lt;/style&gt;</span> in head</td><td>Small single pages</td></tr>
      <tr><td>Inline</td><td><span class="ic">style="color: red"</span></td><td>Single element only</td></tr>
    </tbody>
  </table>
  <h2>Selector types</h2>
  <pre class="code-block">/* Element selector */
h1 { color: #111827; }

/* Class selector — reuse everywhere */
.card { border-radius: 8px; }

/* ID selector — unique element */
#hero { padding: 40px; }

/* Descendant selector */
nav ul { list-style: none; }</pre>
  <ul>
    <li><strong>Element</strong> (<span class="ic">h1</span>) — matches all elements of that tag.</li>
    <li><strong>Class</strong> (<span class="ic">.card</span>) — matches every element carrying that class.</li>
    <li><strong>ID</strong> (<span class="ic">#hero</span>) — matches the single element with that id.</li>
    <li><strong>Combinators</strong> (<span class="ic">nav ul</span>) — match nested patterns.</li>
  </ul>
  <h2>The cascade and specificity</h2>
  <p>What happens when two rules target the same element? The <em>cascade</em> resolves it by precedence, and <em>specificity</em> is the main tie-breaker. Roughly: specific beats general.</p>
  <pre class="code-block">.title { color: gray; }        /* generic class */
#main .title { color: blue; }  /* more specific — wins */</pre>
  <div class="callout callout-info">
    <strong>Order matters</strong>
    <p>When specificity is tied, the rule declared <em>later</em> in the file wins. Keep your stylesheets logical: base styles first, component tweaks after.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Prefer classes over IDs for styling. IDs are for JavaScript and page anchors; classes scale and avoid surprising specificity battles.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000410',
  '30000000-0000-4000-8000-000000000314',
  1,
  'Colors, Units & Typography',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Colors, Units &amp; Typography</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
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
  <h1>Colors, Units &amp; Typography</h1>
  <p>Colors set the mood, units control size, and typography creates readable, beautiful text. These three tools shape how visitors feel on your page.</p>
  <h2>Colors</h2>
  <pre class="code-block">color: #6366f1;              /* hex */
color: rgb(99, 102, 241);    /* rgb */
color: rgba(99, 102, 241, 0.5); /* with opacity */
color: indigo;               /* named color */
background-color: #eef2ff;</pre>
  <ul>
    <li><span class="ic">#rrggbb</span> hex — the most common format.</li>
    <li><span class="ic">rgb(r,g,b)</span> — the same color in decimal, with an optional alpha.</li>
    <li><span class="ic">hsl(h,s,l)</span> — hue/saturation/lightness, great for design exploration.</li>
  </ul>
  <h2>Units</h2>
  <table>
    <thead>
      <tr><th>Unit</th><th>Meaning</th><th>Use</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">px</span></td><td>Pixels, fixed</td><td>Borders, tiny spacing</td></tr>
      <tr><td><span class="ic">em</span></td><td>Relative to parent font-size</td><td>Spacing that scales with text</td></tr>
      <tr><td><span class="ic">rem</span></td><td>Relative to root font-size</td><td>Font sizes throughout a site</td></tr>
      <tr><td><span class="ic">%</span></td><td>Relative to parent</td><td>Widths and heights</td></tr>
      <tr><td><span class="ic">vw</span>/<span class="ic">vh</span></td><td>Relative to viewport</td><td>Full-screen sections</td></tr>
    </tbody>
  </table>
  <h2>Typography</h2>
  <pre class="code-block">body {
  font-family: 'Segoe UI', system-ui, sans-serif;
  font-size: 16px;
  line-height: 1.7;
  font-weight: 400;
}</pre>
  <p>Keep the line-height between 1.5 and 1.8 for comfortable reading, limit line length to roughly 70 characters, and use <span class="ic">rem</span> for font sizes so users who zoom or change root font-size get a consistent experience.</p>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Define a small color palette and a type scale once, then reuse them. Consistent spacing and sizes make a design feel professional.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000411',
  '30000000-0000-4000-8000-000000000316',
  1,
  'Understanding the Box Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding the Box Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Understanding the Box Model</h1>
  <p>Every HTML element is rendered as a <strong>box</strong>. The box model describes the four layers around an element’s content — and mastering it is the key to predictable layouts.</p>
  <p>From the inside out, a box is made of:</p>
  <ol>
    <li><strong>Content</strong> — the text or images inside.</li>
    <li><strong>Padding</strong> — breathing room between content and border.</li>
    <li><strong>Border</strong> — an optional edge around the padding.</li>
    <li><strong>Margin</strong> — transparent space pushing other boxes away.</li>
  </ol>
  <pre class="code-block">.card {
  width: 300px;         /* content width */
  padding: 16px;        /* space inside the border */
  border: 2px solid #ddd;
  margin: 20px auto;    /* space outside the border */
}</pre>
  <h2>box-sizing</h2>
  <p>By default, <span class="ic">width</span> applies to the <em>content</em> only, so the rendered box is wider than you asked. Modern best practice switches to border-box:</p>
  <pre class="code-block">* {
  box-sizing: border-box;
}

.card {
  width: 300px; /* now includes padding + border */
}</pre>
  <p>With <span class="ic">border-box</span>, a declared <span class="ic">300px</span> is truly 300px total — much easier to reason about.</p>
  <div class="callout callout-info">
    <strong>Mental model</strong>
    <p>Think of padding as a cushion inside the frame (border) and margin as the space between frames on the shelf.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Apply <span class="ic">box-sizing: border-box</span> globally at the top of your stylesheet. Virtually every modern layout assumes it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000412',
  '30000000-0000-4000-8000-000000000317',
  1,
  'Margin, Padding & Borders',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Margin, Padding &amp; Borders</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Margin, Padding &amp; Borders</h1>
  <p>Now that you know the box model, here is how to control its spacing layers comfortably.</p>
  <h2>Padding — space inside the border</h2>
  <pre class="code-block">padding: 16px;              /* all four sides */
padding: 12px 24px;         /* vertical horizontal */
padding: 8px 12px 16px 20px;/* top right bottom left */
padding-top: 12px;          /* single side */
</pre>
  <h2>Margin — space outside the border</h2>
  <pre class="code-block">margin: 0 auto;     /* center block horizontally */
margin: 20px 0;     /* vertical breathing room */
margin-left: 8px;</pre>
  <div class="callout callout-info">
    <strong>Margin collapse</strong>
    <p>Adjacent vertical margins collapse: two stacked boxes with 20px each produce a 20px gap, not 40px. This surprises many beginners — expect it and you will never fight it.</p>
  </div>
  <h2>Borders</h2>
  <p>A border needs a width, style, and color. The shorthand packs all three:</p>
  <pre class="code-block">border: 2px solid #e5e7eb;
border-radius: 8px;   /* rounded corners */
border-bottom: 3px solid #6366f1;</pre>
  <h2>Full example</h2>
  <pre class="code-block">.notice {
  padding: 12px 16px;             /* cushion inside */
  border: 1px solid #f59e0b;      /* warm border */
  border-left-width: 4px;         /* emphasized left edge */
  border-radius: 6px;
  margin: 16px 0;                 /* space around */
}</pre>
  <p>Notice how the shorthand grows from compact (<span class="ic">0 auto</span>) to per-side control only when needed — keep your declarations simple and readable.</p>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Stick to a spacing scale (4, 8, 12, 16, 24, 32px…). Consistent rhythm beats thousands of unique magic numbers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000413',
  '30000000-0000-4000-8000-000000000319',
  1,
  'Flexbox Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flexbox Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
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
  <h1>Flexbox Fundamentals</h1>
  <p>Flexbox arranges items in <strong>one dimension</strong> — a row or a column — with powerful alignment and spacing controls. Set <span class="ic">display: flex</span> on a container and its direct children become <em>flex items</em>.</p>
  <pre class="code-block">.toolbar {
  display: flex;
  justify-content: space-between; /* main axis */
  align-items: center;            /* cross axis */
  gap: 12px;
}</pre>
  <h2>Two axes</h2>
  <ul>
    <li><strong>Main axis</strong> — the direction of the row (or column). Controlled by <span class="ic">justify-content</span>.</li>
    <li><strong>Cross axis</strong> — the perpendicular direction. Controlled by <span class="ic">align-items</span>.</li>
  </ul>
  <h2>Direction</h2>
  <pre class="code-block">flex-direction: row;         /* default: left → right */
flex-direction: column;      /* top → bottom */
flex-direction: row-reverse; /* right → left */
flex-direction: column-reverse;</pre>
  <h2>Common properties</h2>
  <table>
    <thead>
      <tr><th>Property</th><th>Controls</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">justify-content</span></td><td>Spacing along the main axis: flex-start, center, space-between…</td></tr>
      <tr><td><span class="ic">align-items</span></td><td>Alignment on the cross axis: stretch, center, flex-end…</td></tr>
      <tr><td><span class="ic">gap</span></td><td>Space between items (no margin hacks needed).</td></tr>
      <tr><td><span class="ic">flex-wrap</span></td><td>Whether items wrap to a new line.</td></tr>
      <tr><td><span class="ic">flex-grow</span>/<span class="ic">flex-shrink</span></td><td>Item growth and shrink proportions.</td></tr>
    </tbody>
  </table>
  <pre class="code-block">.nav {
  display: flex;
  gap: 24px;
}

.nav .logo { margin-right: auto; } /* pushes rest to the right */

.card { flex: 1; } /* grow to share space equally */</pre>
  <div class="callout callout-info">
    <strong>Decide first</strong>
    <p>Use Flexbox when layout follows a line (a navbar, a row of cards, a sidebar split). When you need rows <em>and</em> columns at once, reach for Grid — coming up next.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000414',
  '30000000-0000-4000-8000-000000000320',
  1,
  'Flexbox in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flexbox in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Flexbox in Practice</h1>
  <p>Theory is nice — but Flexbox truly shines in two classic patterns: navigation bars and rows of cards.</p>
  <h2>Pattern 1: A navbar</h2>
  <pre class="code-block">&lt;nav class="navbar"&gt;
  &lt;a class="brand" href="/"&gt;DevAcademy&lt;/a&gt;
  &lt;a href="/courses"&gt;Courses&lt;/a&gt;
  &lt;a href="/pricing"&gt;Pricing&lt;/a&gt;
  &lt;a href="/login"&gt;&lt;button&gt;Sign in&lt;/button&gt;&lt;/a&gt;
&lt;/nav&gt;</pre>
  <pre class="code-block">.navbar {
  display: flex;
  align-items: center;
  gap: 24px;
}

.navbar .brand { margin-right: auto; } /* logo left, links right */
.navbar a { text-decoration: none; }</pre>
  <h2>Pattern 2: A row of cards</h2>
  <pre class="code-block">.cards {
  display: flex;
  flex-wrap: wrap;      /* cards wrap on narrow screens */
  gap: 16px;
}

.card {
  flex: 1 1 220px;      /* grow, shrink, base width */
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 16px;
}</pre>
  <p>The <span class="ic">flex: 1 1 220px</span> shorthand says: grow to fill space, shrink if needed, prefer 220px. Cards then flow into neat rows that wrap gracefully.</p>
  <h2>Vertical centering, the famous one-liner</h2>
  <pre class="code-block">.hero {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
}</pre>
  <p>Content centered both ways — a task that was painful before Flexbox.</p>
  <div class="callout callout-tip">
    <strong>Homework</strong>
    <p>Build the navbar <em>and</em> the card row above, then re-style your earlier list page with Flexbox. Compare how much easier spacing feels now.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000415',
  '30000000-0000-4000-8000-000000000322',
  1,
  'CSS Grid Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSS Grid Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>CSS Grid Basics</h1>
  <p>Grid arranges items in <strong>two dimensions</strong> — rows <em>and</em> columns at once. It is the ideal tool for page scaffolds and card galleries.</p>
  <pre class="code-block">.gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* three equal columns */
  gap: 16px;
}</pre>
  <p>That single rule creates three flexible columns; every child flows automatically into the next cell.</p>
  <h2>Defining tracks</h2>
  <pre class="code-block">grid-template-columns: 1fr 2fr 1fr;      /* middle column double width */
grid-template-columns: 200px 1fr;        /* fixed sidebar + flexible main */
grid-template-rows: auto 1fr auto;       /* header, content, footer */
grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); /* responsive! */</pre>
  <p>The <span class="ic">fr</span> unit shares free space proportionally — like Flexbox growth, but for whole tracks.</p>
  <h2>Placing items</h2>
  <p>Children can occupy explicit cells and span multiple tracks:</p>
  <pre class="code-block">.featured { grid-column: span 2; } /* spans two columns */
.item-a   { grid-column: 1 / 3; }  /* from line 1 to line 3 */</pre>
  <h2>A classic page scaffold</h2>
  <pre class="code-block">.layout {
  display: grid;
  grid-template-columns: 1fr 300px;
  grid-template-rows: auto 1fr auto;
  min-height: 100vh;
}

.layout header  { grid-column: 1 / -1; }
.layout footer  { grid-column: 1 / -1; }</pre>
  <div class="callout callout-tip">
    <strong>Choose wisely</strong>
    <p>Grid for overall page and 2D layouts; Flexbox for single rows or columns and small UI components. Together they cover virtually every layout need.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000416',
  '30000000-0000-4000-8000-000000000323',
  1,
  'Media Queries & Mobile-First Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Media Queries &amp; Mobile-First</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Media Queries &amp; Mobile-First Design</h1>
  <p>People browse on phones, tablets, laptops, and TVs. A responsive page adapts to the viewport instead of forcing a fixed shape.</p>
  <h2>Start with the viewport</h2>
  <p>Without this line, mobile browsers render a desktop-width page shrunk down. Add it to every page:</p>
  <pre class="code-block">&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</pre>
  <h2>@media rules</h2>
  <p>A media query applies its styles only when the condition is true:</p>
  <pre class="code-block">@media (min-width: 768px) {
  .cards { display: grid; grid-template-columns: repeat(3, 1fr); }
}</pre>
  <h2>Mobile-first design</h2>
  <p>Write the <em>base</em> styles for small screens, then layer enhancements for larger viewports with <span class="ic">min-width</span> queries:</p>
  <pre class="code-block">/* Base: one column, everything stacked */
.cards { display: flex; flex-direction: column; gap: 16px; }

/* Tablet and up: two columns */
@media (min-width: 640px) {
  .cards { flex-direction: row; flex-wrap: wrap; }
  .card  { flex: 1 1 300px; }
}

/* Desktop and up: three columns */
@media (min-width: 1024px) {
  .card { flex: 1 1 0; }
}</pre>
  <p>Mobile-first keeps the smallest devices as the baseline, reduces code, and forces you to prioritize content.</p>
  <h2>Common breakpoints</h2>
  <ul>
    <li><span class="ic">640px</span> — small tablets and large phones in landscape.</li>
    <li><span class="ic">768px</span> — tablets portrait.</li>
    <li><span class="ic">1024px</span> — laptops.</li>
    <li><span class="ic">1280px</span> — wide desktop.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Do not hard-code devices</strong>
    <p>Choose breakpoints where your <em>layout breaks</em>, not per device. Resize the browser and add a breakpoint exactly when the design stops working.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use relative units (<span class="ic">rem</span>, <span class="ic">%</span>, <span class="ic">fr</span>) instead of fixed pixels for widths — they adapt more gracefully across screens.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000417',
  '30000000-0000-4000-8000-000000000325',
  1,
  'Project Setup & Page Structure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project Setup &amp; Page Structure</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Project Setup &amp; Page Structure</h1>
  <p>Time to build! This capstone project is your own portfolio page — fast, simple, and genuinely useful at the end.</p>
  <h2>1. Create the files</h2>
  <pre class="code-block">portfolio/
├── index.html
├── styles.css
└── images/
    └── profile.jpg</pre>
  <h2>2. Link the stylesheet</h2>
  <p>Keep styles in a separate file and link it in the head:</p>
  <pre class="code-block">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
  &lt;title&gt;Your Name — Portfolio&lt;/title&gt;
  &lt;link rel="stylesheet" href="styles.css"&gt;
&lt;/head&gt;</pre>
  <h2>3. Build the semantic skeleton</h2>
  <pre class="code-block">&lt;body&gt;
  &lt;header&gt;
    &lt;nav&gt;
      &lt;ul&gt;
        &lt;li&gt;&lt;a href="#about"&gt;About&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#projects"&gt;Projects&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="#contact"&gt;Contact&lt;/a&gt;&lt;/li&gt;
      &lt;/ul&gt;
    &lt;/nav&gt;
  &lt;/header&gt;

  &lt;main&gt;
    &lt;section id="about"&gt;
      &lt;h1&gt;Hello, I am Jane Developer&lt;/h1&gt;
      &lt;p&gt;I build clean, accessible, responsive websites.&lt;/p&gt;
    &lt;/section&gt;

    &lt;section id="projects"&gt;
      &lt;h2&gt;Selected Projects&lt;/h2&gt;
      &lt;!-- project cards go here --&gt;
    &lt;/section&gt;

    &lt;section id="contact"&gt;
      &lt;h2&gt;Get in touch&lt;/h2&gt;
      &lt;!-- contact details / form --&gt;
    &lt;/section&gt;
  &lt;/main&gt;

  &lt;footer&gt;
    &lt;p&gt;&amp;copy; 2026 Jane Developer&lt;/p&gt;
  &lt;/footer&gt;
&lt;/body&gt;</pre>
  <p>Anchor links like <span class="ic">#about</span> scroll to the section with that id — navigation without any JavaScript.</p>
  <div class="callout callout-info">
    <strong>Checkpoint</strong>
    <p>Open <span class="ic">index.html</span> in a browser. You should see stacked, plain HTML content with working nav links. Styling starts in the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000418',
  '30000000-0000-4000-8000-000000000326',
  1,
  'Styling the Portfolio Page',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styling the Portfolio Page</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Styling the Portfolio Page</h1>
  <p>Now we turn the plain skeleton into a polished page using one coherent design system.</p>
  <h2>1. CSS variables</h2>
  <p>Define your palette and spacing once at the root:</p>
  <pre class="code-block">:root {
  --primary: #6366f1;
  --ink: #1f2937;
  --paper: #ffffff;
  --muted: #6b7280;
  --radius: 10px;
}

* { box-sizing: border-box; }
body { margin: 0; font-family: 'Segoe UI', system-ui, sans-serif; color: var(--ink); line-height: 1.7; }</pre>
  <h2>2. Navbar</h2>
  <pre class="code-block">header { background: var(--paper); box-shadow: 0 1px 4px rgba(0,0,0,.08); position: sticky; top: 0; }

nav { display: flex; justify-content: flex-end; align-items: center; max-width: 960px; margin: 0 auto; padding: 14px 20px; }

nav ul { display: flex; gap: 24px; list-style: none; }
nav a { text-decoration: none; color: var(--ink); font-weight: 600; }</pre>
  <h2>3. Hero section</h2>
  <pre class="code-block">#about { max-width: 960px; margin: 0 auto; padding: 80px 20px; text-align: center; }
#about h1 { font-size: clamp(2rem, 5vw, 3.5rem); margin-bottom: 8px; }
#about p { color: var(--muted); font-size: 1.15rem; }</pre>
  <h2>4. Project cards with Grid</h2>
  <pre class="code-block">#projects { max-width: 960px; margin: 0 auto; padding: 40px 20px; }

.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
}

.card { border: 1px solid #e5e7eb; border-radius: var(--radius); padding: 20px; }
.card h3 { margin-top: 0; }</pre>
  <div class="callout callout-tip">
    <strong>Why this works</strong>
    <p>One Grid line (<span class="ic">auto-fit</span> + <span class="ic">minmax</span>) makes the cards responsive with zero media queries. The design system variables keep colors consistent everywhere.</p>
  </div>
  <h2>5. Base responsiveness</h2>
  <p>Most of this layout already adapts. Add a small media query only where needed:</p>
  <pre class="code-block">@media (min-width: 640px) {
  #about { text-align: left; }
}</pre>
  <p>Save and refresh — your portfolio should now look intentional and polished.</p>
</div>
</body>
</html>
$html$
),
(
  '30000000-0000-4000-8000-000000000419',
  '30000000-0000-4000-8000-000000000327',
  1,
  'Adding Interactivity with CSS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adding Interactivity with CSS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
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
  <h1>Adding Interactivity with CSS</h1>
  <p>A few CSS tricks make a page feel alive — hover feedback, smooth motion, and accessible focus states. No JavaScript required.</p>
  <h2>1. Hover effects on cards and links</h2>
  <pre class="code-block">.card { transition: transform .2s ease, box-shadow .2s ease; }

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 20px rgba(0,0,0,.08);
}

nav a:hover { color: var(--primary); }</pre>
  <h2>2. Buttons that react</h2>
  <pre class="code-block">button {
  background: var(--primary);
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 10px 18px;
  cursor: pointer;
  transition: background .2s ease, transform .15s ease;
}

button:hover  { background: #4f46e5; }
button:active { transform: scale(.97); }</pre>
  <h2>3. Focus states for keyboard users</h2>
  <p>People using only a keyboard need a visible indication of where they are:</p>
  <pre class="code-block">a:focus-visible, button:focus-visible {
  outline: 3px solid var(--primary);
  outline-offset: 2px;
}</pre>
  <h2>4. Smooth scrolling for anchor links</h2>
  <pre class="code-block">html { scroll-behavior: smooth; }</pre>
  <p>Clicking a <span class="ic">#section</span> link now glides instead of jumping.</p>
  <h2>5. A subtle entrance</h2>
  <pre class="code-block">@keyframes fade-up {
  from { opacity: 0; transform: translateY(12px); }
  to   { opacity: 1; transform: translateY(0); }
}

#about { animation: fade-up .6s ease both; }</pre>
  <div class="callout callout-tip">
    <strong>Restraint wins</strong>
    <p>Transitions feel premium in small doses: a hover lift, a button press, smooth anchors. Keep motion brief (150–300ms) and always preserve keyboard focus.</p>
  </div>
  <p>Your portfolio is now interactive, responsive, and accessible. Congratulate yourself — then take the final assessment to earn this course’s certificate of completion.</p>
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
  ('30000000-0000-4000-8000-000000000501', '30000000-0000-4000-8000-000000000303',
   'What does HTML stand for?',
   'HTML expands to HyperText Markup Language.', 1),
  ('30000000-0000-4000-8000-000000000502', '30000000-0000-4000-8000-000000000303',
   'Which element is the root of every HTML document?',
   'The <html> element wraps the entire document.', 2),
  ('30000000-0000-4000-8000-000000000503', '30000000-0000-4000-8000-000000000303',
   'Where must the <!DOCTYPE html> declaration appear?',
   'The doctype must be the very first line of the document.', 3),
  ('30000000-0000-4000-8000-000000000504', '30000000-0000-4000-8000-000000000306',
   'Which tag represents the most important heading on a page?',
   '<h1> is the top-level heading and should be used once per page.', 1),
  ('30000000-0000-4000-8000-000000000505', '30000000-0000-4000-8000-000000000306',
   'Which element creates a hyperlink?',
   'The anchor element <a> with an href attribute creates links.', 2),
  ('30000000-0000-4000-8000-000000000506', '30000000-0000-4000-8000-000000000306',
   'Which attribute tells the browser where the image file is located?',
   'The src attribute points to the image file.', 3),
  ('30000000-0000-4000-8000-000000000507', '30000000-0000-4000-8000-000000000309',
   'Which element represents the primary navigation of a page?',
   '<nav> is used for the main navigation links.', 1),
  ('30000000-0000-4000-8000-000000000508', '30000000-0000-4000-8000-000000000309',
   'Which tag is best for a self-contained piece of content such as a blog post?',
   '<article> is for content that can stand on its own.', 2),
  ('30000000-0000-4000-8000-000000000509', '30000000-0000-4000-8000-000000000309',
   'Which element should wrap the dominant content of the page?',
   'There should be exactly one <main> per page, wrapping the unique content.', 3),
  ('30000000-0000-4000-8000-000000000510', '30000000-0000-4000-8000-000000000312',
   'Which form method sends data as part of the URL?',
   'GET appends form data to the URL query string.', 1),
  ('30000000-0000-4000-8000-000000000511', '30000000-0000-4000-8000-000000000312',
   'Which input type masks the characters a user types?',
   'type="password" hides the typed characters.', 2),
  ('30000000-0000-4000-8000-000000000512', '30000000-0000-4000-8000-000000000312',
   'Which attribute connects a <label> to its form control?',
   'The for attribute on the label matches the id of the input.', 3),
  ('30000000-0000-4000-8000-000000000513', '30000000-0000-4000-8000-000000000315',
   'Which CSS property changes the text color?',
   'The color property sets text color.', 1),
  ('30000000-0000-4000-8000-000000000514', '30000000-0000-4000-8000-000000000315',
   'What does CSS stand for?',
   'CSS expands to Cascading Style Sheets.', 2),
  ('30000000-0000-4000-8000-000000000515', '30000000-0000-4000-8000-000000000315',
   'Which selector targets the element with id="hero"?',
   'The # selector targets an id: #hero.', 3),
  ('30000000-0000-4000-8000-000000000516', '30000000-0000-4000-8000-000000000318',
   'Which parts make up the CSS box model?',
   'From inside out: content, padding, border, margin.', 1),
  ('30000000-0000-4000-8000-000000000517', '30000000-0000-4000-8000-000000000318',
   'Which property creates space inside the border, around the content?',
   'Padding is the space between content and border.', 2),
  ('30000000-0000-4000-8000-000000000518', '30000000-0000-4000-8000-000000000318',
   'What does box-sizing: border-box change?',
   'Width and height then include padding and border.', 3),
  ('30000000-0000-4000-8000-000000000519', '30000000-0000-4000-8000-000000000321',
   'Which Flexbox property aligns items along the main axis?',
   'justify-content controls the main axis.', 1),
  ('30000000-0000-4000-8000-000000000520', '30000000-0000-4000-8000-000000000321',
   'Which value of display activates Flexbox?',
   'display: flex makes children flex items.', 2),
  ('30000000-0000-4000-8000-000000000521', '30000000-0000-4000-8000-000000000321',
   'Which property lets flex items wrap to a new line?',
   'flex-wrap: wrap allows wrapping.', 3),
  ('30000000-0000-4000-8000-000000000522', '30000000-0000-4000-8000-000000000324',
   'Which at-rule applies styles based on viewport size?',
   '@media applies styles under certain conditions like min-width.', 1),
  ('30000000-0000-4000-8000-000000000523', '30000000-0000-4000-8000-000000000324',
   'Which unit is relative to the width of the viewport?',
   '1vw equals one percent of the viewport width.', 2),
  ('30000000-0000-4000-8000-000000000524', '30000000-0000-4000-8000-000000000324',
   'Which approach writes base styles for small screens first?',
   'Mobile-first design layers larger-screen styles with min-width queries.', 3),
  ('30000000-0000-4000-8000-000000000525', '30000000-0000-4000-8000-000000000328',
   'Which element is best for a self-contained blog post?',
   '<article> represents self-contained, independently distributable content.', 1),
  ('30000000-0000-4000-8000-000000000526', '30000000-0000-4000-8000-000000000328',
   'Which CSS property controls space between the border and neighboring elements?',
   'Margin is space outside the border, pushing other boxes away.', 2),
  ('30000000-0000-4000-8000-000000000527', '30000000-0000-4000-8000-000000000328',
   'Which Flexbox property aligns items along the cross axis?',
   'align-items controls the cross axis.', 3),
  ('30000000-0000-4000-8000-000000000528', '30000000-0000-4000-8000-000000000328',
   'What is the correct HTML for inserting an image?',
   '<img src="cat.jpg" alt="cat"> is correct; the alt attribute describes it.', 4),
  ('30000000-0000-4000-8000-000000000529', '30000000-0000-4000-8000-000000000328',
   'Which line is required for responsive mobile pages?',
   'The viewport meta tag lets phones render at their natural width.', 5)
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
  -- Q1 (501): What does HTML stand for?
  ('30000000-0000-4000-8000-000000001001', '30000000-0000-4000-8000-000000000501', 'HyperText Markup Language', TRUE,  1),
  ('30000000-0000-4000-8000-000000001002', '30000000-0000-4000-8000-000000000501', 'HyperLink Text Module Language', FALSE, 2),
  ('30000000-0000-4000-8000-000000001003', '30000000-0000-4000-8000-000000000501', 'HighText Machine Language', FALSE, 3),
  ('30000000-0000-4000-8000-000000001004', '30000000-0000-4000-8000-000000000501', 'Home Tool Markup Language', FALSE, 4),
  -- Q1 (501)q2: root element
  ('30000000-0000-4000-8000-000000001005', '30000000-0000-4000-8000-000000000502', '<html>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001006', '30000000-0000-4000-8000-000000000502', '<head>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001007', '30000000-0000-4000-8000-000000000502', '<body>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001008', '30000000-0000-4000-8000-000000000502', '<title>', FALSE, 4),
  -- Q1 (501)q3: doctype placement
  ('30000000-0000-4000-8000-000000001009', '30000000-0000-4000-8000-000000000503', 'At the very top of the document', TRUE,  1),
  ('30000000-0000-4000-8000-000000001010', '30000000-0000-4000-8000-000000000503', 'Inside the <head>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001011', '30000000-0000-4000-8000-000000000503', 'Inside the <body>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001012', '30000000-0000-4000-8000-000000000503', 'At the very end of the document', FALSE, 4),
  -- Q2 (504): most important heading
  ('30000000-0000-4000-8000-000000001013', '30000000-0000-4000-8000-000000000504', '<h1>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001014', '30000000-0000-4000-8000-000000000504', '<heading>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001015', '30000000-0000-4000-8000-000000000504', '<h6>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001016', '30000000-0000-4000-8000-000000000504', '<header>', FALSE, 4),
  -- Q2 (504)q2: hyperlink tag
  ('30000000-0000-4000-8000-000000001017', '30000000-0000-4000-8000-000000000505', '<a>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001018', '30000000-0000-4000-8000-000000000505', '<link>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001019', '30000000-0000-4000-8000-000000000505', '<href>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001020', '30000000-0000-4000-8000-000000000505', '<url>', FALSE, 4),
  -- Q2 (504)q3: image src
  ('30000000-0000-4000-8000-000000001021', '30000000-0000-4000-8000-000000000506', 'src', TRUE,  1),
  ('30000000-0000-4000-8000-000000001022', '30000000-0000-4000-8000-000000000506', 'href', FALSE, 2),
  ('30000000-0000-4000-8000-000000001023', '30000000-0000-4000-8000-000000000506', 'data', FALSE, 3),
  ('30000000-0000-4000-8000-000000001024', '30000000-0000-4000-8000-000000000506', 'rel', FALSE, 4),
  -- Q3 (507): nav element
  ('30000000-0000-4000-8000-000000001025', '30000000-0000-4000-8000-000000000507', '<nav>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001026', '30000000-0000-4000-8000-000000000507', '<div>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001027', '30000000-0000-4000-8000-000000000507', '<main>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001028', '30000000-0000-4000-8000-000000000507', '<link>', FALSE, 4),
  -- Q3 (507)q2: article
  ('30000000-0000-4000-8000-000000001029', '30000000-0000-4000-8000-000000000508', '<article>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001030', '30000000-0000-4000-8000-000000000508', '<aside>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001031', '30000000-0000-4000-8000-000000000508', '<section>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001032', '30000000-0000-4000-8000-000000000508', '<span>', FALSE, 4),
  -- Q3 (507)q3: main
  ('30000000-0000-4000-8000-000000001033', '30000000-0000-4000-8000-000000000509', '<main>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001034', '30000000-0000-4000-8000-000000000509', '<header>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001035', '30000000-0000-4000-8000-000000000509', '<footer>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001036', '30000000-0000-4000-8000-000000000509', '<strong>', FALSE, 4),
  -- Q4 (510): GET sends data in URL
  ('30000000-0000-4000-8000-000000001037', '30000000-0000-4000-8000-000000000510', 'GET', TRUE,  1),
  ('30000000-0000-4000-8000-000000001038', '30000000-0000-4000-8000-000000000510', 'POST', FALSE, 2),
  ('30000000-0000-4000-8000-000000001039', '30000000-0000-4000-8000-000000000510', 'PUT', FALSE, 3),
  ('30000000-0000-4000-8000-000000001040', '30000000-0000-4000-8000-000000000510', 'DELETE', FALSE, 4),
  -- Q4 (510)q2: password type
  ('30000000-0000-4000-8000-000000001041', '30000000-0000-4000-8000-000000000511', 'password', TRUE,  1),
  ('30000000-0000-4000-8000-000000001042', '30000000-0000-4000-8000-000000000511', 'text', FALSE, 2),
  ('30000000-0000-4000-8000-000000001043', '30000000-0000-4000-8000-000000000511', 'hidden', FALSE, 3),
  ('30000000-0000-4000-8000-000000001044', '30000000-0000-4000-8000-000000000511', 'secure', FALSE, 4),
  -- Q4 (510)q3: label for
  ('30000000-0000-4000-8000-000000001045', '30000000-0000-4000-8000-000000000512', 'for', TRUE,  1),
  ('30000000-0000-4000-8000-000000001046', '30000000-0000-4000-8000-000000000512', 'id', FALSE, 2),
  ('30000000-0000-4000-8000-000000001047', '30000000-0000-4000-8000-000000000512', 'name', FALSE, 3),
  ('30000000-0000-4000-8000-000000001048', '30000000-0000-4000-8000-000000000512', 'class', FALSE, 4),
  -- Q5 (513): color property
  ('30000000-0000-4000-8000-000000001049', '30000000-0000-4000-8000-000000000513', 'color', TRUE,  1),
  ('30000000-0000-4000-8000-000000001050', '30000000-0000-4000-8000-000000000513', 'font-color', FALSE, 2),
  ('30000000-0000-4000-8000-000000001051', '30000000-0000-4000-8000-000000000513', 'text-color', FALSE, 3),
  ('30000000-0000-4000-8000-000000001052', '30000000-0000-4000-8000-000000000513', 'background', FALSE, 4),
  -- Q5 (513)q2: CSS meaning
  ('30000000-0000-4000-8000-000000001053', '30000000-0000-4000-8000-000000000514', 'Cascading Style Sheets', TRUE,  1),
  ('30000000-0000-4000-8000-000000001054', '30000000-0000-4000-8000-000000000514', 'Creative Style Sheets', FALSE, 2),
  ('30000000-0000-4000-8000-000000001055', '30000000-0000-4000-8000-000000000514', 'Computer Styled Sections', FALSE, 3),
  ('30000000-0000-4000-8000-000000001056', '30000000-0000-4000-8000-000000000514', 'Colorful Style Sheets', FALSE, 4),
  -- Q5 (513)q3: #hero selector
  ('30000000-0000-4000-8000-000000001057', '30000000-0000-4000-8000-000000000515', '#hero', TRUE,  1),
  ('30000000-0000-4000-8000-000000001058', '30000000-0000-4000-8000-000000000515', '.hero', FALSE, 2),
  ('30000000-0000-4000-8000-000000001059', '30000000-0000-4000-8000-000000000515', 'hero', FALSE, 3),
  ('30000000-0000-4000-8000-000000001060', '30000000-0000-4000-8000-000000000515', '*hero', FALSE, 4),
  -- Q6 (516): box model parts
  ('30000000-0000-4000-8000-000000001061', '30000000-0000-4000-8000-000000000516', 'content, padding, border, margin', TRUE,  1),
  ('30000000-0000-4000-8000-000000001062', '30000000-0000-4000-8000-000000000516', 'content, margin, width, height', FALSE, 2),
  ('30000000-0000-4000-8000-000000001063', '30000000-0000-4000-8000-000000000516', 'text, border, padding, outline', FALSE, 3),
  ('30000000-0000-4000-8000-000000001064', '30000000-0000-4000-8000-000000000516', 'inner, outer, top, bottom', FALSE, 4),
  -- Q6 (516)q2: padding
  ('30000000-0000-4000-8000-000000001065', '30000000-0000-4000-8000-000000000517', 'padding', TRUE,  1),
  ('30000000-0000-4000-8000-000000001066', '30000000-0000-4000-8000-000000000517', 'margin', FALSE, 2),
  ('30000000-0000-4000-8000-000000001067', '30000000-0000-4000-8000-000000000517', 'border-spacing', FALSE, 3),
  ('30000000-0000-4000-8000-000000001068', '30000000-0000-4000-8000-000000000517', 'gap', FALSE, 4),
  -- Q6 (516)q3: border-box
  ('30000000-0000-4000-8000-000000001069', '30000000-0000-4000-8000-000000000518', 'Width and height include padding and border', TRUE,  1),
  ('30000000-0000-4000-8000-000000001070', '30000000-0000-4000-8000-000000000518', 'Width and height include only the content', FALSE, 2),
  ('30000000-0000-4000-8000-000000001071', '30000000-0000-4000-8000-000000000518', 'Margins collapse into each other', FALSE, 3),
  ('30000000-0000-4000-8000-000000001072', '30000000-0000-4000-8000-000000000518', 'Borders become transparent', FALSE, 4),
  -- Q7 (519): justify-content
  ('30000000-0000-4000-8000-000000001073', '30000000-0000-4000-8000-000000000519', 'justify-content', TRUE,  1),
  ('30000000-0000-4000-8000-000000001074', '30000000-0000-4000-8000-000000000519', 'align-items', FALSE, 2),
  ('30000000-0000-4000-8000-000000001075', '30000000-0000-4000-8000-000000000519', 'flex-wrap', FALSE, 3),
  ('30000000-0000-4000-8000-000000001076', '30000000-0000-4000-8000-000000000519', 'order', FALSE, 4),
  -- Q7 (519)q2: display flex
  ('30000000-0000-4000-8000-000000001077', '30000000-0000-4000-8000-000000000520', 'flex', TRUE,  1),
  ('30000000-0000-4000-8000-000000001078', '30000000-0000-4000-8000-000000000520', 'block', FALSE, 2),
  ('30000000-0000-4000-8000-000000001079', '30000000-0000-4000-8000-000000000520', 'inline-block', FALSE, 3),
  ('30000000-0000-4000-8000-000000001080', '30000000-0000-4000-8000-000000000520', 'grid', FALSE, 4),
  -- Q7 (519)q3: flex-wrap
  ('30000000-0000-4000-8000-000000001081', '30000000-0000-4000-8000-000000000521', 'flex-wrap', TRUE,  1),
  ('30000000-0000-4000-8000-000000001082', '30000000-0000-4000-8000-000000000521', 'flex-direction', FALSE, 2),
  ('30000000-0000-4000-8000-000000001083', '30000000-0000-4000-8000-000000000521', 'flex-grow', FALSE, 3),
  ('30000000-0000-4000-8000-000000001084', '30000000-0000-4000-8000-000000000521', 'align-content', FALSE, 4),
  -- Q8 (522): @media
  ('30000000-0000-4000-8000-000000001085', '30000000-0000-4000-8000-000000000522', '@media', TRUE,  1),
  ('30000000-0000-4000-8000-000000001086', '30000000-0000-4000-8000-000000000522', '@import', FALSE, 2),
  ('30000000-0000-4000-8000-000000001087', '30000000-0000-4000-8000-000000000522', '@supports', FALSE, 3),
  ('30000000-0000-4000-8000-000000001088', '30000000-0000-4000-8000-000000000522', '@keyframes', FALSE, 4),
  -- Q8 (522)q2: vw unit
  ('30000000-0000-4000-8000-000000001089', '30000000-0000-4000-8000-000000000523', 'vw', TRUE,  1),
  ('30000000-0000-4000-8000-000000001090', '30000000-0000-4000-8000-000000000523', 'em', FALSE, 2),
  ('30000000-0000-4000-8000-000000001091', '30000000-0000-4000-8000-000000000523', 'px', FALSE, 3),
  ('30000000-0000-4000-8000-000000001092', '30000000-0000-4000-8000-000000000523', 'pt', FALSE, 4),
  -- Q8 (522)q3: mobile-first
  ('30000000-0000-4000-8000-000000001093', '30000000-0000-4000-8000-000000000524', 'Mobile-first design', TRUE,  1),
  ('30000000-0000-4000-8000-000000001094', '30000000-0000-4000-8000-000000000524', 'Desktop-first design', FALSE, 2),
  ('30000000-0000-4000-8000-000000001095', '30000000-0000-4000-8000-000000000524', 'Print-first design', FALSE, 3),
  ('30000000-0000-4000-8000-000000001096', '30000000-0000-4000-8000-000000000524', 'Table-first design', FALSE, 4),
  -- Q9 (525): self-contained blog post
  ('30000000-0000-4000-8000-000000001097', '30000000-0000-4000-8000-000000000525', '<article>', TRUE,  1),
  ('30000000-0000-4000-8000-000000001098', '30000000-0000-4000-8000-000000000525', '<section>', FALSE, 2),
  ('30000000-0000-4000-8000-000000001099', '30000000-0000-4000-8000-000000000525', '<div>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001100', '30000000-0000-4000-8000-000000000525', '<span>', FALSE, 4),
  -- Q9 (525)q2: margin
  ('30000000-0000-4000-8000-000000001101', '30000000-0000-4000-8000-000000000526', 'margin', TRUE,  1),
  ('30000000-0000-4000-8000-000000001102', '30000000-0000-4000-8000-000000000526', 'padding', FALSE, 2),
  ('30000000-0000-4000-8000-000000001103', '30000000-0000-4000-8000-000000000526', 'spacing', FALSE, 3),
  ('30000000-0000-4000-8000-000000001104', '30000000-0000-4000-8000-000000000526', 'gap', FALSE, 4),
  -- Q9 (525)q3: align-items
  ('30000000-0000-4000-8000-000000001105', '30000000-0000-4000-8000-000000000527', 'align-items', TRUE,  1),
  ('30000000-0000-4000-8000-000000001106', '30000000-0000-4000-8000-000000000527', 'justify-content', FALSE, 2),
  ('30000000-0000-4000-8000-000000001107', '30000000-0000-4000-8000-000000000527', 'flex-direction', FALSE, 3),
  ('30000000-0000-4000-8000-000000001108', '30000000-0000-4000-8000-000000000527', 'gap', FALSE, 4),
  -- Q9 (525)q4: image tag
  ('30000000-0000-4000-8000-000000001109', '30000000-0000-4000-8000-000000000528', '<img src="cat.jpg" alt="cat">', TRUE,  1),
  ('30000000-0000-4000-8000-000000001110', '30000000-0000-4000-8000-000000000528', '<image src="cat.jpg">', FALSE, 2),
  ('30000000-0000-4000-8000-000000001111', '30000000-0000-4000-8000-000000000528', '<img href="cat.jpg">', FALSE, 3),
  ('30000000-0000-4000-8000-000000001112', '30000000-0000-4000-8000-000000000528', '<picture><src alt="cat"></picture>', FALSE, 4),
  -- Q9 (525)q5: viewport meta
  ('30000000-0000-4000-8000-000000001113', '30000000-0000-4000-8000-000000000529', '<meta name="viewport" content="width=device-width, initial-scale=1">', TRUE,  1),
  ('30000000-0000-4000-8000-000000001114', '30000000-0000-4000-8000-000000000529', '<meta name="responsive" content="true">', FALSE, 2),
  ('30000000-0000-4000-8000-000000001115', '30000000-0000-4000-8000-000000000529', '<style>max-width: 9999px</style>', FALSE, 3),
  ('30000000-0000-4000-8000-000000001116', '30000000-0000-4000-8000-000000000529', '<script>responsive=mobile</script>', FALSE, 4)
ON CONFLICT (id) DO NOTHING;