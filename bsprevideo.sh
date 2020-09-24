#!/bin/bash
# Die for Schleife sucht im Ordner nach datein mit der Endung .mp4
# mit dem ffmpeg (Audio-und -Video-Encoder und -Decoder) wird dann aus allen datein ein Video von 180 sek geschnitten das Video wird ab sek 15 gestartet und hat eine Auflösung von 354x200
# dann wird das Video mit seinen eigentlichen Namen und dem Zusatz -thumb abgespeichert
for name in *.mp4; do
ffmpeg -ss 180 -i "$name" -t 15 -s 354x200 -filter:v "setpts=0.5*PTS" -an "${name%.*}-thumb.mp4"
done
