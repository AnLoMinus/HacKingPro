#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

if [[ ! -d '/opt/sifter/results/Big_IP_RCE' ]]; then
    mkdir /opt/sifter/results/Big_IP_RCE
fi
echo -e "${RED}"
figlet "F5 Big IP Remote Execution Scanner"
echo -e "${NC}"
echo -e "${YLW}For the best results, use a subdomain list (${W}one of the results\nfiles from a subfinder scan works well${YLW})${NC}"
echo -e "${W}    ========================${NC}"
echo -e "${YLW}/opt/sifter/results/SubFinder/:"
ls /opt/sifter/results/SubFinder
echo -e "${W}    ========================${NC}"
echo -e "${YLW}Please enter your domain list or enter the full path/to/subfinder_list.txt${NC}"
read TARGETS
echo -e "${ORNG}Please enter the name for your output file${NC}"
read OUTF
sudo python3 CVE-2020-5902.py ${TARGETS} > ${TARGETS}.log
sudo mv ${TARGETS}.log /opt/sifter/results/Big_IP_RCE/${OUTF}.txt
echo -e "${RED}Your Output file has been saved to \n${ORNG}/opt/sifter/results/Big_IP_RCE/${OUTF}.txt${NC}"
sleep 5
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################