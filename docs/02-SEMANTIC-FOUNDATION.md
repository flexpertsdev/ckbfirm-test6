# Semantic Foundation for Award-Winning Astro Websites
## Netlify-First, Mobile-First, SEO-Optimized

---

## 🎯 PHILOSOPHY

**Semantic HTML First** → Build with meaning, not divs
**CSS Design Tokens** → Consistent, themeable, scalable
**Progressive Enhancement** → Works without JS, enhanced with it
**Netlify Native** → Leverage platform features
**Performance Budget** → Fast is a feature

---

## 📦 PROJECT INITIALIZATION

### 1. Create Base Project
```bash
# Start with official Astro minimal template
npm create astro@latest my-award-winning-site -- --template minimal

cd my-award-winning-site

# Add Netlify adapter (enables SSR, Functions, etc)
npx astro add netlify

# Add MDX for content-rich pages
npx astro add mdx

# Install additional dependencies
npm install @netlify/blobs         # Simple key-value storage
npm install @neondatabase/serverless  # PostgreSQL (if needed)
```

### 2. Project Structure (Minimal Semantic Foundation)

```
my-award-winning-site/
├── netlify/
│   ├── functions/              # Serverless functions
│   │   ├── contact.ts         # Form submission handler
│   │   ├── newsletter.ts      # Newsletter signup
│   │   └── analytics.ts       # Custom analytics
│   └── edge-functions/        # Edge functions (optional)
│       └── geolocation.ts     # Location-based content
├── public/
│   ├── fonts/                 # Self-hosted fonts
│   ├── robots.txt
│   └── _redirects             # Netlify redirects
├── src/
│   ├── assets/                # Optimized images
│   ├── content/               # Content Collections
│   │   ├── config.ts
│   │   ├── blog/
│   │   └── projects/
│   ├── layouts/
│   │   └── BaseLayout.astro   # Root layout only
│   ├── pages/
│   │   ├── index.astro
│   │   ├── blog/
│   │   │   ├── index.astro
│   │   │   └── [slug].astro
│   │   └── api/               # API routes
│   │       └── form.ts
│   ├── styles/
│   │   ├── tokens/            # Design system tokens
│   │   │   ├── colors.css
│   │   │   ├── typography.css
│   │   │   ├── spacing.css
│   │   │   └── animations.css
│   │   ├── base/
│   │   │   ├── reset.css
│   │   │   └── utilities.css
│   │   └── global.css
│   ├── lib/
│   │   ├── utils.ts
│   │   └── constants.ts
│   └── types/
│       └── index.ts
├── astro.config.mjs
├── netlify.toml               # Netlify configuration
├── package.json
└── tsconfig.json
```

---

## 🎨 DESIGN TOKENS (Semantic CSS Variables)

### File: `src/styles/tokens/colors.css`

```css
/**
 * COLOR SYSTEM
 * Using OKLCH for perceptually uniform colors
 * Customize hue values per project
 */

:root {
  /* Hue values - CHANGE THESE PER PROJECT */
  --hue-brand: 250;        /* Primary brand (0-360) */
  --hue-accent: 30;        /* Secondary/accent (0-360) */

  /* Brand color scale */
  --color-brand-50: oklch(97% 0.01 var(--hue-brand));
  --color-brand-100: oklch(94% 0.03 var(--hue-brand));
  --color-brand-200: oklch(88% 0.06 var(--hue-brand));
  --color-brand-300: oklch(80% 0.10 var(--hue-brand));
  --color-brand-400: oklch(70% 0.15 var(--hue-brand));
  --color-brand-500: oklch(60% 0.18 var(--hue-brand));  /* Base */
  --color-brand-600: oklch(50% 0.18 var(--hue-brand));
  --color-brand-700: oklch(40% 0.15 var(--hue-brand));
  --color-brand-800: oklch(30% 0.11 var(--hue-brand));
  --color-brand-900: oklch(20% 0.07 var(--hue-brand));

  /* Neutral scale */
  --color-neutral-0: oklch(100% 0 0);
  --color-neutral-50: oklch(98% 0 0);
  --color-neutral-100: oklch(96% 0 0);
  --color-neutral-200: oklch(92% 0 0);
  --color-neutral-300: oklch(84% 0 0);
  --color-neutral-400: oklch(70% 0 0);
  --color-neutral-500: oklch(55% 0 0);
  --color-neutral-600: oklch(45% 0 0);
  --color-neutral-700: oklch(35% 0 0);
  --color-neutral-800: oklch(25% 0 0);
  --color-neutral-900: oklch(15% 0 0);
  --color-neutral-950: oklch(10% 0 0);
  --color-neutral-1000: oklch(0% 0 0);

  /* Semantic colors - USE THESE IN COMPONENTS */
  --color-bg: var(--color-neutral-0);
  --color-bg-subtle: var(--color-neutral-50);
  --color-bg-muted: var(--color-neutral-100);

  --color-text: var(--color-neutral-900);
  --color-text-muted: var(--color-neutral-600);
  --color-text-subtle: var(--color-neutral-500);

  --color-border: var(--color-neutral-200);
  --color-border-strong: var(--color-neutral-300);

  --color-primary: var(--color-brand-500);
  --color-primary-hover: var(--color-brand-600);
  --color-primary-active: var(--color-brand-700);

  /* Surface colors (for cards, elevated elements) */
  --color-surface: var(--color-neutral-0);
  --color-surface-hover: var(--color-neutral-50);
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  :root {
    --color-bg: var(--color-neutral-950);
    --color-bg-subtle: var(--color-neutral-900);
    --color-bg-muted: var(--color-neutral-800);

    --color-text: var(--color-neutral-100);
    --color-text-muted: var(--color-neutral-400);
    --color-text-subtle: var(--color-neutral-500);

    --color-border: var(--color-neutral-800);
    --color-border-strong: var(--color-neutral-700);

    --color-surface: var(--color-neutral-900);
    --color-surface-hover: var(--color-neutral-800);
  }
}
```

