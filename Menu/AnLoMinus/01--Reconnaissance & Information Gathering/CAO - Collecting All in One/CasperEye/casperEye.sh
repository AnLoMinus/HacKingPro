#!/bin/bash
telegram_dir="$(pwd)"
VERSION="1.0"
DIR="$HOME/CasperEye-Output"
target=$1
rust_nmap=$2
special_feature="$2"
date=$(date +'%Y-%m-%d_%H-%M-%S')
sudo service docker start

BLINK='\e[5m'
BOLD='\e[1m'
GREEN='\e[92m'
YELLOW='\e[93m'
CYAN='\e[96m'
RESET='\e[0m'
RED='\e[31m'
UNDERLINE='\e[4m'
PURPLE='\e[95m'
BLUE="\e[94m"

#Changement For batch size and time
batch_size="700"
time="1500"

logo(){
	echo -e """ ${BOLD}${YELLOW} 	 
					       version: 1.0 ${RESET} ${BOLD}${RED}	          
		  ▄▄                          ▗▄▄▄▖          
		 █▀▀▌                         ▐▛▀▀▘          
		▐▛    ▟██▖▗▟██▖▐▙█▙  ▟█▙  █▟█▌▐▌   ▝█ █▌ ▟█▙ 
		▐▌    ▘▄▟▌▐▙▄▖▘▐▛ ▜▌▐▙▄▟▌ █▘  ▐███  █▖█ ▐▙▄▟▌
		▐▙   ▗█▀▜▌ ▀▀█▖▐▌ ▐▌▐▛▀▀▘ █   ▐▌    ▐█▛ ▐▛▀▀▘
		 █▄▄▌▐▙▄█▌▐▄▄▟▌▐█▄█▘▝█▄▄▌ █   ▐▙▄▄▖  █▌ ▝█▄▄▌
		  ▀▀  ▀▀▝▘ ▀▀▀ ▐▌▀▘  ▝▀▀  ▀   ▝▀▀▀▘  █   ▝▀▀ 
			       ▐▌                    █▌ 
             	 ${RESET}${PURPLE}${UNDERLINE}Devloped By -AbhisheK${RESET}
     	"""
}


input="$1"
if [[ "$input" == "--help"  || "$input" == "-h" ]]
then
#Help Area
	#For logo Print
	logo
	printf "\n\n"	
	echo -e "${BOLD}${BLUE}[*] For using Nmap use:  -nmap \n${RESET}"	
	echo -e """${BLUE}${BOLD}[*] Rustscan use: ${RESET}${BLUE}  
	Default batch size is : 700
	Default time is : 1500 (1.5 seconds) 
	${YELLOW}
	bathc size: Means no of Port Scan in 1 sec
	Default time : take sleep for 1.5 sec
	${RESET}"""
	
	echo -e "${YELLOW}[*]You can Connect with Vpn Also Just remove # before
	ProtonVPN_Connect
	${RESET}"
	
	echo -e "${BOLD}${PURPLE}\t\t-----------[ Supported Tools ]-----------\n${RESET}"
	
	echo -e "${BOLD}${BLUE}[*]certdata-api
		${CYAN}1. crt.sh API
		2. certspotter API
		3. assetfinder [Tomnonon Tool]
	${RESET}"

	echo -e "${BOLD}${BLUE}[*]Subfinder ${CYAN}[projectdiscovery]${RESET}"
	echo -e "${BOLD}${BLUE}[*]Aquatone ${CYAN}[michenriksen]${RESET}"
	echo -e "${BOLD}${BLUE}[*]Sublist3r ${CYAN}[aboul3la OSINT]${RESET}"
	echo -e "${BOLD}${BLUE}[*]Knockpy ${CYAN}[guelfoweb]${RESET}"
	echo -e "${BOLD}${BLUE}[*]Hackertarget API ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Subbrute ${CYAN}[TheRook${RESET}"
	echo -e "${BOLD}${BLUE}[*]DIg Linux tool ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Rustscan ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Nmap ${RESET}"
	echo -e "${BOLD}${BLUE}[*]WayBack URL Machine ${RESET}"
	echo -e "${BOLD}${BLUE}[*]SSRF Link Finder ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Creating Target Wordlist ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Httprobe 'Live Url Scan' [Tomnomnom] ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Genrating HTTP Response Code ${RESET}"	
	echo -e "${BOLD}${BLUE}[*]ProtonVPN Free Version ${RESET}"
	echo -e "${BOLD}${BLUE}[*]Sending Telegram Alert with Complete Final Recon File ${RESET}"	
	
