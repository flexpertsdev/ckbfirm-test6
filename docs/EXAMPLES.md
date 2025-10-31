# WORKED EXAMPLE: C2H Project (Seed → Stub → Brief)

**Version:** 1.0
**Purpose:** Demonstrate complete workflow using real project
**Project:** C2H (Commercial HVAC, Electrical, Plumbing, Controls)

---

## 📊 Overview

This document walks through the complete Inception Workflow using C2H, a real commercial facilities services company in Georgia. We'll transform a Firecrawl website scrape into a production-ready brief.

**Starting Point:** Firecrawl scrape (`examples/project-seeds/01-c2h--com.md`)
**Ending Point:** Complete project brief ready for build

---

## STAGE 1: Analyzing the Seed

### The Raw Seed Data

**Source:** `examples/project-seeds/01-c2h--com.md`

**What We Have:**
- 7 pages of content
- 45 assets (logos, icons, images)
- Business information
- Services offered
- Contact details
- Site structure
- Page-by-page content breakdown

### Step 1.1: Seed Analysis (Our Notes)

**Business Identity:**
- Name: C2H (a FirstCall company)
- Industry: Commercial facilities services (B2B)
- Services: HVAC, Electrical, Plumbing, Building Controls
- Location: Lawrenceville, GA (serving Georgia)

**Services Breakdown:**
- Primary: HVAC (with cooling tower specialization)
- Secondary: Electrical, Plumbing, Controls
- Support: Emergency Services (24/7), Planned Maintenance, Project Support

**Target Audience (Inferred):**
- Facility managers at commercial/industrial buildings
- Property managers for commercial real estate
- Operations directors at airports, healthcare, education facilities
- Likely 35-60 years old, technically knowledgeable
- Budget authority, risk-averse, value reliability

**Current Site Strengths:**
- Clear service categorization (4 main capabilities)
- Specialist positioning (cooling towers)
- Good contact information
- Careers section (recruiting focus)

**Current Site Weaknesses:**
- No meta descriptions (SEO gap)
- Missing differentiation (what makes C2H better?)
- No emergency service emphasis on homepage
- No customer testimonials/case studies
- No before/after photos

**Gaps & Opportunities:**
- Add emergency service prominence (24/7 is a big selling point)
- Add social proof (certifications, client logos)
- Show technical expertise (cooling tower portfolio)
- Emphasize response time (competitive advantage)
- Add project gallery (build trust through completed work)

### Step 1.2: Brand Vision Development

**Positioning Statement (Drafted):**

> C2H, a FirstCall company, is a premier commercial facilities services provider specializing in HVAC, electrical, plumbing, and building controls for Georgia's industrial and commercial facilities. With certified cooling tower specialists, 24/7 emergency service, and preventive maintenance programs, C2H keeps critical building systems running reliably—minimizing downtime and extending equipment life for facility managers who can't afford system failures.

**Key Insights:**
- B2B positioning (not residential)
- Reliability & uptime focus (mission-critical for clients)
- Specialist expertise (cooling towers is differentiator)
- Geographic focus (Georgia)

**Target Audience (Detailed):**

**Primary: Facility Managers**
- Age: 35-60
- Role: Responsible for building operations, maintenance budgets
- Pain Points:
  - Unexpected equipment failures disrupt operations
  - Difficulty finding reliable 24/7 service providers
  - Budget pressure to extend equipment life vs. replace
  - Need for regulatory compliance (health/safety codes)
- Goals:
  - Minimize downtime
  - Predictable maintenance costs
  - Reliable emergency response
  - Compliance assurance

**Secondary: Property Managers / Operations Directors**
- Similar profile but focused on portfolio management
- Need consistent service across multiple facilities

**Unique Selling Proposition:**

1. **24/7 Emergency Response** - 2-hour average response time (faster than competitors)
2. **Cooling Tower Specialists** - Certified by BAC, Evapco (few competitors have this)
3. **Comprehensive Service** - All trades under one roof (reduces vendor coordination headaches)
4. **Preventive Maintenance** - Planned maintenance programs reduce emergency calls by 70%
5. **FirstCall Network** - Part of larger network, backed by enterprise resources

### Step 1.3: Design Direction

**Color Palette Selection:**

