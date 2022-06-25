#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "V3n0M-Scanner"
echo -e "${NC}"
cd /opt/V3n0M-Scanner
source env/bin/activate
sudo ./env/bin/python3.6 build/lib/v3n0m/v3n0m.py
sleep 2
echo -e "${W}======================================================${NC}"
sleep 2

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################