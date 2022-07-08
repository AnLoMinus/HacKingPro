#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/TorBot
echo -e "${RED}"
figlet -f mini "TorBot"
echo -e "${NC}"
echo -e "${W}Would you like to use TorBot from command-line or GUI? (c/g)${NC}"
read OPT
if [[ ${OPT} == "c" ]]; then
  echo -e "${YLW}Please enter the target onion URL: ${NC}"
  read TARG
  echo -e "${YLW}Would you like to gather general info or all info? (g/a)${NC}"
  read INF
  if [[ ${INF} == "g" ]]; then
    INFO=''
  else
    INFO='--info'
  fi
  echo -e "${YLW}Would you like to check if the site is still alive? (y/n)${NC}"
  read LIV
  if [[ ${LIV} == "y" ]]; then
    LIVE='--live'
  else
    LIVE=''
  fi
  sudo python3 src/torBot.py --update -u ${URL} -s -m ${INFO} ${LIVE}
  sudo mv *.json -t /opt/sifter/results/TorBot
else
  sudo docker run --link tor:tor --rm -ti dedsecinside/torbot
fi
