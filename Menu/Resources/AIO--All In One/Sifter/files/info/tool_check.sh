#!/bin/bash
LPATH='/opt/sifter/'
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
BIGreen='\033[1;92m'
BIYellow='\033[1;93m'
UBLUE='\033[4;34m'
URED='\033[4;31m'
LOLpause(){
	D='1'
	sudo touch .numbers
	sudo chown $USER:$USER .numbers
	for i in `seq -s \  5`;
	do
		echo ${D}... > .numbers
		lolcat .numbers
		sleep 1
		D=$(( $D + 1 ))
	done
	rm .numbers
}
LOLpause2(){
	D='5'
	sudo touch .numbers
	sudo chown $USER:$USER .numbers
	for i in `seq -s \  5`;
	do
		echo ${D}... > .numbers
		lolcat .numbers
		sleep 1
		D=$(( $D + 1 ))
	done
	rm .numbers
}

if [[ ! -d '/opt/SniffingBear' ]]; then
	t1=${RED}'*'
else
	t1=${BIGreen}'!'
fi
if [[ ! -d '/opt/HoneyCaught' ]]; then
	t3=${RED}'*'
else
	t3=${BIGreen}'!'
fi
if [[ ! -d '/root/BlackWidow' ]]; then
	t4=${RED}'*'
else
	t4=${BIGreen}'!'
fi
if [[ ! -d '/opt/rapidscan' ]]; then
	t6=${RED}'*'
else
	t6=${BIGreen}'!'
fi
if [[ ! -d '/opt/shodansploit' ]]; then
	t7=${RED}'*'
else
	t7=${BIGreen}'!'
fi
if [[ ! -d '/root/yuki' ]]; then
	t8=${RED}'*'
else
	t8=${BIGreen}'!'
fi
if [[ ! -d '/opt/reconspider' ]]; then
	t9=${RED}'*'
else
	t9=${BIGreen}'!'
fi
if [[ ! -d '/opt/Zeus-Scanner' ]]; then
	t10=${RED}'*'
else
	t10=${BIGreen}'!'
fi
if [[ ! -d '/opt/CVE-2020-0683' ]]; then
	t11=${RED}'*'
else
	t11=${BIGreen}'!'
fi
if [[ ! -d '/opt/flan' ]]; then
	t12=${RED}'*'
else
	t12=${BIGreen}'!'
fi
if [[ ! -d '/opt/AttackSurfaceMapper' ]]; then
	t13=${RED}'*'
else
	t13=${BIGreen}'!'
fi
if [[ ! -d '/opt/ActiveReign' ]]; then
	t14=${RED}'*'
else
	t14=${BIGreen}'!'
fi
if [[ ! -d '/opt/ispy' ]]; then
	t15=${RED}'*'
else
	t15=${BIGreen}'!'
fi
if [[ ! -d '/opt/Sitadel' ]]; then
	t16=${RED}'*'
else
	t16=${BIGreen}'!'
fi
if [[ ! -d '/opt/docker-osmedeus' ]]; then
	t17=${RED}'*'
else
	t17=${BIGreen}'!'
fi
if [[ ! -d '/opt/NekoBotV1' ]]; then
	t18=${RED}'*'
else
	t18=${BIGreen}'!'
fi
if [[ ! -d '/opt/aSnip' ]]; then
#	t19=${RED}'*'
#else
	t19=${BIGreen}'!'
fi
if [[ ! -d '/opt/armory' ]]; then
	t20=${RED}'*'
else
	t20=${BIGreen}'!'
fi
if [[ ! -d '/opt/seeker' ]]; then
	t21=${RED}'*'
else
	t21=${BIGreen}'!'
fi
if [[ ! -d '/opt/aapfinder' ]]; then
	t22=${RED}'*'
else
	t22=${BIGreen}'!'
fi
if [[ ! -d '/opt/Dark-Star' ]]; then
	t23=${RED}'*'
else
	t23=${BIGreen}'!'
fi
if [[ ! -d '/opt/BruteDum' ]]; then
	t24=${RED}'*'
else
	t24=${BIGreen}'!'
fi
if [[ ! -d '/opt/onedrive_user_enum' ]]; then
	t25=${RED}'*'
else
	t25=${BIGreen}'!'
fi
if [[ ! -d '/opt/SMBGhost' ]]; then
	t26=${RED}'*'
else
	t26=${BIGreen}'!'
fi

if [[ ! -d '/opt/WPForce' ]]; then
	t28=${RED}'*'
else
	t28=${BIGreen}'!'
fi
if [[ ! -d '/opt/XSHOCK' ]]; then
	t29=${RED}'*'
else
	t29=${BIGreen}'!'
fi
if [[ ! -d '/opt/vulnx' ]]; then
	t30=${RED}'*'
else
	t30=${BIGreen}'!'
