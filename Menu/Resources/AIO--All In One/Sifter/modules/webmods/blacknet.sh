#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "Blacknet"
echo -e "${NC}"
cd /opt/Blacknet
echo -e "${W}Please enter the search query to be used: ${NC}"
read QUERY
echo -e "${W}Enter the amount of pages to search: ${NC}"
read PAGES
echo -e " ${YLW}#################"
echo -e " # ${W}Running with: ${YLW}#"
echo -e " ${YLW}#################${NC}"
echo -e " ${ORNG}:: ${RED}Query: ${LBBLUE}${QUERY}${NC}"
echo -e " ${ORNG}:: ${RED}Pages: ${LBBLUE}Searching ${PAGES} pages ${NC}"
echo -e ""
sudo python3 main.py -v -q ${QUERY} -p ${PAGES}


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################s
