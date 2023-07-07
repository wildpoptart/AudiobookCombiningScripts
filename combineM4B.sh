#!/bin/bash

# Check if the "Full.m4b" file exists and delete it if it does
if [ -f "Full.m4b" ]; then
    rm "Full.m4b"
fi

# Concatenate the M4B files in file name order into the "Full.m4b" file
find . -maxdepth 1 -type f -name "*.m4b" | sort | xargs cat > "Full.m4b"

# Check if the combined M4B file was successfully created
if [ ! -f "Full.m4b" ]; then
    echo "Failed to create the combined M4B file."
    exit 1
fi

echo "M4B files combined successfully!"

