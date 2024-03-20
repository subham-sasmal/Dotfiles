#!/bin/bash

function install_hyprland() {
	sudo pacman -S hyprland waybar kitty neofetch rofi swww

	CHECK_HYPR=$(ls ~/.config/ | grep hypr)
	CHECK_WAYBAR=$(ls ~/.config/ | grep waybar)

	CHECK_LOCATE=$(which locate)

	if [[ $CHECK_LOCATE = "/usr/bin/locate" ]]
	then
		echo -e "\033[1mUpdating locate database\033[0m"

		sudo updatedb
	
		DIR=$(locate .DotFiles | grep .DotFiles$)

		cp -r ${DIR}/"Pictures/*" ~/Pictures 

		if [[ $CHECK_HYPR = "hypr" ]]
		then
			mkdir ~/.config/backup_files
			mv ~/.config/hypr ~/.config/backup_files/
		fi

		if [[ $CHECK_WAYBAR = "waybar" ]]
		then
			mv -r ~/.config/waybar ~/.config/backup_files/
		fi
	
		mkdir ~/.config/hypr
		cp -r ${DIR}/"Hyprland/hypr" ~/.config/hypr
	
		mkdir ~/.config/waybar
		cp -r ${DIR}/"Waybar/waybar" ~/.config/waybar
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
