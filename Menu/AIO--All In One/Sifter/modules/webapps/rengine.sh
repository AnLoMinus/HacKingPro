#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

CHK=$(cat /opt/rengine/docker-compose.yml | grep "- 80:80/tcp")
if [[ ${CHK} == "- 80:80/tcp" ]]; then
    IN1='- 9080:80/tcp'
    IN2='- 9443:443/tcp'
    OUT1='- 80:80/tcp'
    OUT2='- 443:443/tcp'
    sudo sed -i "g/${OUT1}/${IN1}/s" /opt/rengine/docker-compose.yml
    sudo sed -i "g/${OUT2}/${IN2}/s" /opt/rengine/docker-compose.yml
fi
cd /opt/rengine
echo -e "${RED}"
figlet -f mini "       reNgine"
echo -e "${NC}"
echo "   ================================"
xterm -e sudo make up & 
echo -e "${YLW}When firefox opens reNgine may not be finished building\nJust wait until the reNgine build in xterm has finished then reload firefox${NC}"
sleep 420
xterm -e firefox https://127.0.0.1:9443 && sudo docker stop rengine_proxy_1 rengine_web_1 rengine_db_1
sleep 10
echo "   ================================"

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################

