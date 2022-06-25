#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f small "Responder"
echo -e "${NC}"
cd /opt/Responder
echo -e "${W}Please specify the network interface Responder should use${NC}"
read INTF
echo -e "${W}Would you like to run Responder in Analysis mode?\n${RED}NOTE: ${W}No responses will be made! (${ORNG}y${W}/${RED}n${W})${NC}"
read MODE
if [[ ${MODE} == "y" ]]; then
  sudo python3 Responder.py -I ${INTF} -A
else
  sudo python3 Responder.py --help
  echo -e "${YLW}Please specify runtime options (${RED}eg. ${ORNG}wrf${RED}/${ORNG}rduF${RED})${NC}"
  read ARGS
  sudo python3 Responder.py -I ${INTF} -${ARGS} -v

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