fi
if [[ ! -d '/opt/XSS-Freak' ]]; then
	t31=${RED}'*'
else
	t31=${BIGreen}'!'
fi
if [[ ! -d '/opt/CredNinja' ]]; then
	t32=${RED}'*'
else
	t32=${BIGreen}'!'
fi
if [[ ! -d '/opt/Impulse' ]]; then
	t33=${RED}'*'
else
	t33=${BIGreen}'!'
fi
if [[ ! -d '/opt/creds_harvester' ]]; then
	t34=${RED}'*'
else
	t34=${BIGreen}'!'
fi
if [[ ! -d '/opt/iKy' ]]; then
	t35=${RED}'*'
else
	t35=${BIGreen}'!'
fi
if [[ ! -d '/opt/dorks-eye' ]]; then
	t36=${RED}'*'
else
	t36=${BIGreen}'!'
fi
MENT=$(ls /opt/sifter/modules/passtools | grep Mentalist)
if [[ ${MENT} == "" ]]; then
	t37=${RED}'*'
else
	t37=${BIGreen}'!'
fi
if [[ ! -d '/opt/dCipher' ]]; then
#	t38=${RED}'*'
#else
	t38=${BIGreen}'!'
fi
if [[ ! -d '/opt/HoneyTel' ]]; then
	t39=${RED}'*'
else
	t39=${BIGreen}'!'
fi
if [[ ! -d '/opt/XSStrike' ]]; then
	t40=${RED}'*'
else
	t40=${BIGreen}'!'
fi
if [[ ! -d '/opt/MkCheck' ]]; then
	t41=${RED}'*'
else
	t41=${BIGreen}'!'
fi
if [[ ! -d '/root/routersploit' ]]; then
	t42=${RED}'*'
else
	t42=${BIGreen}'!'
fi
if [[ ! -d '/opt/dnstwist' ]]; then
	t43=${RED}'*'
else
	t43=${BIGreen}'!'
fi
if [[ ! -d '/opt/Espionage' ]]; then
	t44=${RED}'*'
else
	t44=${BIGreen}'!'
fi
if [[ ! -d '/opt/KatanaFramework' ]]; then
	t45=${RED}'*'
else
	t45=${BIGreen}'!'
fi
if [[ ! -d '/opt/sherlock' ]]; then
	t46=${RED}'*'
else
	t46=${BIGreen}'!'
fi
if [[ ! -d '/opt/PowerHub' ]]; then
	t47=${RED}'*'
else
	t47=${BIGreen}'!'
fi
if [[ ! -d '/opt/theHarvester' ]]; then
	t48=${RED}'*'
else
	t48=${BIGreen}'!'
fi
if [[ ! -d '/opt/spiderfoot' ]]; then
	t49=${RED}'*'
else
	t49=${BIGreen}'!'
fi
if [[ ! -d '/opt/email2phonenumber' ]]; then
	t50=${RED}'*'
else
	t50=${BIGreen}'!'
fi
if [[ ! -d '/opt/intrigue-core' ]]; then
	t51=${RED}'*'
else
	t51=${BIGreen}'!'
fi
if [[ ! -d '/opt/GHunt' ]]; then
	t54=${RED}'*'
else
	t54=${BIGreen}'!'
fi
if [[ ! -d '/opt/findom-xss' ]]; then
	t53=${RED}'*'
else
	t53=${BIGreen}'!'
fi
if [[ ! -d "/home/$USER/.local/OSINT-Framework" ]]; then
	t55=${RED}'*'
else
	t55=${BIGreen}'!'
fi
if [[ ! -d '/opt/ufonet' ]]; then
	t56=${RED}'*'
else
	t56=${BIGreen}'!'
fi
if [[ ! -d '/opt/CardPwn' ]]; then
	t57=${RED}'*'
else
	t57=${BIGreen}'!'
fi
if [[ ! -d '/opt/WBRUTER' ]]; then
	t58=${RED}'*'
else
	t58=${BIGreen}'!'
fi
if [[ ! -d '/opt/OWASP-Nettacker' ]]; then
	t59=${RED}'*'
else
	t59=${BIGreen}'!'
fi
if [[ ! -d '/opt/kali-anonsurf' ]]; then
	t60=${RED}'*'
else
	t60=${BIGreen}'!'
fi
if [[ ! -d '/opt/subfinder' ]]; then
	t61=${RED}'*'
else
	t61=${BIGreen}'!'
fi
if [[ ! -d '/opt/pulsar' ]]; then
	t62=${RED}'*'
else
	t62=${BIGreen}'!'
fi
if [[ ! -d '/opt/rengine' ]]; then
	t63=${RED}'*'
else
	t63=${BIGreen}'!'
fi
if [[ ! -d '/opt/thoron' ]]; then
	t64=${RED}'*'