### File: `src/styles/tokens/typography.css`

```css
/**
 * TYPOGRAPHY SYSTEM
 * Fluid type scale that responds to viewport
 */

:root {
  /* Font families - UPDATE THESE PER PROJECT */
  --font-sans: 'Inter Variable', system-ui, sans-serif;
  --font-serif: 'Newsreader Variable', Georgia, serif;
  --font-mono: 'JetBrains Mono', 'Courier New', monospace;
  --font-display: var(--font-sans);  /* For headlines */

  /* Fluid type scale (320px → 1440px viewport) */
  --text-xs: clamp(0.75rem, 0.7rem + 0.15vw, 0.813rem);
  --text-sm: clamp(0.875rem, 0.82rem + 0.2vw, 0.938rem);
  --text-base: clamp(1rem, 0.95rem + 0.25vw, 1.063rem);
  --text-lg: clamp(1.125rem, 1.05rem + 0.35vw, 1.25rem);
  --text-xl: clamp(1.25rem, 1.15rem + 0.5vw, 1.5rem);
  --text-2xl: clamp(1.5rem, 1.35rem + 0.75vw, 1.875rem);
  --text-3xl: clamp(1.875rem, 1.65rem + 1.1vw, 2.375rem);
  --text-4xl: clamp(2.25rem, 1.95rem + 1.5vw, 3rem);
  --text-5xl: clamp(3rem, 2.5rem + 2.5vw, 4rem);
  --text-6xl: clamp(3.75rem, 3rem + 3.75vw, 5.5rem);

  /* Line heights */
  --leading-none: 1;
  --leading-tight: 1.2;
  --leading-snug: 1.375;
  --leading-normal: 1.5;
  --leading-relaxed: 1.75;

  /* Letter spacing */
  --tracking-tight: -0.02em;
  --tracking-normal: 0;
  --tracking-wide: 0.02em;

  /* Font weights */
  --weight-normal: 400;
  --weight-medium: 500;
  --weight-semibold: 600;
  --weight-bold: 700;

  /* Measure (optimal line length) */
  --measure: 65ch;
  --measure-narrow: 45ch;
  --measure-wide: 80ch;
}
```

### File: `src/styles/tokens/spacing.css`

```css
/**
 * SPACING SYSTEM
 * Based on 4px grid
 */

:root {
  /* Fixed spacing */
  --space-0: 0;
  --space-1: 0.25rem;   /* 4px */
  --space-2: 0.5rem;    /* 8px */
  --space-3: 0.75rem;   /* 12px */
  --space-4: 1rem;      /* 16px */
  --space-5: 1.25rem;   /* 20px */
  --space-6: 1.5rem;    /* 24px */
  --space-8: 2rem;      /* 32px */
  --space-10: 2.5rem;   /* 40px */
  --space-12: 3rem;     /* 48px */
  --space-16: 4rem;     /* 64px */
  --space-20: 5rem;     /* 80px */
  --space-24: 6rem;     /* 96px */
  --space-32: 8rem;     /* 128px */

  /* Fluid spacing for sections */
  --space-section-xs: clamp(1.5rem, 3vw, 2rem);
  --space-section-sm: clamp(2rem, 5vw, 3rem);
  --space-section-md: clamp(3rem, 8vw, 5rem);
  --space-section-lg: clamp(5rem, 12vw, 8rem);
  --space-section-xl: clamp(8rem, 16vw, 12rem);

  /* Layout widths */
  --width-sm: 640px;
  --width-md: 768px;
  --width-lg: 1024px;
  --width-xl: 1280px;
  --width-2xl: 1536px;
  --width-full: 100%;

  /* Container padding */
  --padding-inline: clamp(1rem, 5vw, 2rem);
}
```

