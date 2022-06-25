#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
PY3='/opt/'

cd /opt/attack-website/
echo -e "${RED}"
figlet -f mini "Mitre-Attack"
echo -e "${NC}"
sudo ./env/bin/python3 update-attack.py
cd output
sudo ./../env/bin/python3 -m pelican.server


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
