#!/bin/sh
#!/bin/bash
#!/usr/bin/sh
#!/usr/bin/bash
#!/usr/bin/env sh
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/bash
###############################################################
#                 Path Directories For Tools                  #
#-Info--------------------------------------------------------#
#    Enter Your Target, Hack Him, and Get Markdown Report     #
#-About-------------------------------------------------------#
#--╼▰[ Skils ]-╼▰[ MultiMan ]                                 #
#--╼▰[ Part of ]-╼▰[ HacKingPro ]                             #
#--╼▰[ Script Name ]-╼▰[ HacKingPro-Directories ]             #
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
#--╼▰[ Created ]-╼▰[ 18-08-2022 ]                             #
#--╼▰[ Update ]-╼▰[ 07-09-2022 ]                              #
###############################################################

#--╼▰ [ HacKingPro ]--╼▰ [ Case ]-╼▰ [ Directories ]
MainDirectories(){
  if [ -z "${targetNAME}" ]; then
    #statements
    targetNAME="AnLoMinus"
  fi
  MainDirectoriy="$(pwd)"
  # Define Case {Variable}
  MainDirectoriyCase="${MainDirectoriy}/Case"
  # Define Case Name {Variable}
  MainDirectoriyCaseName="${MainDirectoriyCase}/${targetNAME}"
  # Create Case Folder
  mkdir "${MainDirectoriyCase}" 2> /dev/null
  # Create Case Name Folder
  mkdir "${MainDirectoriyCaseName}" 2> /dev/null
  # Define Variables For Case Local Directory
  MainDirectoriyCaseNameRecon="${MainDirectoriyCaseName}/Recon"
  MainDirectoriyCaseNameLocal="${MainDirectoriyCaseName}/Local"
  MainDirectoriyCaseNamePlanning="${MainDirectoriyCaseName}/Planning"
  MainDirectoriyCaseNameEnumeration="${MainDirectoriyCaseName}/Enumeration"
  mkdir "${MainDirectoriyCaseNameRecon}" 2> /dev/null
  mkdir "${MainDirectoriyCaseNameLocal}" 2> /dev/null
  mkdir "${MainDirectoriyCaseNamePlanning}" 2> /dev/null
  mkdir "${MainDirectoriyCaseNameEnumeration}" 2> /dev/null
}
#--╼▰ [ HacKingPro ]--╼▰ [ Menu ]--╼▰ [ Directories ]
xDirectories(){
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 01 ]--╼▰ [ Reconnaissance & Information Gathering ]--╼▰
  x_Menu_1="${MainDirectoriy}/Menu/AnLoMinus/01--Reconnaissance & Information Gathering/"
  x_Menu_1_CLI="${x_Menu_1}CLI - Collecting Local Information/"
  x_Menu_1_CSI="${x_Menu_1}CSI - Collecting Social Information/"
  x_Menu_1_CNI="${x_Menu_1}CNI - Collecting Network Information/"
  x_Menu_1_CMI="${x_Menu_1}CMI - Collecting Machine Information/"
  x_Menu_1_CPI="${x_Menu_1}CPI - Collecting Public Information/"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 02 ]--╼▰ [ Weaponization ]
  x_Menu_2="${MainDirectoriy}/Menu/AnLoMinus/02--Weaponization"
  x_Menu_2_Android="${x_Menu_2}/Android"
  x_Menu_2_BrutePort="${x_Menu_2}/Brute Force"
  x_Menu_2_Winndows="${x_Menu_2}/Windows"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 03 ]--╼▰ [ Exploitation ]
  x_Menu_3="${MainDirectoriy}/Menu/AnLoMinus/03--Delivery/"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 04 ]--╼▰ [ Delivery ]
  x_Menu_4="${MainDirectoriy}/Menu/AnLoMinus/04--Exploitation/"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 05 ]--╼▰ [ Installation ]
  x_Menu_5="${MainDirectoriy}/Menu/AnLoMinus/05--Installation/"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 06 ]--╼▰ [ Command and Control ]
  x_Menu_6="${MainDirectoriy}/Menu/AnLoMinus/06--Command and Control/"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ 07 ]--╼▰ [ Actions on Objective ]
  x_Menu_7="${MainDirectoriy}/Menu/AnLoMinus/07--Actions on Objective/"

  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ Planning ]--╼▰ [ Output Log File ]
  Planning_File="${MainDirectoriyCaseNamePlanning}${targetNAME}-HacKingPro-Planning-Log.md"
  #--╼[ HacKingPro ]--╼▰ [ Directories ]--╼▰ [ Recon ]--╼▰ [ Output Log File ]
  Recon_File="${MainDirectoriyCaseNameRecon}/${targetNAME}-HacKingPro-Recon-Log.md"

  if [ -d HacKingPro-Menu ]; then
    echo "\n    MainDirectoriy=${faintT}${MainDirectoriy}${resetT}"

    echo "\n\t  ${BYellow}[${BGreen}ls -lhs${BYellow}] ${BGreen} HacKingPro  ${ORANGE} $MainDirectoriy\n${faintT}"
    ls -lhs
    echo "${resetT}"
    sleep 0.1

    echo "\n\t  ${BYellow}[${BGreen}ls -lhs${BYellow}] ${BGreen} /HacKingPro-Menu ${ORANGE} $MainDirectoriy/Menu\n${faintT}"
    ls -lhs HacKingPro-Menu
    echo "${resetT}"
    sleep 0.1

    if [ -s HacKingPro-Menu/AnLoMinus ]; then
      echo "\n\t  ${BYellow}[${BGreen}ls -lhs${BYellow}] ${BGreen} /HacKingPro-Menu/AnLoMinus ${ORANGE} $MainDirectoriy/HacKingPro-Menu/AnLoMinus\n${faintT}"
      ls -lhs HacKingPro-Menu/AnLoMinus
      echo "${resetT}"
      sleep 0.1
    fi
    if [ -s HacKingPro-Menu/AnyTool ]; then
      echo "\n\t  ${BYellow}[${BGreen}ls -lhs${BYellow}] ${BGreen} /HacKingPro-Menu/AnyTool ${ORANGE} $MainDirectoriy/HacKingPro-Menu/AnyTool\n${faintT}"
      ls -lhs HacKingPro-Menu/AnyTool
      echo "${resetT}"
      sleep 0.1
    fi
    if [ -s HacKingPro-Resources ]; then
      echo "\n\t  ${BYellow}[${BGreen}ls -lhs${BYellow}] ${BGreen} /HacKingPro-Menu/Resources ${ORANGE} $MainDirectoriy/HacKingPro-Menu/Resources\n${faintT}"
      ls -lhs HacKingPro-Resources
      echo "${resetT}"
      sleep 0.1
    fi
  else
    echo "    ${BGreen}Can't Find Main ${ORANGE}Menu ${BGreen}Folder]"
  fi
  sleep 0.1
  Press_ENTER
}