else
	t64=${BIGreen}'!'
fi
if [[ ! -d '/opt/CVE-2020-5902-Scanner' ]]; then
	t65=${RED}'*'
else
	t65=${BIGreen}'!'
fi
if [[ ! -d '/opt/DeadTrap' ]]; then
	t66=${RED}'*'
else
	t66=${BIGreen}'!'
fi
if [[ ! -d '/opt/HFish' ]]; then
	t67=${RED}'*'
else
	t67=${BIGreen}'!'
fi
if [[ ! -d '/opt/subdover' ]]; then
	t68=${RED}'*'
else
	t68=${BIGreen}'!'
fi
if [[ ! -d '/opt/Katana' ]]; then
	t69=${RED}'*'
else
	t69=${BIGreen}'!'
fi
if [[ ! -d "/home/$USER/.local/.threat_dragon" ]]; then
	t70=${RED}'*'
else
	t70=${BIGreen}'!'
fi
if [[ ! -d '/opt/whitewidow' ]]; then
	t71=${RED}'*'
else
	t71=${BIGreen}'!'
fi
if [[ ! -d '/opt/V3n0M-Scanner' ]]; then
	t72=${RED}'*'
else
	t72=${BIGreen}'!'
fi
CPY=$(which ciphey)
if [[ ${CPY} == "" ]]; then
	t73=${RED}'*'
else
	t73=${BIGreen}'!'
fi
if [[ ! -d "/opt/XSS-Loader" ]]; then
	t2=${RED}'*'
else
	t2=${BIGreen}'!'
fi
if [[ ! -d "/opt/Responder" ]]; then
	t5=${RED}'*'
else
	t5=${BIGreen}'!'
fi


