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

 if [[ -d /opt/vulnx/output ]]; then
	sleep 1
else
	sudo mkdir /opt/vulnx/output
fi
cd /opt/vulnx
echo -e "${RED}"
figlet -f mini VulnX
echo -e "${NC}"
echo -e "${W}Would you like to set options or run interactive mode?${YLW}(i/m)${NC}"
read MODE
if [[ ${MODE} == "i" ]]; then
	vulnx --it
else
	echo -e "${W}Would you like to scan a single URL or a target list?${YLW}(s/l)${NC}"
	read OPT
	if [[ ${OPT} == "s" ]]; then
		echo -e "${W}Please enter the target URL to scan: ${NC}"
		read URL
		TARGET='-u ${URL}'
	else
		echo -e "${W}Please enter the full path/to/targets.txt${NC}"
		read LIST
		TARGET='-i ${LIST}'
	fi
	echo -e "${W}Would you like to use Google Dorks?${YLW}(y/n)${NC}"
	read GDANS
	if [[ ${GDANS} == "y" ]]; then
		echo -e "${W}Please enter the Google Dork values to use${NC}"
		read DORKS
		GDORK='-D ${DORKS}'
	else
		GDORK=''
	fi
	echo -e "${W}Please enter the value for HTTP request timeout${NC}"
	read TOUT
	echo -e "${W}Please enter the amount of pages that should be crawled in Google: ${NC}"
	read PAGES
	echo -e "${W}Please enter the ports to scan (seperated by a space)${LP}"
	echo -e "eg. 80 443 445" 
	read PORTS
	echo -e "${W}Please enter the amount of threads to run${NC}"
	read THREADS
	echo -e "${INV}==========================================================================${NC}"
	sudo python3 vulnx.py ${TARGET} ${GDORK} -t ${TOUT} -e -d -w -n ${PAGES} -p '${PORTS}' --threads ${THREADS} --dns -o /opt/vulnx/output/
fi


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################