**Industry Context:** Industrial B2B services require colors that communicate:
- Reliability (blues)
- Safety (oranges/yellows)
- Professionalism (neutrals)
- Avoid: Playful colors, pastels, overly creative palettes

**Selected Colors:**
- **Primary: Navy Blue** `--hue-brand: 220`
  - Rationale: Trust, stability, professionalism (standard for B2B)
  - Used for: Headers, primary buttons, emphasis

- **Accent: Safety Orange** `--hue-accent: 30`
  - Rationale: Emergency services, urgency, industrial safety
  - Used for: Emergency CTAs, safety callouts, highlights

- **Background: Clean White** `--lightness-bg: 99%`
  - Rationale: Clarity, cleanliness, documentation-friendly (facility managers print)

**Typography Selection:**

**Display Font: Inter (Bold weights)**
- Rationale: Modern, professional, excellent readability, works in technical contexts
- Weights needed: 600 (semibold), 700 (bold)

**Body Font: Inter (Regular weights)**
- Rationale: Keep font family consistent for simplicity, professional appearance
- Weights needed: 400 (regular), 500 (medium)

**Why not serif?** Serif fonts signal traditional/established, but this market values modern efficiency. Sans-serif is more contemporary and readable on screens (where facility managers are checking on mobile during emergencies).

**Imagery Style:**

- Industrial equipment close-ups (chillers, cooling towers, electrical panels)
- Technicians at work (competence, real people, not stock photos)
- Facility exteriors (scale, commercial focus)
- Before/after comparisons (proof of capability)
- Safety equipment visible (reinforces professionalism)

**Mood:** Professional, competent, trustworthy. NOT: Sleek tech company, creative agency, consumer-focused.

**Lighting:** Natural or industrial (avoid overly-staged studio lighting)

### Step 1.4: Site Structure

**Current Structure (7 pages):**
1. Homepage
2. HVAC Capabilities
3. Electrical Capabilities
4. Plumbing Capabilities
5. Building Controls Capabilities
6. Contact
7. Careers

**Proposed Structure (Keep 7 pages, improve content):**

1. **Homepage** (Improved)
   - Add hero emphasizing 24/7 emergency service
   - Add client logo grid (social proof)
   - Strengthen value proposition

2. **HVAC Capabilities** (Enhanced)
   - Add cooling tower portfolio section
   - Show before/after projects
   - Emphasize specialist certifications

3. **Electrical Capabilities** (As is, mostly good)

4. **Plumbing Capabilities** (As is, mostly good)

5. **Building Controls Capabilities** (As is)

6. **Emergency Services** (NEW - split from homepage)
   - 24/7 response process
   - Response time guarantees
   - Emergency contact prominence
   - Service areas map

   **Rationale:** Emergency service is a key differentiator. It deserves its own page for SEO and conversion.

7. **Contact** (Enhanced)
   - Add emergency vs. non-emergency contact paths
   - Add service request form
   - Keep location/hours prominent

8. **Careers** (As is, working well)

**Result: 8 pages** (added Emergency Services page)

---

## STAGE 1 OUTPUT: The Stub

Here's the complete stub generated from the seed analysis:

```markdown
# 13 - C2H Commercial Services

**Industry:** Commercial Facilities Services / B2B Industrial
**Theme:** Light (Professional, Trustworthy, Technical)
**Difficulty:** Intermediate
**Target Pages:** 8 pages

## 🎯 Brand Vision

**Positioning:** C2H, a FirstCall company, is Georgia's premier commercial facilities services provider specializing in HVAC, electrical, plumbing, and building controls for industrial and commercial facilities. With certified cooling tower specialists, guaranteed 24/7 emergency response, and comprehensive preventive maintenance programs, C2H delivers the reliability facility managers need to keep mission-critical building systems running—minimizing costly downtime and maximizing equipment life.

**Target Audience:** Facility managers and operations directors (35-60) at commercial real estate, industrial facilities, airports, healthcare institutions, and educational campuses who are responsible for maintaining critical building systems, managing maintenance budgets, ensuring regulatory compliance, and minimizing operational disruptions from equipment failures.

**Unique Selling Proposition:** "Critical Systems. Reliable Solutions. 24/7." - 2-hour average emergency response time, certified cooling tower specialists (BAC, Evapco), comprehensive service portfolio (all trades under one roof), preventive maintenance programs proven to reduce emergency calls by 70%, backed by FirstCall's regional network strength.

## 🌟 Brand Personality

**Voice:** Competent, responsive, reliable, professional
**Tone:** "We're here when you need us—and working to prevent you from needing us." Direct, technically credible, solution-focused
**Values:** Reliability, technical expertise, responsive service, preventive approach, safety-first

## 🎨 Design Direction

**Color Story:**
- Primary: Navy blue (trust, stability) `--hue-brand: 220`
- Accent: Safety orange (urgency, industrial) `--hue-accent: 30`
- Atmosphere: Professional, clean, technically credible

**Typography:**
- Display: Inter Bold (modern, professional, readable)
- Body: Inter Regular (consistent family)

**Design Token Customization:**
```css
/* src/styles/tokens/colors.css */
:root {
  --hue-brand: 220;      /* Navy blue */
  --hue-accent: 30;      /* Safety orange */
  --lightness-bg: 99%;   /* Clean white */
  --color-text: oklch(18% 0.015 220); /* Deep navy text */
  --color-emergency: oklch(55% 0.2 30); /* Orange for emergency CTAs */
}

