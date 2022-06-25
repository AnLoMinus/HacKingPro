#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
second(){
    echo -e "${W}Would you like to try another?${YLW}(y/n)${NC}"
    read ANS
    if [[ ${ANS} == "y" ]]; then
        call_ciphey
    else
        exit
    fi
}
call_ciphey(){
    echo -e "${YLW}Please enter the hash you'd like to try crack${NC}"
    read HASH
    echo -e "${W}Would you like to only print the answer? ${YLW}(y/n)${NC}"
    read ANS
    if [[ ${ANS} == "n" ]]; then
        echo -e "${W}Would you like to enable verbose settings? ${YLW}(y/n)${NC}"
        read VS
        if [[ ${VS} == "y" ]]; then
            VER='--verbose'
        fi
    fi
    echo -e "${W}Would you like to try a specific wordlist as well? ${YLW}(y/n)${NC}"
    read WL
    if [[ ${WL} == "y" ]]; then
        echo -e "${ORNG}Please enter the full path/to/list.txt${NC}"
        read WLP
        FWLP="--wordlist ${WLP}"
    else
        FWLP=''
    fi
    ciphey -t "${HASH}" ${VER} ${FWLP}
    second
}

echo -e "${RED}"
figlet Ciphey
echo -e "${NC}"
call_ciphey
##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################