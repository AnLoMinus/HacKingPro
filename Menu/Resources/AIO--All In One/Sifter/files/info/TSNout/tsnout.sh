#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

TSinfo(){
	modinfo=$(zenity --list --title  "TruffleSNout" \
		--text "Choose a Catagory" --radiolist  \
		--column "Pick" --column "Catagory" FALSE "Forest" FALSE "Domain" FALSE "Directory" FALSE "Utilities" TRUE "Exit");
	echo ${modinfo}
	if [[ ${modinfo} == "Forest" ]]; then
		zenity --title "Forest Usage" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/TSNout/forest.info" &>/dev/null
	elif [[ ${modinfo} == "Domain" ]]; then
		zenity --title "Domain Usage" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/TSNout/domain.info" &>/dev/null
	elif [[ ${modinfo} == "Directory" ]]; then
		zenity --title "Directory Usage" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/TSNout/directory.info" &>/dev/null
	elif [[ ${modinfo} == "Utilities" ]]; then
		zenity --title "Utilities Usage" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/TSNout/utils.info" &>/dev/null
	else
		exit 0
	fi
}

TSinfo
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################		
