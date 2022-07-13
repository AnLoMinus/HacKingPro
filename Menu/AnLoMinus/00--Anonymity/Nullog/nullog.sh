#!/bin/sh
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

# Underline
UBlack='\033[4;30m'  # Black
URed='\033[4;31m'    # Red
UGreen='\033[4;32m'  # Green
UYellow='\033[4;33m' # Yellow
UBlue='\033[4;34m'   # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'   # Cyan
UWhite='\033[4;37m'  # White

# Background
On_Black='\033[40m'  # Black
On_Red='\033[41m'    # Red
On_Green='\033[42m'  # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'   # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'   # Cyan
On_White='\033[47m'  # White
}
HacKingProColors

banner() {
    echo "
    ${BRed}  _   _       _${BWhite} _
    ${BRed} | \ | |_   _| ${BWhite}| | ___   __ _
    ${BRed} |  \| | | | | ${BWhite}| |/ _ \ / _' |
    ${BRed} | |\  | |_| | ${BWhite}| | (_) | (_| |
    ${BRed} |_| \_|\__,_|_${BWhite}|_|\___/ \__, |
    ${BRed}               ${BWhite}         |___/

            [ Version 2.0 ]

"
}

remove_login() {
    cat /dev/null /var/log/wtmp 2>/dev/null
    cat /dev/null /var/log/btmp 2>/dev/null
    cat /dev/null /var/log/lastlog 2>/dev/null
}

other_logs() {
    cat /dev/null /var/log/messages 2>/dev/null
    cat /dev/null /var/log/maillog 2>/dev/null
    cat /dev/null /var/log/secure 2>/dev/null
    cat /dev/null /var/log/syslog 2>/dev/null
    cat /dev/null /var/log/dmesg 2>/dev/null

    for mail_f in $(find /var/log/ -name "mail\.*" 2>/dev/null)
        do
            cat /dev/null $mail_f 2>/dev/null
    done
}

bash_history() {
    for bash_history in $(find / -name ".bash_history" 2>/dev/null)
        do
            cat /dev/null $bash_history 2>/dev/null
    done
}

logs_f() {
    find / -name "*\.log\.*" 2>/dev/null >> .logs
    find / -name "*\.log\.*\.*" 2>/dev/null >> .logs
    find / -name "*\.*\.log\.*" 2>/dev/null >> .logs

    while read log_f
        do
            cat /dev/null $log_f 2>/dev/null
            printf "\n Log deleted: $log_f"
    done < .logs
    rm -f .logs
}

main() {
    clear
    banner
    sleep 1
    echo "${LYellow}[*] ${BYellow}Clearing system login logs\n"
    remove_login
    echo "${LGreen}[+] ${BGreen}Login logs successfully deleted!\n"
    sleep 1
    echo "${LYellow}[*] ${BYellow}Clearing other logs\n"
    other_logs
    echo "${LGreen}[+] ${BGreen}Other logs successfully deleted!\n"
    sleep 1
#    echo "${LYellow}[*] ${BYellow}Clearing system histories\n"
#    bash_history
#    echo "${LGreen}[+] ${BGreen}System history deleted successfully!\n"
    sleep 1
    echo "${LYellow}[*] ${BYellow}Deleting content inside log files"
    logs_f
    echo "${LGreen}[+] ${BGreen}Log files cleared successfully!\n"
    echo "${LYellow}[*] ${BYellow}Clear command history 'history -c'\n"
}

if [[ $EUID -ne 0 ]]; then
   echo "${BYellow}[*] ${BWhite} You are not running Nullog as root, for that reason only some logs that you have permission will be deleted. "
   echo "Do you really want to continue? \n ${BYellow}[Press ENTER]"
   read
   main
fi
