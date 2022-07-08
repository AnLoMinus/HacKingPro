#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
listing(){
    echo -e "${YLW}"
    cat /opt/sifter/files/pingtest.pass
    echo -e "${NC}"
}
check(){
    if [[ ! -d '/opt/sifter/results/SubFinder' ]]; then
        mkdir /opt/sifter/results/SubFinder
    fi
}

cd /opt/subfinder
echo -e "${RED}"
figlet -f mini "SubFinder"
echo -e "${NC}"
check
listing
echo -e "${W}Please enter your target${NC}"
read TARGET
echo -e "${YLW}Please enter the name for your output file${NC}"
read OUTF
echo -e "${YLW}Would you like to enable (v)ebose output, (n)ormal output or scan (s)ilently?${W}(v/n/s)${NC})"
read VER
if [[ ${VER} == "v" ]]; then
    SCAN='-v'
elif [[ ${VER} == 's' ]]; then
    SCAN='-silent'
else
    SCAN=''
fi
sleep 2
echo "    ============================="
sudo subfinder -nW -d ${TARGET} -oI -o ${OUTF} ${SCAN}
echo "    ============================="
sudo mv ${OUTF} -t /opt/sifter/results/SubFinder
sleep 2

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
