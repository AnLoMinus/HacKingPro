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
figlet -f mini "EventCleaner"
echo -e "${NC}"
echo -e "${ORNG}EvClean.zip (${YLW}containing ${LP}EventCleaner.exe ${YLW} & ${LP}unlocker.dll${YLW}) has been copied to your Desktop\nUpload it to your target session, unzip and execute in CLI for use."
cp /opt/sifter/modules/opsec/ex/EvClean.zip -t /home/$USER/Desktop
sleep 5
echo -e "${YLW}Would you like to see info on EvClean for example usage?(y/n)${NC}"
read EVINFO
if [[ ${EVINFO} == "y" ]]; then
	zenity --title "EventCleaner" \
	   --text-info --filename="/opt/sifter/files/info/eventcleaner.info" &>/dev/null
fi
echo -e "	============================================"


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################