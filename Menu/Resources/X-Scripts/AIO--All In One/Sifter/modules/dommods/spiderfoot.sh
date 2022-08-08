#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${ORNG}"
figlet -f mini "Spiderfoot"
echo -e "${NC}"
cd /opt/spiderfoot
xterm -e sudo python3.8 sf.py -l 127.0.0.1:5001 &
sleep 5
xterm -e firefox http://127.0.0.1:5001 &
sleep 5

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################