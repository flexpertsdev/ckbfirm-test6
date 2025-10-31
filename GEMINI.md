# GEMINI.md - AI Agent Instructions for Astro Website Template

**You are building a production-ready Astro website using this template. Read this file first to understand the complete system.**

---

## 📁 Project Structure

```
project-root/
├── src/
│   ├── pages/           # Astro pages (index.astro, about.astro, etc.)
│   ├── layouts/         # Page layouts (BaseLayout.astro)
│   ├── components/      # Reusable components
│   └── styles/
│       ├── tokens/      # Design tokens (CRITICAL - read below)
│       ├── base/        # Reset & utilities
│       └── global.css   # Global styles
├── public/              # Static assets (images, fonts, etc.)
├── docs/                # YOUR REFERENCE LIBRARY (read as needed)
├── flexos/              # FlexOS metadata
│   ├── artifacts/       # Planning outputs from Steps 01-09
│   ├── assets/          # Downloaded assets
│   ├── workspace/       # Generated images/videos
│   └── ...
├── package.json
├── astro.config.mjs
└── GEMINI.md           # This file
```

---

## 📚 Critical Documentation (YOUR REFERENCE LIBRARY)

These files in `docs/` are your knowledge base. Read them as needed:

### Essential Reading:
1. **docs/09-BUILD-WORKFLOW.md** - Step-by-step website building process
2. **docs/03-SEMANTIC-LAYOUT-LIBRARY.md** - Pre-built section patterns (hero, features, testimonials, etc.)
3. **docs/04-SEMANTIC-DESIGN-SYSTEM-LIBRARY.md** - Complete design token system explained

### Additional Resources:
4. **docs/01-README-COMPLETE-SYSTEM.md** - System overview
5. **docs/02-SEMANTIC-FOUNDATION.md** - Semantic HTML principles
6. **docs/05-SEMANTIC-INTERACTIONS-COMPONENT-LIBRARY.md** - Interactive components
7. **docs/06-SEMANTIC-UX-FLOWS-LIBRARY.md** - Common user flows
8. **docs/07-CONTENT-TEMPLATE.md** - Content structure guide
9. **docs/08-BLOG-CONTENT-GUIDE.md** - Blog/MDX content collections
10. **docs/EXAMPLES.md** - Code examples

---

## 🎨 Design Token System (CRITICAL - NEVER HARDCODE!)

### Token Files (src/styles/tokens/):
- **colors.css** - OKLCH color system with `--hue-brand` and `--hue-accent` variables
- **typography.css** - Fluid type scale, font families, Google Fonts imports
- **spacing.css** - Spacing scale (--space-xs to --space-6xl)
- **animations.css** - Transitions, animations, timing functions

### How to Use Tokens:

**❌ WRONG (Hardcoded):**
```css
font-size: 48px;
color: #3b82f6;
padding: 32px;
```

**✅ CORRECT (Tokens):**
```css
font-size: var(--text-6xl);
color: var(--color-primary);
padding: var(--space-2xl);
```

### Customizing Tokens:

At the start of Step 10, you MUST customize these tokens based on the design brief:

**1. colors.css:**
```css
/* Set brand color hue from design brief */
--hue-brand: 220;           /* Change this to match brand color */
--saturation-brand: 0.15;   /* Adjust saturation */
--lightness-brand-50: 30%;  /* Adjust lightness */

/* Set accent color */
--hue-accent: 210;
--saturation-accent: 0.1;
```

**2. typography.css:**
```css
/* Add Google Fonts import at top */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Lora:wght@500;700&display=swap');

/* Set font families */
--font-display: 'Lora', serif;      /* Headings */
--font-sans: 'Inter', sans-serif;   /* Body text */
```

---

## 🏗️ Build Workflow (Step-by-Step)

