#!/bin/bash

DIR_WALL="/home/retro/Pictures/swww/wallpapers"
DIR_BAR="/home/retro/.config/waybar"
DIR_FILE="/home/retro/.config/waybar/scripts/valueFor_chwall.txt"

#RANDOM_NUMBER=$((RANDOM % 3 + 1))
VALUE=$(cat ${DIR_FILE})

if [ $VALUE -eq 1 ]
then
	echo "2" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type any ${DIR_WALL}/pixel_city.jpg

	cat ${DIR_BAR}/style_pixel_city.css > ${DIR_BAR}/"style.css"
	
	killall waybar
	pkill waybar
	sleep 0.1
	waybar

	exit
elif [ $VALUE -eq 2 ]
then
	echo "3" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type any ${DIR_WALL}/lucy_code.jpg

	cat ${DIR_BAR}/style_lucy_code.css > ${DIR_BAR}/"style.css"
	
	killall waybar
	pkill waybar
	sleep 0.2
	waybar

	exit
else
	echo "1" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type any ${DIR_WALL}/northlight.jpg

	cat ${DIR_BAR}/style_north_light.css > ${DIR_BAR}/"style.css"
	
	killall waybar
	pkill waybar
	sleep 0.2
	waybar

	exit
fi
