#!/bin/bash

# The directory containing your MP4 files
SEARCH_DIR="/Users/carl/Desktop/Fullbody-workout"

# Navigate to the directory
cd "$SEARCH_DIR"

# Find all MP4 files in the directory and its subdirectories
find . -type f -name '*.mp4' | while read -r FILE; do
    # Temporary output file
    TEMP_FILE="${FILE%.mp4}_temp.mp4"
    
    # Optimize the video file
    ffmpeg -i "$FILE" -vcodec libx264 -crf 28 -preset fast -acodec aac -b:a 128k "$TEMP_FILE" && mv "$TEMP_FILE" "$FILE"
    
    # Inform user of progress
    echo "Optimized: $FILE"
done

echo "Optimization complete for all files."