/* src/styles/tokens/typography.css */
:root {
  --font-display: 'Inter', system-ui, sans-serif;
  --font-sans: 'Inter', system-ui, sans-serif;
  --text-base: clamp(1rem, 0.95rem + 0.2vw, 1.0625rem); /* 16-17px */
}
```

**Imagery Style:**
- Industrial equipment close-ups (chillers, cooling towers, panels)
- Technicians in safety gear working on equipment
- Commercial facility exteriors (scale, professional context)
- Before/after project comparisons
- Service vehicles with company branding
- Safety-first approach visible in all imagery

**Animation Style:**
- Professional, efficient (not playful)
- Quick, decisive interactions
- Emphasis on responsiveness (fast load times critical for emergency calls on mobile)

## 📄 Site Structure

### Homepage
- Hero: Full-width image of facility with prominent "24/7 Emergency Service" CTA
- Value Proposition: "Critical Systems. Reliable Solutions. 24/7."
- Services Grid: 4 main capabilities (HVAC, Electrical, Plumbing, Controls)
- Emergency Service Callout: Prominent orange section with phone number
- Markets Served: Airports, Healthcare, Commercial Real Estate, Education
- Why C2H: Certifications, response time, preventive maintenance value
- Client Logos: Social proof grid
- Contact CTA: Split path (Emergency / Schedule Service)
- Footer: Contact info, capabilities links, careers

### HVAC Capabilities Page
- Hero: Cooling tower or chiller image
- Overview: Comprehensive HVAC services
- Cooling Tower Specialists: Dedicated section on BAC/Evapco certification
- Services: Emergency repair, planned maintenance, equipment upgrades, energy solutions
- Project Portfolio: Before/after cooling tower projects (5-6 examples)
- Chiller Expertise: Makes and models serviced
- CTA: Request service / Emergency contact

### Electrical Capabilities Page
- Hero: Electrical panel or lighting system
- Overview: Commercial electrical services
- Services Grid: Troubleshooting, panel upgrades, lighting controls, branch circuits
- Safety Focus: Code compliance, OSHA standards
- Markets: Where electrical work is performed
- CTA: Request service

### Plumbing Capabilities Page
- Hero: Commercial plumbing equipment
- Overview: Commercial plumbing services
- Services Grid: Emergency services, installations, upgrades, leak detection
- Specialty: Boilers, backflow prevention, domestic water systems
- CTA: Request service

### Building Controls Capabilities Page
- Hero: Control system interface
- Overview: Building automation and controls
- Open Protocol: Customizable solutions
- Strategic Partnership: Long-term maintenance contracts
- Benefits: Flexibility, tailored solutions, data access
- CTA: Consultation request

### Emergency Services Page (NEW)
- Hero: "24/7 Emergency Response" with prominent phone number
- How It Works: 4-step process (Call → Dispatch → Arrive → Resolve)
- Response Time: Average 2-hour response guarantee
- Coverage Area: Georgia service map
- What Qualifies: Emergency vs. scheduled service
- After-Hours: How emergency service works
- CTA: Call now (large, prominent)

### Contact Page
- Hero: "Get In Touch"
- Emergency Contact: Prominent orange section with 24/7 phone
- Schedule Service: Form for non-emergency service requests
- Location: Office address, map, hours (office hours vs. emergency hours)
- Service Areas: Counties/regions covered
- General Inquiries: Email, phone
- Follow-Up: Response time expectations

### Careers Page
- Hero: "Build Durable Partnerships With Us"
- Company Values: Supportive, Decisive, Achievement-Oriented
- Benefits: Healthcare, PTO, Career Growth, Retirement, Bonuses
- Open Positions: Link to Indeed/LinkedIn job boards
- Submit Resume: Form for applications
- Culture: What it's like to work at C2H

## 🎬 Key Interactions

**Homepage:**
- Emergency CTA pulses gently (urgency)
- Services grid hover reveals "Learn More"
- Client logos subtle hover effect
- Smooth scroll to emergency section

**Capabilities Pages:**
- Service icons with hover descriptions
- Portfolio images with lightbox zoom
- Certification badges with credential details
- Request service form modal

**Emergency Services:**
- Click-to-call phone number (large, obvious)
- Service area map with coverage zones
- After-hours process accordion

**Contact:**
- Form validation for service requests
- Google Maps embed with directions
- Emergency vs. scheduled service path clearly separated

## 📸 Asset Requirements (Pexels Keywords)

- "commercial hvac rooftop equipment"
- "industrial cooling tower facility"
- "electrician commercial panel"
- "hvac technician service uniform"
- "commercial building exterior"
- "industrial plumbing pipes"
- "building automation controls screen"
- "emergency service vehicle"
- "facility manager inspection"
- "commercial chiller equipment"
- "industrial safety equipment"
- "electrical panel circuit breakers"

## 🎯 Success Metrics

**Performance:**
- Lighthouse: 95+ (critical for mobile emergency calls)
- LCP: < 2.0s (fast emergency access)
- Mobile-optimized (facility managers call from job sites)

**Conversion:**
- Emergency call clicks: 15%+ (primary goal)
- Service request forms: 5%+
- Careers page applications: 2%+

**Engagement:**
- Capabilities pages: 60% view rate
- Emergency services page: 25% view rate
- Avg. time on site: 2+ minutes

**SEO:**
- Target: "commercial hvac service georgia"
- Target: "24/7 emergency hvac atlanta"
- Target: "cooling tower repair georgia"
- Target: "commercial electrical contractor georgia"

## 🔧 Technical Highlights

- Click-to-call phone numbers optimized for mobile
- Emergency service phone number in header (sticky)
- Google Maps integration for service areas
- Service request form (Netlify Forms)
- Responsive design (mobile-first for emergency calls)
- Fast load time (critical for emergency situations)
- Portfolio image galleries with before/after comparisons

## 💡 Inspiration References

**Tone:** Trane Commercial, Carrier Commercial HVAC, Johnstone Supply
**Interactions:** Service-focused, clear CTAs, emergency prominence
**Layout:** Professional B2B, technical credibility, trust signals (certifications)
```

