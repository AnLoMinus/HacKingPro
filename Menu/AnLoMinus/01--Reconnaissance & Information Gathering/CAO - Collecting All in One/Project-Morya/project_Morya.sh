#!/bin/bash
source ./input_domain.lib
source ./wayback_urls.lib
source ./xss_hunter.lib
source ./subdomain_enumeration.lib
source ./nuclei.lib
source ./probing.lib
source ./dirsearch.lib
source ./subdomain_takeover.lib
source ./help_me.lib
source ./port_scanning.lib

logo(){
echo '                                                                                                                                             ';
echo '                                                                                                                                             ';
echo -e '\e[30;48;5;82m                                                                                                                        \e[0m';
echo -e '\e[30;48;5;82m ███████████                   ███                   █████       ██████   ██████                                        \e[0m';
echo -e '\e[30;48;5;82m░░███░░░░░███                 ░░░                   ░░███       ░░██████ ██████                                         \e[0m';
echo -e '\e[30;48;5;82m ░███    ░███████████ ██████  █████ ██████  ██████  ███████      ░███░█████░███   ██████  ████████  █████ ████ ██████   \e[0m'; 
echo -e '\e[30;48;5;82m ░██████████░░███░░█████░░███░░███ ███░░██████░░███░░░███░       ░███░░███ ░███  ███░░███░░███░░███░░███ ░███ ░░░░░███  \e[0m';
echo -e '\e[30;48;5;82m ░███░░░░░░  ░███ ░░░███ ░███ ░███░███████░███ ░░░   ░███        ░███ ░░░  ░███ ░███ ░███ ░███ ░░░  ░███ ░███  ███████  \e[0m';
echo -e '\e[30;48;5;82m ░███        ░███   ░███ ░███ ░███░███░░░ ░███  ███  ░███ ███    ░███      ░███ ░███ ░███ ░███      ░███ ░███ ███░░███  \e[0m';
echo -e '\e[30;48;5;82m █████       █████  ░░██████  ░███░░██████░░██████   ░░█████     █████     █████░░██████  █████     ░░███████░░████████ \e[0m';
echo -e '\e[30;48;5;82m░░░░░       ░░░░░    ░░░░░░   ░███ ░░░░░░  ░░░░░░     ░░░░░     ░░░░░     ░░░░░  ░░░░░░  ░░░░░       ░░░░░███ ░░░░░░░░  \e[0m';
echo -e '\e[30;48;5;82m                          ███ ░███                                                                   ███ ░███           \e[0m';
echo -e '\e[30;48;5;82m                         ░░██████                                                                   ░░██████            \e[0m';
echo -e '\e[30;48;5;82m                         ░░░░░░                                                                     ░░░░░░              \e[0m';
echo -e '\e[30;48;5;82m                                                                                                                        \e[0m';
echo -e '\e[40;38;5;82m                                                                                              -  Coded by @AnubhavSingh_\e[0m';
echo '                                                                                                                                              ';
echo '                                                                                                                                              ';
}

logo

while getopts ":smah" arg; do
  case "$arg" in
          s )
            input_Domain
            subdomain_Enumeration
            printf "Work is completed" | notify --silent
            ;;
          m )
            input_Domain
            subdomain_Enumeration
            subdomain_Takeover
            wayback_Urls
            probing_Domains
            nuclei_Scanning
            port_Scanning
            printf "Work is completed for $DOMAIN" | notify --silent
            ;;
          a )
            input_Domain
            subdomain_Enumeration
            subdomain_Takeover
            wayback_Urls
            probing_Domains
            nuclei_Scanning
            port_Scanning
            dirsearch_Fuzzing
            xss_Hunter
            printf "Work is completed for $DOMAIN" | notify --silent
          ;;
          \? | h )
            help_me
          ;;
          * )
            echo "Invalid Argument";
          ;;
   esac
done
shift $((OPTIND -1))
