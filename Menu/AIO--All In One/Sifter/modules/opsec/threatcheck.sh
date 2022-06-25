#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

runtime(){
	echo -e "${W}Would you like to check a file or URL? (f/u)${NC}"
	read FILE
	if [[ ${FILE} == 'f' ]]; then
		ARG='-f'
		echo -e "${YLW}Please enter the full path/to/file${NC}"
		read BIN
	else
		ARG='-u'
		echo -e "${YLW}Please enter the URL to be scanned${NC}"
		read BIN
	fi

	echo -e "${LBBLUE}Scan Results:${NC}\n${ORNG}Target: ${LP}${BIN}${NC}"
	echo -e "${W}=======================================${NC}"
	echo -e "${RED}Defender Check:${NC}"
	wine ThreatCheck.exe -e Defender ${ARG} ${BIN}
	echo -e "${W}=======================================${NC}"
	echo -e "${RED}AMSI Check:${NC}"
	wine ThreatCheck.exe -e AMSI ${ARG} ${BIN}
	echo -e "${W}=======================================${NC}"
	echo -e "${YLW}Would you like to run another scan? (y/n)${NC}"
	read OPT
	if [[ ${OPT} == 'y' ]]; then
		runtime
	fi
}

cd /opt/sifter/modules/opsec/TC
echo -e "${RED}"
figlet -f mini "ThreatCheck"
echo -e "${NC}"
runtime
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################		