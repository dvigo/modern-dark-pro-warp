#!/bin/bash

# ------------------------------------------------------------------------------
# Modern Dark Pro Warp Themes - Installation Script
# This script copies the Warp themes to the custom themes directory.
# ------------------------------------------------------------------------------

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"

# Support execution via curl/pipe when SCRIPT_DIR does not contain themes/
if [ ! -d "${SCRIPT_DIR}/themes" ]; then
    echo "📥 Downloading Modern Dark Pro themes..."
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 https://github.com/dvigo/modern-dark-pro-warp.git "$TEMP_DIR" --quiet
    SCRIPT_DIR="$TEMP_DIR"
    trap 'rm -rf "$TEMP_DIR"' EXIT
fi

# Detect OS and set target Warp themes directory
OS_TYPE="$(uname -s)"
WARP_THEMES_DIR="$HOME/.warp/themes"

if [ "$OS_TYPE" = "Linux" ] && [ -d "$HOME/.local/share/warp-terminal" ]; then
    WARP_THEMES_DIR="$HOME/.local/share/warp-terminal/themes"
fi

WARP_BG_DIR="$WARP_THEMES_DIR/backgrounds"

if [ "$1" = "--uninstall" ]; then
    echo "🗑️  Uninstalling Modern Dark Pro Warp Themes..."
    
    # Remove themes
    for yaml_file in "${SCRIPT_DIR}/themes/"*.yaml; do
        if [ -f "$yaml_file" ]; then
            filename=$(basename "$yaml_file")
            rm -f "${WARP_THEMES_DIR}/${filename}"
            echo "   ✓ Removed $filename from ~/.warp/themes/"
        fi
    done
    
    # Remove background images associated with the theme
    if [ -d "${SCRIPT_DIR}/backgrounds" ]; then
        for bg_file in "${SCRIPT_DIR}/backgrounds/"*; do
            if [ -f "$bg_file" ]; then
                filename=$(basename "$bg_file")
                rm -f "${WARP_BG_DIR}/${filename}"
                echo "   ✓ Removed $filename from ~/.warp/themes/backgrounds/"
            fi
        done
    fi

    echo "✅ Uninstallation complete!"
    exit 0
fi

echo "🎨 Installing Modern Dark Pro Warp Themes..."

# Create themes directory if it doesn't exist
mkdir -p "$WARP_THEMES_DIR"
mkdir -p "$WARP_BG_DIR"

# Copy all theme files
for yaml_file in "${SCRIPT_DIR}/themes/"*.yaml; do
    if [ -f "$yaml_file" ]; then
        filename=$(basename "$yaml_file")
        cp "$yaml_file" "${WARP_THEMES_DIR}/${filename}"
        echo "   ✓ Copied $filename to ~/.warp/themes/"
    fi
done

# Copy background images if they exist
if [ -d "${SCRIPT_DIR}/backgrounds" ]; then
    for bg_file in "${SCRIPT_DIR}/backgrounds/"*; do
        if [ -f "$bg_file" ]; then
            filename=$(basename "$bg_file")
            cp "$bg_file" "${WARP_BG_DIR}/${filename}"
            echo "   ✓ Copied $filename to ~/.warp/themes/backgrounds/"
        fi
    done
fi

echo "✅ Modern Dark Pro Warp Themes installed successfully!"
echo ""
echo "To apply the theme in Warp:"
echo "1. Open Warp Terminal."
echo "2. Open Settings using 'Cmd + ,'."
echo "3. Go to Appearance > Themes."
echo "4. In the theme list, select your preferred custom theme."
