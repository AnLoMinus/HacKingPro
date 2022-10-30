#!/bin/sh
#!/bin/bash
#!/usr/bin/sh
#!/usr/bin/bash
#!/usr/bin/env sh
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/bash
###############################################################
#          Privacy / Anonimity / Hiding / Removing            #
#-Info--------------------------------------------------------#
#    Enter Your Target, Hack Him, and Get Markdown Report     #
#-About-------------------------------------------------------#
#--╼▰[ Skils ]-╼▰[ MultiMan ]                                 #
#--╼▰[ Part of ]-╼▰[ HacKingPro ]                             #
#--╼▰[ Script Name ]-╼▰[ HacKingPro-00 ]                      #
#--╼▰[ Author ]-╼▰[ AnLoMinus ]-╼▰[ Leon Yaakobov ]           #
###############################################################
# CREDIT: To All World Creators free Scripts & Tools          #
# BIG THANX TO ALL COMUNITY THAT SHARE ALL THAT FREE          #
# GREAT SCRIPTS                                               #
# Location: Made With LOVE IN ISRAEL !                        #
###############################################################
#-Metadata----------------------------------------------------#
#--╼▰[ Version ]-╼▰[ 1.0.0 ]                                  #
#--╼▰[ Source ]-╼▰[ https://github.com/AnLoMinus/HacKingPro ] #
#--╼▰[ Created ]-╼▰[ 15-08-2022 ]                             #
#--╼▰[ Update ]-╼▰[ 15-08-2022 ]                              #
###############################################################

