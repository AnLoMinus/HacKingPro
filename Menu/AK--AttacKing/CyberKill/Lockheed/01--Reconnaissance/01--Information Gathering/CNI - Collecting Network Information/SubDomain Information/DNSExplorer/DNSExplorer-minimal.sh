#!/usr/bin/env bash
# @author: Danilo Basanta
# @author-linkedin: https://www.linkedin.com/in/danilobasanta/
# @author-github: https://github.com/dabasanta
mkdir -p /tmp/dnsexplorer
clean(){
echo -e "\n\n";rm -rf /tmp/dnsexplorer;echo -e " Happy hunting.";tput cnorm;exit 0
}
function scape() {  # Catch the ctrl_c INT key
echo -e "output [+] Exiting ... ";clean
}
trap scape INT
doZoneTransfer(){
success=1;while IFS= read -r nameserver;do if host -l "$1" $nameserver | grep -i "has address" > /dev/null;then echo -e " NameServer $nameserver accept ZoneTransfer\n";host -l "$1" $nameserver | grep -i "has address";success=0;else echo -e " NameServer $nameserver does not accept zone transfer";fi;done < <(grep -v '^ *#' < /tmp/dnsexplorer/NameServers.txt);return $success
}
dictionaryAttack(){
tput civis;echo -e "\n Using the first 1.000 records of the dictionary: https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/bitquark-subdomains-top100000.txt\n\e[1m\e[36mCourtesy of seclists ;)\n";curl -s https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/bitquark-subdomains-top100000.txt -o /tmp/dnsexplorer/bit.txt;if [ -f /tmp/dnsexplorer/bit.txt ];then cat /tmp/dnsexplorer/bit.txt | head -1000 > /tmp/dnsexplorer/bitquark.txt;l=$(wc -l /tmp/dnsexplorer/bitquark.txt | awk '{print $1}');c=1;s=0;while IFS= read -r fqdn;do if host "$fqdn"."$1" | head -1 | grep "has address";then s=$((s+1));fi;echo -ne " Using entry: $c \e[1m\e[36mof \e[1m\e[36m$l. \r";c=$((c+1));done < <(grep -v '^ *#' < /tmp/dnsexplorer/bitquark.txt);if [ $s -ge 1 ];then echo -e "\n\e[1m[+] Found $s subdomains.";else echo -e "\n\e[1m[!!] Found $s subdomains.";fi;else echo -e " Could not download dictionary from seclists url.";clean;fi
}
dictionaryAttackCustom(){
check=0;while [ $check -eq 0 ];do echo -e "";read -rp "Enter the path of the dictionary file> " dfile ; echo -e "";if [ -f "$dfile" ];then istext=$(file "$dfile" | awk '{print $2}');if [[ $istext = "ASCII" ]];then l=$(wc -l "$dfile" | awk '{print $1}');co=1;su=0;while IFS= read -r sub;do if host "$sub"."$1" | head -1 | grep "has address"; then su=$((su+1));fi;echo -ne "Using entry: $co of $l. \r";co=$((co+1));done < <(grep -v '^ *#' < "$dfile");if [ $su -ge 1 ];then echo -e "\n\e[1m[+] Found $su subdomains.";else echo -e "Found $su subdomains.";fi;check=1;clean;else echo -e " the file is not ASCII text. Can't use it.";fi;else echo -e " File $dfile does not exists.";fi;done
}
bruteForceDNS(){
echo -e " Fuzzing subdomains of $1 \n";echo -e " Do yo want to use a custom dictionary? [C=custom/d=Default]";echo -e " Default: Provides a dictionary with the top 1000 of the most commonly used subdomains.\nCustom: Use your own custom dictionary.";while true; do echo -e "";read -rp "[D/c]> " dc;echo -e ""
    case $dc in
      [Dd]* ) dictionaryAttack "$1"; break;;
      [Cc]* ) dictionaryAttackCustom "$1"; break;;
      * ) echo -e " Please answer D \e[1m\e[91mor\e[1m C\e[1m\e[91m.\n";;
    esac;done
}
crtSH(){
domain_search=$1;echo -e "\n$info Finding subdomains - abusing Certificate Transparency Logs using https://crt.sh/\n$end";curl -s "https://crt.sh/?q=${domain_search}&output=json" -o /dev/null 2>&1;if [ $? ];then curl -s "https://crt.sh/?q=${domain_search}&output=json" | sed 's/,/\n/g' | grep 'common_name' | cut -d : -f 2 | sed 's/"//g' | sed 's/\\n/\n/g' > /tmp/dnsexplorer/crt.sh.reg;sort /tmp/dnsexplorer/crt.sh.reg | uniq ;else echo -e "$error Unable to connect to CTR.sh $end";fi;echo -e "\n"
}
basicRecon(){
echo -e " Finding IP address for A records \e[92m";if [ -z "$2" ];then host "$1" | grep 'has address' | awk '{print $4}';echo -e "";else host "$1" "$2" | grep 'has address' | awk '{print $4}';echo -e "";fi;echo -e " Finding IPv6 address for AAA records \e[92m";if [ -z "$2" ];then if host "$1" | grep 'IPv6' >/dev/null 2>&1;then host "$1" | grep 'IPv6'| awk '{print $5}';echo -e "";else echo -e " Hosts $1 has not IPv6 address\n";fi;else if host "$1" "$2" | grep 'IPv6' >/dev/null 2>&1;then host "$1" "$2" | grep 'IPv6'| awk '{print $5}';echo -e "";else echo -e " Hosts $1 has not IPv6 address\n";fi;fi;echo -e " Finding mail server address for $1 domain \e[92m";if [ -z "$2" ];then if host -t MX "$1" | grep 'mail' >/dev/null 2>&1;then host "$1" | grep 'mail' | awk '{print $6,$7}';echo -e "";else echo -e " Hosts $1 has not mail server records\n";fi;else if host -t MX "$1" "$2" | grep 'mail' >/dev/null 2>&1;then host "$1" "$2" | grep 'mail' | awk '{print $6,$7}';echo -e "";else echo -e " Hosts $1 has not mail server records\n";fi;fi;echo -e " Finding CNAME records for $1 domain \e[92m";if [ -z "$2" ];then if host -t CNAME "$1" | grep 'alias' >/dev/null 2>&1;then host -t CNAME "$1" | awk '{print $1,$4,$6}';echo -e "";else echo -e " Hosts $1 has not alias records\n";fi;else if host -t CNAME "$1" "$2" | grep 'alias' >/dev/null 2>&1;then host -t CNAME "$1" "$2" | awk '{print $1,$4,$6}';echo -e "";else echo -e " Hosts $1 has not alias records\n";fi;fi;echo -e " Finding text description for $1 domain \e[92m";if [ -z "$2" ];then if host -t txt "$1" | grep 'descriptive' >/dev/null 2>&1;then host -t txt "$1" | grep 'descriptive';echo -e "";else echo -e " Hosts $1 has not description records\n";fi;else if host -t txt "$1" "$2" | grep 'descriptive' >/dev/null 2>&1;then host -t txt "$1" "$2" | grep 'descriptive';echo -e "";else echo -e " Hosts $1 has not description records\n";fi;fi;echo -e " Checking if $1 has a TLS site\e[92m";connected=$(echo -n | openssl s_client -connect  "$1:443" 2>/dev/null | head -1 | awk -F "(" '{print $1}');if [[ "$connected" == "CONNECTED" ]];then
      DNS=$(echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | sed 's/\                //'|grep -i "DNS:" | awk -F ":" '{print $1}');if [[ "$DNS" == "DNS" ]];then echo -e " The domain $1 has a secure webserver and your certificate have these alternate domain names:\e[92m";echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | grep "DNS:"| tr ',' '\n' | sed 's/\               //' | sed 's/\s//g' | sed 's/DNS://g';subjects=$(echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | grep "DNS:" | tr ',' '\n' | sed 's/\               //' | wc -l);echo -e " $subjects alternate DNS domain found.\n";crtSH "$1";else echo -e " Domain $1 has secure website at $1:443, but does not have alternate subject names.\n";crtSH "$1";fi;else echo -e " No website found on $1:443\n";fi;echo -e " Finding nameserver address for $1 domain";if [ -z "$2" ];then if host -t NS "$1" | grep 'name server' >/dev/null 2>&1;then host -t NS "$1" | cut -d " " -f 4;host -t NS "$1" | cut -d " " -f 4 > /tmp/dnsexplorer/NameServers.txt;ns=$(wc -l /tmp/dnsexplorer/NameServers.txt | awk '{print $1}');echo -e "\n $ns DNS Servers was found, trying ZoneTransfer on these servers";if doZoneTransfer "$1";then echo -e "\n DNS zone transfer was possible, no bruteforce attacks on the subdomains are required. \n";clean;else echo -e "\n DNS zone transfer was not possible, DNS servers are not accept it";
          while true;do echo "";echo -e "";read -rp "Do you want to brute force subdomains? [Y/n]> " yn;echo -e ""
          case $yn in
            [Yy]* ) bruteForceDNS "$1"; break;;
            [Nn]* ) clean;;
            * ) echo -e " Please answer yes or no.\n";;
          esac;done;fi;fi;else if host -t NS "$1" "$2" | grep 'name server' >/dev/null 2>&1;then host -t NS "$1" "$2" | grep 'name server' | cut -d " " -f 4;host -t NS "$1" "$2" | grep 'name server' | cut -d " " -f 4 > /tmp/dnsexplorer/NameServers.txt;ns=$(wc -l /tmp/dnsexplorer/NameServers.txt | awk '{print $1}');echo -e "\n $ns DNS Servers was found, trying ZoneTransfer on these servers";if doZoneTransfer "$1";then echo -e "\n DNS zone transfer was possible, no bruteforce attacks on the subdomains are required. \n";clean;else echo -e "\n DNS zone transfer was not possible, DNS servers are not accept it";while true;do echo "";tput cnorm;echo -e "";read -rp "Do you want to brute force subdomains? [Y/n]> " yn;echo -e ""
          case $yn in
            [Yy]* ) bruteForceDNS "$1"; break;;
            [Nn]* ) clean;;
            * ) echo -e " Please answer yes or no.\n";;
          esac;done;fi;fi;fi
}
help(){
echo -e "DNSExplorer-minimal.sh automates the enumeration of DNS servers and domains using the 'host' tool and the predefined DNS server in /etc/resolv.conf.\nTo use it run: ./DNSExplorer-minimal.sh domain.com\n>Or use:\n./DNSExplorer-minimal.sh domain.com dns.server";tput cnorm
}
checkDependencies() {
if ! command -v host &> /dev/null;then echo -e " 'host' command is not available, please install the bind-utils/dnsutils package. ";clean;fi;if ! command -v curl &> /dev/null;then echo -e " 'curl' command is not available, please install the curl package. ";clean;fi
}
banner(){
    echo -e "
        ▓█████▄  ███▄    █   ██████ ▓█████ ▒██   ██▒ ██▓███   ██▓     ▒█████   ██▀███  ▓█████  ██▀███  
        ▒██▀ ██▌ ██ ▀█   █ ▒██    ▒ ▓█   ▀ ▒▒ █ █ ▒░▓██░  ██▒▓██▒    ▒██▒  ██▒▓██ ▒ ██▒▓█   ▀ ▓██ ▒ ██▒
        ░██   █▌▓██  ▀█ ██▒░ ▓██▄   ▒███   ░░  █   ░▓██░ ██▓▒▒██░    ▒██░  ██▒▓██ ░▄█ ▒▒███   ▓██ ░▄█ ▒
        ░▓█▄   ▌▓██▒  ▐▌██▒  ▒   ██▒▒▓█  ▄  ░ █ █ ▒ ▒██▄█▓▒ ▒▒██░    ▒██   ██░▒██▀▀█▄  ▒▓█  ▄ ▒██▀▀█▄  
        ░▒████▓ ▒██░   ▓██░▒██████▒▒░▒████▒▒██▒ ▒██▒▒██▒ ░  ░░██████▒░ ████▓▒░░██▓ ▒██▒░▒████▒░██▓ ▒██▒
        ▒▒▓  ▒ ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░░░ ▒░ ░▒▒ ░ ░▓ ░▒▓▒░ ░  ░░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░░ ▒▓ ░▒▓░
        ░ ▒  ▒ ░ ░░   ░ ▒░░ ░▒  ░ ░ ░ ░  ░░░   ░▒ ░░▒ ░     ░ ░ ▒  ░  ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░  ░▒ ░ ▒░
        ░ ░  ░    ░   ░ ░ ░  ░  ░     ░    ░    ░  ░░         ░ ░   ░ ░ ░ ▒    ░░   ░    ░     ░░   ░ 
        ░             ░       ░     ░  ░ ░    ░               ░  ░    ░ ░     ░        ░  ░   ░     
        ░ v:1.0.0     ░ By: Danilo Basanta (https://github.com/dabasanta/) | (https://www.linkedin.com/in/danilobasanta/)\n\n"
}
if [ $# == 1 ];then if [ "$1" = "-h" ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$2" = "-h" ] || [ "$2" = "--help" ] || [ "$2" = "-help" ] || [ "$2" = "help" ];then help;elif [ $# == 1 ];then banner;checkDependencies;if ping -c 1 "$1" > /dev/null 2>&1;then if host "$1" > /dev/null 2>&1;then basicRecon "$1";else echo -e " No route to host, please verify your DNS server or internet connection";clean;fi;else echo -e " PING was not success, does server ignoring ICMP packets?";if host "$1" > /dev/null 2>&1;then echo -e " Running checks anyway\n";basicRecon "$1";else echo -e " No route to host, please verify your DNS server or internet connection";clean;fi;fi;fi;elif [ $# == 2 ];then if [ "$1" = "-h" ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$2" = "-h" ] || [ "$2" = "--help" ] || [ "$2" = "-help" ] || [ "$2" = "help" ];then help;else banner;checkDependencies;if ping -c 1 "$1" > /dev/null 2>&1;then if host "$1" > /dev/null 2>&1;then basicRecon "$1" "$2";else echo -e " No route to host, please verify your DNS server or internet connection";clean;fi;else echo -e " PING was not success, does server ignoring ICMP packets?";if host "$1" > /dev/null 2>&1;then echo -e " Running checks anyway\n";basicRecon "$1" "$2";else echo -e " No route to host, please verify your DNS server or internet connection";clean;fi;fi;fi;else echo -e " Invalid arguments ";help;tput cnorm;exit 1;fi