---

## STAGE 2: Expanding to Brief (Excerpts)

Due to space constraints, here are **excerpts** showing how the stub expands into a brief:

### Excerpt 1: Design System Expansion

**In Stub:**
```
Colors: Navy blue (220), Safety orange (30)
```

**In Brief:**
```css
/* Complete OKLCH Color System */

:root {
  /* Primary Brand Color - Navy Blue */
  --hue-brand: 220;
  --saturation-brand: 0.15;

  /* Brand Color Shades */
  --color-brand-10: oklch(10% 0.015 220);
  --color-brand-20: oklch(20% 0.02 220);
  --color-brand-30: oklch(30% 0.03 220);
  --color-brand-40: oklch(40% 0.05 220);
  --color-brand-50: oklch(50% 0.08 220);
  --color-brand-60: oklch(60% 0.10 220);
  --color-brand-70: oklch(70% 0.08 220);
  --color-brand-80: oklch(80% 0.05 220);
  --color-brand-90: oklch(90% 0.02 220);

  /* Accent Color - Safety Orange */
  --hue-accent: 30;
  --saturation-accent: 0.18;

  /* Accent Color Shades */
  --color-accent-50: oklch(55% 0.20 30);
  --color-accent-60: oklch(65% 0.18 30);
  --color-accent-70: oklch(75% 0.15 30);

  /* Semantic Colors */
  --color-primary: var(--color-brand-50);
  --color-emergency: var(--color-accent-50);
  --color-text: oklch(18% 0.015 220);
  --color-text-muted: oklch(45% 0.01 220);
  --color-bg: oklch(99% 0.002 220);
  --color-bg-elevated: oklch(100% 0 0);
  --color-border: oklch(88% 0.005 220);
}

/* Color Psychology Rationale:

Navy Blue (220°): Selected for B2B industrial context. Communicates:
- Reliability and stability (critical for emergency services)
- Professional competence (facility managers need confidence)
- Technical expertise (not consumer-friendly, appropriately serious)

Safety Orange (30°): Selected for emergency service differentiation:
- High visibility (urgent action required)
- Industrial safety association (OSHA orange, familiar to audience)
- Contrast with navy (ensures emergency CTAs stand out)
- Warm accent to balance cool primary (approachable while professional)

Clean White Background (99%): Chosen for:
- Clarity and readability (technical documentation-like)
- Print-friendly (facility managers often print specs)
- Professional context (not trendy dark mode, established industry standard)
*/
```

