# BUILD WORKFLOW: Brief → Built Site

**Version:** 1.0
**Purpose:** Transform a complete project brief into a production-ready Astro website
**Philosophy:** Build pragmatically, page by page—avoid component type hell

---

## 🎯 Core Principles

### 1. **Pages Before Components**
Build complete, working pages with inline styles FIRST. Only extract components when you see clear patterns emerge across 3+ pages.

**Why:** Components are abstractions. Abstractions are expensive. They require:
- Type definitions
- Prop interfaces
- Documentation
- Mental overhead
- Refactoring when requirements change

Working pages are concrete. They ship. They generate value immediately.

### 2. **One Page Complete Before Starting Next**
Finish each page end-to-end (content → styling → assets → interactions → testing) before moving on.

**Why:** Context switching is expensive. Completing one page gives you momentum and clear patterns for the next.

### 3. **Inline Styles → Component Extraction**
Start with inline styles using design tokens. Extract to components only when you've built the same pattern 3+ times.

**Why:** You don't know what patterns will emerge until you've built a few pages. Premature abstraction leads to over-engineered, brittle components.

### 4. **Test Continuously, Not at the End**
Test each page as you build it. Don't save testing for "after all pages are done."

**Why:** Finding issues early is 10x cheaper than finding them after building 7 pages.

### 5. **Assets Per-Page, Not Bulk**
Download/generate assets for each page as you build it, not all at once upfront.

**Why:** You'll discover needed adjustments as you build. Bulk downloading wastes time on assets you might not use.

---

## 📖 What to Expect from the Brief

This workflow assumes your brief follows the **optimal structure** (validated through testing):

### ✅ What Every Brief Should Provide:

1. **One Detailed Page (Usually Homepage)**
   - Complete implementation with code snippets
   - Shows design token usage in practice
   - All content provided (no placeholders)
   - Demonstrates patterns for reuse

2. **Other Pages at High Level**
   - Content/copy provided
   - Layout suggestions (not prescriptive)
   - No detailed code (adapt homepage patterns)

3. **Design Token Specifications**
   - Exact OKLCH hue values
   - Font names and weights
   - Custom spacing/timing (if any)

4. **Image Guidance**
   - Working Unsplash URLs as placeholders, OR
   - Pexels keywords: `[PEXELS: search term]`
   - **Never fake paths** like `/images/file.jpg`

5. **Theme Specification**
   - Explicit: "Light theme only" or "Dark theme only" or "Both"
   - If light-only: Disable dark mode in colors.css

6. **Foundation Assumptions**
   - Lists required features (scroll animations, utilities, etc.)
   - No surprises about missing dependencies

### ⚠️ If Brief Has Issues:

**Fake Image Paths:** Replace with Unsplash URLs or search Pexels
**Missing Theme Spec:** Ask or assume light theme + disable dark mode
**Over-Specified Layouts:** Use as reference, adapt creatively
**No Copy Provided:** This is a blocker - copy must be written

---

## 📋 The 7-Phase Build Process

### **Phase 1: Setup** (30-45 minutes)

**Goal:** Create project foundation with customized design tokens

#### 1.1 Create New Astro Project

```bash
# In completed-sites directory
npm create astro@latest [project-name]
# Choose: Empty project, TypeScript (strict), No to all integrations

cd [project-name]
npm install
```

#### 1.2 Copy FlexOS Foundation

```bash
# Copy starter structure
cp -r ../../src/styles ./src/
cp -r ../../src/layouts ./src/
cp ../../astro.config.mjs ./
cp ../../netlify.toml ./
cp ../../tsconfig.json ./
```

**Important:** The tsconfig.json includes the `@/*` path alias configuration for clean imports:

```json
{
  "extends": "astro/tsconfigs/strict",
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": [".astro/types.d.ts", "**/*"],
  "exclude": ["dist"]
}
```

This allows you to use `@/` imports instead of relative paths:
```astro
// ✅ Clean - uses path alias
import BaseLayout from '@/layouts/BaseLayout.astro';
import Header from '@/components/Header.astro';

// ❌ Avoid - brittle relative paths
import BaseLayout from '../layouts/BaseLayout.astro';
import Header from '../components/Header.astro';
```

