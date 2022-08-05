red='\033[1;31m'
rset='\033[0m'      
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
#coding section starts :)
lagi=01
while [ $lagi -lt 6 ];
do
clear 
echo ""
echo ""
echo -e "$pink                 ____  _____  ____    ____  ____ "
echo -e "$red                / __ \/   \ \/ / /   / __ \/ __ \ "
echo -e "$blue               / /_/ / /| |\  / /   / / / / / / / "
echo -e "$ylo              / ____/ ___ |/ / /___/ /_/ / /_/ /  "
echo -e "$cyan             /_/   /_/  |_/_/_____/\____/_____/  "
echo ""
echo -e "$grn      ＞＞＞＞＞＞＞＞＞$ylo [ MENU ]$grn ＜＜＜＜＜＜＜＜＜＜$rset"
echo ""
echo -e "$red                   ➡ [01]$blue ANDROID PAYLOD$rset";
echo -e "$red                   ➡ [02]$blue ABOUT$rset";
echo -e "$red                   ➡ [03]$blue YOUTUBE$rset";
echo -e "$red                   ➡ [04]$blue INSTAGRAM$rset";
echo -e "$red                   ➡ [05]$blue GITHUB$rset";
echo -e "$red                   ➡ [00]$blue EXIT$rset";
echo ""
echo -e "$grn      ＞＞＞＞＞＞＞＞＞$ylo [SELECT]$grn ＜＜＜＜＜＜＜＜＜＜$rset"
echo " "
echo -e "$cyan                  $pink[[[$ylo Select any option$pink]]]$rset"
read n
case "$n" in
01)
cd
cd h-sploit-paylod
cd kit
cd hsp
bash ap.sh
sleep 2.0
;;
02)
cd
cd h-sploit-paylod
cd kit
cd hsp
bash ma.sh
sleep 2.0
;;
03)
cd
cd h-sploit-paylod
cd kit
cd hsp
bash my.sh
sleep 2.0
;;
04)
cd
cd h-sploit-paylod
cd kit
cd hsp
bash mi.sh
sleep 2.0
;;
05)
cd
cd h-sploit-paylod
cd kit
cd hsp
bash mg.sh
sleep 2.0
;;
00) clear
echo ""
echo ""
echo -e "$cyan                        THANK U  "
echo -e "$ylo                    FOR USING MY TOOL  "
echo -e "$cyan                    I HOPE u LIKE IT  "
echo ""
echo ""
exit
;;
*) clear
echo -e "$blue sorry, the  option you looking is not found"
sleep 2.0
esac
done
done

=================="