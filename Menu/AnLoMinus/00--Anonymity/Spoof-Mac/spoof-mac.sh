#!/bin/sh
###
# Author: r00t-3xp10it | SSA PurpleTeam @2016
# CHANGE MAC ADDRESS WITHOUT USING MACCHANGER
# SUPPORTED: Linux Kali1, Kali2, Kali3
# ---
#
# I have installed 'kali 2016.1 rolling' a few days ago, and 'macchanger' tool works well with no problems.
# The problem cames when i have decided to 'update' my distro, ever since that update that iam facing bugs
# at changing my 'mac+ip addr' using macchanger('Network Manager9' have changed the way things normally works)
#
# For Reference:
# When using NetworkManager(NM9) to access the net, any spoofed mac address(MAC) produced thru the terminal window(TW)
# using macchanger tool will be over-written by NM9. If no cloned mac address exists in NM9 menu settings, then
# the device is returned to the device MAC (permanent) and any mac spoofing set by the user thru the TW disappears.
# ---
#
# 'This script was writen to enable me to change my mac address using terminal windows'...
# spoof-mac.sh checks if we are running againts 'Kali distros' and if NM version its 'bigger than:1.2.0 (NM9)'
# sudo chmod +x spoof-mac.sh
# sudo ./spoof-mac.sh -h
####




# ---------------------
# VARIABLE DECLARATIONS
# ---------------------
oS=`awk '{print $1}' /etc/issue` # grab distro (Kali or other)
OlD="1.2.0" # version number of the old (not bugged) NetworkManager
VeR=`NetworkManager -V` # grab networkmanager current version installed

  # String to search inside /etc/NetworkManager/system-connections/<ESSID> file
  # If you are getting an error in the 'find /etc/NetworkManager/system-connections'
  # command, then verify if you have enter (case sensitive) the rigth ESSID name. Or
  # if you are using an old kali distro than change the next variable to: 812-11-wireless
  kEy="wifi"




# -----------------------------------
# Colorise shell Script output leters
# -----------------------------------
Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}




Colors;
# pass arguments to script [ -h | -v | -m ]
# we can use: ./spoof-mac.sh -h for help menu
# we can use: ./spoof-mac.sh -v to list mac vendors
# we can use: ./spoof-mac.sh -m to show current mac and ip address
while getopts ":h,:v,:m,:D" opt; do
  case $opt in
    h)
cat << !
---
-- Author: r00t-3xp10it | SSA PurpleTeam @2016
-- CHANGE MAC ADDRESS WITHOUT USING MACCHANGER
-- Supported: Linux Kali1, Kali2, Kali3
---

  When using NetworkManager (NM9) to access the net, any spoofed mac address (MAC)
  produced thru the terminal window (TW) using macchanger tool will be over-writen by
  NM9. If no cloned mac address exists in NM menu settings, then the device is returned
  to the device MAC (permanent) and any mac spoofing set by user thru the TW disappears.

  [ script arguments available ]
  sudo ./spoof-mac.sh for execution
  sudo ./spoof-mac.sh -h for help menu
  sudo ./spoof-mac.sh -v to list mac vendors
  sudo ./spoof-mac.sh -m show current mac and ip address

  "The follow script its my attempt to build the macchanger funtion thru TW"
!
   exit
    ;;
    v)
cat << !
---
-- Author: r00t-3xp10it | SSA PurpleTeam @2016
-- CHANGE MAC ADDRESS WITHOUT USING MACCHANGER
-- [ list of know vendors ]
---

   00:16:f0 - Dell
   00:03:93 - Apple
   00:05:02 - Apple
   00:0a:27 - Apple
   00:00:17 - Oracle
   00:17:ef - IBM Corp
   00:30:ab - Netgear MA401
   08:00:46 - Sony PCWA-C10
   00:30:bd - Belkin F5D6020
   00:50:f2 - MICROSOFT CORP.
   00:01:10 - Gotham Networks.
   00:00:00 - XEROX CORPORATION
   00:00:0b - MATRIX CORPORATION
   00:17:9a - D-Link Corporation
   00:17:0e - CISCO SYSTEMS, INC.
   00:17:a5 - Ralink Technology Corp
   00:04:64 - Fantasma Networks, Inc.
   00:20:91 - National Security Agency.
   00:05:5d - D-Link DWL-650, DWL-650H
   00:06:25 - Linksys WPC11 v2.5, Linksys WPC11 v3

!
   exit
    ;;
    m)
cat << !
---
-- Author: r00t-3xp10it | SSA PurpleTeam @2016
-- CHANGE MAC ADDRESS WITHOUT USING MACCHANGER
-- [ mac and ip addr - current settings ]
---

