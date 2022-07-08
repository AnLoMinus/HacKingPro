#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "iKy"
echo -e "${NC}"
cd /opt/iKy-pack
sudo python3 -m pip install -r requirements.txt &>/dev/null
cd backend
xterm -e sudo python3 app.py -e prod
sleep 10
xterm -e firefox http://127.0.0.1:4200 &

echo -e "${W}======================================================${NC}"

sleep 2


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
