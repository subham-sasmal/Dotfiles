#!/bin/bash

function install_hyprland() {

	# Check and install the essentials required to set hyprland (ex: kitty[terminal], rofi[app-menu], etc.)
	sudo pacman -S hyprland waybar kitty neofetch rofi swww


	# Check if folder: "hypr" and "waybar" is already available in the file system
	CHECK_HYPR=$(ls ~/.config/ | grep hypr)
	CHECK_WAYBAR=$(ls ~/.config/ | grep waybar)
	CHECK_ROFI=$(ls ~/.config/ | grep rofi)


	# Check if "locate" command is installed in the system 
	CHECK_LOCATE=$(which locate)


	# If locate command exists, updating the database
	if [[ $CHECK_LOCATE == "/usr/bin/locate" ]]
	then
		echo -e "\033[1mUpdating locate database\033[0m"

		sudo updatedb
	
		DIR=$(locate .DotFiles | grep .DotFiles$)

		# Copying wallpapers in .DotFiles/Pictures to ~/Pictures directory
		cp -r ${DIR}/"Pictures/*" ~/Pictures 


		# If hypr folder exists already, make a backup copy of the original folder
		if [[ $CHECK_HYPR == "hypr" ]]
		then
			mkdir ~/.config/backup_files
			mv ~/.config/hypr ~/.config/backup_files/
		fi


		# If waybar folder exists already, make a backup copy of the original folder
		if [[ $CHECK_WAYBAR == "waybar" ]]
		then
			mv -r ~/.config/waybar ~/.config/backup_files/
		fi


		# If "rofi" folder exists already, make a backup copy of the original folder
		if [[ $CHECK_WAYBAR == "rofi" ]]
		then
			mv -r ~/.config/rofi ~/.config/backup_files/
		fi


		# Copy the new "hypr", "waybar", "rofi" folders in the right .config directory
		mkdir ~/.config/hypr
		cp -r ${DIR}/"Hyprland/hypr" ~/.config/hypr
	
		mkdir ~/.config/waybar
		cp -r ${DIR}/"Waybar/waybar" ~/.config/waybar

		mkdir ~/.config/rofi
		cp -r ${DIR}/"Rofi" ~/.config/rofi
	else
		echo "[-] Error: Locate: Command not found!!"
		echo "[-] Exiting code!!"
		exit 1
	fi
}

#function install_i3(){
#	//Code for downloading and setting up i3-wm
#}

install_hyprland