#################################################
#------╼╼▰[ Main Menu ]--╼▰ [ 00 ]--╼▰ [ Head ] #
#################################################
#--╼[ Main Menu ]--╼▰ [ 00 ]
#--╼[ Main Menu ]--╼▰ [ 00 ]--╼▰ [ CoverMe ]--╼▰ [ Cover Me Cleaning Logs and more. ]
CoverMe(){

  LOGS_FILES=$(
  "~/.zsh_sessions/*"
  "/var/log/messages" # General message and system related stuff
  "/var/log/auth.log" # Authenication logs
  "/var/log/kern.log" # Kernel logs
  "/var/log/cron.log" # Crond logs
  "/var/log/maillog" # Mail server logs
  "/var/log/boot.log" # System boot log
  "/var/log/mysqld.log" # MySQL database server log file
  "/var/log/qmail" # Qmail log directory
  "/var/log/httpd" # Apache access and error logs directory
  "/var/log/lighttpd" # Lighttpd access and error logs directory
  "/var/log/secure" # Authentication log
  "/var/log/utmp" # Login records file
  "/var/log/wtmp" # Login records file
  "/var/log/yum.log" # Yum command log file
  "/var/log/system.log" # System Log
  "/var/log/DiagnosticMessages" # Mac Analytics Data
  "/Library/Logs" # System Application Logs
  "/Library/Logs/DiagnosticReports" # System Reports
  "~/Library/Logs" # User Application Logs
  "~/Library/Logs/DiagnosticReports" # User Reports
  )

  # CoverMyAss Cleaning Logs

  isRoot () {
    if [ "$EUID" -ne 0 ]; then
      return 1
    fi
  }

  disableAuth () {
    if [ -w /var/log/auth.log ]; then
      ln /dev/null /var/log/auth.log -sf
      echo " "
      echo "[+] Permanently sending /var/log/auth.log to /dev/null"
      Press_ENTER
    else
      echo " "
      echo "[!] /var/log/auth.log is not writable! Retry using sudo."
      Press_ENTER
    fi
  }

  disableHistory () {
    ln /dev/null ~/.bash_history -sf
    echo " "
    echo "[+] Permanently sending bash_history to /dev/null"
    Press_ENTER

    if [ -f ~/.zsh_history ]; then
      ln /dev/null ~/.zsh_history -sf
      echo " "
      echo "[+] Permanently sending zsh_history to /dev/null"
      Press_ENTER
    fi
    export HISTFILESIZE=0
    export HISTSIZE=0
    echo " "
    echo "[+] Set HISTFILESIZE & HISTSIZE to 0"
    echo " "
    set +o history
    echo "[+] Disabled history library"
    echo "Permenently disabled bash log."
    Press_ENTER
  }

  enableAuth () {
    if [ -w /var/log/auth.log ] && [ -L /var/log/auth.log ]; then
      rm -rf /var/log/auth.log
      echo " "
      echo " " > /var/log/auth.log
      echo "[+] Disabled sending auth logs to /dev/null"
      Press_ENTER
    else
      echo " "
      echo "[!] /var/log/auth.log is not writable! Retry using sudo."
      Press_ENTER
    fi
  }

  enableHistory () {
    if [ -L ~/.bash_history ]; then
      echo " "
      rm -rf ~/.bash_history
      echo "" > ~/.bash_history
      echo "[+] Disabled sending history to /dev/null"
    fi

    if [ -L ~/.zsh_history ]; then
      echo " "
      rm -rf ~/.zsh_history
      echo "" > ~/.zsh_history
      echo "[+] Disabled sending zsh history to /dev/null"
    fi

    export HISTFILESIZE=" "
    export HISTSIZE=50000
    echo "
    ${BWhite}|
    ${BWhite}|──${BRed}[${BGreen} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} Restore HISTFILESIZE & HISTSIZE default values. ${BRed}]
    ${BWhite}|
    ${BWhite}|
    ${BWhite}|──${BRed}[${BGreen} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} Enabled history library. ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Permenently enabled bash log. ${BRed}]
    ${BWhite}|        "
    echo " "
    set -o history
    echo " "
  }

  clearLogs () {
    for i in "${LOGS_FILES[@]}"
    do
      if [ -f "$i" ]; then
        if [ -w "$i" ]; then
          Press_ENTER
          echo " " > "$i"
          echo " "
          echo "        ${BWhite}|
          ${BWhite}|──${BRed}[${BGreen} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} $i Cleaned. ${BRed}]
          ${BWhite}|              "
          Press_ENTER
        else
          echo " "
          echo "
          ${BWhite}|
          ${BWhite}|──${BRed}[${BGreen} ! ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} $i Is Not Writable! Retry Using sudo. ${BRed}]
          ${BWhite}|              "

        fi
      elif [ -d "$i" ]; then
        if [ -w "$i" ]; then
          rm -rf "${i:?}"/*
          echo " "
          echo "
          ${BWhite}|
          ${BWhite}|──${BRed}[${BGreen} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} $i Cleaned. ${BRed}]
          ${BWhite}|              "
          Press_ENTER
        else
          echo "
          ${BWhite}|
          ${BWhite}|──${BRed}[${BGreen} !! ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} $i Is Not Writable! Retry Using sudo. ${BRed}]
          ${BWhite}|              "
        fi
      fi
    done
  }

  clearHistory () {
    if [ -f ~/.zsh_history ]; then
      echo " "
      echo " " > ~/.zsh_history
      echo "
      ${BWhite}|
      ${BWhite}|──${BRed}[${DGrey} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} ~/.zsh_history Cleaned. ${BRed}]
      ${BWhite}|          "
      Press_ENTER
    fi
    echo " "
    echo " " > ~/.bash_history
    echo "
    ${BWhite}|
    ${BWhite}|──${BRed}[${DGrey} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen} ~/.bash_history Cleaned. ${BRed}]
    ${BWhite}|        "
    Press_ENTER

    echo " "
    history -c
    Press_ENTER
    echo "
    ${BWhite}|
    ${BWhite}|──${BRed}[${DGrey} + ${BRed}]${BWhite}──╼ ${BRed}[${BGreen}  History File Deleted. ${BRed}]
    ${BWhite}|        "

    echo " "
    echo "
    ${BWhite}|
    ${BWhite}|──${BRed}[${BYellow} Reminder ${BRed}]${BWhite}──╼ ${BRed}[${BYellow} your need to reload the session to see effects. Type exit to do so.${BRed}]
    ${BWhite}|        "
    Press_ENTER
  }

  exitTool () {
    exit 1
  }
  MainMenu () {

      clear # Clear output

      while true; do
        #statements
        clear
        ToolHeaderRun
        TargetStatusRun
    HacKingProMenuMain=$(echo "${BRed}
    ${DGrey}┌──${BRed}[${BYellow} Cover Me ${BRed}]
    ${DGrey}|
    ${DGrey}|──${BRed}[${DGrey} 01 ${BRed}]${BGreen}── ${BRed}[${DGrey} Clear logs for user ${BRed}$USER ${BRed}]
    ${DGrey}|──${BRed}[${DGrey} 02 ${BRed}]${BGreen}── ${BRed}[${DGrey} Permenently disable auth & bash history ${BRed}]
    ${DGrey}|──${BRed}[${DGrey} 03 ${BRed}]${BGreen}── ${BRed}[${DGrey} Restore settings to default ${BRed}]
    ${DGrey}|
    ${DGrey}└──${BRed}[${DGrey} X ${BRed}] 🤴 Exit / Quit / Close

    ${BGreen}┌──${BRed}[${BCyan} Arsenal ${BRed}]${BYellow}╼▰  ${BRed}[${BCyan} Cheat Sheets ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Command ${BRed}]${BYellow}╼▰  ${BRed}[${LGreen} $ArsenalCommand ${BRed}]
    ${BGreen}|
    ${BGreen}|──${BRed}[${DGrey} ~$(pwd) ${BRed}]
    ${BGreen}|
    ${BGreen}└──${BRed}[${BYellow} $(AnLoMinus) ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} ${HacKingPro} ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Anonimity ${BRed}]${BYellow}╼▰   ${BRed}[${BGreen} Cover Me ${BRed}]${BYellow}╼▰  ${BGreen}   ")
            read -p "$HacKingProMenuMain" cmd
            case $cmd in
              1|01 )
              echo " "
              clearLogs
              clearHistory
              ;;
              2|02 )
              echo " "
              disableAuth
              disableHistory
              ;;
              3|03 )
              echo " "
              enableAuth
              enableHistory
              ;;
              x|X|exit|quit|Exit )
              clear
              AwesomeLineExit
              break
              ;;
            esac
          done
        }

    clear # Clear output

    # "now" option
    if [ -n "$1" ] && [ "$1" == 'now' ]; then
      clearLogs
      clearHistory
      read "${Press_ENTER}  now"
      exit 0
    fi
    MainMenu
    if [[ $option == 1 ]]; then
      # Clear logs & current history
      clearLogs
      clearHistory

    elif [[ $option == 2 ]]; then
      # Permenently disable auth & bash log
      disableAuth
      disableHistory
    elif [[ $option == 3 ]]; then
      # Restore default settings
      enableAuth
      enableHistory
    elif [[ $option == 99 ]]; then
      # Exit tool
      exitTool
    else
      echo " "
    fi
}

ZeroMainMenu(){
  while true; do
    clear
    ToolHeaderRun
    TargetStatusRun
    HacKingProMenuMain=$(echo "${BRed}
    ${DGrey}[0]───${resetT}${BYellow}╼▰ ${BRed}[${DGrey} Anonimity ${BRed}]

    ${DGrey}┌──${BRed}[${LGreen} NetWorKing ${BRed}]
    ${DGrey}|
    ${DGrey}└──${BRed}[${BGreen}${slowBlink} NetPro ${resetT}${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BGreen} NetWorKingPro ${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BGreen}${faintT} NetWorKing Controller ${resetT}${BRed}]

    ${DGrey}┌──${BRed}[${BWhite} 00 ${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BWhite} Installer ${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BWhite} Installing Anonymous Tools ${BRed}]
    ${DGrey}|
    ${DGrey}└──${BRed}[${BWhite} 01 ${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BWhite} Cover Me ${BRed}]${BGreen}──${resetT}${BYellow}╼▰  ${BRed}[${BWhite} Clean Logs & History${BRed}]

    ${BGreen}┌──${BRed}[${BCyan} Arsenal ${BRed}]${BGreen}───${resetT}${BYellow}╼▰  ${BRed}[${BCyan} Cheat Sheets ${BRed}]${BGreen}───${resetT}${BYellow}╼▰  ${BRed}[${BGreen} Command ${BRed}]${BYellow}╼▰  ${BRed}[${LGreen} $ArsenalCommand ${BRed}]
    ${BGreen}|
    ${BGreen}|──${BRed}[${DGrey} ~$(pwd) ${BRed}]
    ${BGreen}|
    ${BGreen}└──${BRed}[${BYellow} $(AnLoMinus) ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} ${HacKingPro} ${BRed}]${BYellow}╼▰  ${BRed}[${BGreen} Anonymity ${BRed}]${BYellow}╼▰  ${BGreen}   ")
    read -p "$HacKingProMenuMain" cmd
    case $cmd in
      p|P )
      HacKingProPlanning
      ;;
      ls )
      lahs
      ;;
      0|00 )
      clear
      echo ${faintT}
      AnonymousInstaller
      Press_ENTER
      ;;
      1|01 )
      clear
      CoverMe
      Press_ENTER
      ;;
      nt|NT|netpro|NetPro)
      Info_LocalNet
      while true; do
        clear
        ToolHeaderRun
        TargetStatusRun
        #statements
        NetWorKingPro
      done
      ;;
      x|X|exit|EXIT )
      cd ${MainDirectoriy}
      clear
      AwesomeLineExit
      break
      ;;
    esac
  done
}


################################################
#------╼╼▰[ Main Menu ]--╼▰ [ 00 ]--╼▰ [ End ] #
################################################