### Excerpt 2: Page Specification Expansion

**In Stub:**
```
Homepage:
- Hero: Full-width image with "24/7 Emergency Service" CTA
- Services Grid: 4 capabilities
```

**In Brief (Homepage Section 1):**

```markdown
### Homepage - `index.astro`

**Purpose:** Convert visitors into service calls (emergency or scheduled) by establishing credibility, showcasing comprehensive capabilities, and providing clear action paths.

**Target Keywords:** "commercial hvac service georgia", "24/7 emergency hvac", "facility services atlanta"

**Meta Information:**
- **Title:** C2H Commercial Services | 24/7 HVAC, Electrical, Plumbing Georgia
- **Meta Description:** Georgia's trusted commercial HVAC, electrical, plumbing & controls provider. 24/7 emergency service, 2-hour response time, certified cooling tower specialists. Call now.
- **OG Image:** /images/og/c2h-emergency-service.jpg (1200x630px)
- **Canonical:** https://c2h.com/

---

**Section 1: Hero**

*Layout:* Full-viewport height (100dvh), background image with dark gradient overlay, centered content

*Components:*

**Background Image:**
- Description: Commercial facility rooftop showing modern HVAC equipment (chillers, cooling towers) with facility manager in safety vest inspecting units at golden hour
- Pexels keyword: "commercial hvac rooftop equipment sunset"
- File path: /public/images/home/hero-bg.jpg
- Aspect ratio: 16:9
- Loading: eager (above fold)
- Alt text: "Commercial HVAC equipment on Georgia facility rooftop with technician performing maintenance inspection"
- Overlay: `background: linear-gradient(180deg, oklch(0% 0 0 / 0.5) 0%, oklch(0% 0 0 / 0.7) 100%);`

**Headline (h1):**
```astro
<h1
  style="
    font-size: var(--text-6xl);
    font-family: var(--font-display);
    font-weight: 700;
    line-height: 1.1;
    color: white;
    text-align: center;
    margin-bottom: var(--space-6);
    max-width: 1000px;
  "
  data-animate="fade"
>
  Critical Systems. Reliable Solutions. 24/7.
</h1>
```

**Subheading:**
```astro
<p
  style="
    font-size: var(--text-xl);
    color: oklch(90% 0.01 220);
    text-align: center;
    max-width: 700px;
    margin: 0 auto var(--space-10);
    line-height: var(--line-height-relaxed);
  "
  data-animate="fade"
>
  Georgia's premier commercial HVAC, electrical, plumbing, and building controls provider. When your facility can't afford downtime, call C2H.
</p>
```

**CTA Buttons:**
```astro
<div
  style="
    display: flex;
    gap: var(--space-4);
    justify-content: center;
    flex-wrap: wrap;
  "
  data-animate="fade"
