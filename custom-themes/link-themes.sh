#!/bin/bash

# MOVE SYMLINKS OF CUSTOM THEMES INTO THE THEMES DIR

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure the Helix runtime themes directory exists
mkdir -p ~/.config/helix/runtime/themes

# Create symlinks for each theme file in the custom-themes directory
for theme_file in "$SCRIPT_DIR"/*.toml; do
    if [ -f "$theme_file" ]; then
        filename=$(basename "$theme_file")
        echo "Creating symlink for $filename"
        ln -sf "$theme_file" ~/.config/helix/runtime/themes/"$filename"
    fi
done

echo "All custom themes have been linked to Helix runtime themes directory."
