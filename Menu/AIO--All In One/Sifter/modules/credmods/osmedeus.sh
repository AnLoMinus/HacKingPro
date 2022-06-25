#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/docker-osmedeus
if [[ ! -d '/opt/sifter/results/Osmedeus' ]]; then
	mkdir /opt/sifter/results/Osmedeus
fi
echo -e "${RED}"
figlet -f mini "OsmedeuS"
echo -e "${NC}"
if [[ -f '/opt/docker-osmedeus/.configured' ]]; then
	CHKHOLD=$(echo .configured)
	if [[ ${CHKHOLD} == "HOLD" ]]; then
		sudo docker build -t mablanco/osmedeus .
		sudo rm .configured
		echo "DONE" | sudo tee -a /opt/docker-osmedeus/.configured
	fi
fi
echo -e "${W}Please enter your target${NC}"
read TARGET
mkdir /opt/sifter/results/Osmedeus/${TARGET}
sleep 5
echo -e "${LP}Starting Osmedeus Container${NC}"
sudo docker run -it --name osmedeus -p 8000:8000 mablanco/osmedeus ./osmedeus.py -t ${TARGET} --slow "all" &
sleep 5
echo -e "${RED}an xTerm window will pop-up with your password for Osmedeus Web UI, available at http://127.0.0.1:8000"
xterm -e sudo docker exec -it osmedeus grep password /root/.osmedeus/client.conf
sudo docker cp osmedeus:/root/.osmedeus/workspaces/* /opt/sifter/results/Osmedeus/${TARGET}|-


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
