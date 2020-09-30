#!/bin/bash
# The for loop searches for files with the extension .mp4 in the folder
# With the ffmpeg (audio and video encoder and decoder) a video of 180 seconds is then cut from all files. The video is started from 15 seconds and has a resolution of 354x200
# then the video is saved with its actual name and the addition -thumb
for name in *.mp4; do
ffmpeg -ss 180 -i "$name" -t 15 -s 354x200 -filter:v "setpts=0.5*PTS" -an "${name%.*}-thumb.mp4"
done
