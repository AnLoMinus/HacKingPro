#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${ORNG}"
figlet -f mini "ReconSpider"
echo -e "${NC}"
cd /opt/reconspider
sudo python3 reconspider.py
sleep 2


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################