#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/sifter
echo -e "${RED}"
figlet -f mini "Snaffler"
echo -e "${NC}"
cp /opt/sifter/modules/opsec/snaffle/Snaffler.exe -t ~/Desktop
echo -e "${LP}Snaffler.exe ${YLW}has been copied to your Desktop\nCopy it to a target session for execution usage${NC}"
sleep 3
echo -e "${W}Snaffler ${ORNG}general info ${W}& ${ORNG}Usage info ${W}willl now be shown\n${RED}NOTE: ${YLW}Reading this info is ${ORNG}highly ${YLW}recommended${NC}"
sleep 5
# General Info
zenity --title "Snaffler | General Info" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/snaffle/snaffler.info" &>/dev/null
# Usage Info
zenity --title "Snaffler | Usage Info" \
	   		--height=600 --width=800 \
			--text-info --filename="/opt/sifter/files/info/snaffle/snaffler_usage.info" &>/dev/null
			
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################		