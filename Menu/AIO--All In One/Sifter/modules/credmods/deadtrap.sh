#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/DeadTrapv2
echo -e "${RED}"
figlet -f mini "DeadTrap"
echo -e "${NC}"
echo -e "${YLW}Would you like to scan a (${W}s${YLW})ingle number or a (${W}l${YLW})ist?\n${W}List must consist of 1 number per line${NC}"
read TLIST
if [[ ${TLIST} == "s" ]]; then
	TARG='-n'
	echo -e "${YLW}Please enter the target number${NC}"
	read TARGET
else
	TARG='-i'
	echo -e "${YLW}Please enter the path/to/list.txt${NC}"
	read TARGET
fi
echo -e "${YLW}Which scanning method would you like to use?${NC}"
echo -e "${RED}1. ${W}Spider\n -Scans each disposable number providing website's source code\n  available on the dukduckgo frontpage to see if the number is\n  available there (${YLW}no proxy required${W})${NC}"
echo -e "${RED}2. ${W}Dork\n -uses google dork search results to find out if the number is there\n  in a disposable number providing website available on the\n  front page of duckduckgo (${RED}requires proxy${W})${NC}"
read SOPT
if [[ ${SOPT} == "1" ]]; then
	SARG='spider'
else
	SARG='dork'
fi
echo -e "${YLW}Would you like to use the verbose setting?${NC}"
read VOPT
if [[ ${VOPT} == "y" ]]; then
	VARG='-v'
else
	VARG=''
fi
sudo python3 main.py ${TARG} ${TARGET} -s ${SARG} -o -rep ${VARG}

echo -e "	============================================"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################