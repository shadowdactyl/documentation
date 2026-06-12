#!/bin/bash
# Shadowdactyl Documentation Rebranding Script
# This script replaces all Pterodactyl references with Shadowdactyl in the documentation

echo "🔄 Starting Shadowdactyl Documentation rebranding process..."

# Function to replace text in files
replace_in_files() {
    local pattern=$1
    local replacement=$2
    echo "   Replacing '$pattern' → '$replacement'..."
    
    # Find all text files (exclude git, node_modules, etc.)
    find . -type f \
        -not -path './.git/*' \
        -not -path './node_modules/*' \
        -not -path './.vuepress/dist/*' \
        -not -path './.github/*' \
        \( -name "*.md" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" \
           -o -name "*.html" -o -name "*.txt" -o -name "*.js" -o -name "*.vue" \) \
        -type f \
        -exec sed -i "s/$pattern/$replacement/g" {} + 2>/dev/null
}

echo "📝 Replacing text patterns..."

# 1. PTERODACTYL (ALL CAPS)
replace_in_files "PTERODACTYL" "SHADOWDACTYL"

# 2. Pterodactyl (Title Case)
replace_in_files "Pterodactyl" "Shadowdactyl"

# 3. pterodactyl (lowercase)
replace_in_files "pterodactyl" "shadowdactyl"

# 4. PteroDactyl (specific variations)
replace_in_files "PteroDactyl" "ShadowDactyl"

# 5. Replace pterodactyleggs.com
replace_in_files "pterodactyleggs.com" "shadowdactyl.com"

# 6. Replace pterodactyl.io
replace_in_files "pterodactyl.io" "shadowdactyl.io"

# 7. Update Discord URLs
replace_in_files "discord.gg/pterodactyl" "discord.gg/shadowdactyl"

# 8. Update GitHub URLs
replace_in_files "github.com/pterodactyl" "github.com/shadowdactyl"

# 9. Update CDN URLs
replace_in_files "cdn.pterodactyl.io" "cdn.shadowdactyl.io"

echo "✅ Documentation rebranding complete!"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff"
echo "2. Update any documentation references manually if needed"
echo "3. Test documentation builds locally"
echo "4. Commit and push: git add . && git commit -m 'Rebrand: Pterodactyl → Shadowdactyl (docs)'"
