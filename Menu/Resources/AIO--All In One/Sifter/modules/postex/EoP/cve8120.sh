#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
INV='\e[7m'
URED='\033[4;31m'
UBLUE='\033[4;34m'

echo -e "${INV}"
cp /opt/sifter/modules/postex/EoP/cve-2018-8120.zip -t /home/$USER/Desktop
cp /opt/sifter/extras/unzip.exe -t /home/$USER/Desktop
sudo chown $USER:$USER /home/$USER/Desktop/cve-2018-8120.zip /home/$USER/Desktop/unzip.exe
figlet -f mini "CVE-2018-8120"
echo -e "${URED}cve-2018-8120.zip ${W}has been copied to your Desktop. (Currently only Release binary provided)\nIf you would like to compile the binaries yourself\n${YLW}Please clone https://github.com/unamer/CVE-2018-8120 & put the built binaries in ${ORNG}cve-2018-8120.zip${YLW} in ${W}/opt/sifter/modules/postex/EoP${NC}"
echo -e "${W}Please transfer this file to target and unzip in a CLI"
echo -e "then run ${UBLUE}'cve-2018-8120.exe <command>/<file>' ${W}from a command terminal on target${NC}"
echo -e "     ${W}===================================== ${NC} "
echo -e "${ORNG}unzip.exe ${INV} has been moved to your desktop as well \nso you can easily unzip your files${NC}"

sleep 10


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
