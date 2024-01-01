#!/bin/bash

# Directory to store the downloaded video
download_dir="."

# Filename for the downloaded video
video_filename="video1.mp4"

# Directory to store extracted frames
frames_dir="video1-frames"

# Create directory to store downloaded video and extracted frames
mkdir -p "$frames_dir"

# Check if download was successful
if [ $? -eq 0 ]; then

    # Extract frames using ffmpeg
    ffmpeg -i "$download_dir/$video_filename" -vf "fps=5" "$frames_dir/frame_%04d.jpg"

    # Check if frame extraction was successful
    if [ $? -eq 0 ]; then
        echo "Frames extracted successfully."
    else
        echo "Failed to extract frames."
    fi
else
    echo "Failed to download the video."
fi
