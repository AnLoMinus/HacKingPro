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
# Search Term
cd

echo -e "${YLW}Please enter the term to search on Github\n${RED}eg. ${LP}CVE-2017-0199 ${YLW}CVE-2017-11882 ${LCYN}bluekeep ${W}solarflare${NC}"
read FIND

# Searching for the Repos that match the search term
curl -g https://github.com/search?q=${FIND} > ${FIND}.html

# Display seacrh page
KC=$(which konqueror)
if [[ ${KC} == */konqueror ]]; then
	konqueror ${FIND}.html &>/dev/null
else
	grep "href=\".*/${FIND}\"" ${FIND}.html
fi
# Display Repo names for cloning
echo -e "${W}Would you like to clone a repo?\n${YLW}You can copy and paste the ${RED}user/${LP}repo${YLW} or paste the whole clone link\nOr enter ${LCYN}n${YLW} to go back to Sifter${NC}"
read CLONE
if [[ ${CLONE} == https:\/\/github.com/* ]]; then
	git clone ${CLONE}
elif [[ ${CLONE} == */* ]]; then
	git clone https://github.com/${CLONE}
else
	exit
fi
