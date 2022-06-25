#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'

potatoes(){
	echo -e "${ORNG}Would you like to use BadPotato or SweetPotato? ${YLW}(b/s)"
	read TOE
	if [[ ${TOE} == "b" ]]; then
		cp modules/postex/PotnPea/BadPotato.exe -t /home/$USER/Desktop
		echo -e "${YLW} BadPotato.exe has been copied to your Desktop\nUpload it to an open session on target machine to use.${NC}"
		echo ""
		echo "============================================="
		echo -e "${ORNG}Usage:\n Run your program using BadPotato for System Privileges.\n ${RED}eg. ${YLW} BadPotato.exe minikatz.exe${NC}"
		echo "============================================="
		echo ""
		echo -e "${LP}When ready hit, ${LGRY} enter${NC}"
		read RANDOM
	else
		cp modules/postex/PotnPea/SweetPotato.exe -t /home/$USER/Desktop
		cp modules/postex/PotnPea/NtApiDotNet.dll -t /home/$USER/Desktop
		echo -e "${ORNG} SweetPotato.exe ${YLW}& ${ORNG}NtApiDotNet.dll ${YLW} have been copied to your Desktop\nUpload it to an open session on target machine to use.${NC}"
		echo ""
		echo "============================================="
		echo -e "${ORNG}Usage:\n Run your program using SweetPotato for System Privileges.\n ${RED}NOTE: ${YLW}Run ${ORNG}SweetPotato.exe --help ${YLW}for escalation options on target session${NC}"
		echo "============================================="
		echo ""
		echo -e "${LP}When ready hit, ${LGRY} enter${NC}"
		read RANDOM
	fi
}
peas(){
	echo -e "${ORNG}winPEAS is a program that looks for privilege escalation paths you can exploit\nThe exe file requires .net 4 on the target, otherwise the bat script should be used"
	echo -e "${W}Is your target (l)inux or (w)indows? (l/w)${NC}"
	read WINORLIN
	if [[ ${WINORLIN} == "w" ]]; then
		echo -e "${YLW}Would you like to use the (e)xe or the (b)at script? (e/b)${NC}"
		read WP
		if [[ ${WP} == "e" ]]; then
			cp modules/postex/PotnPea/winPEAS.exe -t /home/$USER/Desktop
			echo ""
			echo "============================================="
			echo -e "${W}winPEAS.exe has been copied to your Desktop\nUpload it to target machine and execute using CMD or PowerShell${NC}"
			echo "============================================="
			echo ""
			echo -e "${LP}When ready hit, ${LGRY} enter${NC}"
			read RANDOM
		else
			cp modules/postex/PotnPea/winPEAS.bat -t /home/$USER/Desktop
			echo ""
			echo "============================================="
			echo -e "${W}winPEAS.bat has been copied to your Desktop\nUpload it to target machine and execute using CMD or PowerShell${NC}"
			echo "============================================="
			echo ""
			echo -e "${LP}When ready hit, ${LGRY} enter${NC}"
			read RANDOM
		fi
	else
		cp modules/postex/PotnPea/linPEAS.sh -t /home/$USER/Desktop
		echo ""
		echo "============================================="
		echo -e "${W}linPEAS.sh has been copied to your Desktop\nUpload it to target machine and execute using CMD or PowerShell${NC}"
		echo "============================================="
		echo ""
		echo -e "${LP}When ready hit, ${LGRY}enter${NC}"
		read RANDOM
	fi
}

echo -e "${RED}"
figlet Potatoes
echo -e "${NC}"
echo ""
echo -e "${W}Would you like to attempt privilege escalation using the Pota(${ORNG}t${W})oes? or the PE(${ORNG}A${W})S? (${ORNG}t${W}/${ORNG}a${W})${NC}"
read POTNPEA
if [[ ${POTNPEA} == "t" ]]; then
	potatoes
else
	peas
fi



##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################