### Phase 1: SETUP (2-3 iterations)
1. Read GEMINI.md (you're doing it now!)
2. Read `flexos/artifacts/06-design-system-brief.md`
3. Customize design tokens (colors.css, typography.css)
4. Test build: `npm run build`

### Phase 2: HOMEPAGE BUILD (15-25 iterations)
1. Read `flexos/artifacts/09-site-architecture.json` (page list)
2. Read `flexos/artifacts/10-content-strategy.json` (homepage content)
3. Study semantic layouts in `docs/03-SEMANTIC-LAYOUT-LIBRARY.md`
4. Build `src/pages/index.astro`:
   - Use BaseLayout wrapper
   - Implement sections using semantic HTML
   - Apply design tokens exclusively
   - Use real content (NO placeholders!)
   - Add images from asset inventory
5. Test build after each major section
6. Commit: `feat: Complete homepage`

### Phase 3: CONTENT COLLECTIONS (10-15 iterations, IF DEFINED)
If `flexos/artifacts/09-content-collections.json` exists:
1. Create `src/content/` directory
2. Create `src/content/config.ts` with Zod schemas
3. Create MDX files with COMPLETE 500-800 word articles
4. Create `src/pages/blog/index.astro` (listing)
5. Create `src/pages/blog/[slug].astro` (detail)
6. Test collections: `npm run build`
7. Commit: `feat: Add blog with MDX collections`

### Phase 4: INTERIOR PAGES (30-50 iterations)
For each page in site architecture:
1. Read page content strategy
2. Adapt patterns from homepage (don't start from scratch)
3. Build `src/pages/[page-name].astro`
4. Use design tokens consistently
5. Use asset inventory for images
6. Test build after each page
7. Commit each completed page

### Phase 5: COMPONENT EXTRACTION (10-15 iterations)
- ONLY extract if pattern repeats 3+ times
- Examples: Button, Card, Section wrapper
- Create in `src/components/`
- Test build after extraction

### Phase 6: NAVIGATION & FORMS (10-15 iterations)
1. Create `src/components/Header.astro`
2. Create `src/components/Footer.astro`
3. Update `src/layouts/BaseLayout.astro`
4. Add Netlify Forms to contact page
5. Test all navigation links

### Phase 7: TESTING & OPTIMIZATION (20-30 iterations)
1. Run final build: `npm run build`
2. Test links: use `test_links` tool
3. Validate HTML: use `validate_html` tool
4. Check images: paths, alt text, optimization
5. Run Lighthouse: use `run_lighthouse` tool
6. Fix all issues found
7. Final commit: `fix: Final testing and optimization`

---

## 📸 Asset Strategy (AUTHENTIC-FIRST)

### Asset Inventory Location:
All planned assets are in: **`flexos/artifacts/11-image-inventory.json`**

### Asset Priority Order:
1. ⭐ **AUTHENTIC** - Real team, real building, real projects (HIGHEST PRIORITY)
2. 🎬 **VIDEO TRANSFORMATION** - Transform authentic images to video (IDEAL for heroes!)
3. 🤖 **AI-GENERATED** - Brand-specific images/videos using AI tools
4. 📦 **STOCK** - ONLY for pure abstracts (minimize to 0-1)

### How to Use Assets:

**Step 1: Check Inventory**
```javascript
// Read: flexos/artifacts/11-image-inventory.json
{
  "assets": [
    {
      "path": "flexos/workspace/hero-building-video.mp4",
      "type": "video",
      "source": "authentic-transformed",
      "purpose": "Homepage hero background",
      "page": "home",
      "altText": "Cinematic view of office building"
    }
  ]
}
```

**Step 2: Implement Asset**

For videos (MP4):
```html
<video autoplay loop muted playsinline style="width: 100%; height: 100%; object-fit: cover;">
  <source src="/videos/hero-building.mp4" type="video/mp4">
</video>
```

For images (JPG/PNG):
```html
<img
  src="/images/team-photo.jpg"
  alt="Company team members in office"
  style="width: 100%; height: auto; object-fit: cover;"
>
```

### If Asset Gap Discovered (RARE):

**For Hero/Feature Sections:**
1. BEST: Transform authentic image to video (`transform_image_to_video` tool)
2. GOOD: Generate brand video (`generate_video_ai` tool)
3. OK: Generate brand image (`generate_image_ai` tool)

**For People/Team:**
- Use authentic photos if available
- Generate with `generate_image_ai` (match demographics)
- NEVER download stock photos of random people

**For Locations/Buildings:**
- Use authentic photos (consider video transformation!)
- Generate with `generate_image_ai`
- NEVER use generic stock office photos

**For Backgrounds/Abstract:**
- Generate with `generate_image_ai` (use brand colors)
- Stock acceptable ONLY if purely abstract

---

## ✅ Critical Rules (MUST FOLLOW)

### 1. TOKEN-ONLY STYLING
- NEVER hardcode: `font-size: 48px`
- ALWAYS use: `font-size: var(--text-6xl)`
- NEVER hardcode: `color: #3b82f6`
- ALWAYS use: `color: var(--color-primary)`

### 2. NO PLACEHOLDERS
- NO 'Lorem ipsum'
- NO '[Company Name]'
- NO '[Your tagline here]'
- Use REAL content from strategy

### 3. SEMANTIC HTML
- Use `<section>`, `<article>`, `<header>`, `<nav>`, `<footer>`
- NOT just `<div>` everywhere
- Proper heading hierarchy (h1 → h2 → h3)

### 4. MOBILE-FIRST
- Design tokens handle responsiveness automatically
- No manual media queries for typography
- Touch targets 44px+ on mobile

### 5. ACCESSIBILITY
- All images have descriptive alt text
- Form inputs have labels
- Color contrast meets WCAG AA
- Keyboard navigation works

### 6. NO data-animate ON HERO
- Hero sections should NOT have `data-animate` (causes black screen)
- Only use `data-animate` on below-fold content

### 7. CONTINUOUS TESTING
- Test build after each page: `npm run build`
- Fix errors immediately
- Don't accumulate broken code

---

## 📋 Quality Standards Checklist

Before marking Step 10 complete, verify ALL of these:

- [ ] Build succeeds: `npm run build` completes with no errors
- [ ] Zero broken links: All internal/external links work
- [ ] All images load: Paths correct, files exist
- [ ] Zero placeholder content: All content is real
- [ ] Token-only styling: Zero hardcoded values found
- [ ] Lighthouse 90+: Performance, Accessibility, SEO all 90+
- [ ] Semantic HTML: Proper element usage throughout
- [ ] Forms work: Netlify Forms configured correctly
- [ ] Collections work (if enabled): MDX content renders, dynamic routes work
- [ ] Navigation complete: All menu links functional

---

## 🚨 Common Pitfalls to Avoid

1. **Hardcoding values** - Use tokens for everything
2. **Lorem ipsum** - Write real content from strategy
3. **Generic stock photos** - Use authentic assets or AI-generated
4. **Skipping build tests** - Test after each page
5. **data-animate on hero** - Causes black screen
6. **Forgetting alt text** - Required for accessibility
7. **Deep nesting** - Use semantic layouts from library
8. **Component over-engineering** - Only extract if 3+ uses
9. **Ignoring mobile** - Test on mobile viewport
10. **Rushing** - Quality over speed

---

## 🎯 Success Metrics

You have **120 iterations** for Step 10. Use them wisely:

- Homepage: 15-25 iterations (most complex)
- Collections: 10-15 iterations (if enabled)
- Interior pages: 30-50 iterations (adapt from homepage)
- Components: 10-15 iterations (only if needed)
- Navigation/Forms: 10-15 iterations
- Testing: 20-30 iterations (crucial!)

**Quality over speed. A working site beats a perfect site.**

---

## 📖 Quick Reference

### Read First:
1. This file (GEMINI.md)
2. flexos/artifacts/06-design-system-brief.md
3. docs/09-BUILD-WORKFLOW.md

### Reference During Build:
- docs/03-SEMANTIC-LAYOUT-LIBRARY.md (section patterns)
- flexos/artifacts/10-content-strategy.json (page content)
- flexos/artifacts/11-image-inventory.json (assets)
- src/styles/tokens/ (design system)

### Tools Available:
- `read_file` - Read any file in project
- `write_file` - Write/edit files
- `generate_code` - Generate code blocks
- `download_image` - Download stock images (minimize use)
- `generate_image_ai` - Generate brand-specific images
- `generate_video_ai` - Generate brand videos
- `transform_image_to_video` - Transform images to videos
- `optimize_image` - Optimize large images
- `validate_html` - Validate HTML structure
- `test_links` - Test all links
- `run_lighthouse` - Run performance audits

---

**Now begin! Read the design brief and start customizing those tokens.**
