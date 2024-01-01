#!/bin/bash

# URL of the video you want to download
video_url="https://c.veocdn.com/9f8c6811-83da-427c-ac1f-28c0035e0423/standard/machine/412e0850/video.mp4"

# Directory to store the downloaded video
download_dir="."

# Filename for the downloaded video
video_filename="video9.mp4"

# Directory to store extracted frames
frames_dir="video9-frames"

# Create directory to store downloaded video and extracted frames
mkdir -p "$frames_dir"

# Download the video using wget
wget -O "$download_dir/$video_filename" "$video_url"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Video downloaded successfully."

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
