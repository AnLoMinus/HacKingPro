#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'

echo -e "${ORNG}"
figlet -f mini "WebMap"
echo -e "${NC}"
sudo docker container rm webmap --force
sudo rm /opt/WebMap/.token
sudo docker run -d \
			--name webmap \
			-h webmap \
			-p 8000:8000 \
			-v /tmp/webmap:/opt/xml \
			reborntc/webmap
if [[ ! -f '/opt/WebMap/.token' ]]; then
		sudo docker start webmap
		TKN=$(sudo docker exec -ti webmap /root/token)
		sudo touch /opt/WebMap/.token
		sudo chown $USER:$USER /opt/WebMap/.token
		echo ${TKN} > /opt/WebMap/.token
fi
if [[ ! -f '/opt/WebMap/.browser' ]]; then
		sudo docker start webmap
		sudo touch /opt/WebMap/.browser
		sudo chown $USER:$USER /opt/WebMap/.browser
		echo -e "${YLW}For runtime the WebMap module will attempt to automatically open the local browser to access the panel\nAs not everyone uses the same browser and to make this as compatible as possible while not installing to many extras.\n${W}Please enter the termianl command for your browser. (eg. ${ORNG}chromium ${W}| ${ORNG}firefox ${W}| ${ORNG}firefox-esr ${W}| ${ORNG}chrome)${NC}"
		read BROWSE
		echo ${BROWSE} > /opt/WebMap/.browser
fi
echo -e "${YLW}Please enter the target IP or block: ${NC}"
read TAR
echo -e "${W}Please enter a name for this scan${NC}"
read SN
TKN=$(cat /opt/WebMap/.token)
BRWS=$(cat /opt/WebMap/.browser)
echo -e "${YLW}Your WebMap panel login token is: ${LBBLUE}${TKN}${NC}"
sudo nmap -sT -A -T4 -oX /tmp/webmap/${SN}.xml ${TAR} &
sleep 5
${BRWS} http://localhost:8000 &


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
