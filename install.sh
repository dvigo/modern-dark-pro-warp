#!/bin/bash

# ------------------------------------------------------------------------------
# Modern Dark Pro Warp Themes - Installation Script
# This script copies the Warp themes to the custom themes directory.
# ------------------------------------------------------------------------------

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WARP_THEMES_DIR="$HOME/.warp/themes"

echo "🎨 Installing Modern Dark Pro Warp Themes..."

# Create themes directory if it doesn't exist
mkdir -p "$WARP_THEMES_DIR"

# Copy all theme files
for yaml_file in "${SCRIPT_DIR}/themes/"*.yaml; do
    if [ -f "$yaml_file" ]; then
        filename=$(basename "$yaml_file")
        cp "$yaml_file" "${WARP_THEMES_DIR}/${filename}"
        echo "   ✓ Copied $filename to ~/.warp/themes/"
    fi
done

echo "✅ Modern Dark Pro Warp Themes installed successfully!"
echo ""
echo "To apply the theme in Warp:"
echo "1. Open Warp Terminal."
echo "2. Open Settings using 'Cmd + ,'."
echo "3. Go to Appearance > Themes."
echo "4. In the theme list, select your preferred custom theme."
