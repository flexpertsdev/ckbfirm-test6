# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 🎯 Project Overview

This is the **Astro Website Template v2** used by the FlexOS Website Builder pipeline. It is a **generic, reusable template** that gets customized per project through the pipeline's Step 13 (CustomizeTemplateStep).

**CRITICAL**: This template is **read-only** - never edit it directly for specific projects. All customizations happen via the pipeline automation.

## 🏗️ Architecture

### Template Role in Pipeline

This template is part of a larger autonomous AI website builder system:

1. **Pipeline Steps 00-09**: Research, analyze brand, create design brief, download assets
2. **Step 13 (CustomizeTemplateStep)**: Copies this template and customizes it (colors, fonts, dark mode)
3. **Step 10+ (Build Steps)**: AI autonomously builds pages using the customized template
4. **Final Output**: Complete production-ready Astro website

### Parent Project Structure

```
flexos-website-builder/
├── src/
│   ├── pipelines/website-builder/    # Pipeline step definitions
│   ├── core/                          # Orchestration engine
│   ├── services/                      # Gemini API, tools, utilities
│   └── cli.ts                         # CLI entry point
├── templates/astro/astro-website/     # THIS TEMPLATE (you are here)
├── projects/                          # Generated websites output
└── README.md                          # Main project docs
```

## 📁 Template Structure

```
astro-website/
├── src/
│   ├── layouts/
│   │   └── BaseLayout.astro          # SEO-optimized base layout
│   └── styles/
│       ├── global.css                # Imports all styles
│       ├── base/
│       │   ├── reset.css             # Modern semantic reset
│       │   └── utilities.css         # Layout primitives (container, grid, etc.)
│       └── tokens/
│           ├── colors.css            # OKLCH color system (Step 13 customizes)
│           ├── typography.css        # Fluid type scale (Step 13 adds fonts)
│           ├── spacing.css           # 4px grid system
│           └── animations.css        # Transitions, motion tokens
├── public/
│   └── robots.txt                    # SEO config (Step 13 updates URL)
├── docs/
│   └── integration-templates/        # 25+ integration guides
├── astro.config.mjs                  # Astro configuration
├── netlify.toml                      # Netlify deployment config
├── package.json                      # Minimal dependencies (6 packages)
└── README.md                         # Comprehensive template documentation
```

## 🎨 Design System Architecture

### CSS Token System

All styling uses CSS custom properties from `src/styles/tokens/`:

**colors.css** - OKLCH color system
- Generic defaults: `--hue-brand: 210` (blue), `--hue-accent: 30` (orange)
- Step 13 replaces these with project-specific hues
- Automatic dark mode support via `@media (prefers-color-scheme: dark)`
- Semantic tokens: `--color-primary`, `--color-text`, `--color-bg`, etc.

**typography.css** - Fluid type scale
- Generic defaults: Georgia (display), system-ui (sans)
- Step 13 adds Google Fonts import and updates font families
- Fluid sizing uses `clamp()` for responsive typography
- All sizes via tokens: `--text-xs` through `--text-7xl`

**spacing.css** - 4px grid system
- Base unit: 4px for consistent spacing
- Fluid section spacing responds to viewport
- Tokens: `--space-xs` through `--space-6xl`

**animations.css** - Motion tokens
- Durations: `--duration-fast`, `--duration-base`, `--duration-slow`
- Easing curves for natural motion
- Respects `prefers-reduced-motion` for accessibility
- OKLCH-based shadows with dark mode support

### Why This System?

**Zero CSS knowledge required** - Users configure everything via props and tokens. The AI builder in Step 10 uses these tokens exclusively, never hardcoding values.

## 🔧 Common Development Tasks

### Building the Template

```bash
# Install dependencies
npm install

# Start dev server (http://localhost:4321)
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

### Testing Template Changes

When modifying this template, test with the full pipeline:

```bash
# From parent directory (flexos-website-builder)
cd /Users/jos/Developer/flexos-website-builder

# Build the pipeline
npm run build

# Test with a real website
npm run flexos -- start https://example-site.com

# Or use CLI directly
node dist/cli.js start https://example-site.com
```

### Validating Template Integrity

Before committing template changes:

```bash
# Check for project-specific contamination
grep -r "EMBER\|COFFEE\|ARTISAN" src/

# Verify generic default hues
grep "hue-brand:" src/styles/tokens/colors.css
# Should show: --hue-brand: 210;

# Verify dark mode is active (not commented out)
grep "^@media (prefers-color-scheme: dark)" src/styles/tokens/colors.css

