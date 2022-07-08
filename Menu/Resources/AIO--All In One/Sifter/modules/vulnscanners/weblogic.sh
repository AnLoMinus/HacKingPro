#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
if [[ ! -d /opt/sifter/results/Weblogic ]]; then
    sudo mkdir /opt/sifter/results/Weblogic
fi
echo -e "${RED}"
figlet -f mini "WeblogicScanner"
echo -e "${NC}"
cd /opt/weblogicScanner
echo -e "${W}Please enter the target or targets (seperated by a space)${NC}"
read TARGET
echo -e "${W}Please enter an output name for scan results${NC}"
read OUTNAME
sudo ./venv/bin/python3 ws.py -t ${TARGET} -o /opt/sifter/results/Weblogic/${OUTNAME}.json

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################