#option1
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
#coding section starts :)
clear
echo " "
echo " "
echo -e "$red                You are going to$grn GITHUB"
echo " "
echo -e "$grn                Press$ylo ENTER$grn to continue$rset"
echo " "
read e1
clear
echo " "
echo " "
echo -e "$ylo  To$red EXIT$ylo the process click$red 'e'$ylo or to$grn continue$ylo click on$grn 'c'$rset" 
read e2
if [[ $e2 = 'e' ]] ; then
clear
echo " "
echo " "
echo -e "$red          Are you sure? Press$grn ENTER$red to exit$rset"
read e3
elif [[ $e2 = 'c' ]] ; then
clear
echo ""
echo ""
echo -e "$red FOLLOW$blue ME ON$pink GITHUB 🔔 "  
echo ""
sleep 3.0
xdg-open https://github.com/jravis-8520
echo " "
sleep 3.0

echo -e "$pink Press Enter $rset"
read a1
fi