#!/bin/bash
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
UBLUE='\033[4;34m'
URED='\033[4;31m'

# Functions
GUI1(){
    cat /opt/sifter/files/info/tacticalek.info
}
GUI2(){
    zenity --title "TacticalEK" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/tacticalek.info" &>/dev/null
}
commands(){
    if [[ ${CHOICE} == "1" ]]; then
        sudo python3 easywin.py
    elif [[ ${CHOICE} == "2" ]]; then
        sudo chown $USER:$USER letmein.ps1
        mv letmein.ps1 -t ~/Desktop
        echo -e "${RED}NOTE: ${W}LetMeIn.ps1 ${YLW}has been moved to your desktop\nUpload it to a compromised host for use${NC}"
    elif [[ ${CHOICE} == "3" ]]; then
        sudo python3 proiluk.py
    elif [[ ${CHOICE} == "4" ]]; then
        sudo python3 botshot.py
    elif [[ ${CHOICE} == "5" ]]; then
        sudo python3 verbal.py
    elif [[ ${CHOICE} == "6" ]]; then
        sudo python3 netdork.py
    elif [[ ${CHOICE} == "7" ]]; then
        sudo python3 seitan.py
    elif [[ ${CHOICE} == "8" ]]; then
        return
    elif [[ ${CHOICE} == "" ]] || [[ ${CHOICE} == "*" ]]; then
        exit 1
    fi
}

# Main Start
echo -e "${RED}"
figlet TacticalEK
echo -e "${NC}"
#cd /opt/tactical-exploitation
XTC=$(which xterm)
# Checks if xTerm is available. If not info is printed to terminal
if [[ ${XTC} == "" ]]; then
    GUI1
else
    GUI2
fi
echo -e " ${W}Please select the tool you would like to use"
echo -e " ${YLW}1.${W} EasyWin     ${YLW}5.${W} Verbal ${NC}"
echo -e " ${YLW}2.${W} LetMeIn     ${YLW}6.${W} Netdork ${NC}"
echo -e " ${YLW}3.${W} Poriluk     ${YLW}7.${W} Seitan ${NC}"
echo -e " ${YLW}4.${W} BotShot     ${YLW}8.${W} Back ${NC}"
read CHOICE
commands
