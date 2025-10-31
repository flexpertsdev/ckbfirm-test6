# UX Flows & User Journeys Library v1.0
**Companion to Semantic Design Patterns & UX Interaction Patterns Libraries**

A comprehensive catalog of complete user flows, interaction sequences, and multi-step journeys that combine individual patterns into cohesive experiences.

---

## TABLE OF CONTENTS

1. [CRUD Flows (Create, Read, Update, Delete)](#crud-flows)
2. [Navigation & Discovery Flows](#navigation--discovery-flows)
3. [Selection & Action Flows](#selection--action-flows)
4. [Content Management Flows](#content-management-flows)
5. [Form & Data Entry Flows](#form--data-entry-flows)
6. [Media Interaction Flows](#media-interaction-flows)
7. [Social Interaction Flows](#social-interaction-flows)
8. [E-commerce & Transaction Flows](#e-commerce--transaction-flows)
9. [Onboarding & Setup Flows](#onboarding--setup-flows)
10. [Search & Filter Flows](#search--filter-flows)
11. [Authentication & Security Flows](#authentication--security-flows)
12. [Error & Recovery Flows](#error--recovery-flows)

---

## CRUD FLOWS

### #1 Quick Create Flow (Bottom Sheet)
**User Journey:** Tap FAB → Bottom sheet slides up → Fill form → Tap save → Success → Sheet slides down → New item appears in list

**Pattern Sequence:**
1. **Trigger:** FAB (#89) or "+" button in navigation
2. **Entry:** Bottom Sheet (#9) slides up from bottom (300ms spring animation)
3. **Content:** Form fields with floating labels (#89), inline validation (#53)
4. **Action:** Primary "Create" button (disabled until valid)
5. **Processing:** Button shows spinner (#44), form disabled
6. **Success:** Success checkmark animation (#45) briefly
7. **Exit:** Sheet slides down (300ms)
8. **Result:** New item appears in list with subtle highlight animation
9. **Feedback:** Toast notification (#5) "Item created" with undo option (#42)

**Mobile Specifics:**
- Sheet has drag handle for swipe-to-dismiss
- Keyboard pushes sheet up (no overlap)
- Swipe down to dismiss (with unsaved changes warning)
- Haptic feedback on success

**Desktop Adaptation:**
- Center modal (#1) instead of bottom sheet
- Keyboard shortcuts (Cmd+N to open, Cmd+Enter to save)
- Tab key navigation through fields
- Escape to cancel

**Accessibility:**
- Focus immediately on first field
- Required fields announced
- Validation errors announced
- Success state announced
- Focus returns to trigger button

**Error Handling:**
- Validation errors inline (#53)
- Network error → Toast with retry button
- Server error → Error state in sheet with retry

**Use Cases:** Quick add task, create event, new note, add contact, compose message

---

### #2 Inline Edit Flow
**User Journey:** Click text → Becomes input → Edit → Save (auto or manual) → Returns to display mode

**Pattern Sequence:**
1. **Trigger:** Click/tap on editable text (hover shows edit icon on desktop)
2. **Transition:** Text morphs to input field (200ms), cursor positioned, text selected
3. **Edit Mode:** Input field with inline validation (#53), save/cancel icons appear
4. **Auto-save Option A:** Debounced save while typing, "Saving..." indicator (#50)
5. **Manual Save Option B:** Enter key or checkmark button to save
6. **Success:** Input morphs back to text (200ms), brief success indicator
7. **Cancel:** Escape key or X button reverts changes instantly

**Mobile Specifics:**
- Larger touch target (44px minimum)
- Keyboard appears immediately
- Done button in keyboard to save
- Tap outside to cancel (with confirmation if changed)

**Desktop Features:**
- Hover reveals edit affordance
- Double-click alternative trigger
- Tab to next editable field
- Keyboard shortcuts (Cmd+E to edit)

**Accessibility:**
- aria-live for edit mode announcement
- Screen reader announces "Editing [field name]"
- Save/cancel clearly labeled
- Focus trapped in edit mode

**Error Handling:**
- Validation error appears below field
- Field remains in edit mode
- Previous value preserved
- Clear error recovery path

**Use Cases:** Edit title, change description, update price, modify settings, rename file

---

### #3 View Details Flow
**User Journey:** Tap list item → Detail view slides in → Read/scroll → Tap back → Return to list

**Pattern Sequence:**
1. **Trigger:** Tap card/list item (with tap highlight feedback)
2. **Transition:** 
   - **Mobile:** New screen slides in from right (300ms) or bottom sheet expands to full
   - **Desktop:** Side panel (#10) slides in from right (300ms) or modal (#1) opens
3. **Content:** Detail view with header (back button, title, actions)
4. **Scroll:** Independently scrollable content, header can collapse/sticky
5. **Actions:** Edit, delete, share buttons in header or bottom
6. **Exit:** 
   - Back button (top-left mobile, X desktop)
   - Swipe from left edge (iOS pattern)
   - Click outside (desktop side panel)
   - Escape key (desktop)

**Mobile Specifics:**
- Edge swipe to go back
- Large tap targets for actions
- Bottom action bar for primary actions
- Pull down to close (bottom sheet variant)

**Desktop Features:**
- Side-by-side view (master-detail) on wide screens
- Arrow keys to navigate between items
- Keyboard shortcuts for actions
- URL updates for deep linking

**Accessibility:**
- Focus moves to detail header
- Back button clearly labeled
- Content structure with proper headings
- Skip to actions link

**State Management:**
- Remember scroll position in list
- Preserve list filters when returning
- Update list item if details changed
- Handle deleted item gracefully

**Use Cases:** Email message, product details, user profile, article, contact info

---

### #4 Swipe to Delete Flow
**User Journey:** Swipe item left → Delete action reveals → Full swipe or tap delete → Confirm → Item removes with animation

**Pattern Sequence:**
1. **Trigger:** Swipe list item left (iOS) or right (varies) (#81)
2. **Reveal:** Delete button slides in behind item (red background)
3. **Partial Swipe:** Item slides with finger, revealing action
4. **Threshold Decision:**
   - **Partial:** Release snaps back or to revealed state
   - **Full Swipe:** Triggers immediate delete (if configured)
5. **Confirmation Option A (Immediate):** 
   - Item animates out (300ms slide + fade)
   - Gap closes smoothly
   - Toast with undo appears (#42)
6. **Confirmation Option B (Dialog):**
   - Confirmation dialog appears (#41)
   - "Delete [item name]?" with Cancel/Delete
   - Delete triggers animation
7. **Undo Window:** 5-second toast with undo button
8. **Permanent:** After timeout, delete is final, toast dismisses

**Mobile Specifics:**
- Haptic feedback at delete threshold
- Color changes to red at threshold
- Multiple action buttons possible (archive, delete, more)
- Fast swipe triggers immediately
- Slow swipe waits for button tap

**Desktop Adaptation:**
- Right-click context menu instead
- Hover reveals delete button
- Keyboard shortcut (Delete key)
- Confirmation dialog on desktop

**Accessibility:**
- Alternative delete button always visible or in menu
- Swipe gesture not required method
- Deletion announced to screen reader
- Undo option keyboard accessible

**Error Handling:**
- Network failure: Item returns, error toast
- Server error: Retry option in toast
- Sync conflict: Show conflict resolution

**Variants:**
- **Archive instead of delete:** Green/blue color, "Archived" toast
- **Multiple actions:** Swipe reveals menu of actions
- **Two-stage:** Swipe reveals, second tap confirms

**Use Cases:** Delete email, remove item from list, clear notification, remove from cart

---

### #5 Long-Press to Delete Flow
**User Journey:** Press and hold item → Context menu appears → Tap delete → Confirm → Item removes

**Pattern Sequence:**
1. **Trigger:** Press and hold list item (500-700ms)
2. **Feedback:** Item scales slightly (1.05x), haptic feedback (#82)
3. **Context Menu:** Action sheet appears (#13) or context menu (#91)
4. **Actions Listed:**
   - Edit
   - Share
   - **Delete** (destructive style - red text)
   - Cancel
5. **Select Delete:** Tap delete option
6. **Confirmation:** 
   - Alert dialog: "Delete [item]?"
   - Cancel / Delete buttons
   - Delete button in red (destructive)
7. **Execute:** 
   - Dialog dismisses
   - Item animates out (scale down + fade, 300ms)
   - Gap closes smoothly
   - Success toast appears (#5)
8. **Undo Option:** Toast with undo button (5-10 seconds)

**Mobile Specifics:**
- 500ms long-press duration
- Haptic feedback on menu open
- Touch-friendly menu items (56px min)
- Bottom sheet on mobile (#9)
- Swipe to dismiss menu

**Desktop Adaptation:**
- Right-click primary method
- Long-press on touchscreen devices
- Keyboard menu key
- Hover reveals delete button

**Accessibility:**
- Alternative delete button in visible UI
- Menu announced when opens
- Arrow keys navigate menu
- Enter selects, Escape cancels
- Deletion announced

**Confirmation Levels:**
- **Low Risk:** No confirmation, just undo toast
- **Medium Risk:** Simple confirmation dialog
- **High Risk:** Type to confirm, extra warning

**Use Cases:** Delete photo, remove contact, delete file, remove account, archive conversation

---

### #6 Bulk Delete Flow
**User Journey:** Long-press item → Selection mode → Select multiple → Tap delete → Confirm → Items remove

**Pattern Sequence:**
1. **Entry Trigger:** Long-press first item (500ms) (#92)
2. **Mode Change:**
   - Checkboxes appear on all items (200ms stagger)
   - Top bar morphs to selection toolbar (#96)
   - Shows "1 selected" counter
   - Cancel / Select All buttons appear
   - Delete button appears (disabled if none selected)
3. **Selection:**
   - Tap items to toggle checkboxes
   - Count updates: "3 selected"
   - Selected items highlight
   - Checkmark animation on select
4. **Bulk Action:**
   - Tap delete button (enabled when 1+ selected)
   - Confirmation dialog: "Delete 3 items?"
   - Cancel / Delete buttons
5. **Execute:**
   - Dialog dismisses
   - Selected items animate out simultaneously (staggered 50ms)
   - Gaps close smoothly
   - Success toast: "3 items deleted" with undo (#42)
6. **Exit Selection Mode:**
   - Tap Cancel or back button
   - Checkboxes fade out
   - Toolbar morphs back to normal
   - All items deselect

**Mobile Specifics:**
- Long-press enters mode
- Haptic feedback on mode entry
- Bottom action bar with delete
- Easy cancel from top bar
- Swipe gestures disabled in selection mode

**Desktop Features:**
- Checkbox column always visible (hover reveals)
- Shift+click for range selection
- Cmd/Ctrl+click for individual
- Select All keyboard shortcut
- Toolbar appears at top

**Accessibility:**
- Selection mode announced
- Item count announced
- Each selection announced
- Bulk action clearly described
- Focus management maintained

**Advanced Features:**
- Select all / Deselect all
- Inverse selection
- Select by filter
- Preview selection
- Export selection

**Use Cases:** Delete multiple emails, remove photos, clear notifications, manage files, bulk archive

---

### #7 Edit Mode Toggle Flow
**User Journey:** Tap edit button → Interface becomes editable → Make changes → Tap done → Changes save → Return to view mode

**Pattern Sequence:**
1. **Trigger:** Tap "Edit" button (top-right typical)
2. **Transition (200ms):**
   - Edit button → "Done" button
   - Editable fields gain borders/backgrounds
   - Action buttons appear (reorder, delete handles)
   - Optional: Interface tint/color shift
3. **Edit Mode:**
   - All editable fields active
   - Drag handles visible for reordering (#61)
   - Delete buttons visible (- circles)
   - Add buttons appear if applicable
4. **Making Changes:**
   - Inline edits update immediately
   - Reorder via drag with live preview
   - Delete with confirmation
   - Add opens bottom sheet (#9) or inline
5. **Save Decision:**
   - **Option A (Auto-save):** Changes save continuously, "Done" just exits
   - **Option B (Batch save):** "Done" saves all changes
   - **Option C (Confirm):** "Done" → Confirmation if changes made
6. **Exit:**
   - Tap "Done" button
   - Transition back (200ms reverse)
   - Success indicator if batch save
   - Changes reflect immediately

**Mobile Specifics:**
- Clear edit/done affordance
- Large touch targets for actions
- Drag handles for reordering
- Bottom sheet for add actions
- Swipe gestures disabled in edit mode

**Desktop Features:**
- Edit/Done button or keyboard toggle
- Hover reveals edit affordances
- Keyboard shortcuts for actions
- Tab navigation between fields
- Save prompt if navigating away

**Accessibility:**
- Mode change announced
- Editable fields announced
- Action buttons labeled clearly
- Focus management
- Unsaved changes warning

**Unsaved Changes:**
- Navigate away → Confirmation dialog
- App background → Auto-save draft
- System interruption → Restore state
- Network loss → Offline queue

**Use Cases:** Reorder playlist, edit profile, manage list items, customize dashboard, organize photos

---

### #8 Progressive Delete Confirmation Flow
**User Journey:** Tap delete → Soft warning → Confirm → Hard warning (if critical) → Final confirm → Delete with undo window

**Pattern Sequence:**
1. **Level 1 - Initial Delete Trigger:**
   - User taps delete button
   - **Low Risk Items:** Skip to execution with undo
   - **Medium Risk:** Show Level 2
   - **High Risk:** Show all levels

2. **Level 2 - Standard Confirmation:**
   - Dialog appears: "Delete this item?"
   - Description: What will happen
   - Actions: Cancel (default focus) / Delete (red)
   - User must actively confirm

3. **Level 3 - Critical Confirmation (High Risk Only):**
   - Second dialog: "Are you sure?"
   - Impact statement: "This cannot be undone"
   - Consequences listed
   - Actions: Go Back (default) / Delete (requires conscious choice)

4. **Level 4 - Type to Confirm (Very High Risk):**
   - Dialog with text input
   - "Type 'DELETE' to confirm"
   - Delete button disabled until typed correctly
   - Case-sensitive or not depending on risk

5. **Execution:**
   - All dialogs dismiss
   - Item deletion animation (300ms)
   - Loading if async
   - Success state reached

6. **Undo Window (Low-Medium Risk):**
   - Toast appears: "Item deleted" (#42)
   - Undo button available (5-10 seconds)
   - Progress bar shows time remaining
   - After timeout, truly deleted

**Risk Classification:**
- **Low Risk:** Draft, temporary item, easily recreatable → Undo toast only
- **Medium Risk:** Content item, some effort to recreate → Level 2 confirmation
- **High Risk:** Published content, others affected → Level 2 + 3 confirmations
- **Critical Risk:** Account, all data, irreversible → All levels + type to confirm

**Mobile Specifics:**
- Full-screen alert for critical confirmations
- Clear tap targets
- Destructive actions red
- Cancel always prominent
- Haptic feedback on confirm

**Desktop Features:**
- Modal dialogs
- Enter confirms, Escape cancels
- Focus on cancel by default
- Keyboard navigation
- Remember "Don't ask again" option (low risk only)

**Accessibility:**
- Each level announced
- Consequences clearly stated
- Cancel always easy
- Destructive actions clearly marked
- Screen reader friendly

**Psychology:**
- Default focus on safe option (cancel)
- Destructive actions visually distinct
- Progressive resistance matches risk
- Clear consequences stated
- Undo reduces anxiety for low risk

**Use Cases:**
- Delete email (low - undo)
- Delete project (medium - confirm)
- Delete account data (high - multiple confirms)
- Delete all data (critical - type to confirm)

---

## NAVIGATION & DISCOVERY FLOWS

### #9 Breadcrumb Navigation Flow
**User Journey:** User is deep in hierarchy → Sees breadcrumb trail → Clicks ancestor → Jumps to that level → Context preserved

**Pattern Sequence:**
1. **Display:**
   - Breadcrumb trail visible: Home > Category > Subcategory > Current Page
   - Current page not clickable (just text)
   - All ancestors clickable
   - Separator (>, /, →) between items
   - Truncate long paths with ellipsis (show first, last, and ellipsis)

2. **Interaction:**
   - **Desktop:** Hover highlights clickable items
   - **Mobile:** Adequate touch targets (44px)
   - Click any ancestor to navigate
   - Optional: Dropdown on ellipsis shows full path

3. **Navigation:**
   - Click "Category" for example
   - Page transition (fade or instant depending on implementation)
   - Breadcrumb updates: Home > Category
   - Content loads for that level
   - Scroll position resets to top
   - URL updates

4. **State Management:**
   - Back button works correctly
   - Filters preserved or reset (depending on UX decision)
   - Scroll position of ancestor page preserved or reset
   - Selected item state preserved

**Mobile Adaptations:**
- Collapse to show: < Category > Current
- Back button primary, breadcrumb secondary
- Dropdown for full path
- Horizontal scroll if needed
- Simplified on very small screens

**Desktop Features:**
- Full path always visible (if space)
- Hover shows full item names if truncated
- Keyboard navigation (Tab between items)
- Right-click for context menu
- Path copyable

**Accessibility:**
- nav element with aria-label="Breadcrumb"
- ol/li structure for hierarchy
- aria-current="page" on current item
- Screen reader announces full path
- Keyboard navigable

**Advanced Features:**
- Dropdown menus on breadcrumb items (show siblings)
- Badge counts on ancestor items
- Icons for item types
- Color coding by section
- Search integration

**Use Cases:** E-commerce categories, documentation sections, file systems, org hierarchy, nested settings

---

### #10 Drill-Down Navigation Flow
**User Journey:** View list → Tap category → Slides to nested list → Tap item → Slides to details → Back reverses each step

**Pattern Sequence:**
1. **Level 1 - Top Level:**
   - Grid or list of categories
   - Each with icon, title, chevron (>)
   - Optional: Item counts "Photos (245)"
   - Tap triggers next level

2. **Transition to Level 2:**
   - **Mobile:** Screen slides in from right (300ms) (#25)
   - **Desktop:** Content area transitions
   - Back button appears (top-left)
   - Breadcrumb updates
   - Title shows current category
   - Subtle scale/position animation of tapped card (shared element #27)

3. **Level 2 - Subcategory:**
   - List or grid of subcategories or items
   - Back button to Level 1
   - Search/filter options appear
   - Tap item goes to Level 3 or details

4. **Transition to Level 3:**
   - Same slide-right animation
   - Back button still available
   - Breadcrumb grows: L1 > L2 > L3
   - Navigation stack maintained

5. **Back Navigation:**
   - Tap back button
   - Screen slides from left (reverse, 300ms)
   - Returns to previous level
   - Scroll position restored
   - Selected item still highlighted
   - **OR:** Swipe from left edge (iOS pattern)

6. **Deep Linking:**
   - URL represents full path
   - Can enter at any level
   - Breadcrumb reconstructed
   - Back button works correctly

**Mobile Specifics:**
- Slide transitions feel native
- Edge swipe to go back
- Large tap targets
- Bottom nav persistent across levels
- Maintain scroll position when returning

**Desktop Features:**
- Breadcrumb navigation primary
- Slide can be fade instead
- Hover previews next level (optional)
- Arrow keys navigate siblings
- Keyboard shortcuts (backspace for back)

**Accessibility:**
- Clear heading hierarchy
- Announced level changes
- Back button labeled with destination
- Breadcrumb navigation available
- Focus management between levels

**Visual Stack Indication:**
- Previous level slightly visible at edge
- Depth indicated by shadow/color
- Parent dims/scales back slightly
- Layer effect communicates depth

**State Management:**
- Remember scroll position per level
- Preserve selections when returning
- Cache loaded data
- Handle deleted items gracefully
- Restore filter state

**Use Cases:** Settings app, file browser, category browsing, org chart, nested menus

---

### #11 Tab Navigation Flow
**User Journey:** View tab content → Tap different tab → Content swaps instantly → Swipe between tabs (mobile)

**Pattern Sequence:**
1. **Initial State:**
   - Tab bar visible (top or bottom)
   - Active tab highlighted
   - Content area shows active tab content
   - Other tabs dimmed/unhighlighted

2. **Tab Switch:**
   - **Tap:** User taps different tab
   - **Swipe (Mobile):** User swipes content left/right
   - **Keyboard (Desktop):** Arrow keys or shortcuts

3. **Transition:**
   - **Instant:** Content swaps immediately (0ms)
   - **Crossfade:** Old fades out, new fades in (150ms)
   - **Slide (if swipe):** Content slides with finger (300ms spring)
   - Active tab indicator moves/animates to new tab

4. **Content Load:**
   - If content not loaded: Show skeleton (#35) or spinner
   - If content cached: Instant display
   - Lazy load tab content (only load when activated)
   - Remember scroll position per tab

5. **State:**
   - Active tab persists across sessions (optional)
   - URL updates (optional for deep linking)
   - Browser back navigates between tabs (optional)
   - Each tab maintains independent state

**Mobile Specifics:**
- Swipe between tabs
- Momentum scrolling
- Snap to tab
- Page indicator dots (optional)
- Bottom tab bar for thumb reach
- Touch-friendly tab size (44px min)

**Desktop Features:**
- Hover previews (optional)
- Keyboard arrows switch tabs
- Number shortcuts (1-9 for tabs)
- Right-click for tab context menu
- Drag to reorder tabs (advanced)

**Accessibility:**
- Tab list role with proper ARIA
- arrow keys navigate tabs
- Space/Enter activate tab
- Tab panel associated with tab
- Current tab announced
- Content changes announced

**Tab Variants:**
- **Top Tabs:** Horizontal bar above content
- **Bottom Tabs:** Navigation bar below (mobile)
- **Side Tabs:** Vertical list (desktop)
- **Segmented Control:** iOS-style connected buttons (#17)
- **Pill Tabs:** Rounded separate buttons

**Advanced Features:**
- Badge counts on tabs
- Icons + labels
- Scrollable tab bar (many tabs)
- Collapsible tab groups
- Close tabs (X button)
- Add new tab

**Use Cases:** Settings sections, dashboard views, profile sections, content categories, app navigation

---

### #12 Bottom Sheet Anchor Points Flow
**User Journey:** Tap trigger → Sheet slides to small peek → Drag up to medium → Drag to full-screen → Swipe down through all detents

**Pattern Sequence:**
1. **Trigger:**
   - Tap button, list item, or map marker
   - Or swipe up from bottom edge gesture
   - Backdrop begins to dim

2. **First Detent - Peek (30% height):**
   - Sheet slides up from bottom (300ms spring)
   - Stops at peek height (e.g., 200px)
   - Drag handle visible at top
   - Key information visible (title, preview)
   - Backdrop at 20% opacity
   - Subtle bounce at stop (spring physics)

3. **Drag Detection:**
   - User starts dragging sheet (up or down)
   - Sheet follows finger precisely (1:1)
   - Rubber band effect at edges
   - Velocity tracking for release

4. **Second Detent - Medium (60% height):**
   - If dragged up past threshold with sufficient velocity
   - Or if dragged to ~50% and released
   - Sheet animates to medium height (200ms spring)
   - Snaps to exact position
   - Backdrop darkens to 40% opacity
   - More content visible
   - Haptic feedback at snap (subtle)

5. **Third Detent - Full Screen (100% height):**
   - If dragged up from medium with velocity
   - Sheet expands to full screen (250ms spring)
   - Backdrop at 60% opacity
   - Scrolling inside sheet becomes active
   - Status bar might change color
   - Sheet has own scroll context

6. **Scrolling Behavior:**
   - At full height: Content scrolls normally
   - At medium/peek: 
     - Drag on content drags sheet
     - OR scroll if content scrollable (depends on implementation)
   - Overscroll at top → Drags sheet up to next detent
   - Overscroll at content top → Drags sheet down

7. **Dismiss Flow:**
   - Swipe down from any detent
   - Sheet follows finger
   - If released with downward velocity → Dismisses
   - If released slowly → Snaps to previous detent
   - Sheet slides off screen (300ms)
   - Backdrop fades out
   - Focus returns to trigger element

**Velocity Thresholds:**
- **Fast swipe up (>1000px/s):** Skips to next detent
- **Fast swipe down:** Dismisses immediately
- **Slow drag:** Snaps to nearest detent based on position
- **Mid-velocity:** Considers direction + position

**Visual Feedback:**
- Drag handle dims when near dismiss
- Corner radius decreases at full screen
- Background content scales/dims with sheet height
- Backdrop opacity matches sheet height
- Sheet shadow increases with height

**Mobile Specifics:**
- Native iOS/Android feel
- Haptic feedback at detents
- Smooth 60fps animation
- Gesture conflicts handled (scroll vs drag)
- Landscape adapts (fewer detents)

**Accessibility:**
- Detent positions announced
- Keyboard up/down through detents
- Escape dismisses
- Focus trapped in sheet
- Screen reader announces height changes

**Configuration Options:**
- Custom detent heights (%, px, auto-sized)
- Skip detents with fast velocity
- Allow/disallow dismissal
- Initial detent
- Enable/disable backdrop tap to dismiss
- Lock sheet at detent (no dragging)

**Use Cases:** Maps bottom sheet, music player, shopping cart, filters, quick actions, details

---

### #13 Drawer Push vs Overlay Flow
**User Journey:** Tap menu → Drawer behavior depends on screen size → Desktop pushes content, mobile overlays

**Pattern Sequence:**

**Mobile Flow (Overlay):**
1. **Trigger:** Tap hamburger menu icon
2. **Transition:**
   - Backdrop fades in (60% black, 200ms)
   - Drawer slides in from left (300ms deceleration)
   - Main content remains in place
   - Drawer overlays content at z-index above
3. **Drawer State:**
   - Drawer 80% screen width (max 320px)
   - Main content still partially visible (dimmed)
   - Swipe right or tap outside to close
4. **Dismiss:**
   - Drawer slides out left (250ms)
   - Backdrop fades out
   - Focus returns to menu button

**Tablet Flow (Hybrid):**
1. **Trigger:** Tap menu icon
2. **Transition:**
   - At narrow widths (< 768px): Overlays like mobile
   - At wider widths: Can push or stay persistent
3. **Adaptive Behavior:**
   - Drawer can dock at certain breakpoints
   - Toggle between overlay and push modes
   - Width adjusts based on available space

**Desktop Flow (Push):**
1. **Trigger:** Click menu icon (or drawer always visible)
2. **Transition (if toggling):**
   - Drawer slides in from left (300ms)
   - Main content simultaneously slides right (300ms)
   - Both animate together in sync
   - No backdrop needed
   - Content area resizes to fit
3. **Persistent State:**
   - Drawer stays open
   - Content area adjusted
   - Drawer has fixed width (250-300px)
   - Collapse to mini-drawer (icons only) option

**Mini-Drawer Variant (Desktop):**
1. **Collapsed State:**
   - 60-80px wide strip visible
   - Shows icons only
   - Text labels hidden
   - Hover shows tooltip
2. **Expand on Hover:**
   - Drawer expands to full width on hover (200ms)
   - Text labels appear
   - Optionally collapses on mouse leave
3. **Toggle to Full:**
   - Click to persist expanded state
   - Icon changes to collapse arrow

**Responsive Breakpoint Logic:**
```
< 640px (Mobile):
  - Always overlay
  - Swipe gesture to open/close
  - 80% width max

640px - 1024px (Tablet):
  - Overlay by default
  - Option to dock on larger tablets
  - Adaptive width

> 1024px (Desktop):
  - Push or persistent
  - Fixed width
  - Mini-drawer option
  - Keyboard shortcuts
```

**Accessibility:**
- Focus traps in overlay mode
- Escape key closes overlay
- Keyboard navigation in drawer
- Skip to main content link
- Drawer toggle announced
- Current page highlighted in menu

**State Management:**
- Remember drawer state (open/closed) per session
- Preserve scroll position in drawer
- Active item persists
- Handles route changes
- Deep linking works

**Use Cases:** App navigation, file browser sidebar, settings menu, tools panel

---

## SELECTION & ACTION FLOWS

### #14 Multi-Select with Actions Flow
**User Journey:** Enter selection mode → Select items → Bulk action bar appears → Choose action → Confirm → Execute → Exit selection mode

**Pattern Sequence:**
1. **Entry (Multiple Methods):**
   - **Method A:** Long-press first item (500ms)
   - **Method B:** Tap "Select" button in header
   - **Method C:** Checkbox mode always visible (desktop)

2. **Selection Mode Active:**
   - UI transforms (200ms):
     - Checkboxes appear on all items (stagger 50ms)
     - Header morphs to selection toolbar
     - Primary nav hides
     - Selection count appears: "0 selected"
     - Action bar appears (bottom mobile, top desktop)
   - First item auto-selected if long-press entry

3. **Selecting Items:**
   - Tap item toggles checkbox
   - Item highlights when selected
   - Count updates: "3 selected"
   - Action buttons enable/disable based on selection:
     - 0 selected: All actions disabled
     - 1 selected: Item-specific actions enabled
     - 2+ selected: Bulk actions only
   - Checkmark animation on select (150ms)
   - Haptic feedback per selection (mobile)

4. **Selection Helpers:**
   - "Select All" button (selects all on current page/view)
   - "Deselect All" button (appears when all selected)
   - Shift-click range select (desktop)
   - Drag to select (optional, desktop)

5. **Action Bar Content:**
   - **Always Visible:** 
     - Selection count
     - Cancel/Close (X) button
   - **Conditional Actions:**
     - Share (1+ items)
     - Download (1+ items)
     - Move to... (1+ items)
     - Delete (1+ items, red/destructive)
     - More actions (overflow menu)

6. **Execute Action:**
   - User taps action button (e.g., Delete)
   - **Confirmation required:**
     - Dialog: "Delete 3 items?"
     - Shows item names if few items
     - Cancel / Delete buttons
   - **No confirmation:**
     - For safe actions (share, download)
     - Immediate execution with feedback

7. **Processing:**
   - Action bar shows progress if needed
   - Progress bar or spinner
   - "Deleting 3 items..." status
   - Items begin animating out or processing indicator

8. **Success:**
   - Selected items update/remove (animation stagger 50ms)
   - Toast notification: "3 items deleted" (#42)
   - Undo button if applicable (5-10 sec window)
   - Auto-exit selection mode OR stay in mode (choice)

9. **Exit Selection Mode:**
   - Tap Cancel/Close button
   - Checkboxes fade out (stagger 50ms reverse)
   - Toolbar morphs back to normal (200ms)
   - All items deselect
   - Normal navigation returns
   - Focus returns to previous context

**Mobile Specifics:**
- Action bar at bottom for thumb reach
- Large checkboxes (44px touch target)
- Haptic feedback on each selection
- Swipe disabled during selection mode
- Pull to deselect all (optional)

**Desktop Features:**
- Checkbox column always visible (or on hover)
- Shift+click for range selection
- Cmd/Ctrl+A for select all
- Keyboard navigation maintains selection
- Toolbar at top
- Right-click still works with selection

**Accessibility:**
- Mode entry announced: "Selection mode active"
- Each selection announced: "Item selected, 3 of 10 selected"
- Action availability announced
- Keyboard select (Space bar)
- Clear exit instructions

**Advanced Features:**
- Filter selection (select only items matching criteria)
- Inverse selection (select all except current)
- Smart suggestions: "Select all photos from July"
- Preview selection
- Save selection as group/collection

**Use Cases:** Email management, photo selection, file operations, playlist editing, contact management

---

### #15 Pinch to Zoom/Rotate Flow
**User Journey:** View image/map → Pinch to zoom in/out → Pan at zoom level → Rotate with two fingers → Double-tap to reset

**Pattern Sequence:**

**Zoom Flow:**
1. **Initial State:**
   - Image/map at fit-to-screen size
   - Double-tap zoom enabled
   - Pinch gesture ready

2. **Pinch Zoom In:**
   - User places two fingers on screen
   - Pinches fingers apart
   - Content scales in real-time (1:1 with gesture)
   - Zooms toward midpoint between fingers
   - Smooth 60fps transform
   - Haptic feedback at 100% (original size) and 200%

3. **Zoom Constraints:**
   - Min zoom: 50% (or fit-to-screen)
   - Max zoom: 400% (or actual size for images)
   - Rubber band effect at limits (bounces back)
   - Momentum zoom if released with velocity

4. **Pinch Zoom Out:**
   - User pinches fingers together
   - Content scales down
   - Zooms out from midpoint
   - Can zoom out to min, then dismisses (optional)

5. **Pan While Zoomed:**
   - Single finger drag to pan
   - Content follows finger 1:1
   - Rubber band at edges
   - Momentum scrolling on release
   - Bounces back to bounds

6. **Double-Tap Zoom:**
   - **At min zoom:** Double-tap zooms to 200% at tap point
   - **At mid zoom:** Double-tap zooms to 100% (actual size)
   - **At max zoom:** Double-tap returns to min zoom (fit-to-screen)
   - Smooth animation (300ms ease-out)
   - Tap point becomes center of zoom

**Rotate Flow:**
1. **Rotation Gesture:**
   - Two fingers on screen
   - Rotate fingers like turning a dial
   - Content rotates in real-time
   - Free rotation or snap to 90° angles (configurable)
   - Haptic feedback at 0°, 90°, 180°, 270°

2. **Rotation Constraints:**
   - Full 360° rotation OR
   - Limited range (e.g., ±45° for maps)
   - Snap to cardinal directions (optional)
   - Momentum rotation on release

3. **Combined Gestures:**
   - Pinch + rotate simultaneously works
   - Pan + zoom with two fingers
   - All gestures feel natural together
   - No conflicts

**Reset Flow:**
1. **Reset Triggers:**
   - Double-tap when at max zoom
   - "Reset" button in UI
   - Pinch beyond min zoom threshold
   - Escape key (desktop)

2. **Reset Animation:**
   - Smoothly animate back to original state (400ms)
   - Position, zoom, and rotation all reset
   - Spring physics for natural feel
   - Can interrupt mid-animation

**Mobile Specifics:**
- Native photo viewer feel
- Smooth 60fps transforms
- Haptic feedback at key points
- Works in portrait and landscape
- Status bar hides when zoomed
- Share/edit buttons persist

**Desktop Features:**
- Trackpad pinch gesture
   - Mouse wheel zoom
   - Hold Space + drag to pan
   - Keyboard zoom (+/- keys)
   - Reset button visible

**Accessibility:**
- Zoom controls (+ / - buttons)
- Reset button
- Zoom level announced
- Keyboard zoom support
- Alternative to gestures available

**Performance:**
- GPU-accelerated transforms
- Lazy load high-res at zoom levels
- Progressive image loading
- Smooth 60fps mandatory
- Low-res placeholder while zooming

**Advanced Features:**
- Zoom to selection/region
- Zoom to fit (smart framing)
- Lock aspect ratio
- Grid overlay at high zoom
- Show zoom percentage

**Use Cases:** Photo viewer, maps, PDF viewer, design tools, medical imaging, microscope view

---

### #16 Swipe Up to Create Flow
**User Journey:** User at content limit (bottom of list or dedicated area) → Swipe up → Create sheet appears → Fill form → Submit → New item appears

**Pattern Sequence:**
1. **Context:**
   - User scrolled to bottom of list
   - Or in a dedicated creation zone
   - Or swipe up gesture recognized at bottom edge

2. **Gesture Recognition:**
   - User swipes up from bottom (100px threshold)
   - Peek of create sheet follows finger during swipe
   - If released before threshold: Bounces back
   - If released after threshold: Continues to open
   - Or fast velocity triggers open immediately

3. **Sheet Opens:**
   - Bottom sheet (#9) slides up to first detent (40% height)
   - Spring animation (300ms)
   - Backdrop fades in (40% opacity)
   - Focus moves to first form field
   - Keyboard appears (mobile)
   - Haptic feedback

4. **Form Interaction:**
   - Fill required fields
   - Inline validation (#53)
   - Can drag sheet to expand for more space
   - Can drag down to dismiss (with unsaved warning)

5. **Submission:**
   - Tap "Create" button
   - Button shows loading spinner
   - Form disabled during submission
   - Optimistic UI: Sheet begins closing

6. **Success:**
   - Sheet slides down and dismisses (250ms)
   - New item appears at top of list with highlight animation
   - Smooth insertion (other items slide down)
   - Success toast: "Item created" (#5)
   - Focus returns to new item

7. **Alternative: Expand to Full Form:**
   - If complex creation needed
   - Drag sheet to full screen
   - Or tap "Full Screen" button
   - Transitions to full create view
   - Back button saves draft or cancels

**Gesture Variations:**
- **Swipe up from list bottom:** Creates related item
- **Swipe up from tab bar:** Creates item for that tab
- **Swipe up from empty state:** Creates first item
- **Swipe up from FAB area:** Alternative to tap FAB

**Mobile Specifics:**
- Gesture discovery (show hint on first visit)
- Haptic feedback on threshold
- Spring physics feels native
- Keyboard doesn't cover form
- Portrait/landscape adaptive

**Desktop Adaptation:**
- Scroll to bottom → "+ Create" button appears
- Keyboard shortcut (Cmd+N)
- Click animation mimics swipe up
- Modal instead of bottom sheet

**Accessibility:**
- Create button always available (not gesture-only)
- Keyboard shortcut to create
- Screen reader announces create mode
- Focus management
- Gesture not required

**Error Handling:**
- Network error: Sheet stays open, retry button
- Validation error: Highlight field, sheet stays open
- Server error: Error message, stay in form

**Use Cases:** Add task, create note, new email, add photo, post content, quick capture

---

## CONTENT MANAGEMENT FLOWS

### #17 Reorder List Items Flow
**User Journey:** Enter edit mode → Long-press item → Drag to new position → Drop → Order saves → Visual feedback → Exit edit mode

**Pattern Sequence:**
1. **Enter Edit Mode:**
   - Tap "Edit" button (top-right)
   - Or long-press any item to auto-enter (optional)
   - **Transition (200ms):**
     - Reorder handles appear on right (☰ icon)
     - Delete buttons appear on left (⊖ red circle)
     - Items slightly indent to make room
     - "Done" button replaces "Edit"

2. **Initiate Drag:**
   - Long-press drag handle (300ms)
   - Or long-press anywhere on item (if no handle)
   - **Visual Feedback:**
     - Item scales up slightly (1.05x)
     - Item gains shadow (elevation)
     - Item separates from list (z-index up)
     - Haptic feedback (strong)
     - Slight vibration on Android

3. **Dragging State:**
   - Item follows finger/cursor precisely
   - Other items create space for it
   - **Gap Animation:**
     - Items smoothly slide up/down (200ms ease-out)
     - Gap appears at potential drop position
     - Previous gap closes smoothly
   - Visual indicator (horizontal line) shows drop position
   - Auto-scroll at list edges if dragging near boundary

4. **Drop Position Calculation:**
   - Track which item is being hovered over
   - Calculate if above or below midpoint
   - Update placeholder position accordingly
   - Other items reflow in real-time

5. **Drop:**
   - User releases touch/mouse
   - **Animation:**
     - Dragged item smoothly moves to new position (300ms spring)
     - Scale returns to 1.0
     - Shadow reduces to normal
     - Other items settle into final positions
     - Haptic feedback (light)
   - **Save:**
     - Order saves immediately (auto-save #50)
     - Or saves on "Done" (batch save)
     - "Saving..." indicator briefly

6. **Success:**
   - Item locks into new position
   - Brief highlight animation (pulse or color flash, 200ms)
   - Can continue reordering other items
   - Or tap "Done" to exit edit mode

7. **Exit Edit Mode:**
   - Tap "Done" button
   - **Transition (200ms):**
     - Reorder handles fade out
     - Delete buttons fade out
     - Items unindent to full width
     - "Edit" button returns
   - New order persists

**Multi-Platform Behavior:**

**Mobile (Touch):**
- Long-press to drag
- Haptic feedback critical
- Drag handles recommended (easier)
- Swipe left for delete (alternative to buttons)
- Auto-scroll at edges
- Large touch targets (44px min)

**Desktop (Mouse):**
- Hover shows drag handle
- Click and drag handle
- Or drag entire item (if no handle)
- Keyboard shortcuts:
  - Alt+↑ to move item up
  - Alt+↓ to move item down
  - Numbers to jump to position
- Smooth animations

**Tablet (Both):**
- Support both touch and mouse
- Adapt handle size for input type
- Hover effects for mouse
- Touch affordances for fingers

**Accessibility:**
- Alternative: "Move Up" / "Move Down" buttons
- Keyboard navigation:
  - Enter edit mode (Tab to Edit button)
  - Focus item (arrow keys)
  - Press Space to "pick up"
  - Arrow keys to move position
  - Space again to "drop"
- Screen reader announces:
  - "Edit mode active"
  - "Item picked up from position 3"
  - "Item moved to position 5"
  - "Order saved"

**Visual Indicators:**
- Drag handle (☰) indicates draggable
- Cursor changes to grab hand
- Placeholder line or gap shows drop position
- Dragged item elevated visually
- Other items respond in real-time

**Advanced Features:**
- Drag between sections/categories
- Multi-select drag (move several at once)
- Snap to positions (ordered snapping)
- Undo reorder (toast with undo #42)
- Drag to delete (off screen edge)
- Nested list reordering (handle depth)

**Error Handling:**
- Save failure: Revert to previous order, error toast, retry option
- Network loss: Queue change, sync when online
- Conflict: Show conflict resolution UI
- Invalid position: Prevent drop, bounce back

**Use Cases:** Playlist reorder, priority list, dashboard widgets, navigation menu, photo album, task list

---

### #18 Archive vs Delete Flow
**User Journey:** User wants to remove item → Chooses archive OR delete → Different confirmations → Different recovery options

**Flow Comparison:**

**Archive Flow (Soft Delete):**
1. **Trigger:**
   - Swipe reveals "Archive" button (blue/green)
   - Or tap archive icon in actions
   - Or keyboard shortcut (E for email)

2. **Action:**
   - **No confirmation needed** (easily reversible)
   - Item immediately animates out (slide + fade, 300ms)
   - Gap closes smoothly
   - Item moves to "Archived" folder/view
   - Toast appears: "Item archived" with Undo button (#42)

3. **Undo Window:**
   - 5-10 second undo window
   - Tap undo → Item returns to list
   - After timeout → Archived permanently (until unarchived)

4. **Recovery:**
   - Navigate to "Archived" view
   - Find item (search/browse)
   - Tap "Unarchive" button
   - Item returns to original location
   - Or bulk unarchive multiple

5. **Characteristics:**
   - Fast, no friction
   - Easily reversible
   - Items preserved indefinitely (or until auto-delete policy)
   - Good for "might need later"
   - Keeps data

**Delete Flow (Hard Delete):**
1. **Trigger:**
   - Swipe reveals "Delete" button (red)
   - Or tap delete icon (trash can)
   - Or keyboard shortcut (Delete key)

2. **Confirmation:**
   - **Important Items:** Dialog appears
     - "Delete this item?"
     - "This cannot be undone" (or can if trash exists)
     - Cancel / Delete buttons
   - **Routine Items:** May skip confirmation if undo available

3. **Action:**
   - Item animates out (scale down + fade, 300ms)
   - Gap closes smoothly
   - Item moves to "Trash" (if available) or deleted immediately
   - Toast: "Item deleted" with Undo button (if trash exists)

4. **Trash / Recently Deleted:**
   - Items stay in trash for 30 days (typical)
   - Can recover from trash during this period
   - Auto-delete after 30 days
   - Can manually "Empty Trash"

5. **Permanent Delete:**
   - After trash period OR
   - If user empties trash manually
   - **Requires Strong Confirmation:**
     - "Permanently delete [X] items?"
     - "This CANNOT be undone"
     - Type to confirm for critical data
   - Truly removes data

6. **Characteristics:**
   - More friction (intentional)
   - Recovery window limited
   - Frees up space
   - Good for "definitely don't need"
   - Eventually removes data

**Decision Matrix for Users:**

| Scenario | Recommended Action |
|----------|-------------------|
| Completed task | Archive (might reference later) |
| Old email might need | Archive (searchable history) |
| Spam email | Delete (no value) |
| Completed project | Archive (documentation value) |
| Duplicate file | Delete (redundant) |
| Old photo | Archive (memories, storage) |
| Blurry photo | Delete (no value) |
| Read notification | Archive (may review) |
| Irrelevant notification | Delete (clutter) |

**UI Differentiation:**

**Archive:**
- Blue or neutral color
- Box/folder icon
- "Archive" label
- Left swipe typically
- Less prominent placement

**Delete:**
- Red (destructive) color
- Trash can icon
- "Delete" label
- Right swipe or long-press menu
- More prominent (ironically, to be careful)

**Hybrid Flow (Both Available):**
1. **Swipe Actions:**
   - Swipe left: Archive (blue)
   - Swipe right: Delete (red)
   - Or both revealed on single swipe direction

2. **Context Menu:**
   - Long-press shows both options
   - Archive at top (safe default)
   - Delete at bottom (destructive position)
   - Clear visual distinction

3. **Toolbar Actions:**
   - Both buttons available when item selected
   - Archive (neutral style)
   - Delete (destructive style)
   - Clear choice presented

**Mobile Specifics:**
- Swipe gestures for both
- Color coding critical
- Haptic feedback differs:
  - Archive: Light single tap
  - Delete: Medium double tap
- Undo toast for both
- Clear visual difference

**Accessibility:**
- Both actions keyboard accessible
- Clear labels distinguish them
- Consequences announced
- Undo always available
- Screen reader differentiates severity

**Business Logic:**
- Archive: Quick, forgiving, keeps data, user-friendly
- Delete: Cautious, confirms, removes data, deliberate

**Use Cases:**
- **Email:** Archive read emails, delete spam
- **Photos:** Archive old photos, delete bad ones
- **Tasks:** Archive completed, delete irrelevant
- **Files:** Archive projects, delete temp files
- **Notes:** Archive old notes, delete drafts

---

### #19 View → Edit Inline Flow
**User Journey:** View content → Click to edit → Edit in place → Save → Return to view mode seamlessly

**(Already covered in detail as Flow #2 - Inline Edit Flow)**

Summary: Click text → becomes input → edit → save/cancel → returns to text display

---

### #20 Categorize/Tag Content Flow
**User Journey:** Select item → Open category picker → Search/browse categories → Select one or multiple → Save → Item tagged → Appears in category view

**Pattern Sequence:**
1. **Trigger:**
   - Tap "Add to..." or "Categorize" button
   - Or tap category chip on item (shows all categories)
   - Or keyboard shortcut (T for tag, C for category)
   - Or during create flow (optional categorization)

2. **Category Picker Opens:**
   - **Mobile:** Bottom sheet (#9) slides up to 60% height
   - **Desktop:** Modal (#1) or dropdown depending on space
   - Shows current categories (if any) with checkmarks
   - Search bar at top (if many categories)
   - List or grid of categories below

3. **Category Display:**
   - **Existing Categories:**
     - Scrollable list/grid
     - Icons + labels
     - Checkboxes or toggle chips (#18)
     - Already-applied categories checked
   - **Search:**
     - Type to filter categories
     - Fuzzy search
     - Results update in real-time
   - **Create New:**
     - "+ Create Category" option
     - Inline input field appears
     - Create and apply in one action

4. **Selection Behavior:**
   - **Single-Select Mode:**
     - Radio buttons or visual cards
     - Previous selection deselects
     - Immediate visual feedback
   - **Multi-Select Mode:**
     - Checkboxes or toggle chips
     - Multiple can be selected
     - Count shows: "3 selected"

5. **Interactive Feedback:**
   - Tap category to toggle
   - Checkmark animates in (150ms)
   - Category chips fill color when selected
   - Haptic feedback (light tap)
   - Selected count updates

6. **Apply/Save:**
   - **Option A (Auto-save):**
     - Each selection saves immediately
     - "Saving..." indicator appears
     - Sheet stays open for more selections
     - "Done" button closes sheet
   - **Option B (Batch Save):**
     - Selections tracked locally
     - "Apply" button at bottom
     - Tap to save all changes
     - Sheet closes automatically

7. **Success:**
   - Sheet dismisses (or stays open if auto-save)
   - Item now shows category badges/chips
   - Toast confirmation: "Added to [Category]"
   - Item appears in category filtered view
   - UI updates to reflect new categorization

8. **Category View:**
   - Navigate to category from item
   - Or browse category from main nav
   - Filtered view shows all items in category
   - Breadcrumb: All Items > [Category] > Item

**Advanced Features:**

**Hierarchical Categories:**
- Parent/child category relationships
- Drill-down selection
- Breadcrumb in picker
- Auto-select parent when child selected (optional)

**Smart Suggestions:**
- Recently used categories at top
- AI-suggested categories based on content
- "Others like this are in..." suggestions
- Auto-tag based on keywords

**Bulk Categorization:**
- Select multiple items (#92)
- Apply categories to all at once
- Batch operation with progress
- Confirmation: "Categorize 12 items?"

**Color Coding:**
- Categories have colors
- Visual differentiation
- Category chips show color
- Filter by color (optional)

**Category Management:**
- Create new inline
- Edit existing (rename, change color)
- Delete unused (with reassignment)
- Merge categories
- Reorder categories

**Mobile Specifics:**
- Bottom sheet with search
- Chip-based selection (touch-friendly)
- Swipe down to dismiss
- Large touch targets (44px)
- Search keyboard appears automatically

**Desktop Features:**
- Dropdown or modal
- Keyboard shortcuts (number keys)
- Type to search immediately
- Hover previews category contents
- Right-click for category options

**Accessibility:**
- Clear category labels
- Selected state announced
- Count announced: "3 categories selected"
- Keyboard navigation (arrows)
- Search keyboard accessible
- Create new accessible

**Performance:**
- Virtual scrolling for many categories (>100)
- Instant search (no debounce needed)
- Cached category list
- Optimistic UI updates

**Undo Flow:**
- Toast with undo after categorization
- 5-second undo window
- Tap undo removes categories
- Can undo bulk operations

**Use Cases:** 
- Email: Add labels/folders
- Photos: Add albums/tags
- Notes: Organize by notebook
- Tasks: Assign to projects
- Products: Assign to collections
- Files: Move to folders
- Bookmarks: Save to lists

---

## FORM & DATA ENTRY FLOWS

### #21 Multi-Step Form with Progress Flow
**User Journey:** Start form → Complete step 1 → Progress indicator advances → Step 2 → Continue through all steps → Review → Submit → Success

**Pattern Sequence:**
1. **Form Entry:**
   - User clicks "Get Started" or similar CTA
   - Form opens (modal #1, full screen, or dedicated page)
   - Progress indicator appears at top
   - Shows: Step 1 of 5, or progress bar at 20%
   - First step content loads

2. **Step 1 - Initial Fields:**
   - Focus automatically on first input
   - 3-5 fields maximum per step (not overwhelming)
   - Inline validation as user types (#53)
   - "Next" button at bottom:
     - Disabled until step valid
     - Enables when all required fields valid
     - Shows spinner if validating
   - "Cancel" or "Save Draft" option

3. **Validation:**
   - Real-time field validation
   - Error messages appear inline
   - Submit attempt highlights all errors
   - Can't proceed until step valid
   - Helpful error messages

4. **Advance to Step 2:**
   - User taps "Next" button
   - **Transition Animation:**
     - Current step slides out left (300ms)
     - Next step slides in from right (300ms)
     - Progress indicator animates forward
     - Progress bar fills (e.g., 20% → 40%)
     - Step number updates (1 of 5 → 2 of 5)
   - New step fields appear
   - Focus on first field
   - "Back" button now visible

5. **Step 2-4 Repeat:**
   - Same pattern for each step
   - User can proceed forward
   - Can go back to previous steps
   - Previous data preserved
   - Can edit previous steps
   - Validation maintains integrity

6. **Back Navigation:**
   - Tap "Back" button
   - Reverse animation (slide right)
   - Previous step restored with data
   - Progress indicator moves back
   - Can edit and re-submit

7. **Step 5 - Review Step:**
   - Summary of all entered data
   - Organized by step/section
   - Edit buttons next to each section
   - "Submit" button prominent at bottom
   - Terms/conditions checkbox (if applicable)
   - Privacy policy link

8. **Edit from Review:**
   - Tap edit button on any section
   - Jump directly to that step
   - Make changes
   - Return to review (auto or manual)
   - Changes reflected in summary

9. **Final Submit:**
   - Tap "Submit" button
   - Button shows loading spinner
   - All inputs disabled
   - Progress indicator shows "Processing..."
   - Form can't be abandoned during submit

10. **Success:**
    - Form closes or transitions to success page
    - Success animation (checkmark #45, confetti #48 for big wins)
    - Success message with next steps
    - Optional: Email confirmation sent
    - CTA for next action
    - Can close/return to app

**Progress Indicator Variations:**

**Type 1 - Step Counter:**
```
○ ● ○ ○ ○
Step 2 of 5
```
- Circles for each step
- Filled circle = current step
- Line connecting steps
- Clear visual of position

**Type 2 - Progress Bar:**
```
[████████░░░░░░░░] 40%
```
- Linear bar fills
- Percentage shown
- Smooth animation
- Clear progress

**Type 3 - Step Labels:**
```
Personal Info → Contact → Payment → Review
     ●             ○          ○         ○
```
- Named steps
- Shows current and upcoming
- Clear context

**Type 4 - Breadcrumb Style:**
```
Personal Info > Contact > Payment > Review
     ✓              •         
```
- Completed steps get checkmark
- Current step highlighted
- Clickable to jump (if allowed)

**Mobile Specifics:**
- One step at a time (no partial views)
- Large "Next" button (full width bottom)
- Progress bar at very top (persistent)
- Can swipe between steps (optional)
- Save draft automatically on step change
- Keyboard dismisses on step change

**Desktop Features:**
- Can show multiple steps at once (optional)
- Sidebar navigation showing all steps
- Click step name to jump (if valid)
- Keyboard Enter to advance
- Keyboard shortcuts (Cmd+→ next, Cmd+← back)
- Save draft auto-saves every 30s

**Accessibility:**
- Each step announced
- Progress announced: "Step 2 of 5"
- Next/Back buttons clearly labeled
- Errors announced when appear
- Can't proceed until valid (clear feedback)
- Form abandonment warning

**State Management:**
- Data persists across steps
- Browser refresh preserves data (localStorage)
- Save draft feature
- Resume later option
- Progress saved to account (if logged in)
- Expire drafts after X days

**Error Handling:**
- Validation error: Stay on step, show errors
- Network error on submit: Stay on review, show error, retry
- Timeout: Save draft, allow resume
- Server error: Clear message, retry option
- Conflict: Show conflict resolution

**Advanced Features:**
- Conditional steps (skip based on answers)
- Branch logic (different paths)
- Step estimation updates (total steps may change)
- Save and resume later
- Send draft via email
- Import data from file/previous submission

**Psychological Considerations:**
- Chunking reduces overwhelm
- Progress visibility motivates completion
- Easy steps first (build momentum)
- Harder steps in middle
- Review step builds confidence
- Can go back reduces anxiety

**Use Cases:**
- Account registration
- Checkout/payment
- Application forms
- Onboarding flows
- Survey/questionnaire
- Product configuration
- Booking/reservation

---

### #22 Smart Form Auto-Fill Flow
**User Journey:** Start form → Browser/app suggests saved data → Accept suggestions → Form fills automatically → Review → Submit

**Pattern Sequence:**
1. **Form Load:**
   - User lands on form
   - Browser detects autocomplete-enabled fields
   - Or app has saved profile data
   - Fields show autocomplete attributes (name, email, address, etc.)

2. **First Field Focus:**
   - User taps/clicks first input (e.g., name field)
   - **Browser Autocomplete:**
     - Dropdown appears below field
     - Shows 1-3 saved options
     - Most recent/frequently used at top
     - Format: "John Doe (john@example.com)"
   - **App Auto-fill:**
     - Toast or banner appears: "Auto-fill from profile?"
     - Quick action button
     - Or automatic with undo

3. **Selection:**
   - **Option A - Select from Dropdown:**
     - User clicks/taps an option
     - That field fills immediately
     - Other related fields auto-fill simultaneously
     - Example: Name selected → Name, email, phone all fill
     - Smooth transition (100ms fade)
   - **Option B - App Auto-fill Accept:**
     - User taps "Auto-fill" button
     - All fillable fields populate at once
     - Staggered animation (50ms delay per field)
     - Visual "filling" effect

4. **Visual Feedback:**
   - Fields that auto-filled get subtle highlight (green tint, 500ms)
   - Values appear with type animation (optional, fast)
   - Focus moves to first non-filled field
   - Or focus stays on current field

5. **Partial Fill:**
   - Some fields auto-fill, others remain empty
   - User completes remaining fields
   - Auto-saved data used where available
   - Manual entry for new/missing data

6. **Edit Auto-Filled Data:**
   - User can edit any auto-filled field
   - Click field to modify
   - Change value
   - Save new value for future (browser stores)
   - Or discard just for this submission

7. **Address Auto-Complete (Special Case):**
   - User starts typing address
   - Google Maps / Address API suggestions appear
   - Dropdown shows matches in real-time
   - Format: "123 Main St, City, State ZIP"
   - Select suggestion → All address fields fill
   - Street, City, State, ZIP, Country all populated
   - Smooth, instant fill

8. **Credit Card Auto-Fill:**
   - User clicks card number field
   - **Browser Saved Cards:**
     - Dropdown shows saved cards
     - Format: "Visa ****1234"
     - Security: Requires device authentication (Face ID, fingerprint)
     - After auth: Card details fill
   - **Digital Wallet:**
     - "Pay with Apple Pay" / "Google Pay" button appears
     - Tap → Authentication → Full fill including address
   - All card fields fill: Number, Expiry, CVV, Name

9. **Review Auto-Filled Data:**
   - User quickly scans filled fields
   - All data visible (not hidden in collapsed sections)
   - Can edit any field
   - Validation still runs (in case saved data now invalid)

10. **Submit:**
    - User taps Submit
    - Standard form submission flow
    - Data sent to server
    - Success confirmation

**Smart Features:**

**Context-Aware Suggestions:**
- Billing address vs Shipping address
- Personal email vs Work email
- Mobile phone vs Home phone
- Suggests most relevant based on field context

**Multi-Profile Support:**
- User has multiple saved addresses
- Dropdown shows all options
- Labels: "Home", "Work", "Mom's House"
- Quick switch between profiles

**Update Saved Data:**
- After editing auto-filled data
- Prompt: "Update saved address?"
- Yes → Saves for future / No → One-time use
- Smart about which changes to save

**Cross-Field Intelligence:**
- ZIP code entered → Auto-fills City, State
- Email entered → Suggests name based on email
- Phone country code → Adjusts format/length validation

**Mobile Specifics:**
- iOS Keychain integration
- Android Google autofill
- Face ID/Fingerprint for sensitive data
- Bottom sheet for selection (instead of dropdown)
- Large touch targets
- Quick fill button prominent

**Desktop Features:**
- Browser native autofill (Chrome, Safari, Firefox)
- Password manager integration (1Password, LastPass)
- Keyboard shortcuts (Cmd+Shift+A to auto-fill)
- Hover shows full saved data
- Right-click to choose profile

**Accessibility:**
- Auto-fill announced to screen reader
- Can navigate suggestions with keyboard
- Enter selects, Escape dismisses
- Auto-fill optional, not required
- Clear labels on all fields

**Privacy & Security:**
- Sensitive data requires authentication
- Credit cards need Face ID/fingerprint
- Users can disable auto-fill per site
- Clear what data is being used
- GDPR/privacy compliant
- User controls what's saved

**Performance:**
- Instant fill (no loading)
- No API calls for local data
- Address API debounced (300ms)
- Smooth animations (60fps)
- No jank or delay

**Error Handling:**
- Invalid saved data: Highlight field, show error
- Address API timeout: Fall back to manual
- Authentication failure: Allow manual entry
- Outdated data: Validation catches, prompts update

**Use Cases:**
- Checkout forms (save 30+ seconds)
- Account registration
- Shipping/billing address
- Contact forms
- Payment information
- Job applications
- Any repetitive form entry

---

## MEDIA INTERACTION FLOWS

### #23 Photo Gallery Browse → View → Share Flow
**User Journey:** Browse thumbnails → Tap photo → Opens full-screen viewer → Swipe between photos → Share → Close returns to gallery

**Pattern Sequence:**
1. **Gallery View (Grid):**
   - Grid of photo thumbnails
   - 3-4 columns on mobile, 4-6 on tablet, 6+ on desktop
   - Square crop thumbnails (consistent size)
   - Lazy load as scrolling (performance)
   - Pinch to adjust grid density (optional)

2. **Select Photo:**
   - Tap thumbnail
   - **Transition (Shared Element #27):**
     - Tapped thumbnail expands to full screen (400ms)
     - Background fades to black
     - UI chrome (nav, toolbar) fades in
     - Other thumbnails fade out
     - Smooth, native-feeling transition

3. **Full-Screen Viewer:**
   - Photo fills screen, aspect-ratio preserved
   - Double-tap to zoom to 200%
   - Pinch to zoom in/out (#83)
   - Pan when zoomed
   - Black background
   - Minimal UI initially:
     - Back button (top-left)
     - Share button (top-right)
     - Photo counter (bottom center): "3 of 24"
   - UI auto-hides after 2 seconds

4. **Show/Hide UI:**
   - Tap photo to toggle UI
   - UI fades in (200ms)
   - Stays visible until:
     - User taps again
     - 2 seconds of inactivity
     - User swipes to next photo
   - UI fades out (200ms)

5. **Swipe Navigation:**
   - Swipe left → Next photo
   - Swipe right → Previous photo
   - **Transition:**
     - Current photo slides out (300ms)
     - Next photo slides in from opposite side
     - Smooth spring physics
     - Counter updates: "4 of 24"
   - Can swipe rapidly (momentum)
   - Peek of next/prev photo visible at edges (optional)

6. **Zoom Interaction:**
   - Double-tap to zoom to 200% (centered on tap point)
   - Pinch to zoom freely (50% to 400%)
   - Pan to explore when zoomed
   - Double-tap again to zoom out
   - Pinch beyond min zoom dismisses viewer (optional)

7. **Share Action:**
   - Tap share button (top-right)
   - **Mobile:**
     - Native share sheet slides up (#13)
     - Shows apps (Messages, Email, Social, etc.)
     - Select app → Shares photo
     - Sheet dismisses
   - **Desktop:**
     - Share modal or dropdown
     - Copy link, Download, Social buttons
     - Click action → Executes
     - Toast confirms: "Link copied" (#5)

8. **Delete Action (if applicable):**
   - Tap trash icon (if edit mode)
   - Confirmation: "Delete this photo?"
   - Delete → Photo removed from gallery
   - Viewer advances to next photo
   - Or closes if last photo
   - Toast: "Photo deleted" with undo (#42)

9. **Info/Details (optional):**
   - Swipe up or tap info icon
   - Bottom sheet slides up with metadata:
     - Date taken
     - Location (map preview)
     - Camera/device info
     - File size, dimensions
     - Tags/albums
   - Sheet dismissable

10. **Close Viewer:**
    - Tap back button
    - OR swipe down (dismissal gesture)
    - **Transition (Reverse Shared Element):**
      - Photo shrinks back to grid position (400ms)
      - Background fades from black
      - Grid reappears
      - Scrolls to ensure photo visible
      - Photo highlighted briefly (pulse)
    - Returns to exact scroll position

**Mobile Specifics:**
- Swipe gestures primary
- Pinch to zoom
- Double-tap zoom
- Swipe down to dismiss
- Native share sheet
- Haptic feedback on actions
- Status bar hides in viewer
- Portrait and landscape support

**Desktop Features:**
- Arrow keys navigate next/prev
- Escape closes viewer
- Mouse wheel to zoom
- Click and drag to pan when zoomed
- Hover shows next/prev arrows at edges
- Keyboard shortcuts (S for share, D for delete)

**Accessibility:**
- Alt text for each photo (read by screen reader)
- Keyboard navigation (arrows, escape)
- Zoom level announced
- Photo counter announced
- Share options keyboard accessible
- Focus management maintained

**Performance:**
- Preload next/prev photos (1 ahead, 1 behind)
- Progressive image loading (blur-up)
- Lazy load thumbnail grid
- GPU-accelerated transitions
- Smooth 60fps animations
- Low-res preview while high-res loads

**Advanced Features:**
- Slideshow mode (auto-advance)
- Compare mode (split view before/after)
- Edit mode (crop, rotate, filters)
- Favorites/like button
- Add to album
- Download original
- EXIF data viewer
- Location on map

**Use Cases:**
- Photo apps (Apple Photos, Google Photos)
- Social media feeds (Instagram, Facebook)
- E-commerce product galleries
- Real estate listings
- Portfolio sites
- Image galleries

---

### #24 Video Player Interaction Flow
**User Journey:** Video card with thumbnail → Tap play → Video loads → Controls appear → Interact with controls → Video ends → Related content suggested

**Pattern Sequence:**
1. **Video Card (Before Play):**
   - Thumbnail image (poster)
   - Large play button overlay (center)
   - Duration badge (bottom-right): "3:24"
   - Title and metadata below
   - Progress bar if partially watched (thin line at bottom)

2. **Play Trigger:**
   - Tap play button
   - OR tap anywhere on thumbnail
   - OR auto-play if scrolled into view (muted)

3. **Loading State:**
   - Play button becomes spinner
   - Poster remains visible
   - Loading indicator: spinner or progress ring
   - Timeout after 10s if not loading (show error)

4. **Video Starts:**
   - **Inline Play:**
     - Video plays in card (feed context)
     - Can scroll away (video pauses or PiP)
   - **Fullscreen Play:**
     - Transitions to fullscreen (300ms)
     - Native fullscreen or custom player
     - Controls overlay on video
   - First frame displays immediately
   - Audio starts (or muted if auto-played)

5. **Controls Overlay:**
   - Appears on play start (2s visible)
   - Auto-hides after 3s of no interaction
   - Tap screen to toggle controls visibility
   - **Controls Include:**
     - Play/Pause button (center)
     - Timeline/scrubber (bottom)
     - Current time / Total duration
     - Volume slider (desktop) or mute button (mobile)
     - Settings (gear icon): quality, speed, captions
     - Fullscreen toggle (expand icon)
     - (Optional) Picture-in-Picture button

6. **Play/Pause:**
   - Tap center or play button → Toggles
   - Spacebar (desktop) → Toggles
   - Visual feedback:
     - Large play/pause icon briefly (center, 500ms fade)
     - Button state changes
     - Timeline continues/pauses

7. **Scrubbing (Seek):**
   - Drag scrubber on timeline
   - **Hover (Desktop):**
     - Hover over timeline shows preview thumbnail
     - Tooltip with timestamp
   - **Drag:**
     - Video seeks in real-time OR
     - Shows preview frame while dragging
     - Release → Jumps to position
   - **Tap (Mobile):**
     - Tap timeline → Jumps to position
     - Visual feedback (ripple)
   - **Keyboard (Desktop):**
     - Arrow left/right: Skip 5s back/forward
     - J/L keys: Skip 10s back/forward

8. **Volume Control:**
   - **Desktop:**
     - Hover over volume icon → Slider appears
     - Drag slider up/down
     - Click mute icon to toggle mute
     - Scroll wheel on icon adjusts volume
   - **Mobile:**
     - Volume controlled by device buttons
     - Mute button available
     - Tap to toggle mute

9. **Settings Menu:**
   - Tap settings (gear) icon
   - Menu slides up (mobile) or dropdown (desktop)
   - **Options:**
     - Playback Speed: 0.5x, 0.75x, 1x, 1.25x, 1.5x, 2x
     - Quality: Auto, 1080p, 720p, 480p, 360p
     - Captions: Off, English, Spanish, etc.
   - Select option → Menu closes → Setting applies
   - Checkmark on selected option

10. **Captions/Subtitles:**
    - If available, shown at bottom-center
    - Styled text (white with black outline)
    - Synced to video
    - Can enable/disable in settings
    - Can adjust size (accessibility)

11. **Fullscreen:**
    - Tap fullscreen icon
    - **Mobile:**
      - Enters native fullscreen
      - Landscape orientation (usually)
      - All device chrome hidden
      - Controls overlay available
    - **Desktop:**
      - Video fills browser window OR
      - Native fullscreen (hides OS UI)
      - Exit with Escape or fullscreen button
    - Exit fullscreen → Returns to previous state

12. **Picture-in-Picture (PiP):**
    - Tap PiP button (if available)
    - Video pops out to floating window
    - User can browse other content
    - Window draggable, resizable
    - Tap to return to full player
    - Swipe to dismiss on mobile

13. **Video Ends:**
    - Final frame + play icon (replay)
    - Controls remain visible
    - **Suggestions Appear:**
      - Overlay with related videos
      - Grid or carousel
      - Auto-play next in X seconds (with countdown)
      - Cancel button to stop auto-play
    - **OR:**
      - Replay button
      - Back to start
      - Share/save options

14. **Related/Next Video:**
    - "Up Next" countdown timer (10s)
    - Shows thumbnail and title of next video
    - Can cancel auto-play
    - Countdown completes → Loads next video
    - Smooth transition (no jarring reload)

15. **Exit Video:**
    - Tap back button
    - OR close fullscreen
    - OR swipe down (mobile)
    - Video pauses
    - Returns to previous context (feed, page)
    - Progress saved (watch later)

**Mobile Specifics:**
- Tap to show/hide controls
- Double-tap left/right to skip 10s
- Swipe up/down for volume (some players)
- Pinch to zoom (fill screen or fit)
- Orientation change → Fullscreen toggle
- Pip mode on app switch
- Haptic feedback on interactions

**Desktop Features:**
- Hover shows controls
- Keyboard shortcuts rich:
  - Space: Play/Pause
  - K: Play/Pause
  - F: Fullscreen
  - M: Mute
  - Arrow keys: Seek
  - Number keys: Jump to %
- Click and drag to scrub
- Volume scroll wheel
- Mini player (theater mode)

**Accessibility:**
- Captions available
- Keyboard fully functional
- Screen reader announces states
- High contrast mode support
- Focus visible on controls
- Audio descriptions (if available)
- Speed adjustable for comprehension

**Performance:**
- Adaptive bitrate streaming
- Preload next video segment
- Efficient buffering
- Low latency start
- Smooth scrubbing
- No dropped frames

**Advanced Features:**
- Chapters/markers on timeline
- Watch progress synced across devices
- Save to watch later
- Download for offline
- Share at current timestamp
- Loop video
- Cast to TV
- Background audio mode

**Use Cases:**
- YouTube/Vimeo style players
- Course/education videos
- Social media videos
- Product demos
- Live streams
- Entertainment/movies

---

## E-COMMERCE & TRANSACTION FLOWS

### #25 Add to Cart → Checkout Flow
**User Journey:** Browse product → Add to cart → Review cart → Checkout (multi-step) → Payment → Confirmation

**Pattern Sequence:**
1. **Product Page:**
   - Product images (gallery #67)
   - Title, price, description
   - Options (size, color, quantity)
   - **Add to Cart button:**
     - Large, prominent (primary color)
     - Bottom of options
     - Enabled when all options selected

2. **Select Options:**
   - Size selector (button group #20)
   - Color selector (visual swatches #24)
   - Quantity stepper (#22)
   - All required options selected
   - Add to Cart button enables

3. **Add to Cart Action:**
   - Tap "Add to Cart" button
   - **Button Feedback:**
     - Loading spinner briefly (200ms)
     - Checkmark animation (#45)
     - Button text: "Added to Cart!"
     - Button color change (green, 1s)
     - Haptic feedback (mobile)
   - **Product Animation:**
     - Product image flies to cart icon (600ms arc animation)
     - Scales down during flight
     - Cart icon bounces
     - Cart badge appears/updates: "3"

4. **Post-Add Options:**
   - **Option A - Toast Notification:**
     - Toast appears (#5): "Added to Cart"
     - Shows mini product preview
     - "View Cart" button
     - Auto-dismiss 5s
   - **Option B - Mini Cart Drawer:**
     - Side panel slides in (#10)
     - Shows cart contents
     - "Continue Shopping" / "Checkout" buttons
     - Auto-closes 5s or tap outside
   - **Option C - Stay on Page:**
     - No interruption
     - Cart badge updates
     - Subtle confirmation only

5. **Continue Shopping (if applicable):**
   - User browses more products
   - Can add multiple items
   - Cart badge increments
   - Cart persists in session/account

6. **View Cart:**
   - Tap cart icon or "View Cart" button
   - Navigate to cart page/drawer
   - **Cart Contents:**
     - List of items
     - Product thumbnail, name, options
     - Quantity stepper per item
     - Price per item
     - Remove button (X or trash)
     - Subtotal for each
   - **Cart Summary:**
     - Subtotal
     - Shipping (calculated or TBD)
     - Tax (calculated or TBD)
     - Total (large, bold)
   - **Actions:**
     - Continue Shopping (back to store)
     - Checkout button (prominent, bottom)

7. **Modify Cart:**
   - Change quantity (stepper #22)
   - Auto-saves (debounced 500ms)
   - Subtotal updates in real-time
   - Total recalculates
   - **Remove Item:**
     - Tap X or swipe to delete (#81)
     - Confirmation: "Remove from cart?"
     - Item slides out (300ms)
     - Toast: "Removed" with undo (#42)
     - Cart updates

8. **Proceed to Checkout:**
   - Tap "Checkout" button
   - Cart locked (no more edits)
   - Navigate to checkout flow
   - Multi-step form begins (#21)

9. **Checkout Step 1 - Shipping Address:**
   - Auto-fill from profile (#22)
   - Or enter manually
   - Address autocomplete (#52)
   - Validate address
   - "Continue to Shipping" button

10. **Checkout Step 2 - Shipping Method:**
    - Radio selection (#20)
    - Options: Standard, Express, Overnight
    - Show price and delivery estimate
    - Selected option highlighted
    - Total updates with shipping cost
    - "Continue to Payment" button

11. **Checkout Step 3 - Payment:**
    - **Payment Options:**
      - Credit/Debit Card
      - Apple Pay / Google Pay
      - PayPal
      - Buy Now Pay Later (Affirm, Klarna)
    - Card entry (auto-fill #22 or manual)
    - CVV field separate (security)
    - Billing address (same as shipping checkbox)
    - Save card for future (optional checkbox)
    - "Review Order" button

12. **Checkout Step 4 - Review:**
    - Order summary
    - All sections expandable:
      - Shipping address (edit button)
      - Shipping method (edit button)
      - Payment method (edit button)
      - Items (view details)
    - Final costs:
      - Subtotal
      - Shipping
      - Tax
      - **Total** (large, bold)
    - Terms checkbox: "I agree to terms"
    - **Place Order button:**
      - Disabled until terms checked
      - Large, prominent
      - Clear text: "Place Order - $XX.XX"

13. **Place Order:**
    - Tap "Place Order"
    - **Processing:**
      - Button shows spinner
      - All inputs disabled
      - "Processing payment..." message
      - Can't navigate away
      - Timeout after 30s

14. **Success:**
    - Redirect to confirmation page
    - Success animation (checkmark #45, confetti #48)
    - Order number displayed (large)
    - Email confirmation sent message
    - Order details summary
    - Delivery estimate
    - "Continue Shopping" CTA

15. **Post-Purchase:**
    - Cart cleared
    - Order in account history
    - Tracking information (when available)
    - Email receipt sent

**Mobile Specifics:**
- Sticky "Add to Cart" button (bottom)
- Full-screen cart view
- Swipe to remove items
- Bottom sheet for mini cart
- Apple Pay/Google Pay prominent
- Autofill everything possible
- Large touch targets throughout

**Desktop Features:**
- Hover effects on products
- Sidebar cart that stays open
- Inline cart edit
- Guest checkout option
- Save cart URL (share cart)
- Keyboard shortcuts
- Tab navigation through forms

**Accessibility:**
- Clear focus indicators
- Error messages announced
- Price changes announced
- Step progress announced
- Checkout fully keyboard accessible
- Screen reader friendly
- High contrast mode support

**Security:**
- HTTPS throughout
- PCI compliance
- No card data stored (tokenized)
- CVV not saved
- Secure payment indicators
- Address verification
- Fraud detection

**Error Handling:**
- **Out of Stock:**
  - Detected at add to cart
  - Message: "Sorry, out of stock"
  - Option to notify when available
- **Price Changed:**
  - Detected at checkout
  - Show old vs new price
  - User must acknowledge
- **Payment Failed:**
  - Clear error message
  - Retry with same card
  - Try different payment method
  - Don't lose form data

**Advanced Features:**
- Promo code entry
- Gift message option
- Save for later (wishlist)
- Share cart with others
- Schedule delivery
- Subscribe and save
- Split payment methods
- Currency/language switching

**Use Cases:**
- E-commerce stores
- Marketplace apps
- Food delivery
- Ticket purchases
- Digital product sales
- Service booking + payment

---

## ONBOARDING & SETUP FLOWS

### #26 First-Time User Onboarding Flow
**User Journey:** Open app first time → Welcome screens → Permission requests → Account setup → Feature walkthrough → Start using app

**Pattern Sequence:**
1. **Welcome Screen (Splash):**
   - App logo (large, centered)
   - App name
   - Tagline/value proposition
   - Loading animation (if loading data)
   - Transitions after 2-3 seconds OR when ready

2. **Intro Carousel (3-5 screens):**
   - Full-screen illustration per screen
   - **Screen 1: Value Prop:**
     - Hero illustration
     - Headline: "Manage your tasks effortlessly"
     - Subheadline: Brief value statement
     - "Next" button (bottom-right)
     - Skip button (top-right, subtle)
     - Progress dots (bottom-center): ● ○ ○
   - **Screen 2-3: Key Features:**
     - Feature illustration
     - Feature headline
     - Benefit explanation (1-2 sentences)
     - Same navigation
   - **Screen 4: CTA:**
     - Final screen
     - "Get Started" button (primary, large)
     - "Sign In" button (secondary, if accounts)
     - Progress dots filled: ● ● ● ●

3. **Navigation:**
   - Swipe left/right between screens
   - Tap "Next" advances
   - Tap "Skip" jumps to end
   - Dots indicate position
   - Auto-advance after 5s (optional)

4. **Account Creation (if applicable):**
   - **Option A: Social Sign-In:**
     - Large buttons: "Continue with Apple"
     - "Continue with Google"
     - Quick, minimal friction
   - **Option B: Email Sign-Up:**
     - Name, Email, Password fields
     - Inline validation (#53)
     - "Create Account" button
   - **Option C: Guest Mode:**
     - "Skip for now" or "Continue as Guest"
     - Can create account later

5. **Permission Requests:**
   - **Strategic Timing:**
     - Request in context (when needed)
     - Not all at once
     - Explain benefit before requesting
   - **Example Flow:**
     - Pre-prompt: "Enable notifications to stay updated"
     - Benefits listed
     - "Enable Notifications" button
     - Tap → System permission dialog appears
     - Allow/Don't Allow
     - Gracefully handle denial

   - **Permissions Types:**
     - Notifications (explained first)
     - Location (if needed, explained)
     - Camera/Photos (when capturing)
     - Contacts (if social features)
     - Microphone (if voice features)

6. **Personalization Quiz (optional):**
   - 3-5 questions to tailor experience
   - Fun, visual questions
   - **Example:**
     - "What's your main goal?"
     - Visual cards to select
     - Multi-select or single
   - Progress bar at top
   - Can skip entire quiz
   - Results used to customize content

7. **Feature Walkthrough (Interactive):**
   - **Coach Marks / Tooltips:**
     - Overlay darkens screen
     - Spotlight on key UI element
     - Tooltip points to it
     - Explanation text (brief)
     - "Next" button or tap to continue
     - Dismiss: "Skip Tour" option always visible
   - **Example Sequence:**
     - Highlight FAB: "Tap here to create"
     - Highlight navigation: "Switch between sections"
     - Highlight profile: "Manage your account"
   - 3-5 steps maximum
   - Can skip at any point

8. **First Action Prompt:**
   - Encourage immediate engagement
   - Empty state with clear CTA
   - **Examples:**
     - "Create your first task"
     - "Add a photo"
     - "Explore categories"
   - Helpful guidance
   - Success feels rewarding

9. **Completion:**
   - Brief celebration (success animation #45)
   - "You're all set!" message
   - Main app interface loads
   - Normal use begins
   - Onboarding marked complete (never show again)

**Best Practices:**

**Minimize Friction:**
- Keep intro short (3-5 screens max)
- Always allow skip
- Don't require everything upfront
- Just-in-time permission requests
- Guest mode option

**Show Value Fast:**
- Lead with benefits, not features
- Use clear, simple language
- Visual storytelling
- Real screenshots (not generic icons)
- Specific use cases

**Progressive Onboarding:**
- Don't teach everything at once
- Introduce features when relevant
- Coach marks in context
- Celebrate small wins
- Allow discovery

**Mobile Specifics:**
- Full-screen intro screens
- Large, thumb-friendly buttons
- Swipe gestures
- Native permission dialogs
- Biometric login option
- Deep linking to skip onboarding (if from invite)

**Desktop Differences:**
- Can show more content per screen
- Keyboard navigation
- Can have sidebar onboarding
- Less critical (more exploration expected)
- Tooltips instead of full-screen overlays

**Accessibility:**
- Skip option always available
- Keyboard navigation
- Screen reader friendly
- Auto-play videos have controls
- Text content accessible
- High contrast support

**Personalization:**
- Remember completion state
- Allow restart onboarding (in settings)
- Tailor experience based on quiz
- Save preferences
- Sync across devices

**Analytics:**
- Track completion rate
- Track where users drop off
- A/B test onboarding flows
- Measure time to first action
- Identify confusing steps

**Re-Onboarding:**
- Major feature updates
- Significant UI changes
- Optional refresher (in help menu)
- "What's New" highlights
- Contextual tutorials for new features

**Use Cases:**
- Mobile app first launch
- SaaS product trial start
- New user registration
- Feature updates
- Platform migration

---

## SEARCH & FILTER FLOWS

### #27 Search with Filters Flow
**User Journey:** Tap search → Enter query → Results appear → Apply filters → Refine results → Select item

**Pattern Sequence:**
1. **Search Entry:**
   - Tap search icon in navigation
   - **Transition:**
     - Search bar expands (if collapsed)
     - Or navigate to search screen
     - Keyboard appears automatically
     - Focus in search input
     - Placeholder text: "Search products..."

2. **Search Input:**
   - User starts typing
   - **Real-Time Suggestions:**
     - Dropdown appears after 2+ characters
     - Autocomplete suggestions (from popular/history)
     - Format: Query text bolded in suggestions
     - "Wireless headphones" shows "Wireless **headphones**"
     - Tap suggestion → Fills search, executes
   - **Search History (before typing):**
     - Shows recent searches (3-5)
     - Can tap to re-execute
     - X to remove from history
   - Debounced search (300ms after stop typing)

3. **Execute Search:**
   - User presses Enter OR taps Search button
   - OR auto-executes after pause
   - **Loading:**
     - Results area shows skeleton (#35)
     - Search button shows spinner briefly
     - "Searching..." message

4. **Results Display:**
   - Results load and display
   - **Header:**
     - "145 results for 'wireless headphones'"
     - Filter button (prominent): "Filters (0)"
     - Sort dropdown: "Best Match ▼"
   - **Results Grid/List:**
     - Products in grid (mobile: 2 col, desktop: 4 col)
     - Infinite scroll or pagination
     - Each card shows key info
   - **No Results:**
     - Friendly message
     - Suggestions: "Did you mean..."
     - Related categories
     - Clear search button

5. **Apply Filters:**
   - Tap "Filters" button
   - **Mobile:** Bottom sheet slides up (#9) to 80% height
   - **Desktop:** Side panel slides in (#10) from left
   - **Filter Panel Contents:**
     - Filter categories (collapsible sections #14):
       - Price Range (slider #21)
       - Brand (checkboxes #23)
       - Color (color swatches #24)
       - Size (buttons #20)
       - Rating (star selection)
       - Availability (In Stock toggle #19)
     - Each section expandable
     - Shows applied count: "Brand (2)"

6. **Select Filters:**
   - **Price Slider:**
     - Drag handles for min/max
     - Values update in real-time
     - "Apply" updates results
   - **Checkboxes:**
     - Tap to toggle
     - Checkmark animation
     - Count updates: "Filters (3)"
   - **Chips (Multi-Select):**
     - Tap to select
     - Selected chips fill with color
     - Can select multiple
   - **Real-Time (optional) or Apply Button:**
     - Some filters apply immediately
     - Or "Apply Filters" button at bottom

7. **Apply Filters Button:**
   - Large button at bottom of filter panel
   - Shows count: "Show 42 Results"
   - Tap button
   - **Panel Dismisses:**
     - Slides down/away
     - Results area updates
     - Loading indicator briefly
     - New results load

8. **Active Filters Display:**
   - Chip row above results
   - Each active filter as dismissible chip (#18)
   - Example: "Brand: Sony (X)" "Price: $50-100 (X)"
   - Tap X to remove filter
   - Filter immediately updates results
   - "Clear All" button if multiple filters

9. **Sort Results:**
   - Tap sort dropdown
   - Options in menu:
     - Best Match (default)
     - Price: Low to High
     - Price: High to Low
     - Newest First
     - Most Popular
     - Highest Rated
   - Select option
   - Checkmark on selected
   - Results re-sort (brief loading)
   - Menu dismisses

10. **Refine Search:**
    - Can modify search query
    - Edit text in search bar
    - Or tap search bar to clear and start new
    - Filters persist (optional) or reset

11. **Select Result:**
    - Tap product card
    - Navigate to product detail
    - Can go back to results
    - Results state preserved:
      - Scroll position saved
      - Filters remain applied
      - Search query remains

12. **Clear Search:**
    - Tap X in search bar
    - Clears query and results
    - Returns to previous screen
    - Or shows search home (history, suggestions)

**Mobile Specifics:**
- Bottom sheet for filters
- Sticky search bar
- Thumb-friendly filter controls
- Swipe to dismiss filters
- Filter count badge visible
- Results grid 2 columns

**Desktop Features:**
- Side panel for filters
- Always-visible filter panel (optional)
- Hover effects on results
- Keyboard shortcuts (Cmd+F to search)
- More filters visible simultaneously
- Results grid 4-6 columns
- Quick view on hover

**Accessibility:**
- Search input labeled
- Filter controls keyboard accessible
- Results count announced
- Applied filters announced
- Clear button labeled
- Focus management
- Screen reader friendly

**Performance:**
- Debounced search input
- Infinite scroll efficient
- Virtual scrolling for many results
- Filter updates optimistic
- Cache results briefly
- Lazy load images

**Advanced Features:**
- **Visual Search:** Upload image to search
- **Voice Search:** Speak query
- **Barcode Scanner:** Scan to search product
- **Saved Searches:** Save complex filter combinations
- **Search Suggestions:** AI-powered recommendations
- **Related Searches:** "People also searched for"
- **Filter Presets:** "Under $50", "Top Rated", etc.

**Error Handling:**
- No results: Helpful suggestions
- Search API failure: Error message, retry
- Invalid filter combo: Disable conflicting options
- Timeout: Show partial results

**Use Cases:**
- E-commerce product search
- Content discovery
- Location/map search
- Job search
- Real estate search
- Restaurant/venue search

---

## ERROR & RECOVERY FLOWS

### #28 Network Error with Retry Flow
**User Journey:** Action fails due to network → Error message appears → User retries → Success or persistent error

**Pattern Sequence:**
1. **Initial Action:**
   - User taps button (e.g., "Load More", "Submit", "Refresh")
   - Action requires network request
   - Loading indicator appears (spinner #44)

2. **Network Failure:**
   - Request times out (10-30s depending on context)
   - Or network unavailable detected immediately
   - Or server returns error (500, 503, etc.)

3. **Error Detection:**
   - App detects failure
   - Loading indicator stops
   - **Determine Error Type:**
     - No internet connection
     - Timeout
     - Server error
     - Rate limited
   - Choose appropriate message and recovery

4. **Error Display:**
   - **Toast Notification (Minor Action):**
     - Toast appears (#5): "Connection lost"
     - Red color, warning icon
     - Brief (3-5s)
     - "Retry" button in toast
   - **Inline Message (Contained Action):**
     - Message appears where content should be
     - "Unable to load. Check your connection."
     - Retry button below
   - **Full-Screen (Major Action):**
     - Screen shows error state
     - Illustration (broken connection icon)
     - Message: "No internet connection"
     - "Retry" button prominent
     - "Go Back" button secondary

5. **Error Message Content:**
   - **No Internet:**
     - "No internet connection"
     - "Check your Wi-Fi or cellular data"
     - Icon: Disconnected Wi-Fi or cloud with X
   - **Timeout:**
     - "Request timed out"
     - "This is taking longer than usual"
     - Icon: Clock or hourglass
   - **Server Error:**
     - "Something went wrong"
     - "Our servers are having issues" (5xx)
     - Icon: Server with warning
   - **Generic:**
     - "Unable to complete request"
     - "Please try again"
     - Icon: Warning triangle

6. **Retry Button:**
   - Prominent placement
   - Primary button style
   - Label: "Retry", "Try Again", or "Reload"
   - Tap to retry
   - **On Retry:**
     - Button shows loading spinner
     - Original action re-attempted
     - Success or failure flows

7. **Successful Retry:**
   - Action completes
   - Error message dismisses
   - Content loads/action executes
   - Brief success indicator (optional):
     - Toast: "Back online" (green)
     - Or just load content without fanfare
   - User continues normally

8. **Failed Retry (Still No Network):**
   - Same error appears again
   - Message may update:
     - "Still unable to connect"
     - "Check your internet connection"
   - Retry button remains available
   - Additional options appear:
     - "Offline Mode" (if supported)
     - "Refresh Later"
     - "View Cached Content"

9. **Multiple Retries:**
   - After 2-3 failed retries:
     - Message becomes more helpful
     - "Connection issues persist"
     - Suggestions:
       - "Check if airplane mode is on"
       - "Restart your router"
       - "Contact support if this continues"
     - Option to report issue

10. **Offline Mode (if applicable):**
    - Banner appears: "You're offline"
    - Persistent at top
    - Orange/yellow color
    - Actions queue when online
    - View cached content
    - **Automatic Sync:**
      - When connection restored
      - Banner: "Back online. Syncing..."
      - Progress indicator
      - Completes → Banner dismisses

**Context-Specific Patterns:**

**During Form Submission:**
- Form data preserved
- User doesn't lose work
- Toast error appears
- Form stays filled
- Retry button in form
- Or auto-retry in background

**During List Loading:**
- Already-loaded items remain visible
- Error appears at bottom of list
- Or inline where new items would be
- "Retry" button to load more
- Pull-to-refresh still works

**During Media Upload:**
- Progress pauses
- Error indicator on upload
- "Retry Upload" button
- Resume from where failed
- Or restart upload

**During Payment:**
- Most critical - very clear error
- Full explanation
- No ambiguity
- Don't charge if failure unclear
- Provide reference number
- Support contact info

**Visual Indicators:**

**Online/Offline Status:**
- Badge in navigation
- Green dot: Online
- Red dot: Offline
- Or banner when offline

**Error Severity Colors:**
- 🔴 Red: Critical (data loss risk)
- 🟠 Orange: Warning (action failed)
- 🟡 Yellow: Notice (offline mode)
- 🔵 Blue: Info (update available)

**Mobile Specifics:**
- Toast for minor errors
- Full-screen for major blocking errors
- Haptic feedback on error (warning pattern)
- Check connectivity before action (if critical)
- Queue actions for when online returns

**Desktop Features:**
- Inline errors preferred over modal
- Browser online/offline events
- System tray notification (optional)
- Background retry without blocking

**Accessibility:**
- Error announced immediately
- Clear error message
- Retry button keyboard accessible
- Status updates announced
- Don't rely on color alone

**Automatic Behaviors:**

**Auto-Retry:**
- Retry automatically (once) after brief delay (2-3s)
- Inform user: "Retrying..."
- If success: No error shown to user
- If failure: Show error and manual retry option

**Exponential Backoff:**
- Multiple auto-retries with increasing delays
- Retry 1: 2s delay
- Retry 2: 5s delay
- Retry 3: 10s delay
- Then require manual retry

**Background Sync:**
- Queue failed actions
- Retry automatically when online
- Notify when synced
- Or silent if user doesn't need to know

**Error Logging:**
- Log errors for debugging
- Track retry success rate
- Identify problematic endpoints
- User feedback option: "Report Issue"

**Use Cases:**
- API failures
- Network unavailability
- Server errors
- Timeout issues
- Rate limiting
- Any network-dependent action

---

## CONCLUSION & MIXING GUIDE

These 28 comprehensive flows cover the most common user journeys across modern applications. 

**Key Principles:**

1. **Context Matters:** Choose patterns based on platform, content type, and user needs
2. **Consistency:** Use the same patterns for similar actions throughout your app
3. **Accessibility First:** Every flow must be fully accessible via keyboard and screen readers
4. **Performance:** Optimize heavy flows, prioritize perceived performance
5. **Error Handling:** Every flow needs clear error states and recovery paths
6. **Mobile vs Desktop:** Adapt patterns appropriately for each platform
7. **User Control:** Always provide escape hatches (back, cancel, undo)
8. **Progressive Disclosure:** Don't overwhelm - reveal complexity as needed
9. **Feedback:** Every action needs clear visual/haptic/audio feedback
10. **Test with Real Users:** Flows that seem obvious to designers may confuse users

**Combining Flows:**

Many real-world experiences combine multiple flows:
- **E-commerce:** Search Flow → Product Browse → Add to Cart → Checkout → Confirmation
- **Social Media:** Browse Feed → View Details → Like/Comment → Share
- **Productivity:** Create Item → Categorize → Edit Inline → Reorder → Bulk Delete
- **Content Platform:** Search → Filter → View Media → Share → Related Content

**Documenting Your Flows:**

For each flow in your app, document:
- Entry points (where does it start?)
- Step-by-step sequence
- Decision points and branches
- Success and error states
- Exit points (how does it end?)
- Edge cases and exceptions
- Platform-specific variations
- Accessibility considerations

**This completes the comprehensive UX Flows & User Journeys Library.**

---

**Last Updated:** 2025  
**Version:** 1.0  
**Companion to:** 
- Semantic Design Patterns Library v1.0
- UX Interaction & Component Patterns Library v1.0
**License:** Open for use and modification
