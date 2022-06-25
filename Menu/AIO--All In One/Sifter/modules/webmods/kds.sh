#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/Katana
echo -e "${RED}"
figlet -f mini "Katana-DS"
echo -e "${YLW}"
PS3='Please select your mode for runtime'
            options=("Google" "Scada" "Tor" "Proxy" "Back")
            select opt in "${options[@]}"
            do
                    case $opt in
                        "Google")
                            sudo python3 kds.py -g
                            ;;

                        "Scada")
                            sudo python3 kds.py -s
                            ;;

                        "Tor")
                            sudo python3 kds.py -t
                            ;;

                        "Proxy"))
                            sudo python3 kds.py -p
                            ;;

                        "Back")
                            exit
                            ;;

                    esac
            done
    echo -e "${NC}"
sleep 5 
echo -e "	============================================"


##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################