elif [[  -z "${input}" ]]
then
#Correct Syntax
	logo
	echo -e """${BOLD}${GREEN} 
	[Right Syntax is: ${PURPLE} ./casperEye.sh target-Website${GREEN}]
	${RESET}"""
	echo -e "${YELLOW}
	For More Help use [--help] or  [-h]
	${RESET}"
else
#logo Printing
logo

#Execution Of Whole Code
dir-check(){	
	mkdir -p $DIR/${target}_${date}
	cd $DIR/${target}_${date}
	output_dir=$(pwd)
	echo -e "${BOLD}${GREEN}[+] Directory Created...${RESET}\n"
}
dir-check $1

runBanner(){
	name=$1
	echo -e "${GREEN}\n[+] Running $name...${RESET}"
}


ProtonVPN_Connect() {
	#Username: hodif46657
	sudo protonvpn c -r
}

ProtonVPN_disconnect() {
	protonvpn d
}


certdata-abhi(){
if [ ! -x "$(command -v jq)" ]; then
echo "[-] This script requires jq. Exiting."
exit 1
fi



certdata(){
	#give it patterns to look for within crt.sh for example %api%.site.com
	declare -a arr=("api" "corp" "dev" "devops" "uat" "test" "stag" "stage" "sandbox" "prod" "priv" "private" "internal" "db" "qa" "staff" "jenkins")
	for i in "${arr[@]}"
	do
	#get a list of domains based on our patterns in the array
	crtsh=$(curl -s https://crt.sh/\?q\=%25.$i.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee -a $output_dir/$1-crtsh.txt )
	done
	#get a list of domains from certspotter
	certspotter=$(curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep -w $1\$ | tee -a $output_dir/$1-certspotter.txt)
	#get a list of domains from digicert
	digicert=$(curl -s https://ssltools.digicert.com/chainTester/webservice/ctsearch/search?keyword=$1 -o $output_dir/$1-digicert.json) 
	}

	assetdata() {
	assetfinder $1 | sort -u | grep -w "$1" | tee -a $output_dir/$1-assetfinder.txt
	}

	rootdomains() { #this creates a list of all unique root sub domains
	cat $output_dir/$1-crtsh.txt | rev | cut -d "."  -f 1,2,3 | sort -u | rev > $1-temp.txt
	cat $output_dir/$1-certspotter.txt | rev | cut -d "."  -f 1,2,3 | sort -u | rev >> $1-temp.txt
	cat $output_dir/$1-assetfinder.txt | rev | cut -d "."  -f 1,2,3 | sort -u | rev >> $1-temp.txt

	jq -r '.data.certificateDetail[].commonName,.data.certificateDetail[].subjectAlternativeNames[]' $output_dir/$1-digicert.json | sed 's/"//g' | grep -w "$domain$" | grep -v '^*.' | rev | cut -d "."  -f 1,2,3 | sort -u | rev >> $output_dir/$1-temp.txt
	cat $output_dir/$1-temp.txt | tr '[:upper:]' '[:lower:]' | sort -u | tee $1_certdata_mainFile.txt; 
	rm $output_dir/$1-temp.txt
	}

certdata $1
assetdata $1
rootdomains $1

}


Subfinder(){
	echo -e "${GREEN} Running subfinder on targets ${RESET}"
	runBanner "subfinder"
	sudo subfinder -d $1 |grep "$target" | tee -a $output_dir/${target}_subfinder.txt
	echo -e "${BLUE}[*] Subfinder Done! View the File${RESET}"
}

Aquatone(){
	echo -e "${GREEN} Running aquatone on targets ${RESET}"
	runBanner "aquatone"
	aquatone-discover -d $1 
	cat $HOME/aquatone/${target}/hosts.txt | cut -d ',' -f1 | tee -a $output_dir/${target}_aquatone.txt
	echo -e "${BLUE}[*] aquatone Done! View the File${RESET}" 
}

Sublist3r(){
	echo -e "${GREEN} Running Sublist3r on targets ${RESET}"
	sublist3r -d $1 -o temp 
	cat temp | grep "$target"  | tee -a $output_dir/${target}_sublist3r.txt
	echo -e "${BLUE}[*] sublist3r Done! View the File${RESET}"
	rm temp
}

Knockpy(){
	echo -e "${GREEN} Running knockpy on targets ${RESET}"
	runBanner "knockpy"
	knockpy $1 | tee -a temp
	cat temp | grep "$target" >> $output_dir/${target}_knockpy.txt
	#you can Use Own Wordlist [ knockpy domain.com -w wordlist.txt ]
	echo -e "${BLUE}[*] knockpy Done! View the File${RESET}"
	rm temp
}

Hackertarget(){
	#Forward DNS search API
	echo -e "${GREEN} Running Hackertarget on targets ${RESET}"
	curl -s https://api.hackertarget.com/hostsearch/?q=$1 | cut -d ',' -f1 | sort -u | tee -a $output_dir/${target}_hackertarget.txt
	echo -e "${BLUE}[*] Hackertarget Done! View the File${RESET}"
}

Subbrute(){
	touch temp
	echo -e "${GREEN} Running subbrute on targets ${RESET}"
	runBanner "subbrute"
	cd $HOME/CasperEye/tools 
	subbrute $1 | tee -a temp
	cat temp | tr ',' ' ' | awk '{print $1}' | tee -a $output_dir/${target}_subbrute.txt
	cat temp | tee -a $output_dir/${target}_subbrute[with-all-CNAMe].txt
	echo -e "${BLUE}[*] subbrute Done! View the File${RESET}"
	rm temp
}

final-list() {
	echo -e "${GREEN} Preparing Final List ${RESET}"
	cd $output_dir
	touch final
	#Copy all Files into Final List
	cat ${target}_certdata_mainFile.txt  ${target}_subfinder.txt ${target}_aquatone.txt ${target}_sublist3r.txt ${target}_hackertarget.txt  ${target}_subbrute.txt | tee -a final 
	#Print Domains Without [@]-- 
	cat final | sort -u | uniq -u | grep -v "@" >> ${target}_Final.txt
	#Print Email Address [@]--
	cat final | sort -u | uniq -u | grep -i "@" >> ${target}_Emails.txt
	rm final
	echo -e "${BOLD}${BLUE}File successfullyy Created${RESET}"
	#move certdata Files
	mkdir cert-output
	mv  ${target}-crtsh.txt ${target}-certspotter.txt ${target}-assetfinder.txt ${target}_certdata_mainFile.txt cert-output/
}

WayBack_machine(){
	echo -e "${GREEN} Running WayBack_machine on targets ${RESET}"
	runBanner "WayBack_machine"	
	cat $output_dir/${target}_Final.txt | waybackurls |sort -u | tee -a $output_dir/${target}_waybackURLS.txt 
	cat $output_dir/${target}_waybackURLS.txt 
	echo -e "${BLUE}[*] WayBack_machine Done..! ${RESET}"
}


Simple-SSRF(){
	echo -e "${GREEN} Running SSRF on targets ${RESET}"
	runBanner "Searching SSRF EndPoints"
	cat $output_dir/${target}_Final.txt $output_dir/${target}_waybackURLS.txt >> temp 
	cat temp | grep "?url="| anti-burl | tee $output_dir/${target}_SSRF.txt
	rm temp
	echo -e "${BLUE}[*] SSRF Searching Done..! ${RESET}"
}


Target-wordlist(){
	echo -e "${GREEN} Creating Target Wordlist by Waybackurl ${RESET}"
	runBanner "Creating Target Wordlist"
	cat $output_dir/${target}_waybackURLS.txt| cut -d "/" -f 4,5 | sed 's/?.*//' | sort -u | tee -a $output_dir/${target}_Target_Wordlist.txt
	echo -e "${BLUE}[*] Wordlist Created Successfully ${RESET}"
}

#-----------For Port Scanning -------------#

dig-loop() {
	echo -e "${GREEN} Running dig Command on targets ${RESET}"
	runBanner "Digging All Url's"
	cd $output_dir
	for i in $(cat ${target}_Final.txt)
	do
	dig $i +noall +answer > temp
	cat temp | awk '{print $5}' |sort -u | tee -a ip.txt
	cat temp | awk '{print $1" :: "$5}' | tee -a ${target}_dig_domians.txt
	done 
	cat ip.txt| sort -u | grep '^\s*[0-9]'| tee ${target}_ip.txt
	rm ip.txt temp
	echo -e "${BLUE}[*] Digging Done..! ${RESET}"
} 

Rust-scan() {	
	calling() {
		val=1	
		cd $output_dir/
		while IFS= read line
		do
			echo -e "\n\n${BLINK}${UNDERLINE}${PURPLE}	--{ RUSTSCAN AND NMAP IS WORKING }--${RESET}" 
			echo -e "${BOLD}${BLUE}[!]--------Ip No $val: [ $line ]: --------[!] ${RESET}" | tee -a ${target}_PortScan_result.txt
			echo -e "${BOLD}${YELLOW}Related IP & Domains:--- \n $(cat ${target}_dig_domians.txt |sort -u | grep "$line")${RESET}" | tee -a ${target}_PortScan_result.txt
			echo "" | tee -a ${target}_PortScan_result.txt
			sudo docker run rustscan/rustscan:alpine -b $batch_size -t $time $line -- -$par | grep -i "open"  | tee -a ${target}_PortScan_result.txt
			#| grep '^\s*[0-9]'
			echo -e "${BOLD}${CYAN}-----------------[!] Finished [!]----------------- ${RESET}" | tee -a ${target}_PortScan_result.txt
			echo "" | tee -a ${target}_PortScan_result.txt
			val=$((val+1))
		done < ${target}_ip.txt
	}

	par="exit"
	if [[ "$rust_nmap" == "-nmap" ]] 
	then
	#Enableling Nmap
		echo -e "${YELLOW}Nmap is Enable ${RESET}"
		par="A"
		calling	 
	elif [[ -z "$rust_nmap" ]]
	then
	#Without Nmap
		echo -e "${YELLOW}Nmap is Not Enable${RESET}"
		calling	
	fi
}


Httprobe(){
	#Scanning Live URL's
	echo -e "${GREEN}${BOLD} Running httprobe on target Url ${RESET}"
	runBanner "Live URL's Scan"
	cat $output_dir/${target}_Final.txt | httprobe | tee -a temp 
	cat temp | sort -u | tee -a  $output_dir/${target}_httprobe.txt
	rm temp
	echo -e "${BLUE}${BOLD}[*] Live URL's Scan, Done..! ${RESET}"
}

Http_response_code(){
	echo -e "${GREEN}${BOLD} Genrating Response Code ${RESET}"
	runBanner "Response Code"
	mkdir -p $output_dir/${target}_http-response
	for i in $(cat $output_dir/${target}_httprobe.txt) ;do
	#echo -e "$i \t $(curl --write-out %{http_code} --silent --connect-timeout 10 --no-keepalive --output /dev/null  $i)"
	res="$(curl --write-out %{http_code} --silent --connect-timeout 10 --no-keepalive --output /dev/null  $i)"
	code_200="$(echo $res | grep '^\s*[2]' )"
	code_300="$(echo $res | grep '^\s*[3]')"
	code_400="$(echo $res | grep '^\s*[4]')"	
	
	if [[ "$res" -eq "$code_200" ]] 
	then	
		if [[ $res == '200' ]]
		then
		echo -e "$i: ${BOLD}${GREEN} $code_200 ${RESET}" | tee -a $output_dir/${target}_http-response/${target}_http_200.txt		
		else
			echo -e "$i: ${BOLD}${PURPLE} [Response time Out] ${RESET}" | tee -a $output_dir/${target}_http-response/${target}_http_500.txt
		fi	
	elif [[ "$res" -eq "$code_300" ]]
	then 
		echo -e "$i: ${BOLD}${YELLOW} $code_300 ${RESET}" | tee -a $output_dir/${target}_http-response/${target}_http_300.txt
	elif [[ "$res" -eq "$code_400" ]]
	then
		echo -e "$i: ${BOLD}${RED} $code_400 ${RESET}" | tee -a $output_dir/${target}_http-response/${target}_http_400.txt
	else	
		echo -e "${BOLD}Error in Subdomain Or Certificate${RESET}"		
	fi 

	done
	echo -e "${BLUE}${BOLD}[*] Completed..! ${RESET}"
}


telegram-bot(){
	bot_api=$(cat $telegram_dir/set-api-keys.sh | grep "bot" | cut -d '"' -f2)
	chatID=$(cat $telegram_dir/set-api-keys.sh | grep "chatID" | cut -d '"' -f2)
	##Message send
	curl -s -X POST https://api.telegram.org/$bot_api/sendMessage -d chat_id=$chatID -d text="__Alert Your $target Recon Process Has been Finished__" > temp

	#create zip file
	zip -r ${target}_${date}.zip $DIR/${target}_${date} > temp

	##file Sending 
	curl -F document=@"${target}_${date}.zip" https://api.telegram.org/$bot_api/sendDocument?chat_id=$chatID > temp
	rm ${target}_${date}.zip temp

	echo -e "\n\n${BLUE}[*] File ${target}.Zip Sending To Telegram Has Been Done..! ${RESET}"
}

########################		
#Execute All Functions 	

certdata-abhi $1	  
Subfinder $1	  
Aquatone $1	          
Sublist3r $1		   
Knockpy	$1
Hackertarget $1	  
Subbrute	$1				
final-list
dig-loop	   
Rust-scan $rust_nmap 
WayBack_machine 
Simple-SSRF
Target-wordlist
Httprobe
Http_response_code
telegram-bot
ProtonVPN_Connect

fi 


