#!/bin/bash

# Template v2 Verification Script
# Run this to verify template is clean and generic

echo "🔍 Verifying Template v2..."
echo ""

# Colors
TEMPLATE_DIR="/Users/jos/Developer/flexos-website-builder/templates/astro-project-v2"
cd "$TEMPLATE_DIR" || exit 1

PASS=0
FAIL=0

# Test 1: No project-specific references
echo "Test 1: Checking for project-specific references..."
if grep -r "EMBER\|Ember\|ember" . --exclude-dir=node_modules --exclude="VERIFY-TEMPLATE.sh" --exclude="TEMPLATE-V2-SUMMARY.md" -q; then
    echo "  ❌ FAIL: Found 'Ember' references"
    FAIL=$((FAIL + 1))
else
    echo "  ✅ PASS: No project-specific references"
    PASS=$((PASS + 1))
fi

# Test 2: Generic hue values
echo "Test 2: Checking default hue values..."
if grep -q "hue-brand: 210" src/styles/tokens/colors.css && grep -q "hue-accent: 30" src/styles/tokens/colors.css; then
    echo "  ✅ PASS: Generic hues (210, 30)"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Non-generic hue values"
    FAIL=$((FAIL + 1))
fi

# Test 3: Dark mode is active
echo "Test 3: Checking dark mode is active..."
if grep -q "^@media (prefers-color-scheme: dark)" src/styles/tokens/colors.css; then
    echo "  ✅ PASS: Dark mode is active (uncommented)"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Dark mode is commented out"
    FAIL=$((FAIL + 1))
fi

# Test 4: System fonts
echo "Test 4: Checking for system fonts..."
if grep -q "Georgia" src/styles/tokens/typography.css && ! grep -q "Crimson Text" src/styles/tokens/typography.css; then
    echo "  ✅ PASS: Using system fonts"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Custom fonts found"
    FAIL=$((FAIL + 1))
fi

# Test 5: No Tailwind
echo "Test 5: Checking Tailwind is removed..."
if ! grep -q "tailwindcss" src/styles/global.css; then
    echo "  ✅ PASS: Tailwind removed from global.css"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Tailwind still present"
    FAIL=$((FAIL + 1))
fi

# Test 6: Generic package name
echo "Test 6: Checking package name..."
if grep -q '"name": "astro-generated-site"' package.json; then
    echo "  ✅ PASS: Generic package name"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Project-specific package name"
    FAIL=$((FAIL + 1))
fi

# Test 7: astro-icon configured
echo "Test 7: Checking astro-icon integration..."
if grep -q "import icon from 'astro-icon'" astro.config.mjs; then
    echo "  ✅ PASS: astro-icon configured"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: astro-icon not configured"
    FAIL=$((FAIL + 1))
fi

# Test 8: Placeholder in robots.txt
echo "Test 8: Checking robots.txt..."
if grep -q "SITE_URL_PLACEHOLDER" public/robots.txt; then
    echo "  ✅ PASS: Using placeholder URL"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Hardcoded URL in robots.txt"
    FAIL=$((FAIL + 1))
fi

# Test 9: Template version tags
echo "Test 9: Checking template version tags..."
if grep -q "@template-version 2.0.0" src/styles/tokens/colors.css; then
    echo "  ✅ PASS: Version tag present"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: Missing version tag"
    FAIL=$((FAIL + 1))
fi

# Test 10: CSS brace balance
echo "Test 10: Checking CSS brace balance..."
OPEN=$(grep -o "{" src/styles/tokens/colors.css | wc -l)
CLOSE=$(grep -o "}" src/styles/tokens/colors.css | wc -l)
if [ "$OPEN" -eq "$CLOSE" ]; then
    echo "  ✅ PASS: CSS braces balanced ($OPEN opening, $CLOSE closing)"
    PASS=$((PASS + 1))
else
    echo "  ❌ FAIL: CSS braces unbalanced ($OPEN opening, $CLOSE closing)"
    FAIL=$((FAIL + 1))
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "RESULTS: $PASS passed, $FAIL failed"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $FAIL -eq 0 ]; then
    echo "✅ Template v2 is clean and ready for use!"
    exit 0
else
    echo "❌ Template v2 has issues that need fixing"
    exit 1
fi