#### 1.3 Customize Design Tokens

Read the project brief's Design System section. Update these files:

**`src/styles/tokens/colors.css`**
```css
:root {
  /* Copy exact values from brief */
  --hue-brand: [from brief];
  --hue-accent: [from brief];
  --lightness-bg: [from brief];
  /* etc. */
}
```

**`src/styles/tokens/typography.css`**
```css
:root {
  --font-display: '[Font from brief]', [fallback];
  --font-sans: '[Font from brief]', [fallback];
  /* etc. */
}
```

**`src/styles/tokens/spacing.css`**
- Adjust only if brief specifies custom spacing

**`src/styles/tokens/animations.css`**
- Adjust only if brief specifies custom animation timing

**IMPORTANT: Check Theme Specification**

If brief says "Light theme only" or doesn't support dark mode:
```css
/* In colors.css - Comment out dark mode */
/* @media (prefers-color-scheme: dark) {
  :root {
    ...
  }
} */
```

**Why:** Prevents user's dark mode system preference from overriding brand theme.

#### 1.4 Import Fonts

**For Google Fonts (Recommended):**
1. Add `@import` statement at the top of `typography.css`
2. Include all needed font weights in the URL

**Example:**
```css
/* At top of typography.css */
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=Outfit:wght@300;400;500&display=swap');
```

**For Custom/Self-Hosted Fonts:**
1. Download font files (WOFF2 format)
2. Create `/public/fonts/[font-name]/` directories
3. Add font files
4. Create `@font-face` declarations in `typography.css`

**Example:**
```css
@font-face {
  font-family: 'Custom Font';
  src: url('/fonts/custom-font/custom-font-400.woff2') format('woff2');
  font-weight: 400;
  font-display: swap;
}
```

#### 1.5 Test Setup

```bash
npm run dev
```

Create a test page `src/pages/test.astro`:
```astro
---
---
<html>
<head>
  <link rel="stylesheet" href="/src/styles/global.css" />
</head>
<body>
  <h1 style="font-family: var(--font-display); color: var(--color-primary);">
    Test Design Tokens
  </h1>
  <p style="font-family: var(--font-sans); font-size: var(--text-lg);">
    If you see custom fonts and colors, tokens work!
  </p>
</body>
</html>
```

Visit `http://localhost:4321/test` - verify fonts and colors load.

**✅ Phase 1 Checkpoint:**
- [ ] Project created and running
- [ ] Design tokens customized
- [ ] Fonts installed and loading
- [ ] Test page confirms tokens work

---

### **Phase 2: Foundation** (45-60 minutes)

**Goal:** Set up BaseLayout and global styles

#### 2.1 Customize BaseLayout

Edit `src/layouts/BaseLayout.astro`:

```astro
---
interface Props {
  title: string;
  description: string;
  ogImage?: string;
  canonical?: string;
}

const { title, description, ogImage, canonical } = Astro.props;
const siteUrl = '[from brief]'; // e.g., https://serenityresort.com
---

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{title}</title>
  <meta name="description" content={description} />

  <!-- Open Graph -->
  <meta property="og:title" content={title} />
  <meta property="og:description" content={description} />
  <meta property="og:image" content={ogImage || `${siteUrl}/og-default.jpg`} />
  <meta property="og:url" content={canonical || siteUrl} />

  <!-- Canonical -->
  <link rel="canonical" href={canonical || siteUrl} />

  <!-- Fonts & Styles -->
  <link rel="stylesheet" href="/src/styles/global.css" />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
</head>
<body>
  <slot />
</body>
</html>
```

#### 2.2 Update Global Styles

Verify `src/styles/global.css` imports all tokens:
```css
@import './tokens/colors.css';
@import './tokens/typography.css';
@import './tokens/spacing.css';
@import './tokens/animations.css';
@import './base/reset.css';
@import './base/utilities.css';
```

