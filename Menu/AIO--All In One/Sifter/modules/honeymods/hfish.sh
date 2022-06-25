#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "HFish"
echo -e "${NC}"
cd /opt/HFish
echo -e "${W}Please ensure the config is set correctly${NC}"
sleep 3
nano config.ini
xterm -e ./HFish run
sleep 2
echo -e "${W}======================================================${NC}"
sleep 2

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################