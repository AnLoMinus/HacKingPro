#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

# Generate
gen(){
    echo -e "${W}Please enter your number and mask to use (${RED}eg. ${ORNG}555XXX1234${W})${NC}"
    read NUM 
    echo -e "${W}Please enter your path/to/outfile.txt${NC}"
    read OUTPUT
    sleep 2
    sudo python email2phonenumber.py generate -m ${NUM} -o ${OUTPUT}
}
# Scrape
scrape(){
    echo -e "${W}Please enter target email to try scrape Numbers for${NC}"
    read ETAR
    sudo python email2phonenumber.py scrape -e ${ETAR}
}
# Bruteforce
brute(){
    echo -e "${W}Please enter your number and mask to use (${RED}eg. ${ORNG}555XXX1234${W})${NC}"
    read NUM
    echo -e "${W}Please enter target email to try scrape Numbers for${NC}"
    read ETAR
    echo -e "${W}Please enter ${YLW}path/to/proxies.txt${W} to use in order to mask detection${NC}"
    read PROX 
    sudo python email2phonenumber.py bruteforce -m ${NUM} -e ${ETAR} -p ${PROX} -q
}

# Runtime
echo -e "${ORNG}"
figlet -f mini "Email2PhoneNumber"
echo -e "${NC}"
cd /opt/email2phonenumber
echo -e "${YLW}Please select the option to use?${NC}"
echo -e "${YLW}"
    options=("Generate" "Bruteforce" "Scrape" "Back") 
    select opt in "${options[@]}"
    do
        case $opt in
            "Generate")
                echo -e "${ORNG}Generate a dictionary of valid phone numbers based on a phone number mask${NC}"
                gen
                ;;

            "Bruteforce")
                echo -e "${ORNG}Find target's phone number by resetting passwords on websites that do not alert the target\nThis is done using a phone number mask and proxies to avoid captchas and other abuse protections${NC}"
                brute
                ;;

            "Scrape")
                echo -e "${ORNG}Scrape websites for phone number digits${NC}"
                scrape
                ;;

        esac
    done
echo -e "${NC}"
sleep 2

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################