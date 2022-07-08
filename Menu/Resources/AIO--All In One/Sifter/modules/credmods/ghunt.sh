#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/GHunt
echo -e "${RED}"
figlet -f mini "GHunt"
echo -e "${NC}"
echo -e "${YLW}Please enter the email address you'd like to hunt${NC}"
read EADDR
sudo python3 hunt.py ${EADDR}
sleep 5 
echo -e "	============================================"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################