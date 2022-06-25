#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/sifter
echo -e "${RED}"
figlet -f mini "TruffleSNout"
echo -e "${NC}"
cp /opt/sifter/modules/opsec/ex/TSNout.zip -t ~/Desktop
echo -e "${LP}TSNout.zip ${YLW}has been copied to your Desktop\nCopy it to a target session for execution usage${NC}"
sleep 3
echo -e "${RED}TruffleSNout consists of 4 main options:\n*****************************************${NC}\n"
echo -e "${W}1.${YLW} Forest${NC}"
echo -e "${W}2.${YLW} Domain${NC}"
echo -e "${W}3.${YLW} Directory${NC}"
echo -e "${W}4.${YLW} Utilities${NC}\n"
echo -e "${W}Usage examples have been provided for use.${NC}"
sleep 5
bash /opt/sifter/files/info/TSNout/tsnout.sh &
			
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################		