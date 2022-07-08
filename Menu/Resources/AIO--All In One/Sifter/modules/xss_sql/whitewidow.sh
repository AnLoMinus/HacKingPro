#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${ORNG}"
figlet -f mini "White Widow"
echo -e "${NC}"
cd /opt/whitewidow
echo -e "${YLW}Would you like to run WhiteWidow against a (s)ingle URL or (l)ist? (s/l)${NC}"
read ANS
if [[ ${ANS} == "s" ]]; then
    ARG='-d'
    echo -e "${W}Please enter your target: ${NC}"
    read TARGET
else
    ARG='-f'
    echo -e "${W}Please enter your full path/to/list.txt${NC}"
    read TARGET
fi
sudo ruby whitewidow.rb ${ARG} ${TARGET}

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################