#### 2.3 Add Scroll Animations Script

Create `public/scripts/animations.js`:
```javascript
// Initialize scroll animations
document.addEventListener('DOMContentLoaded', () => {
  const animated = document.querySelectorAll('[data-animate]');

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  animated.forEach(el => observer.observe(el));
});
```

Add to BaseLayout `<body>`:
```astro
<slot />
<script src="/scripts/animations.js"></script>
```

**✅ Phase 2 Checkpoint:**
- [ ] BaseLayout configured with SEO meta tags
- [ ] Global styles loading correctly
- [ ] Scroll animation script added
- [ ] Test page using BaseLayout works

---

### **Phase 3: Page Build Loop** (2-4 hours per page)

**Goal:** Build one complete page from start to finish

**This is the core loop. Repeat for each page in the brief.**

#### 3.1 Read Page Specification from Brief

Open the project brief, find the page section.

**For First Page (Usually Homepage):**
- Read detailed implementation thoroughly
- Note design token usage patterns
- Understand code structure
- Copy exact content provided

**For Subsequent Pages:**
- Read high-level spec + content
- **Adapt patterns from homepage** (don't start from scratch!)
- Reuse section structures that work
- Apply same token usage patterns
- Be creative within the brand system

**Read carefully:**
- Purpose & meta information
- Content/copy provided
- Layout suggestions (not prescriptive)
- Image guidance
- Interactions required

#### 3.2 Create Page File

```bash
# For homepage
touch src/pages/index.astro

# For other pages
touch src/pages/[page-name].astro
```

#### 3.3 Start with Page Shell

```astro
---
import BaseLayout from '@/layouts/BaseLayout.astro';
---

<BaseLayout
  title="[from brief]"
  description="[from brief]"
  ogImage="[from brief]"
  canonical="[from brief]"
>
  <!-- Page content goes here -->
</BaseLayout>
```

#### 3.4 Build Section by Section

**For each section in the brief:**

1. **Copy content from brief** - Use exact headlines, copy, and structure
2. **Add HTML structure** - Semantic elements (`<section>`, `<div class="container">`, etc.)
3. **Add inline styles** - Using design tokens from brief
4. **Add data-animate attributes** - Where specified in brief

**Example: Homepage Hero Section**

```astro
<section style="
  height: 100dvh;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(180deg, oklch(0% 0 0 / 0.3) 0%, oklch(0% 0 0 / 0.5) 100%),
              url('/images/home/hero.jpg');
  background-size: cover;
  background-position: center;
">
  <div class="container" style="text-align: center; color: white;">
    <h1
      style="
        font-size: var(--text-6xl);
        font-family: var(--font-display);
        font-weight: 300;
        line-height: 1.1;
        margin-bottom: var(--space-6);
      "
      data-animate="fade"
    >
      Where Luxury Meets<br/>Mindfulness
    </h1>

    <p
      style="
        font-size: var(--text-xl);
        max-width: 600px;
        margin: 0 auto var(--space-8);
        opacity: 0.95;
      "
      data-animate="fade"
    >
      24 overwater villas. Infinite serenity. Your transformation awaits.
    </p>

    <div style="display: flex; gap: var(--space-4); justify-content: center; flex-wrap: wrap;">
      <a
        href="/contact"
        style="
          padding: var(--space-4) var(--space-8);
          background: white;
          color: var(--color-text);
          border-radius: var(--radius-base);
          text-decoration: none;
          font-weight: 500;
          font-size: var(--text-lg);
          transition: transform 0.2s ease;
        "
        onmouseover="this.style.transform='translateY(-2px)'"
        onmouseout="this.style.transform='translateY(0)'"
      >
        Plan Your Journey
      </a>
    </div>
  </div>
</section>
```

**Key points:**
- All styles inline (using design tokens)
- Exact copy from brief
- Semantic HTML
- Accessibility (alt text, proper headings)
- Responsive via fluid design tokens

#### 3.5 Gather Assets for This Page

**From brief's asset inventory, for this page only:**

**Option A: Pexels Search**
1. Open Pexels.com
2. Search using keywords from brief (e.g., "luxury overwater villa sunset")
3. Download high-quality images (1920x1080+ for hero, 800x600+ for sections)
4. Save to `/public/images/[page-name]/[descriptive-name].jpg`
5. Optimize with ImageOptim or similar (target: <500KB for hero, <200KB for sections)

**Option B: AI Image Generation**
1. Use DALL-E / Midjourney with prompts from brief
2. Generate images matching description
3. Save to `/public/images/[page-name]/[descriptive-name].jpg`

**Update image paths in code:**
```astro
<img
  src="/images/home/hero.jpg"
  alt="[descriptive alt text from brief]"
  loading="[eager for above-fold, lazy for below-fold]"
/>
```

#### 3.6 Add Interactions

**For each interaction specified in brief:**

**Example: Hover effects**
```astro
<div
  style="
    transition: transform var(--transition-base), box-shadow var(--transition-base);
  "
  onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='var(--shadow-lg)'"
  onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='var(--shadow-md)'"
>
  Card content
</div>
```

**Example: Form submission**
```astro
<form name="contact" method="POST" data-netlify="true">
  <input type="hidden" name="form-name" value="contact" />
  <!-- Form fields -->
</form>
```

**Example: Carousel (use simple library)**
```astro
<!-- Add Swiper CSS in <head> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<div class="swiper">
  <div class="swiper-wrapper">
    <div class="swiper-slide">Slide 1</div>
    <div class="swiper-slide">Slide 2</div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
  new Swiper('.swiper', {
    autoplay: { delay: 6000 },
    loop: true,
  });
</script>
```

#### 3.7 Test the Page

**In browser (http://localhost:4321/[page]):**

- [ ] All content displays correctly
- [ ] Design tokens (colors, fonts, spacing) match brief
- [ ] Images load (check Network tab)
- [ ] Scroll animations trigger
- [ ] Hover effects work
- [ ] Forms submit (test with Netlify Forms)
- [ ] Mobile responsive (resize browser to 375px width)
- [ ] Lighthouse score 90+ (run in incognito)
- [ ] No console errors

**Fix issues immediately before moving on.**

#### 3.8 Commit Progress

```bash
git add .
git commit -m "feat: Complete [Page Name] page

- Add all sections from brief
- Include assets and interactions
- Test passes: responsive, performance, accessibility"
```

**✅ Phase 3 Checkpoint (Per Page):**
- [ ] Page built section by section
- [ ] Assets downloaded and optimized
- [ ] Interactions working
- [ ] Tested and passing
- [ ] Committed to git

**Repeat Phase 3 for each page in the brief.**

---

### **Phase 4: Optimization** (1-2 hours)

**Goal:** Extract common patterns and optimize

#### 4.1 Identify Repeated Patterns

After building 3+ pages, you'll notice repeated patterns:
- Button styles
- Card layouts
- Section wrappers
- Image treatments

**Only now should you extract components.**

#### 4.2 Extract Components (If Justified)

**Example: Button Component**

Create `src/components/Button.astro`:
```astro
---
interface Props {
  href?: string;
  variant?: 'primary' | 'secondary';
  size?: 'md' | 'lg';
}

const { href, variant = 'primary', size = 'md' } = Astro.props;

const styles = {
  primary: `
    background: var(--color-primary);
    color: white;
  `,
  secondary: `
    border: 2px solid var(--color-border);
    color: var(--color-text);
  `
};

const sizes = {
  md: `padding: var(--space-3) var(--space-6);`,
  lg: `padding: var(--space-4) var(--space-8);`
};
---

<a
  href={href}
  style={`
    display: inline-block;
    ${styles[variant]}
    ${sizes[size]}
    border-radius: var(--radius-base);
    text-decoration: none;
    font-weight: 600;
    transition: transform 0.2s ease;
  `}
  onmouseover="this.style.transform='translateY(-2px)'"
  onmouseout="this.style.transform='translateY(0)'"
>
  <slot />
</a>
```

#### 4.3 Refactor Pages to Use Components

**Only replace inline code where the component is simpler:**

**Before:**
```astro
<a href="/contact" style="padding: var(--space-4) var(--space-8); background: var(--color-primary); color: white; ...">
  Contact
</a>
```

**After:**
```astro
<Button href="/contact" variant="primary" size="lg">
  Contact
</Button>
```

**If it's not simpler, leave it inline. Avoid premature abstraction.**

#### 4.4 Optimize Images

**Check image sizes:**
```bash
du -sh public/images/**/*
```

**If any image > 500KB:**
- Use ImageOptim / Squoosh
- Convert to WebP: `cwebp input.jpg -q 85 -o output.webp`
- Update code to use WebP with JPG fallback

#### 4.5 Performance Audit

```bash
npm run build
npm run preview
```

**Run Lighthouse on each page (incognito mode):**
- Performance: 90+
- Accessibility: 90+
- Best Practices: 90+
- SEO: 90+

**If scores < 90, fix issues:**
- Add `loading="lazy"` to below-fold images
- Optimize large images
- Add missing alt text
- Fix contrast issues

**✅ Phase 4 Checkpoint:**
- [ ] Common patterns extracted to components (only if justified)
- [ ] Images optimized (<500KB each)
- [ ] Lighthouse scores 90+ on all pages
- [ ] No console errors

---

### **Phase 5: Testing** (1-2 hours)

**Goal:** Comprehensive cross-browser and device testing

#### 5.1 Browser Testing

Test on:
- [ ] Chrome/Edge (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)

**Check:**
- [ ] All pages load
- [ ] Fonts display correctly
- [ ] Colors match design
- [ ] Animations work
- [ ] Forms submit

#### 5.2 Responsive Testing

Test breakpoints:
- [ ] Mobile (375px)
- [ ] Tablet (768px)
- [ ] Desktop (1024px, 1440px)

**Check:**
- [ ] Text is readable (16px+ body)
- [ ] Touch targets 44px+ (mobile)
- [ ] No horizontal scroll
- [ ] Images scale properly

#### 5.3 Accessibility Testing

**Automated:**
```bash
npm install -g @axe-core/cli
axe http://localhost:4321/ --exit
```

**Manual:**
- [ ] Tab through all interactive elements
- [ ] Screen reader test (NVDA/VoiceOver)
- [ ] Color contrast (WebAIM checker)
- [ ] Alt text on all images

#### 5.4 Form Testing

**For each form:**
- [ ] Submit with valid data
- [ ] Submit with invalid data (check validation)
- [ ] Check Netlify Forms dashboard for submissions

#### 5.5 Load Testing

**Check performance:**
- [ ] Homepage loads < 2s (Fast 3G)
- [ ] No render-blocking resources
- [ ] No layout shifts (CLS < 0.1)

**✅ Phase 5 Checkpoint:**
- [ ] All browsers tested and working
- [ ] All breakpoints responsive
- [ ] Accessibility checks passing
- [ ] Forms working correctly
- [ ] Performance targets met

---

### **Phase 6: Deploy** (30 minutes)

**Goal:** Deploy to Netlify production

#### 6.1 Pre-Deploy Checklist

- [ ] All pages built and tested
- [ ] All images optimized
- [ ] Lighthouse scores 90+
- [ ] Forms tested
- [ ] No console errors
- [ ] favicon.svg added to /public/

#### 6.2 Update Netlify Config

**Edit `netlify.toml`:**
```toml
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

#### 6.3 Deploy

```bash
# Install Netlify CLI (if not already)
npm install -g netlify-cli

# Login
netlify login

# Initialize site (first time)
netlify init

# Deploy to production
netlify deploy --prod
```

**Follow prompts:**
- Site name: [project-name]
- Build command: npm run build
- Publish directory: dist

#### 6.4 Verify Deployment

Visit deployed URL:
- [ ] All pages load
- [ ] Images display
- [ ] Forms work
- [ ] SSL certificate active
- [ ] Custom domain (if applicable)

#### 6.5 Configure Custom Domain (If Applicable)

**In Netlify dashboard:**
1. Domain settings → Add custom domain
2. Update DNS records at registrar
3. Wait for SSL provisioning (15-60 min)
4. Verify site loads on custom domain

**✅ Phase 6 Checkpoint:**
- [ ] Site deployed to Netlify
- [ ] All pages accessible
- [ ] SSL active
- [ ] Forms working in production
- [ ] Custom domain configured (if applicable)

---

### **Phase 7: Handoff** (Optional, 30 minutes)

**Goal:** Create documentation for client/team

#### 7.1 Create README.md

```markdown
# [Project Name]

**Live Site:** [URL]
**Netlify Dashboard:** [URL]

## Local Development

\`\`\`bash
npm install
npm run dev
\`\`\`

Visit http://localhost:4321

## Deployment

\`\`\`bash
npm run build
netlify deploy --prod
\`\`\`

## Editing Content

- Pages: \`src/pages/\`
- Images: \`public/images/\`
- Design tokens: \`src/styles/tokens/\`

## Forms

Forms are handled by Netlify Forms. View submissions at:
[Netlify Dashboard] → Forms

## Support

For issues or questions, contact: [your email]
```

#### 7.2 Document Design Tokens

Create `DESIGN-TOKENS.md`:
```markdown
# Design Tokens

## Colors

- Primary: \`var(--color-primary)\` - [Hex value]
- Accent: \`var(--color-accent)\` - [Hex value]

## Typography

- Display: [Font name]
- Body: [Font name]

## Spacing

- Section padding: \`var(--space-section-lg)\`
- Card padding: \`var(--space-8)\`

[Full token list...]
```

**✅ Phase 7 Checkpoint:**
- [ ] README.md created
- [ ] Design tokens documented
- [ ] Access credentials shared (if applicable)

---

## 🚨 Common Pitfalls & Solutions

### Pitfall 1: "Component Type Hell"
**Symptom:** Spending hours defining types instead of building pages

**Solution:** Build 3 complete pages with inline styles first. Only extract components when you see clear patterns.

### Pitfall 2: "Perfectionism Paralysis"
**Symptom:** Endlessly tweaking one page instead of moving forward

**Solution:** Set a timer. Give yourself 2 hours per page. Ship working pages, not perfect pages.

### Pitfall 3: "Bulk Asset Download"
**Symptom:** Downloading all 50 images upfront, then realizing half don't work

**Solution:** Download assets page-by-page as you build. Adjust as needed.

### Pitfall 4: "Testing at the End"
**Symptom:** Building all pages, then finding systemic issues that require rework

**Solution:** Test each page as you complete it. Fix issues immediately.

### Pitfall 5: "Over-abstraction"
**Symptom:** Creating components for everything, losing clarity

**Solution:** Inline styles are fine if used once or twice. Extract only when pattern appears 3+ times.

---

## ⏱️ Time Estimates

| Phase | Time | Notes |
|-------|------|-------|
| Setup | 30-45 min | One-time per project |
| Foundation | 45-60 min | One-time per project |
| Page Build (Homepage) | 3-4 hours | Most complex page |
| Page Build (Interior) | 2-3 hours | Simpler than homepage |
| Optimization | 1-2 hours | After all pages built |
| Testing | 1-2 hours | Comprehensive check |
| Deploy | 30 min | Usually quick |
| Handoff | 30 min | Optional |

**Total for 7-page site:** 18-25 hours

---

## ✅ Success Criteria

**A successful build means:**
- [ ] All pages from brief are built
- [ ] Design tokens match brief exactly
- [ ] All content is present (no "lorem ipsum")
- [ ] All images are optimized and displaying
- [ ] All interactions work as specified
- [ ] Lighthouse scores 90+ on all pages
- [ ] Mobile responsive (tested 375px-1440px)
- [ ] Forms submit successfully
- [ ] Deployed and accessible via HTTPS
- [ ] No console errors

---

**Ready to build?** Follow this workflow one phase at a time, and you'll ship production-ready sites efficiently without getting lost in component abstraction.
