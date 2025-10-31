# Blog Content Guide for AI Builders

**Purpose:** Guide AI agents on creating SEO-optimized, content-rich blog posts that rank well and provide genuine value to readers.

---

## 🎯 Core Principle

**NO STUBS.** Every blog post must be:
- **2,000-4,000 words** minimum (comprehensive, not fluff)
- **Genuinely useful** - readers should learn something valuable
- **Well-structured** - clear hierarchy, scannable, actionable
- **SEO-optimized** - but written for humans first

---

## 📐 Blog Post Structure

### Essential Frontmatter

```mdx
---
title: "The Primary Keyword: A Comprehensive Guide to [Topic]"
description: "Concise 150-160 character summary with primary keyword. Enticing and clear."
pubDate: 2025-01-15
author: "Author Name"
category: "brewing" # or "origin", "roasting", "education", "events"
image: "https://images.unsplash.com/photo-xxxxx?w=1200&q=90"
imageAlt: "Descriptive alt text with keyword"
tags: ["keyword1", "keyword2", "long-tail-keyword"]
featured: true # Only for best posts
---
```

### Content Structure Template

```markdown
# Primary H1 (Title - only one per post)

Hook paragraph - grab attention, state the problem or question. Include primary keyword naturally.

## Why This Matters (H2)

Explain the broader context. Why should readers care? What will they learn?

## Section 1: Main Topic (H2)

### Subsection 1.1 (H3)

Detailed content with examples, data, or stories.

### Subsection 1.2 (H3)

Continue breaking down the topic logically.

## Section 2: Practical Application (H2)

### How to Do X (H3)

Step-by-step instructions or actionable advice.

### Common Mistakes (H3)

What to avoid. This is highly valuable content.

## Section 3: Advanced Insights (H2)

Go deeper for readers who want expert-level information.

## The Takeaway (H2)

Summarize key points. What should readers remember?

---

**Call to Action:** Link to relevant products, services, or related content.
```

---

## ✅ SEO Checklist

### Keyword Research

- [ ] **Primary keyword** in title (first 50 characters if possible)
- [ ] **Primary keyword** in first paragraph (first 100 words)
- [ ] **Primary keyword** in at least one H2 heading
- [ ] **Primary keyword density**: 0.5-2% of total content
- [ ] **LSI keywords** (related terms) sprinkled throughout
- [ ] **Long-tail keywords** in H3 headings

### On-Page SEO

- [ ] **URL slug**: `/blog/primary-keyword-topic` (short, descriptive)
- [ ] **Meta description**: 150-160 characters, includes keyword, compelling CTA
- [ ] **Image alt text**: Descriptive, includes keyword where natural
- [ ] **Internal links**: 3-5 links to other site pages/posts
- [ ] **External links**: 2-3 links to authoritative sources
- [ ] **H1 only once** (the title)
- [ ] **H2-H6 hierarchy** maintained (no skipping levels)

### Content Quality

- [ ] **Word count**: 2,000-4,000 words minimum
- [ ] **Readability**: 8th-grade level or below (use Hemingway Editor)
- [ ] **Scannable**: Short paragraphs (2-4 sentences), bullet points, numbered lists
- [ ] **Visual**: Images every 300-500 words (if applicable)
- [ ] **Actionable**: Clear takeaways, steps, or advice
- [ ] **Original**: Not copied or thin content
- [ ] **Updated**: Date clearly visible, update old posts annually

### Technical SEO

- [ ] **Mobile-friendly**: Responsive by default (FlexOS handles this)
- [ ] **Fast loading**: Optimize images (< 200KB), lazy load
- [ ] **Schema markup**: Article schema (handled by BaseLayout)
- [ ] **Canonical URL**: Correct canonical tag
- [ ] **Social meta tags**: OG and Twitter cards

---

## 🎨 Content Guidelines

### Writing Style

**DO:**
- Write conversationally ("you", "we", "your")
- Use active voice ("We roast coffee" not "Coffee is roasted by us")
- Break up long sentences (max 25 words)
- Use specific numbers ("47% of coffee drinkers" not "Many people")
- Tell stories and give examples
- Cite sources for data/claims
- Use transition words (However, Therefore, Additionally)

