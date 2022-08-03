#!/usr/bin/env bash
# @author: Danilo Basanta
# @author-linkedin: https://www.linkedin.com/in/danilobasanta/
# @author-github: https://github.com/dabasanta

# Changing between bash colors in outputs
BBold="\e[1m"
BRed='\033[1;31m'    # Red
BCyan='\033[1;36m'   # Cyan
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
end="\e[0m"
info="${BBold}${BCyan}[+]"
output="${BBold}${BCyan}[++]"
error="${BBold}${BRed}[!!]"
question="${BBold}${BYellow}[?]"
ok="${BBold}${BGreen}"

mkdir -p /tmp/dnsexplorer  # Creating temporally directory
tput civis  # Making beep off

clean(){  # Cleaning the system after execution
    echo -e "\n\n"
    rm -rf /tmp/dnsexplorer
    echo -e "$output Happy hunting.$end"
    tput cnorm
    exit 0
}

function scape() {  # Catch the ctrl_c INT key
  echo -e "output [+] Exiting ... $end"
  clean
}

trap scape INT

doZoneTransfer(){
  # Perform zone transfer attack using recently discovered dns servers
  success=1

  while IFS= read -r nameserver
  do
    if host -l "$1" "$nameserver" | grep -i "has address" > /dev/null;then
    echo -e "${BGreen} NameServer $nameserver accept ZoneTransfer$end\n"
      host -l "$1" "$nameserver" | grep -i "has address"
      success=0
    else
      echo -e "$error NameServer $nameserver does not accept zone transfer$end"
    fi
  done < <(grep -v '^ *#' < /tmp/dnsexplorer/NameServers.txt)

  return $success
}

dictionaryAttack(){
  tput civis
  echo -e "\n$output Using the first 1.000 records of the dictionary:${BGreen} https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/bitquark-subdomains-top100000.txt\n${BBold}${BCyan}Courtesy of seclists ;)$end\n"
  curl -s https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/bitquark-subdomains-top100000.txt -o /tmp/dnsexplorer/bit.txt

  if [ -f /tmp/dnsexplorer/bit.txt ];then
    # shellcheck disable=SC2002
    cat /tmp/dnsexplorer/bit.txt | head -1000 > /tmp/dnsexplorer/bitquark.txt

    l=$(wc -l /tmp/dnsexplorer/bitquark.txt | awk '{print $1}')
    c=1
    s=0

    while IFS= read -r fqdn
    do
      # shellcheck disable=SC2086
      if host "$fqdn"."$1" | head -1 | grep "has address";then
        s=$((s+1))
      fi

      echo -ne "$output Using entry: ${BGreen}$c$end ${BBold}${BCyan}of ${BBold}${BCyan}$l.$end \r"
      c=$((c+1))
    done < <(grep -v '^ *#' < /tmp/dnsexplorer/bitquark.txt)

    # shellcheck disable=SC1087
    if [ $s -ge 1 ];then
      echo -e "\n${BBold}${BGreen}[+] Found $s subdomains.$end"
    else
      echo -e "\n${BBold}$error[!!] Found $s subdomains.$end"
    fi
  else
    echo -e "$error Could not download dictionary from seclists url.$end"
    clean
  fi
}

dictionaryAttackCustom(){
  check=0
  while [ $check -eq 0 ];do
    echo -e "$question"
    read -rp "Enter the path of the dictionary file> " dfile ; echo -e "$end"

    if [ -f "$dfile" ];then
      istext=$(file "$dfile" | awk '{print $2}')

      if [[ $istext = "ASCII" ]];then
        l=$(wc -l "$dfile" | awk '{print $1}')
        co=1
        su=0

        while IFS= read -r sub
        do
          if host "$sub"."$1" | head -1 | grep "has address"; then
            su=$((su+1))
          fi

          echo -ne "$output Using entry: ${BGreen}$co$end ${BBold}${BCyan}of ${BBold}${BCyan}$l.$end \r"
          co=$((co+1))
        done < <(grep -v '^ *#' < "$dfile")

        if [ $su -ge 1 ];then
          # shellcheck disable=SC1087
          echo -e "\n${BBold}${BGreen}[+] Found $su subdomains.$end"
        else
          echo -e "\n${BBold}$error Found $su subdomains.$end"
        fi
        check=1
        clean
      else
        echo -e "$error the file is not ASCII text. Can't use it."
      fi

    else
      echo -e "$error File $dfile does not exists."
    fi
  done
}

