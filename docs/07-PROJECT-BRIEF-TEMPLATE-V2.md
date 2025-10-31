# Project Briefing Template v2.0

**Version:** 2.0 (Optimized Format)
**Purpose:** Expand project stubs into streamlined, production-ready briefings
**Key Change:** ONE detailed page + high-level others = faster to write, faster to build, same quality

**Based on:** Serenity Resort workflow testing (October 2025)

---

## 📖 How to Use This Template

### The Optimal Brief Structure:

1. **Brand Foundation** (3-5 pages) - Complete brand identity and design tokens
2. **ONE Detailed Page** (12-20 pages) - Usually homepage, shows design system in action
3. **Other Pages High-Level** (1-2 pages each) - Content + suggestions, not prescriptive
4. **Assets & SEO** (2-3 pages) - Image library, keywords, meta descriptions

**Target Length:** 25-35 pages (vs. old format's 80-120 pages)
**Build Time:** 50% faster, same quality output

---

## PART 1: Brand Foundation

### 📋 Project Overview

**Project Information:**
- **Project ID:** [e.g., 03]
- **Project Name:** [Full business name]
- **Industry:** [Primary industry/sector]
- **Theme:** [Light only / Dark only / Both - SPECIFY EXPLICITLY]
- **Difficulty Level:** [Beginner/Intermediate/Advanced]
- **Target Pages:** [Number and list: Homepage, About, Services, Contact]

### Brand Identity

**Business Name:** [Legal entity name]
**Tagline:** [Memorable one-liner]
**Domain:** [example.com]

**Positioning Statement:**
[50-100 words describing market position, what makes them unique, who they serve]

**Target Audience:**

**Primary:**
- **Demographics:** [Age, income, location, occupation]
- **Psychographics:** [Values, interests, lifestyle]
- **Behaviors:** [Online habits, buying patterns]
- **Pain Points:** [What problems do they face?]
- **Goals:** [What do they want to achieve?]

**Secondary:** [If applicable]

**Unique Selling Proposition (USP):**
[100-150 words. What makes this business different and better? Specific advantages, not generic claims.]

**Competitive Landscape:**
- **Direct Competitors:** [List 3-5 with brief notes]
- **Indirect Competitors:** [List 2-3]
- **Competitive Advantages:** [Specific differentiators]

---

### 🎨 Design System

#### Brand Personality

**Voice:** [3-5 adjectives describing tone]
**Tone:** [One-liner capturing communication style]

**Do's:**
- [Specific style guidance]
- [Language preferences]
- [Emotional tone]

**Don'ts:**
- [What to avoid]
- [Off-brand language]
- [Tone pitfalls]

**Values:** [3-5 core values]

#### Visual Identity

**Theme Specification:** ⚠️ IMPORTANT
- [ ] Light theme only (Disable dark mode in colors.css)
- [ ] Dark theme only (Light mode won't work)
- [ ] Supports both (Keep default behavior)

**Color Palette:**

```css
/* src/styles/tokens/colors.css */

:root {
  /* Primary Brand Color */
  --hue-brand: [0-360];        /* [Color name, e.g., Aquamarine] */
  --saturation-brand: [0-0.3]; /* Usually 0.12-0.18 for subtle colors */
  --lightness-brand-50: [50-60%];

  /* Accent Color */
  --hue-accent: [0-360];       /* [Color name, e.g., Sand Gold] */
  --saturation-accent: [0-0.3];
  --lightness-accent-50: [50-60%];

  /* Background (if custom needed) */
  --lightness-bg: [8-99%];     /* 98-99% for light, 8-10% for dark */

  /* Custom colors (optional) */
  --color-custom: oklch([l] [c] [h]); /* If brand has specific colors */
}
```

**Color Psychology:**
[Why these colors? What emotions/associations do they create?]

**Typography:**

```css
/* src/styles/tokens/typography.css */

/* Add this import at TOP of file */
@import url('https://fonts.googleapis.com/css2?family=[Font+Name]:wght@[weights]&family=[Second+Font]:wght@[weights]&display=swap');

:root {
  /* Display Font (Headlines) */
  --font-display: '[Font Name]', [fallback], serif;
  --font-display-weights: [e.g., 300, 400, 600];

  /* Body Font */
  --font-sans: '[Font Name]', [fallback], sans-serif;
  --font-sans-weights: [e.g., 300, 400, 500];

  /* Type Scale - only if custom needed */
  --text-base: clamp([min]rem, [middle] + [vw]vw, [max]rem);
  /* ... only specify if different from defaults */
}
```

**Typography Rationale:**
[Why these fonts? What feeling do they create? How do they support the brand?]

**Font Sources:**
- **[Font Name]:** [Google Fonts URL or custom source]
- **[Font Name]:** [Google Fonts URL or custom source]

**Spacing / Animations:**
[Only include if custom values needed - defaults usually work]

#### Imagery Style

[2-3 paragraphs describing:]
- What types of images (photography style, illustrations, etc.)
- Subject matter (people, products, environments)
- Mood/feeling (bright, moody, clean, organic, etc.)
- Diversity/representation considerations

#### Icon Style

- **Type:** [SVG icons, outline style, filled, duotone, etc.]
- **Source:** [Heroicons, Lucide, custom, etc.]
- **Color:** [Usually var(--color-primary) or var(--color-text)]
- **Size:** [Consistent sizing, e.g., 24px/48px for features]

**Do NOT use emojis** unless explicitly part of brand personality.

---

### 🏗️ Foundation Assumptions

**This brief assumes the following exist** (from FlexOS Astro Starter):

✅ **BaseLayout Component**
- SEO meta tags
- Scroll animation system (data-animate attributes work)
- ViewTransitions enabled

✅ **CSS Utility Classes**
- `.container` - Centered content with max-width
- `.grid` - CSS Grid with responsive columns
- `.stack` - Vertical spacing (flow)
- `.cluster` - Horizontal spacing with wrap

✅ **Design Token System**
- `/src/styles/tokens/` with colors, typography, spacing, animations
- All tokens accessible via `var(--token-name)`

✅ **Navigation & Footer**
- Will be built as components from specifications below
- Header.astro and Footer.astro to be created

---

### 📄 Site Structure

**Site Map:**
```
[Project Name]
├── Homepage (index.astro)
├── [Page 2] ([page-2].astro)
├── [Page 3] ([page-3].astro)
├── [Page 4] ([page-4].astro)
└── [Page N] ([page-n].astro)
```

**Navigation Structure:**

**Desktop:**
- Logo (left) → Homepage
- [Nav Item 1]
- [Nav Item 2]
- [Nav Item 3]
- [Nav Item 4]
- [CTA Button] (right)

**Mobile:**
- Logo + Hamburger
- Same items, mobile-friendly
- [CTA] as full-width button

**Footer:**
- [Column 1: Brand info, contact]
- [Column 2: Quick links]
- [Column 3: Newsletter / Social]
- Copyright & legal links

---

## PART 2: ONE Detailed Page - Homepage

### Homepage - `index.astro`

**Purpose:** [What should this page accomplish?]

**Target Keywords:** "[primary keyword]," "[secondary keyword]," "[tertiary keyword]"

**Meta Information:**
- **Title:** [50-60 characters, keyword-optimized]
- **Meta Description:** [150-160 characters, compelling + keyword]
- **OG Image:** [Description of social share image]
- **Canonical:** https://[domain].com/

---

**[SECTION 1 NAME] - `.section-classname`**

*Purpose:* [What this section accomplishes]

*Layout:* [Description - e.g., "Full-viewport hero with centered content"]

*Components/Structure:*

```astro
<section style="
  [All inline styles using design tokens]
  padding: var(--space-section-lg);
  background: var(--color-bg);
  [etc.]
">
  <div class="container">
    <div class="stack stack-lg">
      <!-- Exact HTML structure -->
      <h1 style="
        font-size: var(--text-6xl);
        font-family: var(--font-display);
        [etc.]
      ">
        [EXACT COPY - Actual headline text goes here]
      </h1>

      <p style="[exact styling]">
        [EXACT COPY - Actual paragraph text]
      </p>

      <!-- Images with WORKING URLs -->
      <img
        src="https://images.unsplash.com/photo-[ID]?w=800&q=90"
        alt="[Descriptive alt text]"
        style="[styling]"
        loading="[eager/lazy]"
      />

      <!-- Or use keyword format -->
      <img
        src="[UNSPLASH: keyword search term]"
        alt="[Descriptive alt text]"
      />
    </div>
  </div>
</section>
```

*Content:*
- **Headline:** "[Exact text]"
- **Subheading:** "[Exact text]"
- **Body Copy:** "[Full paragraph(s)]"
- **CTA Text:** "[Button/link text]"

*Images:*
1. **[Image description]**
   - URL: https://images.unsplash.com/photo-[ID]?w=[size]&q=90
   - Alt: "[Descriptive alt text]"
   - Loading: [eager/lazy]

*Interactions:*
- [Hover effects, animations, scroll behaviors]
- [Any data-animate attributes]

*Responsive Behavior:*
- Mobile: [Only if explicit breakpoints needed - fluid tokens handle most]
- Tablet: [If needed]
- Desktop: [As specified]

---

**[SECTION 2 NAME]**

[Repeat same structure for each section on homepage]

---

**[SECTION N NAME]**

[All homepage sections detailed with code, content, images]

---

### Homepage Images Summary

1. **[Section name] - [Description]**
   - URL: https://images.unsplash.com/photo-[ID]?w=[size]&q=90
   - Alt: "[Alt text]"

[List all images for quick reference]

---

## PART 3: Other Pages - High Level

### [Page 2 Name] - `[page-2].astro`

**Purpose:** [What this page accomplishes]

**Keywords:** "[primary]," "[secondary]"

**Meta:**
- **Title:** [50-60 chars]
- **Description:** [150-160 chars]

**Content:**

**[Section 1]:**
- **Headline:** "[Exact text]"
- **Body:** "[Full copy]"
- **CTA:** "[Button text]"

**[Section 2]:**
[All actual content written out]

**Layout Suggestions:**
- [Brief guidance like "Use alternating image/text pattern from homepage"]
- [NOT prescriptive code - let developer adapt patterns]

**Images:**
- **[Description]:** https://images.unsplash.com/photo-[ID] or [UNSPLASH: keyword]
- **[Description]:** [URL or keyword]

**Interactions:**
- [Key features: forms, galleries, etc.]

---

### [Page 3 Name] - `[page-3].astro`

[Same structure - high level with all content]

---

### [Repeat for all pages]

**Note:** These pages get 1-2 pages each, NOT 10-15 pages like homepage.

---

## PART 4: Assets & SEO

### Complete Image Library

**Homepage:**
1. [Description] - https://images.unsplash.com/photo-[ID]?w=1920&q=90
2. [Description] - https://images.unsplash.com/photo-[ID]?w=800&q=90
[etc.]

**[Page 2]:**
1. [Description] - [URL]
[etc.]

[All images organized by page with working URLs]

---

### SEO Strategy

**Primary Keywords:**
1. "[keyword phrase]"
2. "[keyword phrase]"
3. "[keyword phrase]"
[5-10 total]

**Long-Tail Keywords:**
1. "[specific long phrase]"
2. "[specific long phrase]"
[20-30 total]

**Meta Descriptions Per Page:**
- **Homepage:** "[150-160 chars with primary keyword]"
- **[Page 2]:** "[150-160 chars with relevant keyword]"
[One per page]

---

### Functional Requirements

**Forms:**
- **Contact Form:** [Fields, validation, success state]
- **Newsletter:** [Email only, Netlify Forms integration]

**Integrations:**
- [Any third-party services needed]
- [Maps, calendars, etc.]

---

### Performance Targets

- **Lighthouse:** 90+ all metrics
- **LCP:** < 2.5s
- **Page Weight:** < 2MB

---

## ✅ Launch Checklist

[Standard checklist items]

---

**Brief Complete!** This streamlined format is faster to write and builds faster while maintaining the same quality output.
