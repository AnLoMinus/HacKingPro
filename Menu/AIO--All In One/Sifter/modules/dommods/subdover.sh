#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
if [[ ! -d '/opt/sifter/results/SubDover' ]]; then
	sudo mkdir /opt/sifter/results/SubDover
fi
echo -e "${RED}"
figlet -f mini "SubDover"
echo -e "${NC}"
cd /opt/subdover
echo -e "${ORNG}Would you like to display current scanable fingerprints?(y/n)${NC}"
read FP
if [[ ${FP} == "y" ]]; then
	sudo ./env/bin/python3 subdover.py -s
fi
echo -e "${YLW}Would you like to use a ${W}s${YLW}ingle target or a ${W}l${YLW}ist of domains?(${W}s${YLW}/${W}l${YLW})${NC}"
read TARG
if [[ ${TARG} == "s" ]]; then
	sudo ./env/bin/python3 subdover.py
	#ARG='-d'
	#echo -e "${ORNG}Please enter your target domain:${NC}"
	#read TARGET
else
	echo -e "${ORNG}Please enter your full path/to/domain_list.txt:${NC}"
	read TARGET
	echo -e "${W}Please enter the number of threads to use: (Default: 30)${NC}"
	read THRD
	if [[ ${THRD} == '' ]]; then
        THREADS='30'
	else
        THREADS=${THRD}
	fi
	echo -e "${YLW}Please enter a name for your result file${NC}"
	read OUTF
	echo "      ============================================="
	sudo ./env/bin/python3 subdover.py -l ${TARGET} --thread ${THREADS} -o ${OUTF}.txt
	sudo mv ${OUTF}.txt -t /opt/sifter/results/SubDover/
fi

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################