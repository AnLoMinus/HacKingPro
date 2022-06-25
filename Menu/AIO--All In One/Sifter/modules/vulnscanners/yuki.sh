#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
#FIRST='YES'

cd /root/yuki2/
sudo chmod +x Module --recursive
sudo chown $USER:$USER Module --recursive
sudo chmod +x wafninja joomscan yuki.sh startyuki yuki1 yukirun.sh install-perl-module.sh
#sudo ./install-perl-module.sh

echo -e "${ORNG}"
figlet -f small "Yuki-Chan"
echo -e "${NC}"
echo -e "${YLW}"
cat /opt/sifter/files/pingtest.pass
echo -e "${NC}"
echo -e "${W}Please copy and paste in your target site\nOr enter as per example above${NC}"
echo "================================================================================================="

sleep 1
sudo ./startyuki
echo "================================================================================================="



##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
