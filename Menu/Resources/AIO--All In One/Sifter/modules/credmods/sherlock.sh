#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
TOUT='60'

if [[ -d '/opt/sifter/results/Sherlock' ]]; then
    sleep 2
else
    mkdir /opt/sifter/results/Sherlock
fi
cd /opt/sherlock
echo -e "${ORNG}"
figlet -f mini "Sherlock"
echo -e "${NC}"
echo -e "${W}Would you like results to be ranked in order of their score on Alexia.com?(y/n)${NC}"
read RANKC
if [[ ${RANKC} == 'y' ]]; then
    RANK='--rank'
else
    RANK=''
fi
echo -e "${W}Would you like to save only the websites the username was (f)ound on or (a)ll the sites checked?(f/a)${NC}"
read SITEC
if [[ ${SITEC} == 'a' ]]; then
    PFOUND=''
else
    PFOUND='--print-found'
fi
echo -e "${W}Please set a timeout limit for requests (Default is 60s)${NC}"
read TOUT
echo -e "${W}Would you like to make requests through tor?(y/n)${NC}"
echo -e "${RED}NOTE: ${ORNG}increases runtime & requires tor to be accessable from system path${NC}"
read TORC
if [[ ${TORC} == 'y' ]]; then
    sudo service tor start
    TOR='--tor'
else
    TOR=''
fi
echo -e "${W}Please enter the target username/s${NC}"
echo -e "${RED}NOTE: ${ORNG}separated by a space for multiple usernames${NC}"
read USERS
echo -e "${W}===========================================================================${NC}"
sudo python3 serlock.py --verbose ${RANK} -fo /opt/sifter/results/Sherlock ${TOR} --csv --timeout ${TOUT} ${PFOUND} '${USER}'
echo -e "${YLW}Results have been saved to /opt/sifter/results/Sherlock"
echo -e "${W}===========================================================================${NC}"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