bruteForceDNS(){
  echo -e "$output Fuzzing subdomains of $1 $end\n"
  echo -e "$question Do yo want to use a custom dictionary? [C=custom/d=Default]$end"
  echo -e "$info Default: Provides a dictionary with the top 1000 of the most commonly used subdomains.\nCustom: Use your own custom dictionary."

  while true; do
    echo -e "$question"
    read -rp "[D/c]> " dc
    echo -e "$end"

    case $dc in
      [Dd]* ) dictionaryAttack "$1"; break;;
      [Cc]* ) dictionaryAttackCustom "$1"; break;;
      * ) echo -e "$error Please answer${BGreen} D$end ${BBold}${BRed}or$end${BGreen}${BBold} C$end${BBold}${BRed}.$end\n";;
    esac
  done
}

crtSH(){
  domain_search=$1
  echo -e "\n$info Finding subdomains - abusing Certificate Transparency Logs using https://crt.sh/\n$end"
  curl -s "https://crt.sh/?q=${domain_search}&output=json" -o /dev/null 2>&1
  if [ $? ];then
    curl -s "https://crt.sh/?q=${domain_search}&output=json" | sed 's/,/\n/g' | grep 'common_name' | cut -d : -f 2 | sed 's/"//g' | sed 's/\\n/\n/g' > /tmp/dnsexplorer/crt.sh.reg
    echo -e $ok
    sort /tmp/dnsexplorer/crt.sh.reg | uniq
    echo -e $end
  else
    echo -e "$error Unable to connect to CTR.sh $end"
  fi
  echo -e "\n"
}

