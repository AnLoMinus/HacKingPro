#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "OSINTGram"
echo -e "${NC}"
cd /opt/Osintgram
if [[ ! -f "/opt/Osintgram/config/username.conf" ]]; then
	echo -e "${W}Please enter your Instagram username${NC}"
	read INAME
	sudo touch config/username.conf
	sudo chown $USER:$USER config/username.conf
	echo "${INAME}" > config/username.conf
fi
if [[ ! -f "/opt/Osintgram/config/pw.conf" ]]; then
	echo -e "${W}Please enter your Instagram password ${NC}"
	read INAME
	sudo touch config/pw.conf
	sudo chown $USER:$USER config/pw.conf
	echo "${INAME}" > config/pw.conf
fi
if [[ ! -f "/opt/Osintgram/config/settings.json" ]]; then
	sudo touch config/settings.json
	sudo chown $USER:$USER config/settings.json
	echo "{}" > config/settings.json
fi
echo -e "${YLW}Please enter the username youd like to search${NC}"
read TUSER
sudo ./env/bin/python3 main.py ${TUSER}

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
