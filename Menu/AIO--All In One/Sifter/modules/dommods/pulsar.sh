#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
URED='\033[4;31m'

cd /opt/pulsar

# Runtime Options
runtime(){
    echo -e "${ORNG}"
    PS3='What tool would you like to do?'
        options=("Start Pulsar" "Check current containers" "Rebuild Pulsar Containers" "Back")
        select opt in "${options[@]}"
        do
            case $opt in
                "Start Pulsar")
                    echo -e "${ORNG}These are your Login Credentials for Pulsar${NC}"
                    cat /opt/pulsar/web.env
                    echo -e "${YLW}Once the nginx server has booted ${W}(approx. 5mins)${YLW}\nOpen your browser to https:// ${NC}"
                    xterm -e sleep 420 && firefox https://127.0.0.1:8443 & \ sudo docker-compose up --force-recreate
                    ;;

                "Check current containers")
                    echo -e "${ORNG}Checking current Pulsar build containers\n${RED}Please Wait. . . ${NC}"
                    sudo docker-compose build
                    runtime
                    ;;

                "Rebuild Pulsar Containers")
                    echo -e "${ORNG}Building fresh Pulsar containers\n${RED}Please Wait. . . ${NC}"
                    echo -e "${YLW}When prompted please enter the old containers IMAGE ID's seperated by a space\n${RED}eg. ${W}43e3995ee54a 17150f4321a3 355842be9433${NC}"
                    sudo docker-compose build --no-cache
                    runtime
                    ;;

                "Back")
                    exit
                    ;;

            esac
        done
    echo -e "${NC}"
}

echo -e "${RED}"
figlet -f mini "Pulsar"
echo -e "${NC}"
if [[ -f '.build' ]]; then
    runtime
else
    echo -e "${URED}First run. . .\nBuilding Pulsar Containers${NC}"
    echo -e "${RED}NOTE: ${ORNG}This Module will take a while to configure and build the containers${NC}"
    echo -e "${LP}Would you like to continue? ${LP}(${YLW}y${LP}/${YLW}n${LP})${NC}"
    read CONT
    if [[ ${CONT} == "y" ]]; then
        runtime
    fi
fi
echo "    =========================="

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