# Verify system fonts (no Google Fonts import)
grep "@import" src/styles/tokens/typography.css
# Should be empty

# Verify placeholder in robots.txt
grep "SITE_URL_PLACEHOLDER" public/robots.txt

# Test build succeeds
npm run build
```

## 🚨 Critical Rules

### 1. Template Must Stay Generic

**NEVER** add project-specific values to this template:
- ❌ Custom color hues (use 210 blue, 30 orange)
- ❌ Google Fonts imports (Step 13 adds these)
- ❌ Project names or branding
- ❌ Hardcoded domain names (use `SITE_URL_PLACEHOLDER`)
- ❌ Custom saturation/lightness overrides
- ❌ Commented-out dark mode (must be active)

**ALWAYS** keep defaults that work for 90% of projects:
- ✅ Blue (210) and orange (30) as neutral defaults
- ✅ System fonts (Georgia, system-ui)
- ✅ Active dark mode support
- ✅ Balanced CSS (no orphaned braces)
- ✅ Minimal dependencies (avoid bloat)

### 2. Step 13 Customization Contract

The template is designed to work with Step 13's automation, which expects:

**In colors.css:**
- `--hue-brand: 210;` exists (exact format with semicolon)
- `--hue-accent: 30;` exists
- Dark mode block starts with `@media (prefers-color-scheme: dark) {`
- All CSS braces are balanced

**In typography.css:**
- System fonts by default (no Google Fonts import)
- Font variables: `--font-display`, `--font-sans`
- Step 13 adds `@import url('...')` at top of file

**In astro.config.mjs:**
- `site: 'https://yoursite.com'` as placeholder

**In public/robots.txt:**
- Uses `SITE_URL_PLACEHOLDER` for sitemap URL

### 3. Version Tracking

All token files have `@template-version` comments:
```css
/**
 * COLOR SYSTEM
 * @template-version 2.0.0
 * @last-updated 2025-10-23
 */
```

Update version when making breaking changes that affect Step 13.

### 4. No Uncommitted node_modules

Never commit `node_modules/` - it's in `.gitignore` for a reason. The template should be lightweight.

## 📦 Dependencies

### Production Dependencies (6 packages)

```json
{
  "@astrojs/mdx": "^4.3.7",           // MDX support
  "@astrojs/netlify": "^6.5.12",     // Netlify adapter
  "astro": "^5.14.3",                // Core framework
  "astro-icon": "^1.1.5",            // Icon component
  "@iconify-json/lucide": "^1.2.25", // Lucide icon set
  "clsx": "^2.1.1"                   // Conditional classes utility
}
```

### What's Intentionally NOT Included

- ❌ **Tailwind CSS** - Uses CSS tokens instead
- ❌ **@fontsource packages** - Step 13 uses Google Fonts dynamically
- ❌ **Neon Database / Netlify Blobs** - Add per-project if needed
- ❌ **State management** (nanostores) - Add per-project if needed

**Rationale**: Keep template lightweight. Pipeline adds specific dependencies as needed.

## 🔄 Integration with Pipeline

### How Step 13 (CustomizeTemplateStep) Works

1. **Copy Template**: Copies entire template directory to project workspace
2. **Read Design Brief**: Extracts brand colors, fonts, dark mode preference
3. **Customize colors.css**:
   - Replace `--hue-brand: 210` with project hue
   - Replace `--hue-accent: 30` with project accent hue
   - Optionally remove dark mode block if light-only theme
4. **Customize typography.css**:
   - Add Google Fonts import at top
   - Replace `--font-display` and `--font-sans` values
5. **Update astro.config.mjs**: Replace site URL
6. **Update robots.txt**: Replace sitemap placeholder
7. **Validate**: Check CSS braces are balanced

### Why Template-Based Approach?

**v1.0 used regex replacements** - Often broke CSS by creating orphaned braces.

**v2.0 uses template files** - Step 13 reads the clean template, makes simple string replacements, validates, and writes complete files. Much more reliable.

## 🧪 Testing Strategy

### Phase 1: Template Validation (Before Pipeline)

```bash
# In this directory (templates/astro/astro-website)
npm install
npm run build  # Must succeed

# Check for contamination
grep -r "project-specific-keyword" src/
```

### Phase 2: Pipeline Integration (After Template Changes)

```bash
# In parent directory (flexos-website-builder)
npm run build

# Test with 2-3 different projects
npm run flexos -- start https://site1.com
npm run flexos -- start https://site2.com
npm run flexos -- start https://site3.com

# Verify Step 13 output in each project:
# - Colors customized correctly
# - Fonts imported and applied
# - Dark mode present or removed as expected
# - No CSS syntax errors
# - Build succeeds
```

### Phase 3: Generated Site Validation

```bash
# In generated project directory (projects/site-name-timestamp/)
npm install
npm run build   # Must succeed
npm run preview # Check in browser

# Validate:
# - Colors match design brief
# - Fonts load correctly
# - Dark mode works (if enabled)
# - No console errors
# - Responsive on mobile
```

## 📚 Key Documentation Files

### In This Template Directory

- **README.md** - Comprehensive template documentation (design system, customization, troubleshooting)
- **TEMPLATE-V2-SUMMARY.md** - v2.0 creation summary, changes from v1, testing checklist
- **GEMINI.md** - Instructions for Gemini AI (used in Step 10 autonomous building)
- **docs/** - 25+ integration templates (analytics, forms, maps, payments, etc.)

### In Parent Project

- **README.md** - FlexOS Website Builder system overview
- **claude-docs/ARCHITECTURE.md** - Three-tier autonomous execution architecture
- **src/pipelines/website-builder/** - All pipeline step definitions

## 🚀 Deployment Architecture

### Netlify Configuration

**netlify.toml** configures:
- Build command: `npm run build`
- Publish directory: `dist`
- Security headers (CSP, XSS protection, frame options)
- Aggressive caching for static assets
- Lighthouse plugin for performance audits

### Astro Configuration

**astro.config.mjs** configures:
- Static site generation by default
- Netlify adapter (for SSR if needed)
- Icon integration (Lucide icons)
- Image optimization
- Prefetching for faster navigation
- View transitions for smooth UX

## 🎯 Design Philosophy

This template embodies these principles:

1. **Zero CSS Knowledge Required** - Everything configured via tokens
2. **Mobile-First** - Responsive by default, works on all devices
3. **Accessibility First** - WCAG AAA standards built-in
4. **Performance First** - Minimal dependencies, optimized assets
5. **SEO Optimized** - Structured data, meta tags, sitemaps
6. **Dark Mode Native** - Not an afterthought, built into system
7. **Maintainable** - Clear structure, documented, version tracked
8. **Pipeline-Friendly** - Designed for automation via Step 13

## 🐛 Common Issues & Solutions

### Issue: Template Changes Break Pipeline

**Symptoms**: Step 13 fails, CSS syntax errors, missing styles
**Solution**: Verify template maintains expected structure for Step 13
- Check `--hue-brand: 210;` exists in colors.css
- Check dark mode block is uncommented
- Check system fonts in typography.css
- Validate CSS braces are balanced

### Issue: Build Fails After Template Update

**Symptoms**: `npm run build` fails with module errors
**Solution**: Clean install and rebuild
```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Issue: Dark Mode Not Working in Generated Sites

**Symptoms**: Dark mode styles don't apply
**Solution**: Ensure dark mode block is uncommented in template's colors.css
```css
@media (prefers-color-scheme: dark) {
  :root {
    /* Dark mode styles */
  }
}
```

### Issue: Fonts Not Loading in Generated Sites

**Symptoms**: Fonts fall back to system defaults
**Solution**: Verify Step 13 is adding Google Fonts import correctly
- Check `flexos/artifacts/03-brand-analysis.md` has font definitions
- Verify Step 13 logs show font customization
- Check generated typography.css has `@import url(...)` at top

## 💡 Best Practices

### When Modifying the Template

1. **Always test with full pipeline** (not just template in isolation)
2. **Test with 3+ different projects** (different colors, fonts, themes)
3. **Verify Step 13 still works** after any CSS changes
4. **Update @template-version** in affected files
5. **Document breaking changes** in README.md
6. **Commit with clear messages**: `fix(template): Improve dark mode contrast`

### When Adding New Features

1. **Keep it generic** - Will this work for 90% of projects?
2. **Use tokens exclusively** - No hardcoded values
3. **Support dark mode** - All new styles need dark variants
4. **Document in README** - Explain the feature and tokens
5. **Add integration guide** - Create docs/integration-templates/[feature].md if applicable

### When Troubleshooting Pipeline Issues

1. **Check template first** - Is it still generic and valid?
2. **Check Step 13 logs** - What did customization do?
3. **Check generated files** - Do they have correct structure?
4. **Check build output** - Any CSS syntax errors?
5. **Compare to working version** - What changed?

---

**Last Updated**: 2025-10-30
**Template Version**: 2.0.0
**Pipeline Compatibility**: FlexOS Website Builder v1.3+
