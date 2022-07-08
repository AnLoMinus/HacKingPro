#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/sifter
lolcat /opt/sifter/modules/postex/BSK/.ban
sleep 1
echo -e "${RED}Release & Debug Binaries have been provided\n${YLW}Would you like to use the ${ORNG}R${YLW}elease or ${ORNG}D${YLW}ebug build?${NC}"
read BOPT
if [[ ${BOPT} == "r" ]] || [[ ${BOPT} == "R" ]]; then
	cp /opt/sifter/modules/postex/BSK/BSK.zip -t /home/$USER/Desktop
	cp /opt/sifter/extras/unzip.exe -t /home/$USER/Desktop
	ZIP='BSK.zip'
	BIN='bsk32 & bsk64'
else
	cp /opt/sifter/modules/postex/BSK/BSKdebug.zip -t /home/$USER/Desktop
	cp /opt/sifter/extras/unzip.exe -t /home/$USER/Desktop
	ZIP='BSKdebug.zip'
	BIN='bsk32debug & bsk64debug'
fi
echo -e "${ORNG}${ZIP} (${YLW}containing the ${LP}BetterSafetyKayz ${YLW} binararies - ${ORNG}${BIN}${YLW}) has been copied to your Desktop\nUpload it to your target session, unzip and execute in CLI for use."
sleep 5
echo -e "	============================================"


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################