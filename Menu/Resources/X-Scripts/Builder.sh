#!/bin/sh
#!/bin/bash
#!/usr/bin/sh
#!/usr/bin/bash
#!/usr/bin/env sh
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/bash
###############################################
# Name : Anlominus ~ HacKingPro
# Description : HacKingPro ~ enter your target and Hack Him in the end get Markdown Report.
# Last UPDATE : 2022 Jul 2
# Aouther: Anlominus ~> RhytMix ~> HacKingPro
# Skils: Best Copywriter IN the COSMOS!
# BIG THANX TO ALL COMUNITY THAT SHARE ALL THAT FREE GREAT SCRIPTS
# CREDIT: To All World Creators free Scripts & Tools
# Location: Made With LOVE IN ISRAEL !
# Source: https://github.com/Anlominus/HacKingPro
###############################################
Anlominus="AnLoMinus"
###############################################
# Define Colors Variables
HacKingProColors(){
##############################################################################
# COLORS AND BACKGROUNDS
##############################################################################
Color_Off='\033[0m' # Text Reset

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;97m'  # White

# Additional colors
LGrey='\033[0;37m'   # Ligth Gray
DGrey='\033[0;90m'   # Dark Gray
LRed='\033[0;91m'    # Ligth Red
LGreen='\033[0;92m'  # Ligth Green
LYellow='\033[0;93m' # Ligth Yellow
LBlue='\033[0;94m'   # Ligth Blue
LPurple='\033[0;95m' # Light Purple
LCyan='\033[0;96m'   # Ligth Cyan


# Bold
BBlack='\033[1;30m'  # Black
BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'   # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'   # Cyan
BWhite='\033[1;37m'  # White
}
HacKingProColors
###############################################
HacKingPro=$(echo "${BRed}Hac${BYellow}King${BBlue}Pro")
MyVersion="${BGreen} v0.1.3.12"
Tool_Name="${Anlominus}~Builder"
Press_ENTER=$(echo "\n\n${Color_Off}${BYellow}                🔶    Press ENTER    🔶     ${BGreen}\n\n")
HacKingProExit=$(echo "\n\n\t\t${BRed}[${BCyan}✡${BRed}] ${BCyan}Exit ${HacKingPro} ${BRed}[${BCyan}✡${BRed}]\n\t\t ${BGreen}")
clear
echo "\n  ${BYellow}⚜️  $Anlominus  $HacKingPro  $Tool_Name  $MyVersion ⚜️ ${BRed}\n"
chmod +x $0
ls Alternative >> /dev/null
if [ $? == 0 ]; then
  echo "\n\n\t ✅ ${BGreen} Found ${BYellow}Alternative \n\n\t ${BBlue}Blue-Team	${BPurple}Purple-Team	${BRed}Red-Team \n"
  cd Alternative
  echo "\n\t ✅ ${BGreen} Continue To ${BPurple}Purple-Team \n"
  cd Purple-Team
  read -p "$Press_ENTER"
else
  echo "\n\t ✅ ${BGreen} Creating ${BYellow}Alternative ${BGreen}Folder \n"
  mkdir Alternative >> /dev/null
  cd Alternative
  echo "\n\t ✅ ${BGreen} Creating ${BRed}Red-Team ${BGreen}Folder \n"
  mkdir Red-Team >> /dev/null
  echo "\n\t ✅ ${BGreen} Creating ${BBlue}Blue-Team ${BGreen}Folder \n"
  mkdir Blue-Team >> /dev/null
  echo "\n\t ✅ ${BGreen} Creating ${BPurple}Purple-Team ${BGreen}Folder \n"
  mkdir Purple-Team >> /dev/null
  echo "\n\t ✅ ${BGreen} Continue To ${BPurple}Purple-Team ${BGreen}Folder \n"
  cd Purple-Team
  mkdir "00--Most Used Tools" >> /dev/null
  mkdir "01--Information Gathering" >> /dev/null
  mkdir "02--Web Application Analysis" >> /dev/null
  mkdir "03--Vulnerability Analysis" >> /dev/null
  mkdir "04--Exploitation Tools" >> /dev/null
  mkdir "05--Maintaining Access" >> /dev/null
  mkdir "06--Post Exploitation" >> /dev/null
  mkdir "07--Password Attacks" >> /dev/null
  mkdir "08--Wireless Attacks" >> /dev/null
  mkdir "09--Sniffing & Spoofing" >> /dev/null
  mkdir "10--Digital Forensics" >> /dev/null
  mkdir "11--Reporting Tools" >> /dev/null
  mkdir "12--Reverse Engineering" >> /dev/null
  read -p "$Press_ENTER"
fi
echo  "$HacKingProExit"
