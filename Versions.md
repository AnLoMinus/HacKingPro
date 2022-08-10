> בס״ד

<h2 align="center">

 ⫷[D̷̨̥̥̥͖̞͐ͮ̄A̳̳̹̟̋ͣ͌ͅT̼̼̖̾͟͞Ơ̷̴̪̪̝͈̥͈̆̀̚S̢̼̼͖̺͖ͪ](https://github.com/AnLoMinus/AnLoMinus/blob/main/DATOS.md)⫸ <br> <br>

 🌑🌒🌓🌔🌕🌖🌗🌘🌑

<p align="center">🔱 We believe in God, everyone else is suspicious 🔱</p>

</h2>

<div align="center">

<a href="https://github.com/AnLoMinus">⚜️ A̍ͭͩnLͭ̇̎̏̒oͩM̳͇i͎̞̝̪n̹̘̓ͣ̓͊̓ů͕̈s̙͉͎̫̈̌̇̐̂ ⚜️</a>

⫷ [`HacKingPro`](https://github.com/AnLoMinus/HacKingPro) ⫸

</div>

---

#### **ToDO**
* [ ] [f8x](https://github.com/ffffffff0x/f8x) | Red/Blue team environment automation deployment tool
* [ ]

---

# 🔮 Changelog 🔮

## [0.0.0.26] ⌛️ 10-08-2022

## ➕ `Functions Print Awesome` ✅
- [x] `AwesomePrint`
```sh
AwesomePrint(){
  echo "\n"
  echo "    ${ORANGE}${faintT}┌╼  $dcdv "
  sleep 0.1
  echo "    ${ORANGE}${faintT}|─╼  $dcdv "
  sleep 0.1
  echo "    ${resetT}${ORANGE}|──╼ $5 "
  sleep 0.1
  echo "    ${ORANGE}${faintT}|─╼  $dcdv "
  sleep 0.1
  echo "    ${ORANGE}${faintT}└╼  $dcdv "
  echo "\n${resetT}"
}
```
- [x] `AwesomeLine`
```sh
AwesomeLine(){
	local WhatHeader="$@"
  echo "\n"
  echo "${BBlue}🔮-=x=-=x=-=x=-=x=-=x=-=x=-=${LYellow}[ ${slowBlink}${WhatHeader}${resetT} ${LYellow}]${BBlue}=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-🔮"
  echo "\n${resetT}"
}
```
## ➕ `Functions to Check Required Programs` ✅
- [x] `MiniHeaderSta`
```sh
MiniHeaderSta(){
  echo "${BYellow}"
  figlet -f small $1
  echo " "
  echo "    ${LGreen}${faintT}┌───${ORANGE}╼${resetT}${LGreen}╼▰  ${resetT}${ORANGE}[ ${LYellow}$@${ORANGE} ] ${resetT}"
  echo "    ${LGreen}${faintT}|"
}
```
- [x] `MiniHeaderEnd`
```sh
MiniHeaderEnd(){
  echo "    ${LGreen}${faintT}|"
  echo "    ${LGreen}${faintT}└───${ORANGE}╼${resetT}${LGreen}╼▰  ${resetT}${ORANGE}[ ${LYellow}$@${ORANGE} ] ${resetT}"
  echo " "
}
```
- [x] `CheckThatPro`
```sh
CheckThatPro(){
  sleep 0.1
  if [ -z $1 ]; then
    echo "\n"
    echo "    ${LRed}|──╼${BRed}[${slowBlink} ❌ ${resetT}${BRed}]${LRed}──╼▰ ${BRed}[${LRed} Please Set Something To Find ${BRed}]"
    echo "\n"
  else
    which ${1} &> /dev/null
    if [ ${?} = 0 ]; then
      ToolPath=$(which ${1})
      echo "    ${BCyan}${faintT}|──╼${resetT}${BRed}[ ✅ ]${BCyan}${faintT}──╼${resetT}${LGreen}╼▰ ${LCyan}[ ${1} ]${BCyan}${faintT}──╼${resetT}${LGreen}╼▰ ${BRed}[${BCyan} ${ToolPath} ${BRed}]"
    else
      echo "    ${BCyan}${faintT}|──╼${resetT}${BRed}[ ${slowBlink}❌${resetT}${BRed} ]${BCyan}${faintT}──╼${resetT}${LRed}╼▰ ${BRed}[ ${1} ]${BCyan}${faintT}──╼${resetT}${LRed}╼▰ ${BRed}[ Sorry ${BRed}Not Found! ${BRed}]"
    fi
  fi
}
```
- [x] `CheckRequiredPro`
```sh
CheckRequiredPro(){
  AwesomeLine "🔶 Checking Required Programs 🔶"

  MiniHeaderSta "System Pack"
  CheckThatPro ps
  CheckThatPro sh
  CheckThatPro nc
  CheckThatPro su
  CheckThatPro top
  CheckThatPro git
  CheckThatPro zsh
  CheckThatPro apt
  CheckThatPro sudo
  CheckThatPro bash
  CheckThatPro less
  CheckThatPro last
  CheckThatPro host
  CheckThatPro ping
  CheckThatPro whoami
  CheckThatPro figlet
  CheckThatPro python
  CheckThatPro python2
  CheckThatPro python3
  CheckThatPro apktool
  CheckThatPro tcpdump
  CheckThatPro netstat
  CheckThatPro ifconfig
  CheckThatPro enum4linux 
  MiniHeaderEnd "System Pack"
  read -p "${Press_ENTER}"

  MiniHeaderSta "Reconnaissance & Information Gathering "
  CheckThatPro ip
  CheckThatPro who
  CheckThatPro dig
  CheckThatPro arp
  CheckThatPro curl
  CheckThatPro wget
  CheckThatPro nmap
  CheckThatPro dirb
  CheckThatPro amass
  CheckThatPro whois
  CheckThatPro nikto
  CheckThatPro tshark
  CheckThatPro kismet
  CheckThatPro dnsmap
  CheckThatPro dnswalk
  CheckThatPro dnsenum
  CheckThatPro gobuster
  CheckThatPro nslookup
  CheckThatPro dnsrecon
  CheckThatPro beef-xss
  CheckThatPro SubFinder
  CheckThatPro Sublist3r
  CheckThatPro smbclient
  CheckThatPro wireshark
  CheckThatPro traceroute
  CheckThatPro netdiscover
  MiniHeaderEnd "Reconnaissance & Information Gathering "
  read -p "${Press_ENTER}"

  MiniHeaderSta "Delivery "
  CheckThatPro ssh
  CheckThatPro ftp
  MiniHeaderEnd "Delivery "
  read -p "${Press_ENTER}"

  MiniHeaderSta "Exploitation "
  MiniHeaderSta "Metasploit Framework"
  CheckThatPro msfd
  CheckThatPro msfdb
  CheckThatPro msfrpc
  CheckThatPro msfvenom
  CheckThatPro msfconsole
  MiniHeaderEnd "Metasploit Framework"
  MiniHeaderEnd "Exploitation "
  read -p "${Press_ENTER}"

  MiniHeaderSta "WiFi HacKing"
  CheckThatPro wifite
  CheckThatPro airmon-ng
  CheckThatPro airbase-ng
  CheckThatPro aircrack-ng
  CheckThatPro airodump-ng
  CheckThatPro aireplay-ng
  CheckThatPro airdecap-ng
  CheckThatPro airdecloak-ng
  MiniHeaderEnd "WiFi HacKing"
  read -p "${Press_ENTER}"

  AwesomeLine "✅ Finish Checking Required Programs ✅"

  echo "\n"
}
```
- #  Main Menu
- ### `0` - Anonimity >
- #### `nt` - NetPro >
    - [x] `Input_Local_Interface`
    ```sh
    clear
    echo "\n"
    echo  "    [*] Finding your Network Interfaces... "$GREEN
    ifconfig -a
    echo "\n"
    echo  "    [*] Enter Your Interface : "${BBlue}
    read LocalHostNAME
    ```
    - [x] `Info_LocalNet`
    ```sh
    Input_Local_Interface
    LocalHostIP="$(ipconfig getifaddr ${LocalHostNAME} 2>/dev/null)"
    DefaultGatewayIP="$(arp -a 2>/dev/null | head -1 | awk -F"[)(]" '{print $2}')"
    DefaultGatewayNAME="$(arp -a 2>/dev/null | head -1 | awk -F"[)(]" '{print $1}')"
    ```

---

# | HacKingPro | v0.0.0.25 |
## | Released | 08/08/2022 | 03:50 |

#### [+] New
- [x] [+] Create Versions File
- [x] [+] MainMenu > [0] Anonimity > [nt] NetPro
- [x] [+] MainMenu > [4] Exploitation > [xp] XPloits

#### [*] BugFix
- [x] [*]  Many Bugs


---

# Examples
- [x] [?] Ask
- [x] [!] Info
- [x] [+] Adding
- [x] [-] Delete
- [x] [*] Fixing

---

## Developer [`AnLoMinus`](https://github.com/AnLoMinus")
