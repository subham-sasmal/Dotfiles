#!/bin/bash

SSID="Retro"

read -p "[+] Proceed to connect to SSID: Retro? (y/N) [default=y]: " YORN

if [ $YORN == 'n' ] || [ $YORN == 'N' ]
then
	#echo "[+] Available networks: "
	echo "[+] Available networks: " && sudo iw wlp0s20f3 scan | grep SSID | awk '{print $2}' | nl 

	read -p "[+] Enter network name: " NETWORK_NAME
	nmcli con up $NETWORK_NAME --ask
else
	nmcli con up $SSID --ask
fi