basicRecon(){
  echo -e "$info Finding IP address for A records ${BGreen}"

  if [ -z "$2" ];then
    host "$1" | grep 'has address' | awk '{print $4}'
    echo -e ""
  else
    host "$1" "$2" | grep 'has address' | awk '{print $4}'
    echo -e ""
  fi

  echo -e "$info Finding IPv6 address for AAA records ${BGreen}"

  if [ -z "$2" ];then
    if host "$1" | grep 'IPv6' >/dev/null 2>&1;then
      host "$1" | grep 'IPv6'| awk '{print $5}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not IPv6 address\n"
    fi
  else
    if host "$1" "$2" | grep 'IPv6' >/dev/null 2>&1;then
      host "$1" "$2" | grep 'IPv6'| awk '{print $5}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not IPv6 address\n"
    fi
  fi

  echo -e "$info Finding mail server address for $1 domain ${BGreen}"

  if [ -z "$2" ];then
    if host -t MX "$1" | grep 'mail' >/dev/null 2>&1;then
      host "$1" | grep 'mail' | awk '{print $6,$7}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not mail server records\n"
    fi
  else
    if host -t MX "$1" "$2" | grep 'mail' >/dev/null 2>&1;then
      host "$1" "$2" | grep 'mail' | awk '{print $6,$7}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not mail server records\n"
    fi
  fi

  echo -e "$info Finding CNAME records for $1 domain ${BGreen}"

  if [ -z "$2" ];then
    if host -t CNAME "$1" | grep 'alias' >/dev/null 2>&1;then
      host -t CNAME "$1" | awk '{print $1,$4,$6}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not alias records\n"
    fi
  else
    if host -t CNAME "$1" "$2" | grep 'alias' >/dev/null 2>&1;then
      host -t CNAME "$1" "$2" | awk '{print $1,$4,$6}'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not alias records\n"
    fi
  fi

  echo -e "$info Finding text description for $1 domain ${BGreen}"

  if [ -z "$2" ];then
    if host -t txt "$1" | grep 'descriptive' >/dev/null 2>&1;then
      host -t txt "$1" | grep 'descriptive'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not description records\n"
    fi
  else
    if host -t txt "$1" "$2" | grep 'descriptive' >/dev/null 2>&1;then
      host -t txt "$1" "$2" | grep 'descriptive'
      echo -e ""
    else
      echo -e "$question Hosts $1 has not description records\n"
    fi
  fi

  echo -e "$info Checking if $1 has a TLS site${BGreen}"

  connected=$(echo -n | openssl s_client -connect  "$1:443" 2>/dev/null | head -1 | awk -F "(" '{print $1}')

  if [[ "$connected" == "CONNECTED" ]];then
      DNS=$(echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | sed 's/\                //'|grep -i "DNS:" | awk -F ":" '{print $1}')

      if [[ "$DNS" == "DNS" ]];then
          echo -e "$output The domain $1 has a secure webserver and your certificate have these alternate domain names:${BGreen}"
          echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | grep "DNS:"| tr ',' '\n' | sed 's/\               //' | sed 's/\s//g' | sed 's/DNS://g'
          subjects=$(echo -n | openssl s_client -connect "$1:443" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text | grep "DNS:" | tr ',' '\n' | sed 's/\               //' | wc -l)
          echo -e "$output $subjects alternate DNS domain found.\n"
          crtSH "$1"
      else
          echo -e "$question Domain $1 has secure website at $1:443, but does not have alternate subject names.\n"
          crtSH "$1"
      fi
  else
      echo -e "$error No website found on $1:443\n"
  fi

  echo -e "$info Finding nameserver address for $1 domain ${BGreen}"

  if [ -z "$2" ];then
    if host -t NS "$1" | grep 'name server' >/dev/null 2>&1;then
      host -t NS "$1" | cut -d " " -f 4
      host -t NS "$1" | cut -d " " -f 4 > /tmp/dnsexplorer/NameServers.txt
      ns=$(wc -l /tmp/dnsexplorer/NameServers.txt | awk '{print $1}')
      echo -e "\n$output $ns DNS Servers was found, trying ZoneTransfer on these servers$end"

      if doZoneTransfer "$1";then
        echo -e "\n$ok DNS zone transfer was possible, no bruteforce attacks on the subdomains are required. $end\n"
        clean
      else
        echo -e "\n$error DNS zone transfer was not possible, DNS servers are not accept it"

        while true; do
          echo ""
          tput cnorm
          echo -e "$question"
          read -rp "Do you want to brute force subdomains? [Y/n]> " yn
          echo -e "$end"

          case $yn in
            [Yy]* ) bruteForceDNS "$1"; break;;
            [Nn]* ) clean;;
            * ) echo -e "$error Please answer yes or no.$end\n";;
          esac
        done
      fi
    fi
  else
    if host -t NS "$1" "$2" | grep 'name server' >/dev/null 2>&1;then
      host -t NS "$1" "$2" | grep 'name server' | cut -d " " -f 4
      host -t NS "$1" "$2" | grep 'name server' | cut -d " " -f 4 > /tmp/dnsexplorer/NameServers.txt
      ns=$(wc -l /tmp/dnsexplorer/NameServers.txt | awk '{print $1}')
      echo -e "\n$output $ns DNS Servers was found, trying ZoneTransfer on these servers$end"

      if doZoneTransfer "$1";then
        echo -e "\n$ok DNS zone transfer was possible, no bruteforce attacks on the subdomains are required. $end\n"
        clean
      else
        echo -e "\n$error DNS zone transfer was not possible, DNS servers are not accept it"

        while true; do
          echo ""
          tput cnorm
          echo -e "$question"
          read -rp "Do you want to brute force subdomains? [Y/n]> " yn
          echo -e "$end"

          case $yn in
            [Yy]* ) bruteForceDNS "$1"; break;;
            [Nn]* ) clean;;
            * ) echo -e "$error Please answer yes or no.$end\n";;
          esac
        done
      fi
    fi
  fi
}

help(){
    echo -e "
        ${BGreen}@@@  @@@  @@@@@@@@  @@@       @@@@@@@
        @@@  @@@  @@@@@@@@  @@@       @@@@@@@@
        @@!  @@@  @@!       @@!       @@!  @@@
        !@!  @!@  !@!       !@!       !@!  @!@
        @!@!@!@!  @!!!:!    @!!       @!@@!@!
        !!!@!!!!  !!!!!:    !!!       !!@!!!
        !!:  !!!  !!:       !!:       !!:
        :!:  !:!  :!:        :!:      :!:
        ::   :::   :: ::::   :: ::::   ::
        :   : :  : :: ::   : :: : :   :


${BCyan}DNSExplorer$ok automates the enumeration of DNS servers and domains using the 'host' tool and the predefined DNS server in /etc/resolv.conf.

${BCyan}To use it run: $ok./DNSExplorer.sh domain.com$end\n"
tput cnorm
}

