#! /bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Wallpapers/Mizuki/"

# Get all image files in the directory (more explicit pattern matching)
WALLPAPERS=()
while IFS= read -r -d $'\0' file; do
    WALLPAPERS+=("$file")
done < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

# Debug: Print number of wallpapers found
echo "Found ${#WALLPAPERS[@]} wallpapers"

# Check if any wallpapers were found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "Error: No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Create or read the current wallpaper index
INDEX_FILE="$HOME/.cache/current_wallpaper"
if [ ! -f "$INDEX_FILE" ]; then
    echo "0" > "$INDEX_FILE"
fi
CURRENT_INDEX=$(cat "$INDEX_FILE")

# Calculate next index (with wraparound)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))

# Set the next wallpaper
swww img "${WALLPAPERS[$NEXT_INDEX]}" --transition-fps 60 --transition-type grow --transition-pos center

# Save the new index
echo "$NEXT_INDEX" > "$INDEX_FILE"
