#!/bin/bash

# Prompt the user to select a folder
read -p "Enter the path to the folder (starting at ~/Documents/books): " folder_path

# Check if the "Full.mp3" file exists and delete it if it does
if [ -f "Full.mp3" ]; then
    rm "Full.mp3"
fi

# Concatenate the MP3 files in file name order into the "Full.mp3" file
find "$folder_path" -maxdepth 1 -type f -name "*.mp3" | sort | xargs cat > "Full.mp3"

# Check if the combined MP3 file was successfully created
if [ ! -f "Full.mp3" ]; then
    echo "Failed to create the combined MP3 file."
    exit 1
fi

echo "MP3 files combined successfully!"