!
   # funtion to check mac and ip current settings.
   # grab default interface, current mac and ip settings.
   InTeR=`netstat -r | grep "default" | awk {'print $8'}`
   cUrRe=`ifconfig $InTeR | grep "ether" | awk {'print $2'}`
   IP=`ifconfig $InTeR | egrep -w "inet" | awk '{print $2}'`
   echo ${BlueF}[*]${white} Interface active:${GreenF} $InTeR ${Reset};
   echo ${BlueF}[*]${white} Current mac addr:${GreenF} $cUrRe ${Reset};
   echo ${BlueF}[*]${white} Current ip addr :${GreenF} $IP ${Reset};
   exit
    ;;
    D)
      # easter egg: dump wifi passwords to a hidden file :D
      # This argument (funtion) will write .dumped-wifi.txt
      # into the working directory (path were script has run)
      PsK=`sudo grep psk= /etc/NetworkManager/system-connections/*`
      WeP=`sudo grep wep-key0= /etc/NetworkManager/system-connections/*`
      sleep 1
      echo ${BlueF}[☠]${white} easter egg:${GreenF} Done ...${Reset};
      echo "[DUMPED WIFI WEP/PSK's]" >> .dumped-wifi.txt
      echo "$PsK" >> .dumped-wifi.txt
      echo "$WeP" >> .dumped-wifi.txt
      echo "" >> .dumped-wifi.txt
      sleep 1 && clear
      exit
    ;;
    \?)
      echo ${RedF}[x]${white} Invalid option:${RedF} -$OPTARG ${Reset}; >&2
      exit
    ;;
  esac
done





# --------------
# BANNER DISPLAY
# --------------
echo ${YellowF}
cat << !
---
-- Author: r00t-3xp10it | SSA PurpleTeam @2016
-- CHANGE MAC ADDRESS WITHOUT USING MACCHANGER
-- Supported: Linux Kali1, Kali2, Kali3
---
!




# ---------------------------------------------
# Chek if we are running againts Kali distros
# and if NM version its bigger than: 1.2.0 (NM9)
# ----------------------------------------------
if [ "$oS" = "Kali" ] && [ $VeR \> $OlD ]; then
  echo ${BlueF}[*]${white} Kali Distro found...${Reset};
  echo ${BlueF}[*]${white} NetworkManager9 found... ${Reset};


    # questions to user
    iNtEr=$(zenity --title="Input INTERFACE in Use" --text "example: wlan0" --entry --width 300) > /dev/null 2>&1
    echo ${BlueF}[*]${white} Sellected INTERFACE:${GreenF}$iNtEr...${Reset};
    EsSiD=$(zenity --title="Input ESSID to inject Clone" --text "example: Gh0st-Ubuntu" --entry --width 300) > /dev/null 2>&1
    echo ${BlueF}[*]${white} Sellected ESSID:${GreenF}$EsSiD...${Reset};
    ClOnE=$(zenity --title="Input MAC ADDR to Inject" --text "example: 00:04:64:a8:04:b8" --entry --width 300) > /dev/null 2>&1
    echo ${BlueF}[*]${white} Sellected CLONE:${GreenF}$ClOnE...${Reset};

      # bring interface down
      echo ${BlueF}[*]${white} Stop network-manager...${Reset};
      service network-manager stop > /dev/null 2>&1
      sleep 3
      echo ${BlueF}[*]${white} Bring interface down...${Reset};
      ifconfig $iNtEr down > /dev/null 2>&1
      sleep 2

        # add cloned mac to NetworkManager
        echo ${BlueF}[*]${white} Add Cloned mac address to network-manager...${Reset};
        find "/etc/NetworkManager/system-connections/$EsSiD" -type f -exec sh -c "sed -i \"/^cloned-mac-address.*/d;/^\[$kEy\]/a\cloned-mac-address=$ClOnE\" \"{}\"" \;
        sleep 2

    # bring interface up
    echo ${BlueF}[*]${white} Bring interface up...${Reset};
    ifconfig $iNtEr up > /dev/null 2>&1
    sleep 2
    echo ${BlueF}[*]${white} Restart network-manager...${Reset};
    service network-manager start > /dev/null 2>&1
    sleep 7

  # display settings to user
  cUrRe=`ifconfig $iNtEr | grep "ether" | awk {'print $2'}`
  IP=`ifconfig $iNtEr | egrep -w "inet" | awk '{print $2}'`
  echo ${BlueF}[*]${white} Current mac addr:${GreenF}$cUrRe ${Reset};
  echo ${BlueF}[*]${white} Current ip addr :${GreenF}$IP ${Reset};
  sleep 2
  echo ${BlueF}['!'] To change your Mac adress to default [ permanent ] ${Reset};
  echo ${BlueF}['!'] just run the tool again, and when the clone mac adress ${Reset};
  echo ${BlueF}['!'] window appear just press ENTER [ dont input any mac ]. ${Reset};
  exit


else


  sleep 1
  # not supported distro/operative system...
  if [ "$oS" != "Kali" ]; then
  echo ${RedF}[x]${white} OS Distribution :${RedF} $oS '(NOT SUPPORTED)' ${Reset};
  else
  echo ${RedF}[x]${white} OS Distribution :${RedF} $oS ${Reset};
  fi
  if [ $OlD \> $VeR ]; then
  echo ${RedF}[x]${white} Network Manager :${RedF} $VeR '(NOT SUPPORTED)' ${Reset};
  else
  echo ${RedF}[x]${white} Network Manager :${RedF} $VeR ${Reset};
  fi
  sleep 1
  echo ${BlueF}['!'] Use macchanger utility to spoof your mac addr. ${Reset};
  echo ${BlueF}['!'] This bug it´s only present In NetworkManager '( >=' $OlD ')'${Reset};
  echo ${BlueF}['!'] versions, the main reason why this script was build... ${Reset};
  exit

fi