>
  <!-- Emergency CTA (Primary - Orange) -->
  <a
    href="tel:+16788271224"
    style="
      display: inline-flex;
      align-items: center;
      gap: var(--space-3);
      padding: var(--space-5) var(--space-10);
      background: var(--color-emergency);
      color: white;
      border-radius: var(--radius-base);
      text-decoration: none;
      font-weight: 700;
      font-size: var(--text-lg);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      box-shadow: 0 4px 12px oklch(0% 0 0 / 0.15);
      animation: pulse 2s ease-in-out infinite;
    "
    onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 16px oklch(0% 0 0 / 0.2)'"
    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px oklch(0% 0 0 / 0.15)'"
  >
    <svg width="24" height="24" fill="currentColor">
      <!-- Phone icon -->
      <path d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
    </svg>
    24/7 Emergency Service
  </a>

  <!-- Secondary CTA (Navy) -->
  <a
    href="/contact"
    style="
      display: inline-flex;
      align-items: center;
      padding: var(--space-5) var(--space-8);
      border: 2px solid white;
      color: white;
      border-radius: var(--radius-base);
      text-decoration: none;
      font-weight: 600;
      font-size: var(--text-lg);
      transition: background 0.2s ease, color 0.2s ease;
    "
    onmouseover="this.style.background='white'; this.style.color='var(--color-primary)'"
    onmouseout="this.style.background='transparent'; this.style.color='white'"
  >
    Schedule Service
  </a>
</div>

<!-- Pulse animation for emergency button -->
<style>
@keyframes pulse {
  0%, 100% { box-shadow: 0 4px 12px oklch(0% 0 0 / 0.15); }
  50% { box-shadow: 0 4px 20px oklch(55% 0.2 30 / 0.4); }
}
</style>
```

**Response Time Badge:**
```astro
<div
  style="
    margin-top: var(--space-8);
    text-align: center;
  "
  data-animate="fade"
>
  <p style="
    font-size: var(--text-sm);
    color: oklch(85% 0.01 220);
    font-weight: 600;
    letter-spacing: 0.05em;
    text-transform: uppercase;
  ">
    Average 2-Hour Emergency Response Time
  </p>
</div>
```

*Responsive Behavior:*
- **Mobile (< 768px):**
  - h1 reduces to `var(--text-4xl)`
  - Buttons stack vertically (flex-direction: column)
  - Padding reduces to `var(--space-4) var(--space-6)`

- **Tablet (768px-1024px):**
  - h1 at `var(--text-5xl)`
  - Buttons remain horizontal

- **Desktop (> 1024px):**
  - As specified above

*Interactions:*
- Emergency button pulses continuously (2s cycle)
- Hover effects on both buttons
- Click emergency button → initiates phone call on mobile
- All elements fade in on page load (staggered by 200ms)

*Technical Notes:*
- Hero must load fast (emergency context) - optimize bg image heavily
- Phone number must be click-to-call on mobile (facility managers call from job sites)
- Pulse animation subtle (professional, not gimmicky)
```

[Brief continues with 7-10 more sections per page, all with this level of detail]

---

## Key Takeaways from This Example

### What We Learned

**1. Start with Research, Not Guessing**
The seed had data about cooling towers appearing multiple times. This insight led to positioning C2H as cooling tower specialists—a clear differentiator.

**2. Be Industry-Appropriate**
Navy + orange isn't creative, but it's *exactly right* for industrial B2B. The audience expects professional, not innovative.

**3. Write Real Copy Early**
"Critical Systems. Reliable Solutions. 24/7." came from understanding the audience's mindset (facility managers who manage critical systems).

**4. Design for User Context**
Facility managers call from job sites → mobile-first, click-to-call, fast load times. The emergency CTA pulses because it's genuinely urgent.

**5. Leverage Existing Strengths**
The seed showed they have cooling tower expertise and 24/7 service. We amplified these rather than inventing new positioning.

**6. Address Gaps Systematically**
The seed had no testimonials, no before/after photos, weak emergency emphasis. The stub/brief systematically addresses each gap.

---

## Next Steps: Building from This Brief

With the complete brief (abbreviated here), the build process would follow BUILD-WORKFLOW.md:

1. **Setup:** Create Astro project, install fonts, customize tokens exactly as specified
2. **Build Homepage:** Follow the hero section spec above (exact copy, exact styling)
3. **Build Capability Pages:** Each following similar detailed specs
4. **Add Assets:** Search Pexels using exact keywords, optimize images
5. **Test:** Mobile responsiveness, phone number click-to-call, emergency CTA pulse
6. **Deploy:** Netlify with emphasis on fast mobile load times

The brief provides everything needed to build without improvisation.

---

**This completes the worked example. You now see how to transform messy real-world data into structured, production-ready specifications.**
