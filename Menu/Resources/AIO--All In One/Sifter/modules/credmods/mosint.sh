#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/mosint
echo -e "${RED}"
figlet -f mini "Mosint"
echo -e "${NC}"
if [[ ! -f '.conf' ]]; then
  echo -e "${YLW}For mosint to work correctly you need to configure the API keys in ${RED}config.json\n${W}These API's can be found at:"
  echo -e "${LP}- ${ORNG}verify-email.org\n${LP}- ${ORNG}hunter.io\n${LP}- ${ORNG}leak-lookup.com${NC}"
  echo -e "${W}Please enter them now${NC}"
  sudo nano config.json
  echo 1 | sudo tee .conf
fi
echo -e "${ORNG}Please enter the email address to perform reconnaissance on${NC}"
read TARGET
sudo python3 mosint.py -e ${TARGET}
sleep 30
echo -e "	============================================"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
