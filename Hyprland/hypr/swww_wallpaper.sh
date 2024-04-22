#!/bin/bash

DIR="/home/retro/Pictures/swww/wallpapers"

swww query 2> /dev/null 1> /dev/null

if [ $? -ne 0 ]
then
	swww init
fi

IMG="pixel_city"

if [ -z "$1" ]
then
	break
else
	IMG=$1
fi

WALLPAPER="${DIR}/${IMG}.jpg"
echo "$WALLPAPER"

swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type any ${DIR}/${IMG}.jpg

#swww img --resize fit --transition-duration 3 --transition-angle 45 --transition-fps 30 --transition-type any ${DIR}/${IMG}.jpg

if [ $? -ne 0 ]
then
	exit
else
	echo "[+] Wallpaper changed"
fi