**DON'T:**
- Use jargon without explanation
- Write walls of text (max 4 sentences per paragraph)
- Make claims without evidence
- Stuff keywords unnaturally
- Write generic, vague content
- Copy from competitors

### Section Length

- **Introduction:** 100-150 words (hook + preview)
- **H2 sections:** 300-600 words each
- **H3 subsections:** 150-300 words each
- **Conclusion:** 100-200 words (summary + CTA)

### Example of Good vs. Bad Content

**BAD (Generic, thin):**
```markdown
## How to Brew Coffee

Coffee is brewed by adding hot water to ground coffee beans. It's important to use good quality beans. The temperature matters too.
```

**GOOD (Specific, useful):**
```markdown
## How to Brew Pour Over Coffee

Pour over brewing gives you complete control over extraction. Here's my exact recipe that I've refined over 5 years of daily brewing:

**Equipment:**
- V60 dripper (size 02)
- Paper filter (rinsed with hot water)
- 20g coffee (medium-fine grind)
- 320g water at 200°F (93°C)
- Gooseneck kettle
- Digital scale (0.1g accuracy)
- Timer

**Step-by-step process:**

1. **Bloom (0:00-0:45):** Pour 40g water in circular motion, ensuring all grounds are saturated. Wait 45 seconds. You should see vigorous bubbling—this releases trapped CO2 from fresh beans.

2. **First pour (0:45-1:15):** Slowly pour to 200g total. Pour in concentric circles from center outward. Maintain gentle, steady stream.

[...continue with detailed steps, troubleshooting, common mistakes, etc.]
```

---

## 📝 Content Types That Perform Well

### 1. Complete Guides (2,500-4,000 words)

**Format:** "The Complete Guide to [Topic]"

**Structure:**
- What is [topic]?
- Why it matters
- History/background
- How to do it (step-by-step)
- Equipment/materials needed
- Common mistakes
- Advanced techniques
- FAQs
- Resources for learning more

**Example:** "The Complete Guide to Pour Over Coffee"

### 2. Origin Stories (2,000-3,000 words)

**Format:** "Journey to [Country]: Behind Our [Coffee Name]"

**Structure:**
- Why this origin matters
- The region and terroir
- Meet the farmers
- Processing methods
- Cupping notes
- Environmental/social impact
- What it means for your cup

**Example:** "Journey to Ethiopian Coffee Country"

### 3. Educational Deep Dives (2,500-3,500 words)

**Format:** "[Topic] Explained: Everything You Need to Know"

**Structure:**
- The science explained (accessible language)
- Practical applications
- Common misconceptions
- How professionals do it
- Tips for home users
- Resources and next steps

**Example:** "Coffee Roasting Explained: Light, Medium, and Dark"

### 4. Practical How-Tos (1,500-2,500 words)

**Format:** "How to [Achieve Outcome]: A Step-by-Step Guide"

**Structure:**
- Why this technique matters
- Equipment needed
- Step-by-step instructions (numbered)
- Troubleshooting guide
- Common mistakes to avoid
- Variations and alternatives

**Example:** "How to Dial In Your Espresso: 5 Variables That Matter"

### 5. Comparison Posts (2,000-3,000 words)

**Format:** "[Option A] vs. [Option B]: Which is Right for You?"

**Structure:**
- Overview of both options
- Detailed comparison table
- Pros and cons of each
- Use cases for each
- Our recommendation
- How to decide

**Example:** "Light Roast vs. Dark Roast: Which Should You Choose?"

---

## 🔍 Example Post Breakdown

Let's analyze the "Perfect Pour Over Guide" post:

**Word count:** ~2,800 words ✅

**Structure:**
- H1: Title (primary keyword: "pour over")
- H2: Why Pour Over (benefits)
- H2: Essential Equipment (specific recommendations)
- H2: The Perfect Recipe (exact numbers)
- H2: Step-by-Step Technique (detailed walkthrough)
  - H3: The Bloom (technique explanation)
  - H3: First Pour (pouring technique)
  - etc.
- H2: Water Quality Matters (depth)
- H2: Coffee Selection (specific guidance)
- H2: Dialing In Your Recipe (troubleshooting)
- H2: Advanced Techniques (expert level)
- H2: Common Mistakes (practical value)