echo -e "\n${LP}Checking for Missing tools${NC}"
LOLpause
echo -e "${RED}Installed tools are indicated by ${BIGreen}!${NC}\nMissing tools are indicated by ${RED}*${NC}"
LOLpause2
echo -e "${ORNG}[ ${t1} ${ORNG}] ${YLW}SniffingBear			${ORNG}[ ${t2} ${ORNG}] ${YLW}XSS-Loader ${NC}"
echo -e "${ORNG}[ ${t3} ${ORNG}] ${YLW}HoneyCaught			${ORNG}[ ${t4} ${ORNG}] ${YLW}BlackWidow ${NC}"
echo -e "${ORNG}[ ${t5} ${ORNG}] ${YLW}Responder				${ORNG}[ ${t6} ${ORNG}] ${YLW}RapidScan ${NC}"
echo -e "${ORNG}[ ${t7} ${ORNG}] ${YLW}ShodanSploit			${ORNG}[ ${t8} ${ORNG}] ${YLW}Yuki-Chan ${NC}"
echo -e "${ORNG}[ ${t9} ${ORNG}] ${YLW}ReconSpider			${ORNG}[ ${t10} ${ORNG}] ${YLW}Zeus ${NC}"
echo -e "${ORNG}[ ${t11} ${ORNG}] ${YLW}EoP				${ORNG}[ ${t12} ${ORNG}] ${YLW}Flan ${NC}"
echo -e "${ORNG}[ ${t13} ${ORNG}] ${YLW}AttackSurfaceMapper		${ORNG}[ ${t14} ${ORNG}] ${YLW}ActiveReign ${NC}"
echo -e "${ORNG}[ ${t15} ${ORNG}] ${YLW}iSpy				${ORNG}[ ${t16} ${ORNG}] ${YLW}Sitadel ${NC}"
echo -e "${ORNG}[ ${t17} ${ORNG}] ${YLW}Osmedeus				${ORNG}[ ${t18} ${ORNG}] ${YLW}NekoBot ${NC}"
echo -e "${ORNG}[ ${t19} ${ORNG}] ${YLW}aSnip				${ORNG}[ ${t20} ${ORNG}] ${YLW}Armory ${NC}"
echo -e "${ORNG}[ ${t21} ${ORNG}] ${YLW}Seeker				${ORNG}[ ${t22} ${ORNG}] ${YLW}AapFinder ${NC}"
echo -e "${ORNG}[ ${t23} ${ORNG}] ${YLW}Dark-Star				${ORNG}[ ${t24} ${ORNG}] ${YLW}BruteDUM ${NC}"
echo -e "${ORNG}[ ${t25} ${ORNG}] ${YLW}OneFind				${ORNG}[ ${t26} ${ORNG}] ${YLW}SMBGhost ${NC}"
echo -e "${ORNG}[ ${t27} ${ORNG}] ${YLW}xRay				${ORNG}[ ${t28} ${ORNG}] ${YLW}WPForce ${NC}"
echo -e "${ORNG}[ ${t29} ${ORNG}] ${YLW}xShock				${ORNG}[ ${t30} ${ORNG}] ${YLW}VulnX ${NC}"
echo -e "${ORNG}[ ${t31} ${ORNG}] ${YLW}XSS-Freak				${ORNG}[ ${t32} ${ORNG}] ${YLW}CredNinja ${NC}"
echo -e "${ORNG}[ ${t33} ${ORNG}] ${YLW}Impulse				${ORNG}[ ${t34} ${ORNG}] ${YLW}CredHarvester ${NC}"
echo -e "${ORNG}[ ${t35} ${ORNG}] ${YLW}iKy				${ORNG}[ ${t36} ${ORNG}] ${YLW}Dork-Eye ${NC}"
echo -e "${ORNG}[ ${t37} ${ORNG}] ${YLW}Mentalist				${ORNG}[ ${t38} ${ORNG}] ${YLW}dCipher ${NC}"
echo -e "${ORNG}[ ${t39} ${ORNG}] ${YLW}Honey-Tel				${ORNG}[ ${t40} ${ORNG}] ${YLW}XSS-Strike ${NC}"
echo -e "${ORNG}[ ${t41} ${ORNG}] ${YLW}MkCheck				${ORNG}[ ${t42} ${ORNG}] ${YLW}RouterSploit ${NC}"
echo -e "${ORNG}[ ${t43} ${ORNG}] ${YLW}DnsTwist				${ORNG}[ ${t44} ${ORNG}] ${YLW}Espionage ${NC}"
echo -e "${ORNG}[ ${t45} ${ORNG}] ${YLW}Katana-VF				${ORNG}[ ${t46} ${ORNG}] ${YLW}Sherlock ${NC}"
echo -e "${ORNG}[ ${t47} ${ORNG}] ${YLW}PowerHub				${ORNG}[ ${t48} ${ORNG}] ${YLW}theHarvester ${NC}"
echo -e "${ORNG}[ ${t49} ${ORNG}] ${YLW}SpiderFoot			${ORNG}[ ${t50} ${ORNG}] ${YLW}Email2Phone ${NC}"
echo -e "${ORNG}[ ${t51} ${ORNG}] ${YLW}Intrigue-Core			${ORNG}[ ${t53} ${ORNG}] ${YLW}finDOM-XSS ${NC}"
echo -e "${ORNG}[ ${t54} ${ORNG}] ${YLW}GHunt				${ORNG}[ ${t55} ${ORNG}] ${YLW}OSINT-Framework ${NC}"
echo -e "${ORNG}[ ${t56} ${ORNG}] ${YLW}UFONet				${ORNG}[ ${t57} ${ORNG}] ${YLW}CardPwn ${NC}"
echo -e "${ORNG}[ ${t58} ${ORNG}] ${YLW}WBruter				${ORNG}[ ${t59} ${ORNG}] ${YLW}Netattacker ${NC}"
echo -e "${ORNG}[ ${t60} ${ORNG}] ${YLW}AnonSurf				${ORNG}[ ${t61} ${ORNG}] ${YLW}SubFinder ${NC}"
echo -e "${ORNG}[ ${t62} ${ORNG}] ${YLW}Pulsar				${ORNG}[ ${t63} ${ORNG}] ${YLW}reNgine ${NC}"
echo -e "${ORNG}[ ${t64} ${ORNG}] ${YLW}Thoron				${ORNG}[ ${t65} ${ORNG}] ${YLW}F5 Big IP Scanner ${NC}"
echo -e "${ORNG}[ ${t66} ${ORNG}] ${YLW}DeadTrap				${ORNG}[ ${t67} ${ORNG}] ${YLW}HFish ${NC}"
echo -e "${ORNG}[ ${t68} ${ORNG}] ${YLW}SubDover				${ORNG}[ ${t69} ${ORNG}] ${YLW}Katana-DS ${NC}"
echo -e "${ORNG}[ ${t70} ${ORNG}] ${YLW}Threat Dragon			${ORNG}[ ${t71} ${ORNG}] ${YLW}WhiteWidow ${NC}"
echo -e "${ORNG}[ ${t72} ${ORNG}] ${YLW}V3n0M-Scanner			${ORNG}[ ${t73} ${ORNG}] ${YLW}Ciphey ${NC}"
echo -e "${ORNG}[ ${t52} ${ORNG}] ${YLW}				${ORNG}[ ${t74} ${ORNG}] ${YLW} ${NC}"
#echo -e "${ORNG}[ ${t75} ${ORNG}] ${YLW} ${NC}"

echo -e "${LP}Would you like to run the install script? (y/n)${NC}"
read ISS
if [[ ${ISS} == "y" ]]; then
	cd /opt/sifter
	bash install.sh
fi
python3 /opt/sifter/extras/ban2.py
exit

######################################################################################################
######################               VGhlIERlYWQgQnVubnkgQ2x1Yg==             ########################
######################################################################################################
