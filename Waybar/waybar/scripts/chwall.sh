#!/bin/bash

DIR_WALL="/home/retro/Pictures/swww/wallpapers"
DIR_BAR="/home/retro/.config/waybar"
DIR_FILE="/home/retro/.config/waybar/scripts/valueFor_chwall.txt"
TRANSITION_TYPE="any"

#RANDOM_NUMBER=$((RANDOM % 3 + 1))
VALUE=$(cat ${DIR_FILE})

if [ $VALUE -eq 1 ]
then
	echo "2" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type $TRANSITION_TYPE ${DIR_WALL}/pixel_city.jpg

	cat ${DIR_BAR}/style_pixel_city.css > ${DIR_BAR}/"style.css"
	cat ${DIR_BAR}/config_default > ${DIR_BAR}/config

	killall waybar
	waybar

	exit
elif [ $VALUE -eq 2 ]
then
	echo "3" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type $TRANSITION_TYPE ${DIR_WALL}/lucy_code.jpg

	cat ${DIR_BAR}/style_lucy_code.css > ${DIR_BAR}/"style.css"
		
	killall waybar
	waybar

	exit
elif [ $VALUE -eq 3 ]
then
	echo "4" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type $TRANSITION_TYPE ${DIR_WALL}/sunset.jpg

	cat ${DIR_BAR}/style_sunset.css > ${DIR_BAR}/"style.css"
	cat ${DIR_BAR}/config_default > ${DIR_BAR}/config

	killall waybar
	waybar

	exit
else
	echo "1" > ${DIR_FILE}

	swww img --transition-duration 3 --transition-angle 90 --transition-fps 165 --transition-type $TRANSITION_TYPE ${DIR_WALL}/northlight.jpg

	cat ${DIR_BAR}/style_north_light.css > ${DIR_BAR}/"style.css"
	cat ${DIR_BAR}/config_north_light > ${DIR_BAR}/config

	killall waybar
	waybar

	exit
fi
