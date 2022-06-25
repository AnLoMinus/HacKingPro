#!/bin/bash

ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
ARG=$2
cd /opt/flan
PNC=$(cat Makefile | grep "-Pn")
if [[ ${PNC} == "-Pn" ]]; then
	out="shared\:Z\" flan_scan"
	in="shared\:Z\" flan_scan -Pn"
	sudo sed -i "s/${out}/${in}/g" Makefile
fi
while getopts "t:" options; do
	case "${options}" in
		t)
			echo "$ARG" > shared/ips.txt
			echo -e "${LP}Running Flan Vuln Scanner against ${ORNG}$ARG${NC}"
			sudo make start
	esac
done
if (( $OPTIND == 1 )); then	# if no option is passed
	echo -e "${RED}"
	figlet FlaN					# during script execution then
	echo -e "${YLW}"
	cat shared/ips.txt				# the default command will run
	echo -e "${W}Is your target list correct?(y/n)${NC}"
	read TARGET
	sleep 1
	if [ $TARGET == y ]; then
	        sudo make start
	else
	        sudo nano shared/ips.txt
	        sleep 1
	        sudo make start
	fi
	echo -e "${ORNG}Done${NC}"
fi
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################