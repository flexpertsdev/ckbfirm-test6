# UX Interaction & Component Patterns Library v1.0
**Companion to Semantic Design Patterns Library**

A comprehensive catalog of interactive components, overlays, transitions, and presentation patterns for building modern, intuitive user experiences.

---

## TABLE OF CONTENTS

1. [Overlay Patterns](#overlay-patterns)
2. [Sheet & Panel Patterns](#sheet--panel-patterns)
3. [Selection & Input Patterns](#selection--input-patterns)
4. [Navigation Transitions](#navigation-transitions)
5. [Content Reveal Patterns](#content-reveal-patterns)
6. [Feedback & Confirmation Patterns](#feedback--confirmation-patterns)
7. [Data Entry Patterns](#data-entry-patterns)
8. [List & Collection Patterns](#list--collection-patterns)
9. [Media Presentation Patterns](#media-presentation-patterns)
10. [State Transition Patterns](#state-transition-patterns)
11. [Gesture-Based Interactions](#gesture-based-interactions)
12. [Contextual Actions Patterns](#contextual-actions-patterns)

---

## OVERLAY PATTERNS

### #1 Center Modal (Dialog)
**Behavior:** Centered overlay, backdrop dim, click-outside to close optional, focus trap
**Animation:** Fade in backdrop + scale up modal (0.95 → 1.0), duration 200-300ms
**Best for:** Forms, confirmations, focused tasks, critical decisions
**Mobile:** Full-width with margins, or full-screen on small devices
**Accessibility:** Focus trap, Escape to close, return focus on close, ARIA dialog role
**Avoid if:** Long content, complex workflows, frequent use (annoying)
**Combines well with:** Glassmorphism backdrop, spring animation, card elevation

### #2 Full-Screen Modal (Takeover)
**Behavior:** Edge-to-edge overlay, own header/close, immersive experience
**Animation:** Slide up from bottom, fade in, duration 300-400ms
**Best for:** Multi-step flows, image viewers, video players, immersive tasks
**Mobile:** Native feel, full device screen, smooth transitions
**Accessibility:** Clear close button, Escape key, proper heading hierarchy
**Avoid if:** Quick interactions, simple forms, contextual actions
**Combines well with:** Native app feel, progressive forms, media content

### #3 Popover (Floating Context)
**Behavior:** Anchored to trigger element, arrow pointer, non-modal, click-away closes
**Animation:** Fade + slight slide toward anchor (10-20px), duration 150-200ms
**Best for:** Tooltips, quick actions, contextual menus, additional info
**Mobile:** Often becomes bottom sheet on mobile for better reach
**Accessibility:** Keyboard navigation, arrow keys for menu items, Escape closes
**Avoid if:** Critical actions, complex content, needs guaranteed visibility
**Combines well with:** Dropdowns, context menus, icon actions, inline help

### #4 Dropdown Menu
**Behavior:** Attached to trigger, list of options, single or grouped items
**Animation:** Fade + slide down, duration 150-200ms, stagger items optional
**Best for:** Navigation overflow, action lists, selections, settings
**Mobile:** Consider bottom sheet alternative for better thumb reach
**Accessibility:** Arrow key navigation, type-ahead search, ARIA menu role
**Avoid if:** Too many items (use modal/sheet), complex content
**Combines well with:** Navigation, toolbars, button groups, filters

### #5 Toast / Snackbar Overlay
**Behavior:** Non-modal, temporary, corner/edge position, auto-dismiss, stackable
**Animation:** Slide in from edge, pause, slide out, duration 200ms in/out
**Best for:** Success messages, undo actions, brief notifications, status updates
**Mobile:** Bottom position for thumb reach, top for system consistency
**Accessibility:** Polite ARIA live region, pausable on hover, sufficient duration
**Avoid if:** Critical errors (use modal), needs interaction, permanent info
**Combines well with:** Action buttons, undo functionality, icons, color coding

### #6 Backdrop Blur Overlay
**Behavior:** Full-screen backdrop with blur effect, modal content over, cinematic
**Animation:** Blur in (0 → 10px), fade in backdrop, duration 300ms
**Best for:** Premium feel, focus attention, reduce visual noise, modern aesthetic
**Mobile:** May reduce blur intensity for performance
**Accessibility:** Ensure sufficient contrast, keyboard navigation maintained
**Avoid if:** Performance concerns, older devices, need simplicity
**Combines well with:** Glassmorphism, modals, media viewers, premium brands

### #7 Picture-in-Picture Overlay
**Behavior:** Small floating video/content window, draggable, resizable, stays on top
**Animation:** Scale down from full size, float to corner, duration 300ms
**Best for:** Video, chat windows, reference content, multitasking
**Mobile:** Fixed corner position, tap to expand, swipe to dismiss
**Accessibility:** Keyboard controls, clear close button, descriptive label
**Avoid if:** Single-task interface, need full attention, no multitasking
**Combines well with:** Video players, live chat, reference docs, tutorials

### #8 Alert / Notification Banner Overlay
**Behavior:** Top or inline banner, prominent, dismissible, can be sticky
**Animation:** Slide down from top (or up from position), duration 250ms
**Best for:** System messages, important updates, warnings, errors
**Mobile:** Full width, adequate height for thumb tap, clear close
**Accessibility:** High contrast, clear message, keyboard dismissible, ARIA alert
**Avoid if:** Frequent messages (annoying), non-critical info (use toast)
**Combines well with:** Icons, action buttons, color coding, animations

---

## SHEET & PANEL PATTERNS

### #9 Bottom Sheet (Mobile Native)
**Behavior:** Slides up from bottom, partial or full height, swipe to dismiss, iOS/Android standard
**Animation:** Slide up with spring physics, backdrop fade, duration 300-400ms
**Best for:** Mobile actions, selections, forms, filters, mobile-first apps
**Mobile:** Native behavior, drag handle, snap points, smooth gestures
**Accessibility:** Touch target size, clear close action, keyboard on desktop
**Avoid if:** Desktop-primary, need persistence, complex interactions
**Combines well with:** Lists, forms, filters, image pickers, share actions

**Variants:**
- **Detent Sheet:** Snap to multiple heights (small, medium, large)
- **Scrollable Sheet:** Content scrolls when fully expanded
- **Nested Sheet:** Sheet can present another sheet (iOS pattern)

### #10 Side Panel (Overlay)
**Behavior:** Slides in from left/right, overlays content, backdrop dims, fixed width
**Animation:** Slide in with ease-out, backdrop fade, duration 250-300ms
**Best for:** Filters, settings, secondary navigation, details, cart
**Mobile:** Often full-width or 90% width, smooth slide
**Accessibility:** Focus trap, Escape closes, clear heading, keyboard nav
**Avoid if:** Primary navigation (use drawer), need side-by-side comparison
**Combines well with:** Shopping carts, filters, settings, inbox details

### #11 Drawer (Push Out)
**Behavior:** Pushes main content aside, both visible, navigation pattern, persistent
**Animation:** Slide main content and drawer together, duration 300ms
**Best for:** Primary navigation, always-available menu, app structure
**Mobile:** Overlays instead of pushing, hamburger trigger
**Accessibility:** Landmark navigation role, skip link, keyboard accessible
**Avoid if:** Limited screen space, need maximum content area, simple site
**Combines well with:** App layouts, dashboards, admin panels, nested menus

**Variants:**
- **Mini Drawer:** Collapses to icon-only width, expands on hover/click
- **Permanent Drawer:** Always visible on desktop, hides on mobile
- **Temporary Drawer:** Overlays and auto-closes after selection

### #12 Slide-Over (macOS Style)
**Behavior:** Slides in from right edge, semi-transparent backdrop, detail view pattern
**Animation:** Slide in with deceleration, subtle backdrop, duration 350ms
**Best for:** Detail views, inspectors, properties, secondary content
**Mobile:** Often becomes full-screen or bottom sheet
**Accessibility:** Clear title, close button, keyboard shortcuts, Escape closes
**Avoid if:** Primary content, need equal emphasis, mobile-first design
**Combines well with:** Master-detail layouts, file browsers, email clients, settings

### #13 Action Sheet (iOS Native)
**Behavior:** Bottom sheet with action list, destructive actions in red, cancel button
**Animation:** Slide up with bounce, backdrop fade, duration 300ms
**Best for:** Contextual actions, destructive confirmations, sharing, mobile apps
**Mobile:** Native iOS pattern, thumb-friendly, familiar interaction
**Accessibility:** Clear action labels, destructive actions clearly marked, cancel obvious
**Avoid if:** Desktop-primary, need custom content, not action-focused
**Combines well with:** Context menus, share actions, delete confirmations, options

### #14 Expandable Panel (Accordion-Style)
**Behavior:** Expands in place, pushes content down, single or multi-expand
**Animation:** Height expand with ease-out, smooth reflow, duration 250-300ms
**Best for:** FAQs, settings groups, collapsible sections, space-saving
**Mobile:** Touch-friendly headers, clear expand/collapse indicator
**Accessibility:** Button role, aria-expanded state, keyboard toggle, focus management
**Avoid if:** All content should be visible, need scanability, SEO priority
**Combines well with:** FAQs, settings, forms, documentation, filters

### #15 Split Panel (Resizable)
**Behavior:** Two panels with draggable divider, resize both sides, persistent sizes
**Animation:** Smooth resize during drag, snap to min/max, no animation on load
**Best for:** Code editors, email clients, file managers, data + detail views
**Mobile:** Often stacks vertically or uses navigation pattern instead
**Accessibility:** Keyboard resize, clear current sizes, logical tab order
**Avoid if:** Mobile-primary, simple content, no need for customization
**Combines well with:** Developer tools, email clients, data exploration, comparisons

### #16 Peek Panel (Hover Preview)
**Behavior:** Panel slides in partially on hover, full panel on click, preview pattern
**Animation:** Partial slide on hover (100-200ms), full slide on click (250ms)
**Best for:** File browsers, galleries, product previews, quick look
**Mobile:** Direct tap to open (no hover state)
**Accessibility:** Keyboard trigger, skip hover if keyboard navigation, clear states
**Avoid if:** Critical content (don't hide), touch-primary, accessibility priority
**Combines well with:** File systems, galleries, product grids, search results

---

## SELECTION & INPUT PATTERNS

### #17 Segmented Button Group (iOS Style)
**Behavior:** Connected buttons, single selection, mutually exclusive, visual toggle
**Animation:** Background slides to selected button, duration 200ms with spring
**Best for:** View switchers (list/grid), filters, sorting, binary choices
**Mobile:** Touch-friendly sizing, clear active state, native feel
**Accessibility:** Radio group role, arrow key navigation, clear selection
**Avoid if:** Many options (5+), non-exclusive selections, need flexibility
**Combines well with:** View controls, filters, settings, mobile UI

### #18 Chip Selection (Multi-Select Pills)
**Behavior:** Pill-shaped buttons, multi-select, toggle on/off, visual feedback
**Animation:** Scale slightly on tap, checkmark or fill change, duration 150ms
**Best for:** Tags, filters, categories, interests, multi-select options
**Mobile:** Touch-friendly spacing, clear selected state, wrap to multiple rows
**Accessibility:** Checkbox group role, Space to toggle, clear selection count
**Avoid if:** Single select (use segmented or radio), too many options (use dropdown)
**Combines well with:** Filters, tags, categories, search refinement, interests

### #19 Toggle Switch (Binary Control)
**Behavior:** Sliding toggle, on/off states, immediate action, clear current state
**Animation:** Slide knob with spring physics, background color transition, duration 200ms
**Best for:** Settings, enable/disable features, instant toggles, preferences
**Mobile:** Large touch target, clear on/off states, immediate feedback
**Accessibility:** Checkbox role, Space to toggle, aria-checked state, clear labels
**Avoid if:** Need confirmation, not instant effect, multiple options
**Combines well with:** Settings panels, feature flags, preferences, mobile UI

### #20 Button Selector (Visual Radio)
**Behavior:** Button grid/list, single select, visual representation, better than radios
**Animation:** Scale + fill selected button, duration 200ms, spring optional
**Best for:** Plans, sizes, colors, visual options, engaging selections
**Mobile:** Card-style layout, clear selected state, adequate spacing
**Accessibility:** Radio group role, arrow keys, clear selection, focus visible
**Avoid if:** Text-only options work fine, need compact layout
**Combines well with:** Pricing tiers, product options, onboarding, configuration

### #21 Slider Range Control
**Behavior:** Draggable thumb(s), continuous or stepped values, visual range, immediate feedback
**Animation:** Smooth thumb drag, value tooltip appears, no jump animations
**Best for:** Ranges, budgets, filters, volume, brightness, adjustments
**Mobile:** Large thumb target, immediate visual feedback, haptic feedback optional
**Accessibility:** Arrow keys for adjustment, Page Up/Down for large steps, value announced
**Avoid if:** Precise input needed, many options, non-continuous values
**Combines well with:** Filters, settings, volume controls, budget selectors

### #22 Stepper (Increment/Decrement)
**Behavior:** Plus/minus buttons, numeric input, constrained values, clear limits
**Animation:** Number change with brief highlight, button press feedback, duration 100ms
**Best for:** Quantities, counters, numeric input with limits, shopping carts
**Mobile:** Touch-friendly buttons, adequate spacing, haptic feedback
**Accessibility:** Keyboard arrows work, announced value changes, min/max clear
**Avoid if:** Large ranges (use slider), no limits, need typing flexibility
**Combines well with:** Shopping carts, quantity selectors, counters, adjustments

### #23 Checkbox Card (Enhanced Selection)
**Behavior:** Full card is clickable, checkbox visual indicator, better engagement
**Animation:** Card scales slightly, border highlight, checkmark appears, duration 150ms
**Best for:** Feature selection, add-ons, multi-select options, engaging choices
**Mobile:** Full card touch target, clear selected state, adequate spacing
**Accessibility:** Checkbox role, Space to toggle, clear selection, focus border
**Avoid if:** Many options in tight space, simple list sufficient
**Combines well with:** Feature selection, add-ons, configuration, onboarding

### #24 Color Picker (Swatch + Custom)
**Behavior:** Preset swatches, custom picker option, visual feedback, recent colors
**Animation:** Selected swatch grows/highlights, picker opens with slide, duration 200ms
**Best for:** Theme customization, color selection, design tools, customization
**Mobile:** Large swatches, accessible picker, preset options prominent
**Accessibility:** Keyboard navigation, color names announced, sufficient contrast preview
**Avoid if:** Fixed colors only, no customization needed, simple theme switching
**Combines well with:** Customization, themes, design tools, branding tools

---

## NAVIGATION TRANSITIONS

### #25 Page Transition (Slide)
**Behavior:** New page slides in from right, old slides left, back reverses
**Animation:** Slide with deceleration easing, duration 300-350ms, smooth overlap
**Best for:** Mobile apps, wizards, drill-down navigation, forward/back clarity
**Mobile:** Native app feel, swipe to go back gesture, familiar pattern
**Accessibility:** Focus management, skip animations on reduced-motion, logical flow
**Avoid if:** Web-traditional navigation, need instant, SEO-critical pages
**Combines well with:** App-like experiences, progressive flows, native feel

### #26 Page Transition (Fade Cross-Dissolve)
**Behavior:** Old page fades out while new fades in, smooth blend, no direction
**Animation:** Crossfade both pages, duration 200-300ms, subtle and elegant
**Best for:** Same-level navigation, elegant transitions, subtle movement
**Mobile:** Universal pattern, smooth feel, no gesture conflicts
**Accessibility:** Smooth focus transfer, reduced motion compliant, clear destination
**Avoid if:** Need directional clarity, instant navigation preferred, old browsers
**Combines well with:** Elegant sites, same-level pages, smooth experiences

### #27 Morph Transition (Shared Element)
**Behavior:** Element morphs between pages, maintains visual continuity, hero animation
**Animation:** Element scales/moves to new position, duration 400-500ms, sophisticated
**Best for:** Image to detail, card to page, list to detail, visual continuity
**Mobile:** Smooth native feel, maintains context, reduces cognitive load
**Accessibility:** Optional enhancement, ensure fallback, focus management
**Avoid if:** No shared elements, simple navigation, performance concerns
**Combines well with:** Image galleries, product details, card expansions, modern apps

### #28 Stack Navigation (Layer Up)
**Behavior:** New view layers on top, breadcrumb visual, back removes layer
**Animation:** Slide up and forward, previous layer dims/scales back, duration 300ms
**Best for:** Drill-down interfaces, progressive depth, clear hierarchy
**Mobile:** Natural depth perception, easy back navigation, clear layers
**Accessibility:** Clear hierarchy, back button, breadcrumb alternative, skip levels
**Avoid if:** Flat navigation, need side-by-side, no clear hierarchy
**Combines well with:** Settings, file browsers, drill-down menus, mobile apps

### #29 Tab Transition (Instant Swap)
**Behavior:** Instant content swap, no animation (or very subtle), fast switching
**Animation:** Optional crossfade (100ms) or instant, content changes immediately
**Best for:** Tabbed interfaces, settings sections, instant switching, parallel content
**Mobile:** Swipe between tabs, instant feedback, clear current tab
**Accessibility:** Arrow key navigation, clear current tab, instant focus update
**Avoid if:** Want context preservation, need smooth feeling, artistic transitions
**Combines well with:** Settings, dashboards, parallel content, quick switching

### #30 Carousel Transition (Horizontal Slide)
**Behavior:** Content slides horizontally, pagination dots, swipe-able, cyclic optional
**Animation:** Slide with spring or ease-out, duration 300-400ms, momentum scrolling
**Best for:** Image galleries, onboarding, featured content, stories
**Mobile:** Native swipe gesture, momentum, snap to items, familiar
**Accessibility:** Arrow keys, focus on current, skip to end, descriptive labels
**Avoid if:** All content should be visible, SEO priority, accessibility-first
**Combines well with:** Images, onboarding, stories, featured content, products

### #31 Drill-Down Navigation (Accordion-Style)
**Behavior:** Expand to reveal sub-items, smooth height animation, nested depth
**Animation:** Height expand with ease, slight indent for depth, duration 250ms
**Best for:** Nested navigation, hierarchical content, tree structures, menus
**Mobile:** Touch-friendly headers, clear expand indicators, adequate spacing
**Accessibility:** aria-expanded, keyboard navigation, clear hierarchy, skip levels
**Avoid if:** Too many levels (confusing), all items should be visible, need breadcrumbs
**Combines well with:** Sidebars, mobile menus, nested categories, settings

### #32 Parallax Navigation Transition
**Behavior:** Multiple layers move at different speeds during page change, depth illusion
**Animation:** Layered element movement, background slower than foreground, duration 400-500ms
**Best for:** Storytelling sites, creative portfolios, immersive experiences
**Mobile:** Simplified or disabled for performance, reduced layers
**Accessibility:** Optional enhancement only, provide instant alternative, reduced-motion
**Avoid if:** Professional/corporate, accessibility priority, performance concerns
**Combines well with:** Creative sites, storytelling, immersive experiences, portfolios

---

## CONTENT REVEAL PATTERNS

### #33 Expand/Collapse Details
**Behavior:** Click to reveal more content, smooth height animation, chevron indicator
**Animation:** Height grows with ease-out, chevron rotates, duration 250-300ms
**Best for:** Long descriptions, optional details, FAQ answers, progressive disclosure
**Mobile:** Full-width touch target, clear indicator, smooth expansion
**Accessibility:** aria-expanded, keyboard toggle, focus management, summary visible
**Avoid if:** All content should be visible, SEO priority, critical information
**Combines well with:** Product details, FAQs, articles, progressive disclosure

### #34 Read More / Show More
**Behavior:** Truncated text with "Read more" link, expands inline or navigates
**Animation:** Height expand for inline, or fade transition for navigation, duration 250ms
**Best for:** Long text previews, article excerpts, comments, descriptions
**Mobile:** Clear tap target, smooth expansion, return-to-top after long content
**Accessibility:** Clear action label, keyboard accessible, focus management
**Avoid if:** Short content, all should be visible, SEO critical
**Combines well with:** Article previews, comments, descriptions, feeds

### #35 Lazy Load with Skeleton
**Behavior:** Placeholder skeleton while loading, smooth reveal when ready, progressive
**Animation:** Skeleton pulse animation, fade to real content, duration 300ms
**Best for:** Images, content sections, lists, perceived performance
**Mobile:** Faster perceived load, smooth reveal, reduces layout shift
**Accessibility:** Loading state announced, content ready announced, no broken focus
**Avoid if:** Content loads instantly, simple page, no dynamic content
**Combines well with:** Images, feeds, infinite scroll, dynamic content

### #36 Staggered Reveal (Sequential)
**Behavior:** Items appear one after another, cascade effect, rhythmic reveal
**Animation:** Each item fades/slides in with delay (50-100ms apart), duration 200ms per item
**Best for:** Lists on page load, feature sections, card grids, visual interest
**Mobile:** Faster stagger (30-50ms), fewer items at once, performance consideration
**Accessibility:** Optional enhancement, ensure instant fallback, no content delay
**Avoid if:** Need instant content, critical information, accessibility-first
**Combines well with:** Landing pages, feature sections, card grids, marketing

### #37 Hover Expand Card
**Behavior:** Card expands on hover to reveal more, returns on mouse-out, preview pattern
**Animation:** Scale up or height expand, duration 250ms, ease-out, smooth
**Best for:** Product grids, portfolios, galleries, quick previews
**Mobile:** Direct tap to expand or navigate (no hover), alternative pattern
**Accessibility:** Keyboard focus reveals, Escape collapses, don't hide critical info
**Avoid if:** Mobile-primary, all info should be visible, accessibility priority
**Combines well with:** Product grids, portfolios, image galleries, previews

### #38 Modal Content Load (Progressive)
**Behavior:** Modal opens with basic content, additional sections load progressively
**Animation:** Initial content appears, skeleton for loading sections, smooth reveals
**Best for:** Heavy content modals, multi-section details, data-heavy views
**Mobile:** Progressive load feels faster, smooth additions, good perceived performance
**Accessibility:** Loading states announced, focus managed, content ready announced
**Avoid if:** Simple modal content, fast loading, no heavy data
**Combines well with:** Product details, profiles, data views, complex modals

### #39 Scroll Trigger Reveal (Intersection)
**Behavior:** Elements reveal as they enter viewport, scroll-based, progressive page
**Animation:** Fade + slide up, or scale up, duration 300-400ms, smooth reveal
**Best for:** Long landing pages, storytelling, marketing sites, engagement
**Mobile:** Simpler animations for performance, reduced motion consideration
**Accessibility:** Optional enhancement, instant fallback, no content delay
**Avoid if:** Content-critical, need immediate access, accessibility-first
**Combines well with:** Landing pages, marketing, storytelling, feature sections

### #40 Flip Card Reveal
**Behavior:** Card flips to reveal back side, hover or click trigger, 3D rotation
**Animation:** 3D rotate Y-axis, duration 400-500ms, preserve-3d transform
**Best for:** Product features, team bios, before/after, two-sided content
**Mobile:** Tap to flip, clear indicator, smooth rotation, adequate size
**Accessibility:** Keyboard trigger, back-side content accessible, clear both sides
**Avoid if:** Critical info on back (don't hide), accessibility priority, need simplicity
**Combines well with:** Team pages, product features, game cards, interactive content

---

## FEEDBACK & CONFIRMATION PATTERNS

### #41 Confirmation Dialog (Critical Actions)
**Behavior:** Modal confirms action, clear yes/no, destructive actions red, blocking
**Animation:** Scale up + fade backdrop, duration 200ms, attention-grabbing
**Best for:** Delete actions, irreversible changes, critical decisions, data loss prevention
**Mobile:** Full-screen on small devices, clear buttons, adequate spacing
**Accessibility:** Focus on cancel, Escape cancels, Enter confirms, clear consequences
**Avoid if:** Frequent actions (annoying), undo available, non-destructive
**Combines well with:** Delete buttons, settings changes, account actions

### #42 Undo Toast (Forgiving UX)
**Behavior:** Action happens immediately, toast offers undo, better than confirmation
**Animation:** Toast slides in with undo button, auto-dismiss after 5-10 seconds
**Best for:** Deletes, moves, changes that can be reversed, better UX than confirm
**Mobile:** Bottom position for thumb reach, clear undo button, adequate time
**Accessibility:** Focus on undo optional, keyboard shortcut, announced action
**Avoid if:** Truly irreversible, critical data, need explicit confirmation
**Combines well with:** Archive, delete, move, status changes, forgiving interactions

### #43 Loading Progress Bar
**Behavior:** Determinate progress bar, percentage or steps, shows completion status
**Animation:** Smooth bar fill, duration matches actual progress, no fake progress
**Best for:** File uploads, multi-step processes, known duration tasks, user patience
**Mobile:** Clear progress, cancel option, estimated time remaining
**Accessibility:** Progress announced at intervals, cancellable, status visible
**Avoid if:** Indeterminate duration (use spinner), instant process, no progress data
**Combines well with:** File uploads, form submission, data processing, exports

### #44 Loading Spinner (Indeterminate)
**Behavior:** Rotating spinner, unknown duration, simple feedback, blocks or inline
**Animation:** Continuous rotation, duration infinite until loaded, smooth loop
**Best for:** Unknown duration, simple loading, button states, quick feedback
**Mobile:** Appropriate size, not too small, clear loading state, cancellable if long
**Accessibility:** Loading state announced, reason given, timeout handling
**Avoid if:** Known duration (use progress), long wait (use skeleton), instant load
**Combines well with:** Button loading, quick loads, simple feedback, overlays

### #45 Success Checkmark Animation
**Behavior:** Animated checkmark draws in, success confirmation, positive feedback
**Animation:** SVG path draw animation, green color, duration 400-600ms, satisfying
**Best for:** Form submissions, completed actions, success states, positive reinforcement
**Mobile:** Adequate size, clear success state, optional haptic feedback
**Accessibility:** Success announced, clear message, visual + text confirmation
**Avoid if:** Expected behavior (over-celebration), frequent actions, need subtlety
**Combines well with:** Forms, payments, completions, achievements, confirmations

### #46 Error Shake Animation
**Behavior:** Element shakes horizontally, draws attention to error, clear feedback
**Animation:** Quick horizontal shake (3-5 shakes), duration 400ms, attention-grabbing
**Best for:** Form errors, invalid input, failed actions, password errors
**Mobile:** Adequate shake amplitude, not too aggressive, clear error message
**Accessibility:** Error announced to screen reader, visual + text feedback, focus on error
**Avoid if:** Subtle errors, accessibility concerns (motion), prefer static indicators
**Combines well with:** Form validation, password fields, error messages, inline errors

### #47 Pulse/Heartbeat Attention
**Behavior:** Element pulses to draw attention, repeating animation, notification indicator
**Animation:** Scale pulse (1.0 → 1.1 → 1.0), duration 1500ms loop, subtle breathing
**Best for:** Notification badges, unread indicators, attention-needed items, CTAs
**Mobile:** Subtle animation, not distracting, clear purpose, pausable on motion-reduce
**Accessibility:** Optional enhancement, static indicator as well, announced changes
**Avoid if:** Too many items pulsing (chaos), accessibility priority, professional context
**Combines well with:** Notification badges, unread counts, CTAs, attention-needed

### #48 Confetti Celebration
**Behavior:** Particle confetti animation, celebration moment, delightful surprise
**Animation:** Particles emit and fall with physics, duration 2-3 seconds, joyful
**Best for:** Major achievements, completions, milestones, celebrations, delight
**Mobile:** Performance-optimized, reduced particles, optional haptic burst
**Accessibility:** Optional enhancement only, announced achievement, skippable
**Avoid if:** Frequent events, professional context, accessibility-first, performance concerns
**Combines well with:** Achievements, onboarding completion, purchases, milestones

---

## DATA ENTRY PATTERNS

### #49 Inline Editing
**Behavior:** Click text to edit in place, smooth transition, save/cancel actions
**Animation:** Highlight editable area, input appears with focus, duration 150ms
**Best for:** Titles, labels, simple edits, quick changes, admin interfaces
**Mobile:** Large tap target, clear edit mode, keyboard appears instantly
**Accessibility:** Enter to edit, Escape to cancel, Enter to save, clear edit mode
**Avoid if:** Complex validation, rich content, needs form context
**Combines well with:** Tables, lists, labels, headings, simple properties

### #50 Auto-Save Indicator
**Behavior:** Saves automatically while typing, shows save status, no manual save needed
**Animation:** "Saving..." appears, transitions to "Saved" with checkmark, duration 200ms
**Best for:** Drafts, notes, documents, forms, modern apps, reduced anxiety
**Mobile:** Clear save status, confidence-building, no lost work
**Accessibility:** Save status announced, clear state, no manual save stress
**Avoid if:** Critical data needs explicit save, offline mode, conflicts possible
**Combines well with:** Text editors, note apps, forms, document editors

### #51 Multi-Step Form with Progress
**Behavior:** Form split into steps, progress indicator, next/back navigation, save state
**Animation:** Slide to next step, progress bar advances, duration 300ms
**Best for:** Long forms, onboarding, checkout, applications, less overwhelming
**Mobile:** One step at a time, clear progress, save between steps
**Accessibility:** Current step announced, keyboard navigation, skip steps if applicable
**Avoid if:** Simple form, need overview, SEO requires single page
**Combines well with:** Onboarding, checkout, applications, surveys, registrations

### #52 Smart Input Suggestions
**Behavior:** Dropdown suggestions appear as user types, autocomplete, keyboard navigable
**Animation:** Dropdown fades in below input, items highlight on hover/arrow keys, duration 150ms
**Best for:** Search, addresses, tags, known values, assisted input
**Mobile:** Large touch targets, clear selection, keyboard dismissal
**Accessibility:** Combobox role, arrow key navigation, selection announced, clear dismiss
**Avoid if:** Unique input only, no suggestion data, simple input sufficient
**Combines well with:** Search, address fields, tags, categories, selections

### #53 Field Validation (Inline Real-Time)
**Behavior:** Validates as user types or on blur, immediate feedback, helpful messages
**Animation:** Error message slides in below field, field border color changes, duration 200ms
**Best for:** Most forms, user help, error prevention, better UX
**Mobile:** Clear error messages, adequate spacing, helpful recovery
**Accessibility:** Error announced, clear association with field, recovery guidance
**Avoid if:** Server-only validation, want submit-time only, false positives common
**Combines well with:** All forms, required fields, format requirements, passwords

### #54 Drag-and-Drop File Upload
**Behavior:** Drag files over zone, visual feedback, highlight drop zone, easy upload
**Animation:** Drop zone highlights on drag-over, scale or border pulse, duration 200ms
**Best for:** File uploads, images, documents, modern interfaces
**Mobile:** Fallback to file picker, clear upload button, progress indicator
**Accessibility:** Keyboard-accessible upload button, progress announced, file list
**Avoid if:** Simple file picker sufficient, mobile-only, accessibility-first
**Combines well with:** Image uploads, document uploads, media management, cloud storage

### #55 Masked Input (Format Guidance)
**Behavior:** Input format automatically applied, guides entry, prevents errors
**Animation:** Characters format as typed, cursor positioned correctly, instant feedback
**Best for:** Phone numbers, credit cards, dates, formatted values, error prevention
**Mobile:** Appropriate keyboard type, clear format, paste handling
**Accessibility:** Format announced, clear requirements, validation feedback
**Avoid if:** Flexible format needed, international variations, complex rules
**Combines well with:** Phone inputs, credit cards, dates, postal codes, IDs

### #56 Voice Input Option
**Behavior:** Microphone button enables voice dictation, transcribes to text, modern input
**Animation:** Pulse animation during recording, waveform optional, clear recording state
**Best for:** Accessibility, hands-free, long text entry, modern apps
**Mobile:** Native pattern, clear recording state, pause/cancel options
**Accessibility:** Alternative input method, clear state, stop recording easy
**Avoid if:** Privacy concerns, noisy environments, not supported
**Combines well with:** Search, messages, notes, accessibility features, mobile apps

---

## LIST & COLLECTION PATTERNS

### #57 Swipe Actions (Mobile List)
**Behavior:** Swipe list item left/right to reveal action buttons, iOS/Android pattern
**Animation:** Item slides with finger, actions reveal behind, spring physics optional
**Best for:** Email apps, to-do lists, mobile apps, quick actions, native feel
**Mobile:** Native behavior, clear action colors, destructive actions red, undo option
**Accessibility:** Alternative action menu button, clear action labels, keyboard shortcuts
**Avoid if:** Desktop-primary, complex actions, need confirmation always
**Combines well with:** Lists, emails, messages, tasks, mobile-first apps

### #58 Pull-to-Refresh
**Behavior:** Pull down list to trigger refresh, loading indicator, iOS/Android standard
**Animation:** Pull reveals spinner, release triggers refresh, spring physics, duration varies
**Best for:** Feeds, timelines, news, mobile apps, data updates
**Mobile:** Native behavior, clear pull distance, smooth physics, familiar pattern
**Accessibility:** Refresh button alternative, loading announced, completed announced
**Avoid if:** Desktop-only, auto-refresh sufficient, not dynamic data
**Combines well with:** Feeds, social media, news, timelines, mobile apps

### #59 Infinite Scroll with Loader
**Behavior:** More items load as scroll reaches bottom, smooth continuation, endless feed
**Animation:** Loading spinner appears at bottom, new items fade in, duration 300ms
**Best for:** Social feeds, image galleries, search results, exploration
**Mobile:** Smooth loading, clear indicator, performance optimized, threshold early
**Accessibility:** Loading announced, "Load more" button alternative, stop point option
**Avoid if:** Need pagination, footer important, SEO critical, prefer paging
**Combines well with:** Feeds, galleries, search, exploration, content-heavy sites

### #60 Virtual Scrolling (Performance)
**Behavior:** Only renders visible items, smooth scroll of thousands, performance optimization
**Animation:** Seamless scroll, items render just before visible, imperceptible
**Best for:** Huge lists, data tables, performance-critical, thousands of items
**Mobile:** Smooth performance, native feel, efficient memory usage
**Accessibility:** Keyboard navigation maintained, announced counts, focus management
**Avoid if:** Simple list (overkill), SEO needs all items, complexity not needed
**Combines well with:** Data tables, huge lists, logs, messages, performance-critical

### #61 Sortable List (Drag to Reorder)
**Behavior:** Drag items to reorder, visual feedback during drag, saves new order
**Animation:** Dragged item lifts (scale 1.05), other items shift smoothly, duration 200ms
**Best for:** Playlists, task priorities, customizable order, dashboards
**Mobile:** Long-press to drag, clear drag handles, adequate spacing, smooth reorder
**Accessibility:** Keyboard reordering (Alt+Arrow or Move buttons), announced changes
**Avoid if:** Order not customizable, complex nesting, accessibility-first
**Combines well with:** Dashboards, playlists, priorities, customizable interfaces

### #62 Grid View / List View Toggle
**Behavior:** Switch between grid (cards) and list (rows) layouts, instant swap, save preference
**Animation:** Crossfade or morph between layouts, duration 250-300ms, smooth transition
**Best for:** Products, images, files, flexible viewing, user preference
**Mobile:** Both layouts mobile-optimized, toggle easy to reach, saved preference
**Accessibility:** Keyboard toggle, view announced, both layouts accessible, saved preference
**Avoid if:** Single layout sufficient, no benefit to switching, adds complexity
**Combines well with:** Product catalogs, galleries, file managers, search results

### #63 Filter + Sort Panel
**Behavior:** Panel (sidebar/bottom sheet) with filter options and sort controls, apply/reset
**Animation:** Panel slides in, filters animate in staggered, apply button prominent
**Best for:** Product listings, search results, data tables, refinement
**Mobile:** Bottom sheet on mobile, clear apply button, selected filters visible
**Accessibility:** Clear filter groups, announced counts, keyboard accessible, reset clear
**Avoid if:** Simple filtering, few options, added complexity not needed
**Combines well with:** Product listings, search, data exploration, e-commerce

### #64 Grouped List with Headers
**Behavior:** Items grouped by category, sticky headers, clear sections, collapsible optional
**Animation:** Smooth scroll with sticky headers, expand/collapse sections optional
**Best for:** Contacts, settings, organized data, long lists with categories
**Mobile:** Sticky headers for orientation, jump-to-section, smooth scroll
**Accessibility:** Header navigation, skip to section, clear groupings, keyboard navigation
**Avoid if:** Simple flat list, no natural groupings, added complexity not helpful
**Combines well with:** Contacts, settings, organized content, long categorized lists

---

## MEDIA PRESENTATION PATTERNS

### #65 Lightbox (Image Viewer)
**Behavior:** Full-screen image overlay, click outside to close, prev/next navigation, zoom
**Animation:** Image scales up from thumbnail, backdrop fades in, duration 300-400ms
**Best for:** Image galleries, product photos, portfolios, detailed viewing
**Mobile:** Pinch to zoom, swipe between images, double-tap zoom, native gestures
**Accessibility:** Keyboard arrows, Escape closes, zoom controls, image description
**Avoid if:** Simple images, no detail needed, accessibility-primary (inline better)
**Combines well with:** Galleries, portfolios, product images, photo collections

### #66 Video Player with Custom Controls
**Behavior:** Custom UI over video, play/pause, scrubbing, volume, fullscreen, native features
**Animation:** Controls fade in on hover/tap, fade out on idle, duration 200ms
**Best for:** Embedded videos, courses, custom branding, consistent experience
**Mobile:** Native controls on mobile often better, large touch targets if custom
**Accessibility:** Keyboard controls, captions support, announced states, full keyboard access
**Avoid if:** Native controls sufficient, complexity not needed, accessibility concerns
**Combines well with:** Courses, marketing videos, branded content, custom experiences

### #67 Image Carousel with Thumbnails
**Behavior:** Main image display, thumbnail strip below, click thumbnail to change, navigation arrows
**Animation:** Main image crossfades, thumbnail highlights, duration 300ms, smooth
**Best for:** Product galleries, portfolios, image collections, detailed viewing
**Mobile:** Swipe main image, thumbnail strip scrollable, touch-friendly
**Accessibility:** Keyboard navigation, current image announced, skip to content
**Avoid if:** Single image, simple gallery, added complexity not needed
**Combines well with:** Product pages, portfolios, real estate, detailed galleries

### #68 Before/After Slider
**Behavior:** Draggable divider reveals before/after images, interactive comparison
**Animation:** Smooth divider drag, instant reveal, no animation on drag
**Best for:** Product results, image editing, transformations, comparisons
**Mobile:** Touch-friendly slider, large handle, smooth drag, clear labels
**Accessibility:** Keyboard slider control, before/after clearly labeled, announced position
**Avoid if:** No comparison needed, images too similar, static comparison works
**Combines well with:** Product results, editing tools, transformations, comparisons

### #69 Audio Waveform Player
**Behavior:** Visual waveform, scrubbing, play/pause, playback position, modern audio player
**Animation:** Waveform draws in, playhead moves smoothly, duration continuous
**Best for:** Podcasts, music, audio content, modern audio experience, visual interest
**Mobile:** Large touch targets, smooth scrubbing, native audio features
**Accessibility:** Standard audio controls, keyboard playback, announced position/duration
**Avoid if:** Simple audio sufficient, added complexity not valued, performance concerns
**Combines well with:** Podcasts, music players, audio content, modern audio experiences

### #70 360° Product Viewer
**Behavior:** Drag to rotate product view, all angles, interactive exploration
**Animation:** Smooth rotation with drag, momentum spin optional, frame-by-frame
**Best for:** Product showcases, e-commerce, detailed viewing, interactive exploration
**Mobile:** Touch drag rotation, momentum spin, pinch to zoom optional
**Accessibility:** Alternative images/description, keyboard rotation, all angles described
**Avoid if:** Simple product, too complex, loading/performance concerns
**Combines well with:** Product pages, e-commerce, detailed showcases, premium products

### #71 Thumbnail Grid with Quick View
**Behavior:** Grid of thumbnails, hover/click for quick view overlay, faster than full navigation
**Animation:** Overlay scales up from thumbnail, backdrop fade, duration 250ms
**Best for:** Products, galleries, search results, quick browsing
**Mobile:** Direct tap navigation or quick view, clear close action
**Accessibility:** Keyboard quick view, Escape closes, focus management, logical flow
**Avoid if:** Need full navigation, simple grid sufficient, added layer not helpful
**Combines well with:** Product grids, search results, galleries, quick browsing

### #72 Media Gallery (Mixed Types)
**Behavior:** Grid of images/videos/documents, type indicators, unified browsing
**Animation:** Items load progressively, hover effects, smooth transitions
**Best for:** Mixed content, portfolios, project showcases, diverse media
**Mobile:** Touch-friendly grid, clear type indicators, appropriate viewers per type
**Accessibility:** Type announced, keyboard navigation, appropriate viewer per type
**Avoid if:** Single media type, simple layout sufficient, consistency preferred
**Combines well with:** Portfolios, project showcases, mixed content, diverse collections

---

## STATE TRANSITION PATTERNS

### #73 Loading to Content (Smooth Handoff)
**Behavior:** Skeleton/spinner transitions smoothly to actual content, no jarring swap
**Animation:** Skeleton fades out as content fades in, duration 300ms, seamless
**Best for:** Dynamic content, better perceived performance, smooth experience
**Mobile:** Fast handoff, minimal layout shift, smooth perception
**Accessibility:** Loading announced, content ready announced, focus management
**Avoid if:** Instant loading, static content, simple page
**Combines well with:** Dynamic content, API-driven interfaces, perceived performance

### #74 Empty to Populated State
**Behavior:** Helpful empty state with CTA, transitions to content once added, encouraging
**Animation:** Empty illustration fades out, first content item fades/slides in, duration 300ms
**Best for:** New users, first-time experiences, lists, collections
**Mobile:** Touch-friendly CTA, clear next step, welcoming experience
**Accessibility:** Empty state announced, CTA clear, content additions announced
**Avoid if:** Should never be empty, error state instead, temporary only
**Combines well with:** Onboarding, first-time use, lists, collections, user-generated content

### #75 Success to Next Step
**Behavior:** Success confirmation briefly, auto-advances to next step, smooth flow
**Animation:** Success checkmark displays (1-2s), fades to next step, duration 300ms each
**Best for:** Multi-step flows, onboarding, forms, continuous process
**Mobile:** Clear success state, adequate pause, smooth continuation
**Accessibility:** Success announced, next step announced, not too fast, skippable
**Avoid if:** User needs to stop, success is final, no next step
**Combines well with:** Onboarding, forms, checkout, progressive flows

### #76 Error to Retry State
**Behavior:** Error message with retry action, clear what failed, how to fix, helpful
**Animation:** Error message slides in, retry button prominent, duration 200ms
**Best for:** Network errors, failed actions, recoverable errors, helpful guidance
**Mobile:** Large retry button, clear error message, offline handling
**Accessibility:** Error announced, retry action clear, guidance provided, keyboard accessible
**Avoid if:** Unrecoverable error, redirect needed, automatic retry better
**Combines well with:** Network requests, form submissions, data loading, actions

### #77 Offline to Online Sync
**Behavior:** Offline indicator, queued actions, auto-sync when online, seamless experience
**Animation:** Offline badge appears, sync indicator when reconnected, duration 200ms
**Best for:** PWAs, mobile apps, intermittent connectivity, reliable experience
**Mobile:** Clear offline state, queued actions saved, smooth sync on reconnect
**Accessibility:** Connectivity announced, sync status announced, offline actions clear
**Avoid if:** Always online, no offline functionality, online-only features
**Combines well with:** PWAs, mobile apps, offline-first, reliable experiences

### #78 Minimal to Expanded Detail
**Behavior:** Starts minimal (card/row), expands to show detail, accordion-like but in-place
**Animation:** Height expands smoothly, additional content fades in, duration 300ms
**Best for:** Email clients, list details, minimizing vertical space, progressive disclosure
**Mobile:** Full-width expansion, clear collapse action, smooth animation
**Accessibility:** aria-expanded state, keyboard toggle, focus management, clear both states
**Avoid if:** Details should be separate page, too much content, mobile navigation better
**Combines well with:** Email clients, messages, list items, progressive disclosure

### #79 Compact to Comfortable Density
**Behavior:** Toggle between compact and comfortable spacing, user preference, save setting
**Animation:** Smooth spacing transition, items reflow, duration 300ms
**Best for:** Data tables, lists, power users vs casual, customization
**Mobile:** Both modes mobile-optimized, toggle easy to reach, saved preference
**Accessibility:** Density announced, both modes accessible, saved preference
**Avoid if:** Single density sufficient, added complexity not valued
**Combines well with:** Data tables, admin panels, lists, user preference

### #80 Live Update Notification
**Behavior:** New content available banner, click to refresh or auto-refresh, non-disruptive
**Animation:** Banner slides down from top, prominent but not blocking, duration 250ms
**Best for:** Feeds, dashboards, real-time content, collaboration tools
**Mobile:** Bottom banner for thumb reach, clear action, non-intrusive
**Accessibility:** Update announced, refresh action clear, keyboard accessible
**Avoid if:** Auto-refresh better, not real-time, disruptive to reading
**Combines well with:** Feeds, dashboards, collaborative tools, real-time content

---

## GESTURE-BASED INTERACTIONS

### #81 Swipe to Delete/Archive
**Behavior:** Swipe item left/right to reveal delete/archive, full swipe triggers action
**Animation:** Item slides with finger, action reveals, full swipe triggers with animation
**Best for:** Mobile lists, emails, tasks, quick actions, native feel
**Mobile:** Native pattern, clear action colors, undo option, haptic feedback
**Accessibility:** Alternative button actions, clear labels, keyboard shortcuts
**Avoid if:** Desktop-primary, accidental swipes concern, need confirmation always
**Combines well with:** Email apps, task lists, messages, mobile-first apps

### #82 Long-Press Context Menu
**Behavior:** Press and hold to reveal context menu, actions for item, native mobile pattern
**Animation:** Item scales slightly, haptic feedback, menu fades in, duration 200ms
**Best for:** Mobile apps, context actions, secondary functions, native feel
**Mobile:** Native behavior, clear menu, haptic feedback, touch-friendly targets
**Accessibility:** Alternative access via button, clear actions, keyboard equivalents
**Avoid if:** Desktop-primary, actions should be visible, confusion with drag
**Combines well with:** Mobile apps, lists, images, context-driven actions

### #83 Pinch to Zoom
**Behavior:** Two-finger pinch gesture scales content, mobile standard, smooth zoom
**Animation:** Smooth scale transformation, momentum optional, natural physics
**Best for:** Images, maps, diagrams, detail viewing, mobile standard
**Mobile:** Native gesture, smooth performance, double-tap zoom alternative
**Accessibility:** Zoom controls alternative, announced zoom level, keyboard zoom
**Avoid if:** Not zoomable content, desktop-only, no benefit to zooming
**Combines well with:** Images, maps, diagrams, PDFs, detailed content

### #84 Two-Finger Pan (Map/Canvas)
**Behavior:** Two fingers to pan map/canvas, distinguishes from scroll, desktop and mobile
**Animation:** Smooth panning with finger movement, momentum optional, natural
**Best for:** Maps, canvas editors, design tools, distinguishing from scroll
**Mobile:** Native map gesture, smooth performance, clear pan mode
**Accessibility:** Keyboard panning, alternative controls, announced position
**Avoid if:** Simple scrolling sufficient, confusion with zoom, not needed
**Combines well with:** Maps, canvas apps, design tools, spatial navigation

### #85 Shake to Undo (Mobile)
**Behavior:** Shake device to trigger undo, iOS pattern, physical interaction
**Animation:** Undo dialog appears after shake detection, haptic confirmation
**Best for:** Mobile apps adopting iOS patterns, undo actions, playful interaction
**Mobile:** iOS standard, clear undo dialog, alternative undo button also
**Accessibility:** Must have alternative undo method, shake may not be possible
**Avoid if:** Not iOS-focused, shake unreliable, accessibility-first
**Combines well with:** iOS apps, text editing, undoable actions, mobile-native feel

### #86 Edge Swipe Navigation
**Behavior:** Swipe from screen edge to go back or open menu, iOS/Android pattern
**Animation:** Screen slides with finger, reveals previous screen/menu, physics-based
**Best for:** Mobile apps, navigation, back action, native feel
**Mobile:** Native pattern, smooth physics, clear visual feedback during swipe
**Accessibility:** Back button alternative, clear navigation, keyboard equivalent
**Avoid if:** Conflicts with system gestures, web-based, not mobile app
**Combines well with:** Mobile apps, stack navigation, native feel, gestures

### #87 Double-Tap Actions
**Behavior:** Tap twice quickly for action (zoom, like, etc.), common mobile pattern
**Animation:** Immediate action response, visual feedback (heart, zoom), duration 200ms
**Best for:** Social apps (like), images (zoom), quick actions, mobile pattern
**Mobile:** Fast recognition, clear feedback, alternative single-tap action
**Accessibility:** Alternative action method, announced action, keyboard equivalent
**Avoid if:** Conflicts with system actions, too sensitive, accidental triggers
**Combines well with:** Social apps, images, quick actions, mobile interactions

### #88 Rotation Gesture (Two-Finger)
**Behavior:** Two-finger rotation gesture rotates object, design/map apps, mobile
**Animation:** Smooth rotation following finger movement, snap to angles optional
**Best for:** Design tools, maps orientation, creative apps, object manipulation
**Mobile:** Smooth rotation, snap points optional, clear rotation mode
**Accessibility:** Rotation controls alternative, announced angle, keyboard rotation
**Avoid if:** Not applicable, confusion with other gestures, no rotation needed
**Combines well with:** Design tools, creative apps, map orientation, manipulation

---

## CONTEXTUAL ACTIONS PATTERNS

### #89 Floating Action Button (FAB) with Speed Dial
**Behavior:** Main FAB expands to reveal related actions, mobile material design pattern
**Animation:** Main FAB rotates, secondary FABs expand radially or vertically, duration 250ms
**Best for:** Mobile apps, primary action with variants, material design, quick access
**Mobile:** Thumb-friendly position, clear main action, easy dismiss, touch-friendly
**Accessibility:** Keyboard access to all actions, announced expansion, clear action labels
**Avoid if:** Desktop-primary, too many actions, unclear primary action
**Combines well with:** Mobile apps, material design, primary actions, quick access

### #90 Hover Toolbar (Contextual)
**Behavior:** Toolbar appears on hover, context-specific actions, text selection pattern
**Animation:** Toolbar fades in above content, duration 150ms, smooth appearance
**Best for:** Text editors, selection actions, contextual editing, desktop pattern
**Mobile:** Alternative touch-and-hold menu, selected state shows actions
**Accessibility:** Keyboard shortcut alternatives, clear actions, focus management
**Avoid if:** Mobile-primary, actions should be always visible, touch interactions
**Combines well with:** Text editors, rich content, selection actions, desktop apps

### #91 Right-Click Context Menu
**Behavior:** Right-click shows context menu, desktop pattern, action list for item
**Animation:** Menu appears at cursor, fade in, duration 100-150ms, instant feel
**Best for:** Desktop apps, power users, file managers, advanced interfaces
**Mobile:** Long-press alternative, clear menu, touch-friendly items
**Accessibility:** Keyboard menu key, announced menu, arrow key navigation
**Avoid if:** Mobile-primary, casual users, simple interactions sufficient
**Combines well with:** Desktop apps, file managers, power user features, advanced UI

### #92 Selection Mode (Multi-Select)
**Behavior:** Enter selection mode, checkboxes appear, batch actions available, exit mode
**Animation:** Checkboxes fade in, toolbar appears at top, duration 200ms
**Best for:** File managers, email, galleries, batch operations, organization
**Mobile:** Long-press enters mode, clear selection count, easy exit, batch actions
**Accessibility:** Keyboard selection, Select All, announced count, clear mode
**Avoid if:** Single actions only, rare need for batch, adds complexity
**Combines well with:** File managers, email, galleries, admin interfaces, organization

### #93 Smart Suggestions (Contextual)
**Behavior:** AI/rule-based suggestions appear contextually, helpful, non-intrusive
**Animation:** Suggestion card fades in, dismiss easily, duration 200ms
**Best for:** Email (smart reply), writing tools, proactive help, modern apps
**Mobile:** Bottom position, easy dismiss, clear action, non-blocking
**Accessibility:** Announced suggestion, keyboard accessible, easy dismiss, not disruptive
**Avoid if:** Suggestions poor quality, privacy concerns, user prefers control
**Combines well with:** Email, writing tools, smart apps, AI features, assistance

### #94 Quick Actions Bar
**Behavior:** Fixed bottom bar with primary actions, always accessible, mobile pattern
**Animation:** Bar slides up on scroll down, reappears on scroll up, duration 200ms
**Best for:** E-commerce (cart), booking (reserve), persistent actions, mobile
**Mobile:** Thumb-friendly position, clear primary action, always accessible
**Accessibility:** Keyboard accessible, clear actions, announced state changes
**Avoid if:** No persistent action needed, desktop-primary, blocks content
**Combines well with:** E-commerce, booking, forms, mobile actions, sticky CTAs

### #95 Progressive Disclosure Actions
**Behavior:** "More" button reveals additional actions, keeps UI clean, reveals on demand
**Animation:** Additional actions fade/slide in, clear reveal, duration 200ms
**Best for:** Card actions, list items, keeping UI clean, many optional actions
**Mobile:** Touch-friendly reveal, clear expanded state, easy dismiss
**Accessibility:** Keyboard expansion, announced additional actions, logical order
**Avoid if:** All actions should be visible, too many levels, confusion
**Combines well with:** Cards, list items, clean UI, optional actions, space-saving

### #96 Bulk Actions Header
**Behavior:** When items selected, header transforms to show bulk actions, clear state change
**Animation:** Header morphs to action bar, selection count visible, duration 250ms
**Best for:** Tables, lists, file managers, batch operations, admin interfaces
**Mobile:** Clear selection count, touch-friendly actions, easy cancel
**Accessibility:** Announced selection count, clear actions, keyboard batch operations
**Avoid if:** Single operations only, rare need, adds complexity
**Combines well with:** Data tables, admin panels, file managers, batch operations

---

## ADVANCED INTERACTION PATTERNS

### #97 Drag-to-Reorder with Zones
**Behavior:** Drag items between different zones/categories, multi-list drag-drop, organizing
**Animation:** Item lifts on drag, drop zones highlight, smooth drop placement, duration 200ms
**Best for:** Kanban boards, categorization, organizing, project management
**Mobile:** Long-press to drag, clear drop zones, adequate spacing, smooth reorder
**Accessibility:** Keyboard move between zones, announced zones/positions, clear state
**Avoid if:** Simple single list, no zones, accessibility-first (complex)
**Combines well with:** Project management, categorization, Kanban, organization tools

### #98 Nested Expansion (Tree View)
**Behavior:** Hierarchical tree, expand/collapse nested levels, maintain state, navigable
**Animation:** Smooth height expand, indent nested items, chevron rotation, duration 250ms
**Best for:** File systems, nested navigation, hierarchical data, organization
**Mobile:** Touch-friendly headers, clear nesting levels, adequate spacing
**Accessibility:** aria-tree roles, keyboard navigation, announced levels, expand/collapse keys
**Avoid if:** Flat structure, too many levels, confusing hierarchy
**Combines well with:** File systems, org charts, nested categories, hierarchical data

### #99 Command Palette (Cmd+K)
**Behavior:** Keyboard shortcut opens searchable command list, fuzzy search, power user tool
**Animation:** Overlay fades in, search focused immediately, results instant, duration 200ms
**Best for:** Web apps, power users, keyboard navigation, efficiency, modern apps
**Mobile:** Search icon trigger, touch-friendly, keyboard appears, mobile-adapted
**Accessibility:** Keyboard-first design, screen reader friendly, clear results, announced
**Avoid if:** Simple app, casual users only, no keyboard focus, mobile-only
**Combines well with:** Web apps, productivity tools, keyboard shortcuts, power users

### #100 Split View / Comparison Mode
**Behavior:** Two views side-by-side, synchronized scrolling optional, comparison
**Animation:** View splits with smooth resize, content adjusts, duration 300ms
**Best for:** Code editors, document comparison, before/after, data comparison
**Mobile:** Often stacks vertically or separate views, toggle between
**Accessibility:** Keyboard navigation between panes, announced current pane, logical flow
**Avoid if:** Mobile-primary, no comparison need, single view sufficient
**Combines well with:** Code editors, diffs, comparisons, data analysis, reviews

### #101 Live Collaboration Cursors
**Behavior:** Show other users' cursors/selections in real-time, multiplayer presence
**Animation:** Cursor moves smoothly, label with name, color-coded per user, smooth tracking
**Best for:** Collaborative editing, design tools, documents, real-time collaboration
**Mobile:** Touch points instead of cursors, clear user indicators, less visual
**Accessibility:** Optional feature, announced user presence, focus not disrupted
**Avoid if:** Single-user only, no collaboration, privacy concerns
**Combines well with:** Collaborative editors, design tools, documents, team work

### #102 Undo/Redo Stack with History
**Behavior:** Visual history of changes, click to jump to state, time travel, power feature
**Animation:** History panel slides in, states listed chronologically, smooth navigation
**Best for:** Design tools, editors, complex data entry, power users
**Mobile:** Simplified history, swipe through states, touch-friendly timeline
**Accessibility:** Keyboard undo/redo, announced state changes, clear history, navigable
**Avoid if:** Simple edits, no history value, adds complexity unnecessarily
**Combines well with:** Design tools, editors, version control, complex workflows

### #103 Minimap Navigation
**Behavior:** Small overview map shows position in large document, click to jump, code editor pattern
**Animation:** Current position highlights, smooth scroll to clicked position, instant jump
**Best for:** Code editors, long documents, large canvases, navigation aid
**Mobile:** Often hidden on mobile, alternative scroll position indicator
**Accessibility:** Optional enhancement, keyboard navigation alternatives, announced position
**Avoid if:** Short content, simple navigation, mobile-primary, unnecessary
**Combines well with:** Code editors, long documents, design tools, large content

### #104 Annotation/Comment Layer
**Behavior:** Overlay comments/annotations on content, click to add, threaded discussions
**Animation:** Comment indicator pulses, panel slides in for thread, duration 250ms
**Best for:** Document review, design feedback, collaboration, asynchronous communication
**Mobile:** Touch to comment, panel slides up, clear indicators, threading maintained
**Accessibility:** Keyboard add comment, comment navigation, announced comment count
**Avoid if:** No collaboration, simple feedback, privacy concerns
**Combines well with:** Document review, design tools, collaboration, feedback workflows

---

## MIXING & MATCHING GUIDE

### Mobile-First App Stack
**Patterns:** Bottom Sheet (#9), Swipe Actions (#57), Tab Bar Navigation, Pull-to-Refresh (#58), Toast Notifications (#5), Segmented Controls (#17), FAB with Speed Dial (#89)
**Best for:** iOS/Android apps, mobile-first experiences, native feel

### Desktop Web App Stack  
**Patterns:** Center Modal (#1), Sidebar Navigation, Command Palette (#99), Hover Toolbar (#90), Right-Click Menu (#91), Split View (#100), Keyboard Shortcuts
**Best for:** Productivity tools, admin panels, power user interfaces, desktop-focused

### E-commerce / Checkout Stack
**Patterns:** Side Panel (#10) for cart, Bottom Sheet (#9) for mobile filters, Multi-Step Form (#51), Progress Bar (#43), Success Animation (#45), Quick Actions Bar (#94)
**Best for:** Online stores, checkout flows, product configuration, shopping

### Content Platform Stack
**Patterns:** Infinite Scroll (#59), Lightbox (#65), Pull-to-Refresh (#58), Swipe Navigation (#30), Card Grid with Quick View (#71), Comment Layer (#104)
**Best for:** Social media, content platforms, media sites, galleries

### SaaS Dashboard Stack
**Patterns:** Drawer Navigation (#11), Center Modal (#1), Toast Notifications (#5), Inline Editing (#49), Auto-Save (#50), Keyboard Shortcuts, Filters Panel (#63)
**Best for:** Business apps, analytics, project management, admin interfaces

### Collaborative Tools Stack
**Patterns:** Live Cursors (#101), Comment Layer (#104), Undo/Redo History (#102), Auto-Save (#50), Offline Sync (#77), Real-Time Updates (#80)
**Best for:** Document editors, design tools, team collaboration, real-time work

### Mobile Game / Interactive Stack
**Patterns:** Fullscreen Modal (#2), Gesture Controls (#81-88), Confetti Celebrations (#48), Achievement Animations, Sound Feedback, Haptic Feedback
**Best for:** Games, interactive experiences, entertainment apps, playful interfaces

---

## PLATFORM-SPECIFIC CONSIDERATIONS

### iOS Patterns
- Bottom sheets with detents
- Swipe gestures (back, actions)
- Large titles in navigation
- Action sheets for choices
- Pull-to-refresh standard
- Haptic feedback essential
- Tab bar navigation
- Context menus (iOS 13+)
- Card-style modals

### Android/Material Patterns
- Bottom sheets standard
- FAB for primary actions
- Navigation drawer
- Snackbars for feedback
- Card-based layouts
- Ripple effects
- Bottom navigation
- Backdrop layer
- Motion emphasis

### Web/Desktop Patterns
- Center modals primary
- Hover interactions rich
- Right-click context menus
- Keyboard shortcuts essential
- Command palette popular
- Multi-window awareness
- Cursor feedback detailed
- Toolbar patterns
- Menu bars traditional

### Progressive Web App (PWA) Patterns
- Install prompts
- Offline indicators
- Background sync
- Push notifications
- App-like navigation
- Mobile + desktop adaptive
- Service worker updates
- Home screen presence

---

## ACCESSIBILITY CHECKLIST

### Every Pattern Must Have:
- ✅ Keyboard navigation
- ✅ Focus indicators visible
- ✅ ARIA roles/attributes
- ✅ Screen reader support
- ✅ Touch target size (44px min mobile)
- ✅ Color not sole indicator
- ✅ Reduced motion alternative
- ✅ Clear focus order
- ✅ Error announcements
- ✅ State announcements

### Pattern-Specific Accessibility:
- **Modals:** Focus trap, Escape closes, return focus
- **Sheets:** Clear close action, keyboard dismissal
- **Gestures:** Keyboard alternatives mandatory
- **Animations:** respect prefers-reduced-motion
- **Overlays:** Proper z-index, focus management
- **Navigation:** Skip links, landmarks, logical order
- **Forms:** Labels, error messages, help text
- **Lists:** Announced counts, positions, changes

---

## PERFORMANCE CONSIDERATIONS

### Fast Patterns (Optimized):
- CSS-only animations
- Native browser features
- Transform/opacity animations
- Virtual scrolling
- Lazy loading
- Debounced interactions
- Efficient event listeners

### Heavier Patterns (Optimize Carefully):
- Drag-and-drop (event-heavy)
- Real-time collaboration
- Complex animations
- Video/media heavy
- Particle effects
- Blur effects (backdrop-filter)
- Many simultaneous animations

### Optimization Strategies:
- `will-change` for animated properties
- Passive event listeners
- Intersection Observer for visibility
- RequestAnimationFrame for smooth animations
- Virtualization for long lists
- Code splitting for modals
- Lazy load below-fold
- Reduce motion complexity on mobile

---

## RESPONSIVE BEHAVIOR

### Mobile (320px - 640px)
- Bottom sheets preferred over modals
- Full-screen modals for complex content
- Swipe gestures primary
- Touch-friendly targets (44px min)
- Bottom navigation for primary
- Simplified animations
- Single-column layouts
- Drawer overlays (doesn't push)

### Tablet (641px - 1024px)
- Mix of mobile and desktop patterns
- Side panels work well
- Hover available but optional
- Touch + keyboard both supported
- Adaptive navigation
- Medium complexity animations
- Split views possible

### Desktop (1025px+)
- Hover interactions rich
- Right-click context menus
- Keyboard shortcuts essential
- Multi-window patterns
- Side-by-side layouts
- Complex animations acceptable
- Cursor feedback detailed
- Toolbars and menu bars

---

## IMPLEMENTATION PRIORITY

### Phase 1 - Core Interactions (MVP)
1. Primary modal/sheet pattern
2. Basic navigation
3. Form validation
4. Success/error feedback
5. Loading states

### Phase 2 - Enhancement
6. Gesture support
7. Advanced navigation
8. Animation polish
9. Contextual actions
10. Keyboard shortcuts

### Phase 3 - Delight
11. Micro-interactions
12. Celebrations
13. Advanced gestures
14. Sophisticated transitions
15. Power user features

---

## DESIGN SYSTEM INTEGRATION

### Document in Design System:
- When to use each pattern
- Platform-specific variants
- Accessibility requirements
- Animation specifications
- Code examples
- Do's and don'ts
- Common mistakes
- Alternative patterns

### Component Library Should Include:
- Base interaction components
- Animation timing constants
- Gesture handlers
- Focus management utilities
- Keyboard shortcut system
- Accessibility helpers
- Mobile/desktop variants
- Usage examples

---

## CONCLUSION

This interaction patterns library provides 104 comprehensive patterns for building modern, intuitive user interfaces. Key principles:

1. **Platform-appropriate** - Use patterns that fit the platform
2. **Accessibility-first** - Every pattern needs keyboard/screen reader support
3. **Mobile considerations** - Touch targets, gestures, alternative patterns
4. **Performance-aware** - Optimize heavy patterns, prioritize perceived performance
5. **User expectations** - Follow platform conventions when possible
6. **Progressive enhancement** - Start simple, enhance for capable devices

Use these patterns as building blocks, combining them thoughtfully to create cohesive, delightful user experiences that work across devices and contexts.

---

**Last Updated:** 2025  
**Version:** 1.0  
**Companion to:** Semantic Design Patterns Library v1.0  
**License:** Open for use and modification
