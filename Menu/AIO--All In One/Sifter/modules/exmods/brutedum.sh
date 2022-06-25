#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/BruteDum
echo -e "${RED}"
figlet -f mini "BruteDUM"
echo -e "${NC}"
sudo python3 brutedum.py
sleep 2

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################