checkDependencies() {
    if ! command -v host &> /dev/null
    then
        echo -e "$error 'host' command is not available, please install the bind-utils/dnsutils package. $end"
        clean
    fi
    if ! command -v curl &> /dev/null
    then
        echo -e "$error 'curl' command is not available, please install the curl package. $end"
        clean
    fi
}

banner(){
    echo -e "${BRed}
        ▓█████▄  ███▄    █   ██████ ▓█████ ▒██   ██▒ ██▓███   ██▓     ▒█████   ██▀███  ▓█████  ██▀███
        ▒██▀ ██▌ ██ ▀█   █ ▒██    ▒ ▓█   ▀ ▒▒ █ █ ▒░▓██░  ██▒▓██▒    ▒██▒  ██▒▓██ ▒ ██▒▓█   ▀ ▓██ ▒ ██▒
        ░██   █▌▓██  ▀█ ██▒░ ▓██▄   ▒███   ░░  █   ░▓██░ ██▓▒▒██░    ▒██░  ██▒▓██ ░▄█ ▒▒███   ▓██ ░▄█ ▒
        ░▓█▄   ▌▓██▒  ▐▌██▒  ▒   ██▒▒▓█  ▄  ░ █ █ ▒ ▒██▄█▓▒ ▒▒██░    ▒██   ██░▒██▀▀█▄  ▒▓█  ▄ ▒██▀▀█▄
        ░▒████▓ ▒██░   ▓██░▒██████▒▒░▒████▒▒██▒ ▒██▒▒██▒ ░  ░░██████▒░ ████▓▒░░██▓ ▒██▒░▒████▒░██▓ ▒██▒
        ▒▒▓  ▒ ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░░░ ▒░ ░▒▒ ░ ░▓ ░▒▓▒░ ░  ░░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░░ ▒▓ ░▒▓░
        ░ ▒  ▒ ░ ░░   ░ ▒░░ ░▒  ░ ░ ░ ░  ░░░   ░▒ ░░▒ ░     ░ ░ ▒  ░  ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░  ░▒ ░ ▒░
        ░ ░  ░    ░   ░ ░ ░  ░  ░     ░    ░    ░  ░░         ░ ░   ░ ░ ░ ▒    ░░   ░    ░     ░░   ░
        ░             ░       ░     ░  ░ ░    ░               ░  ░    ░ ░     ░        ░  ░   ░
        ░ v:1.0.1     ░$end By: Danilo Basanta (https://github.com/dabasanta/) | (https://www.linkedin.com/in/danilobasanta/)\n\n"

}

if [ $# == 1 ];then

    if [ "$1" = "-h" ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$2" = "-h" ] || [ "$2" = "--help" ] || [ "$2" = "-help" ] || [ "$2" = "help" ];then
        help

    elif [ $# == 1 ];then
        banner
        checkDependencies

        if ping -c 1 "$1" > /dev/null 2>&1;then
            if host "$1" > /dev/null 2>&1;then
                basicRecon "$1"
            else
                echo -e "$error No route to host, please verify your DNS server or internet connection$end"
                clean
            fi
        else
            echo -e "$question PING was not success, does server ignoring ICMP packets?$end"
            if host "$1" > /dev/null 2>&1;then
                echo -e "$info Running checks anyway$end\n"
                basicRecon "$1"

            else
                echo -e "$error No route to host, please verify your DNS server or internet connection$end"
                clean
            fi
        fi
    fi
elif [ $# == 2 ];then

  if [ "$1" = "-h" ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$2" = "-h" ] || [ "$2" = "--help" ] || [ "$2" = "-help" ] || [ "$2" = "help" ];then
        help
  else
    banner
    checkDependencies

    if ping -c 1 "$1" > /dev/null 2>&1;then
        if host "$1" > /dev/null 2>&1;then
            basicRecon "$1" "$2"
        else
            echo -e "$error No route to host, please verify your DNS server or internet connection$end"
            clean
        fi
    else
        echo -e "$question PING was not success, does server ignoring ICMP packets?$end"
        if host "$1" > /dev/null 2>&1;then
            echo -e "$info Running checks anyway$end\n"
            basicRecon "$1" "$2"

        else
            echo -e "$error No route to host, please verify your DNS server or internet connection$end"
            clean
        fi
    fi
  fi
else
    echo -e "$error Invalid arguments $end"
    help
    tput cnorm
    exit 1
fi
