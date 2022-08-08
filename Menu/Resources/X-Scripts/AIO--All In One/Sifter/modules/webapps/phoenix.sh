#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

sudo chown $USER:$USER /opt/sifter/modules/webapps/pnx --recursive
sudo chmod 777 /opt/sifter/modules/webapps/pnx --recursive
cd /opt/sifter/modules/webapps/pnx/
npm install .
echo -e "${RED}"
figlet -f mini "       Phoenix"
echo -e "${NC}"
npm start &