**SEO elements:**
- Primary keyword "pour over" in title, first paragraph, multiple H2s
- LSI keywords: "manual brewing", "V60", "Chemex", "coffee technique"
- Long-tail keywords: "perfect pour over coffee", "how to make pour over"
- Internal links: to `/menu` (Yirgacheffe product)
- Alt text: "Barista performing pour over coffee brewing technique with precision"

**Content quality:**
- Specific, actionable advice (exact temps, ratios, times)
- Troubleshooting section (too fast/slow, uneven bed)
- Advanced techniques for experienced users
- Conversational tone but expert knowledge
- No fluff—every paragraph adds value

---

## 📊 Performance Metrics to Track

After publishing, monitor:

- **Organic traffic**: Google Analytics/Search Console
- **Average time on page**: Should be 3+ minutes for long-form content
- **Bounce rate**: Should be < 60%
- **Scroll depth**: Aim for 50%+ reading to end
- **Click-through rate (CTR)**: From search results
- **Ranking position**: For target keywords
- **Social shares**: Indicates value/engagement
- **Internal clicks**: To products/services

**Targets for success:**
- Rank top 10 for primary keyword within 3-6 months
- Average time on page: 4-6 minutes
- CTR from search: 3-5%
- Bounce rate: 40-50%

---

## 🔄 Content Refresh Strategy

Old posts lose rankings. Update annually:

1. **Check rankings**: Google Search Console
2. **Update outdated info**: Prices, techniques, data
3. **Add new sections**: Recent developments
4. **Improve SEO**: Better title, meta, keywords
5. **Add media**: New images, videos
6. **Update pubDate**: Shows content is current
7. **Re-promote**: Social media, newsletter

---

## 📝 AI Builder Workflow

When creating a blog post:

1. **Research keywords**
   - What do target customers search?
   - Check Google "People also ask"
   - Look at competitor topics

2. **Create outline**
   - Map H2/H3 structure
   - Identify 8-12 main sections
   - Assign word counts per section

3. **Write in sections**
   - Intro (hook + preview)
   - Body (detailed, actionable)
   - Conclusion (summary + CTA)

4. **SEO optimization**
   - Run through checklist above
   - Natural keyword placement
   - Internal/external links

5. **Quality check**
   - Read aloud (does it flow?)
   - Remove fluff
   - Add specific examples
   - Verify all claims

6. **Add metadata**
   - Title (60 characters max)
   - Description (155 characters)
   - Image with alt text
   - Category and tags

7. **Internal linking**
   - Link to 3-5 relevant pages
   - Products, services, related posts
   - Use descriptive anchor text

---

## 💡 Pro Tips

### Content Gap Analysis

Before writing, check competitors:
- What topics rank #1-3?
- What's missing from their content?
- Can you go deeper/more practical?
- Add unique perspective or data

### The Skyscraper Technique

1. Find top-ranking content
2. Make yours 10x better:
   - More comprehensive
   - More visual
   - More actionable
   - More current
   - Better structured

### Content Clusters

Create topic clusters:
- **Pillar post**: "The Complete Guide to Coffee Brewing" (5,000 words)
- **Cluster posts**: "Pour Over Guide", "French Press Guide", "Espresso Guide"
- Link cluster posts to pillar, pillar links to all clusters
- Dominates topic in search

---

## 🎯 Remember

**Quality > Quantity**
- One excellent 3,000-word post beats ten 300-word posts
- Depth beats breadth for SEO and user value
- Better to publish monthly with great content than weekly with thin content

**Write for humans, optimize for search**
- Never sacrifice readability for SEO
- If keyword placement feels forced, skip it
- Google rewards helpful, comprehensive content
- User engagement signals (time on page, bounce rate) matter more than keyword density

**Update is easier than create**
- Refresh old posts instead of writing new ones
- Updated posts regain rankings quickly
- Build on existing authority

---

**Example posts available:**
- `/src/content/blog/perfect-pour-over-guide.mdx`
- `/src/content/blog/ethiopian-coffee-journey.mdx`
- `/src/content/blog/coffee-roasting-explained.mdx`

Study these for structure, depth, and SEO implementation.

---

**Built for AI agents. Optimized for search rankings and reader value.**