### File: `src/styles/tokens/animations.css`

```css
/**
 * ANIMATION SYSTEM
 * Respects prefers-reduced-motion
 */

:root {
  /* Durations */
  --duration-instant: 0ms;
  --duration-fast: 150ms;
  --duration-base: 250ms;
  --duration-slow: 350ms;
  --duration-slower: 500ms;

  /* Easing functions */
  --ease-linear: linear;
  --ease-in: cubic-bezier(0.4, 0, 1, 1);
  --ease-out: cubic-bezier(0, 0, 0.2, 1);
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);

  /* Common transitions */
  --transition-colors: color var(--duration-base) var(--ease-out),
                       background-color var(--duration-base) var(--ease-out),
                       border-color var(--duration-base) var(--ease-out);

  --transition-transform: transform var(--duration-base) var(--ease-out);
  --transition-opacity: opacity var(--duration-base) var(--ease-out);

  /* Shadows */
  --shadow-sm: 0 1px 2px 0 oklch(0% 0 0 / 0.05);
  --shadow-base: 0 1px 3px 0 oklch(0% 0 0 / 0.1);
  --shadow-md: 0 4px 6px -1px oklch(0% 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px oklch(0% 0 0 / 0.1);
  --shadow-xl: 0 20px 25px -5px oklch(0% 0 0 / 0.1);

  /* Border radius */
  --radius-sm: 0.25rem;
  --radius-base: 0.5rem;
  --radius-md: 0.75rem;
  --radius-lg: 1rem;
  --radius-xl: 1.5rem;
  --radius-full: 9999px;
}

/* Respect reduced motion */
@media (prefers-reduced-motion: reduce) {
  :root {
    --duration-fast: 0ms;
    --duration-base: 0ms;
    --duration-slow: 0ms;
    --duration-slower: 0ms;
  }

  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

---

## 🏗️ BASE STYLES (Semantic HTML Reset)

### File: `src/styles/base/reset.css`

```css
/**
 * SEMANTIC RESET
 * Opinionated defaults for semantic HTML
 */

/* Box sizing */
*,
*::before,
*::after {
  box-sizing: border-box;
}

/* Remove default margins */
* {
  margin: 0;
}

/* HTML & Body */
html {
  -webkit-text-size-adjust: 100%;
  tab-size: 4;
  hanging-punctuation: first last;
}

body {
  min-height: 100vh;
  font-family: var(--font-sans);
  font-size: var(--text-base);
  line-height: var(--leading-normal);
  color: var(--color-text);
  background-color: var(--color-bg);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}

/* Semantic headings */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-display);
  font-weight: var(--weight-bold);
  line-height: var(--leading-tight);
  text-wrap: balance;
}

h1 { font-size: var(--text-5xl); }
h2 { font-size: var(--text-4xl); }
h3 { font-size: var(--text-3xl); }
h4 { font-size: var(--text-2xl); }
h5 { font-size: var(--text-xl); }
h6 { font-size: var(--text-lg); }

/* Paragraphs */
p {
  max-width: var(--measure);
  text-wrap: pretty;
}

/* Links */
a {
  color: var(--color-primary);
  text-decoration-skip-ink: auto;
  transition: var(--transition-colors);
}

a:hover {
  color: var(--color-primary-hover);
}

/* Lists */
ul[role="list"],
ol[role="list"] {
  list-style: none;
  padding: 0;
}

/* Media */
img,
picture,
video,
canvas,
svg {
  display: block;
  max-width: 100%;
  height: auto;
}

/* Forms */
input,
button,
textarea,
select {
  font: inherit;
  color: inherit;
}

button {
  cursor: pointer;
}

/* Tables */
table {
  border-collapse: collapse;
  width: 100%;
}

/* Focus styles */
:focus-visible {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

/* Selection */
::selection {
  background-color: var(--color-brand-200);
  color: var(--color-brand-900);
}
```

### File: `src/styles/base/utilities.css`

```css
/**
 * SEMANTIC UTILITY CLASSES
 * Minimal, purpose-driven utilities
 */

/* Layout primitives */
.container {
  width: 100%;
  max-width: var(--width-xl);
  margin-inline: auto;
  padding-inline: var(--padding-inline);
}

.container-narrow { max-width: var(--width-md); }
.container-wide { max-width: var(--width-2xl); }

/* Flow (vertical rhythm) */
.flow > * + * {
  margin-top: var(--flow-space, 1em);
}

/* Stack (explicit vertical spacing) */
.stack {
  display: flex;
  flex-direction: column;
  gap: var(--stack-gap, var(--space-4));
}

/* Cluster (horizontal grouping) */
.cluster {
  display: flex;
  flex-wrap: wrap;
  gap: var(--cluster-gap, var(--space-4));
  align-items: center;
}

/* Grid */
.grid {
  display: grid;
  gap: var(--grid-gap, var(--space-6));
}

.grid-auto-fit {
  grid-template-columns: repeat(auto-fit, minmax(min(var(--grid-min, 250px), 100%), 1fr));
}

.grid-auto-fill {
  grid-template-columns: repeat(auto-fill, minmax(min(var(--grid-min, 250px), 100%), 1fr));
}

/* Visually hidden (accessible) */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

/* Skip link */
.skip-link {
  position: absolute;
  top: 0;
  left: 0;
  padding: var(--space-4);
  background: var(--color-bg);
  transform: translateY(-100%);
  transition: transform var(--duration-fast);
}

.skip-link:focus {
  transform: translateY(0);
}
```

---

## 🌐 NETLIFY INTEGRATION

### File: `netlify.toml`

```toml
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/api/*"
  to = "/.netlify/functions/:splat"
  status = 200

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"

# Cache static assets
[[headers]]
  for = "/assets/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

# Cache fonts
[[headers]]
  for = "/fonts/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
```

### File: `astro.config.mjs`

```javascript
import { defineConfig } from 'astro/config';
import netlify from '@astrojs/netlify';
import mdx from '@astrojs/mdx';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  output: 'hybrid', // SSR for dynamic pages, static for others
  adapter: netlify({
    edgeMiddleware: true,
    imageCDN: true, // Use Netlify Image CDN
  }),
  integrations: [
    mdx(),
    tailwind({ applyBaseStyles: false }), // Use our own reset
  ],
  image: {
    domains: ['images.unsplash.com'], // Allow external images
  },
  prefetch: {
    prefetchAll: true, // Faster navigation
  },
});
```

---

## 📝 NETLIFY FORMS INTEGRATION

### Simple Form (Works with SSR)

```astro
---
// pages/contact.astro
---

<form
  name="contact"
  method="POST"
  data-netlify="true"
  netlify-honeypot="bot-field"
>
  <!-- Honeypot for spam prevention -->
  <p hidden>
    <label>
      Don't fill this out: <input name="bot-field" />
    </label>
  </p>

  <input type="hidden" name="form-name" value="contact" />

  <label for="name">Name</label>
  <input type="text" id="name" name="name" required />

  <label for="email">Email</label>
  <input type="email" id="email" name="email" required />

  <label for="message">Message</label>
  <textarea id="message" name="message" required></textarea>

  <button type="submit">Send</button>
</form>
```

### Advanced: API Route + Netlify Function

```typescript
// pages/api/contact.ts
import type { APIRoute } from 'astro';

export const POST: APIRoute = async ({ request }) => {
  const formData = await request.formData();
  const name = formData.get('name');
  const email = formData.get('email');
  const message = formData.get('message');

  // Send to Netlify Forms via fetch
  const netlifyFormData = new FormData();
  netlifyFormData.append('form-name', 'contact');
  netlifyFormData.append('name', name as string);
  netlifyFormData.append('email', email as string);
  netlifyFormData.append('message', message as string);

  try {
    await fetch('/', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams(netlifyFormData as any).toString()
    });

    return new Response(JSON.stringify({ success: true }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (error) {
    return new Response(JSON.stringify({ error: 'Failed to submit' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
```

---

## 🗄️ DATABASE OPTIONS

### Option 1: Netlify Blobs (Simple Key-Value)

```typescript
// netlify/functions/save-data.ts
import { getStore } from '@netlify/blobs';

export default async (req: Request) => {
  const store = getStore('my-data');

  // Save data
  await store.set('user-preferences', JSON.stringify({
    theme: 'dark',
    language: 'en'
  }));

  // Get data
  const prefs = await store.get('user-preferences');

  return new Response(prefs);
};
```

### Option 2: Neon PostgreSQL (Production)

```typescript
// lib/db.ts
import { neon } from '@neondatabase/serverless';

const sql = neon(process.env.DATABASE_URL!);

export async function getBlogPosts() {
  const posts = await sql`
    SELECT * FROM posts
    WHERE published = true
    ORDER BY created_at DESC
  `;
  return posts;
}

export async function incrementViews(slug: string) {
  await sql`
    UPDATE posts
    SET views = views + 1
    WHERE slug = ${slug}
  `;
}
```

---

## 🎯 SEO FOUNDATION

### File: `src/layouts/BaseLayout.astro`

```astro
---
import { ViewTransitions } from 'astro:transitions';

interface Props {
  title: string;
  description: string;
  image?: string;
  article?: boolean;
}

const {
  title,
  description,
  image = '/og-image.jpg',
  article = false
} = Astro.props;

const canonicalURL = new URL(Astro.url.pathname, Astro.site);
const socialImage = new URL(image, Astro.site);
---

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Primary Meta Tags -->
  <title>{title}</title>
  <meta name="title" content={title} />
  <meta name="description" content={description} />
  <link rel="canonical" href={canonicalURL} />

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content={article ? 'article' : 'website'} />
  <meta property="og:url" content={canonicalURL} />
  <meta property="og:title" content={title} />
  <meta property="og:description" content={description} />
  <meta property="og:image" content={socialImage} />

  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image" />
  <meta property="twitter:url" content={canonicalURL} />
  <meta property="twitter:title" content={title} />
  <meta property="twitter:description" content={description} />
  <meta property="twitter:image" content={socialImage} />

  <!-- Fonts (self-hosted recommended) -->
  <link rel="preload" href="/fonts/inter-var.woff2" as="font" type="font/woff2" crossorigin />

  <!-- Styles -->
  <link rel="stylesheet" href="/src/styles/global.css" />

  <!-- View Transitions -->
  <ViewTransitions />
</head>
<body>
  <a href="#main" class="skip-link">Skip to content</a>

  <slot />
</body>
</html>
```

---

## 📊 PERFORMANCE CHECKLIST

```typescript
// lib/constants.ts
export const PERFORMANCE_BUDGET = {
  // Core Web Vitals targets
  LCP: 2.5,     // Largest Contentful Paint (seconds)
  FID: 100,     // First Input Delay (ms)
  CLS: 0.1,     // Cumulative Layout Shift (score)

  // Resource budgets
  totalPageWeight: 1024,    // KB
  javascript: 200,          // KB
  css: 50,                  // KB
  images: 500,              // KB
  fonts: 100,               // KB

  // Request limits
  totalRequests: 50,
  thirdPartyRequests: 10
};
```

---

## 🚦 USAGE GUIDE

### Building Your First Page

1. **Use semantic HTML**
   ```astro
   <article>
     <header>
       <h1>Article Title</h1>
       <time datetime="2025-01-15">Jan 15, 2025</time>
     </header>
     <p>Content goes here...</p>
   </article>
   ```

2. **Reference Layout Library patterns semantically**
   ```astro
   <!-- Example: Hero #1 - Split Hero with Depth -->
   <section class="hero">
     <div class="container">
       <div class="cluster" style="--cluster-gap: var(--space-12)">
         <div style="flex: 6">
           <h1>Your Headline</h1>
           <p>Supporting text</p>
         </div>
         <div style="flex: 4">
           <img src="..." alt="..." />
         </div>
       </div>
     </div>
   </section>
   ```

3. **Use design tokens for styling**
   ```css
   .hero {
     padding-block: var(--space-section-lg);
     background: var(--color-bg-subtle);
   }

   .hero h1 {
     font-size: var(--text-6xl);
     color: var(--color-text);
   }
   ```

4. **Add progressive enhancement**
   ```astro
   <div data-animate="slide-up">
     <!-- Content fades in on scroll -->
   </div>
   ```

---

## 🎨 PROJECT BRIEF TEMPLATE (Next Section)

This foundation gives you:

✅ **Semantic HTML-first** approach
✅ **Design tokens** for consistency
✅ **Netlify-native** integration
✅ **SEO-optimized** out of the box
✅ **Performance-budgeted**
✅ **Accessibility-compliant**
✅ **Zero component lock-in** (build what you need)

---

**Next:** Want me to create the PROJECT BRIEF template for starting new projects with unique branding?
