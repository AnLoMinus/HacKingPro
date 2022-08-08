#!/bin/bash
resize -s 28 88 > /dev/null 2>&1;
clear
banner(){
	tput setaf 208; tput bold
	echo -n '                      ';
	echo '     -= Built with <3 by PRANSHU RANAKOTI  ©2018 =-' ;
	tput setaf 48;
	echo $'\n
	███████╗████████╗███████╗██████╗ ███╗   ██╗ █████╗ ██╗    ██╗   ██╗██╗███████╗██╗    ██╗
	██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██║    ██║   ██║██║██╔════╝██║    ██║
	█████╗     ██║   █████╗  ██████╔╝██╔██╗ ██║███████║██║    ██║   ██║██║█████╗  ██║ █╗ ██║
	██╔══╝     ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║    ╚██╗ ██╔╝██║██╔══╝  ██║███╗██║
	███████╗   ██║   ███████╗██║  ██║██║ ╚████║██║  ██║███████╗╚████╔╝ ██║███████╗╚███╔███╔╝
	╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝\n';
	tput sgr0;
	tput setaf 50;
	echo -en '          ';
	echo $'Welcome to EternalView™, the omniscient ᒡ◯ᵔ◯ᒢ information gathering tool!\n' ;
	tput setaf 50;echo -en                                  '**************';
	tput setaf 48;echo -en                                                 'MENU';
	tput setaf 50;echo                                                          '***************';
	tput setaf 50;echo -en '*';tput setaf 154;           echo -en ' 1.  Whois information       ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 197;echo -en ' 2.  DNS Lookup              ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 3;  echo -en ' 3.  Web Technology Detection';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 51; echo -en ' 4.  IP Locator              ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 33; echo -en ' 5.  NMAP                    ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 208;echo -en ' 6.  Cloudflare detection    ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 118;echo -en ' 7.  Robots.txt enumeration  ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 248;echo -en ' 8.  WAF/IDS/IPS detection   ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 105;echo -en ' 9.  Extract embedded URL/URI';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 10; echo -en ' 10. HTTP Header             ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 9;  echo -en ' 11. Traceroute              ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 11; echo -en ' 12. AutoPwn™                ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 12; echo -en ' 13. Reload                  ';
	tput setaf 50;echo '  *';echo -en '*';tput setaf 1;  echo -en ' 14. exit                    ';
	tput setaf 50;echo -en '  *';echo                      $'\n*********************************';
	tput setaf 50;echo -en "Please choose an option: ";
	tput sgr0;
}
banner
tput setaf 50;
read opt;
 if [[ opt -eq '1' ]]; # WHOIS
 then tput setaf 154;
echo -en "Enter the website or IP address: ";
read site;
whois $site;
tput smso;
tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
elif [[ opt -eq '2' ]]; # DNS LOOKUP
then tput setaf 197;
echo -en "Enter the website or IP address: ";
tput setaf 50;
read site;
tput sgr0;dig  $site;
tput smso;
 tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '3' ]]; #WEB TECHNOLOGY DETECTION
 then tput setaf 3;
echo -en "Enter the website or IP address: ";
read site;
wget -q https://builtwith.com/$site -O log.html;
echo "    The output has been saved as 'log.html' at";
 pwd;
echo "    Please open the file log.html in your web browser to view the results!";
tput smso;
 tput blink;
tput setaf 1;
tput bold;
echo "    Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '4' ]]; # IP LOCATOR
 then tput setaf 51;
echo -en "Enter the IP address: ";
read ip;
curl ipinfo.io/$ip | grep -v "readme";
tput smso;
 tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '5' ]]; #NMAP
 then tput setaf 33;
echo -en "Press 1 for basic scan and 2 for extensive scan: ";
read scan;
 	if [[ scan -eq "1" ]];
 	then echo -en "Enter the website or the IP address: ";
	read site;
	nmap $site;
	tput smso;
 	tput blink;
	tput setaf 1;
	tput bold;
	echo "If the Host is down or blocking the ping probes, try the extensive scan(option 2). Press any key to continue";
	tput sgr0;
	read key;
	clear
	./EternalView.sh;
 	elif [[ scan -eq "2" ]];
 	then echo -en "Enter the website or the IP address: ";
	read site;
	echo "THIS SCAN WILL TAKE SOME TIME, SIT BACK AND RELAX!";
	sudo nmap -sS -sV -vv --top-ports 1000 -T4 -O $site;
	tput smso;
 	tput blink;
	tput setaf 1;
	tput bold;
	echo "Press any key to continue";
	tput sgr0;
	read key;
	clear
	./EternalView.sh
	else
	tput smso;
	tput blink;
	tput setaf 1;
	tput bold;
	echo "Please choose a valid option! Press Enter to continue";
	tput sgr0;
	read key;
	clear
	./EternalView.sh
 	fi;
elif [[ opt -eq '6' ]]; #CLOUDFLARE DETECTION
then tput setaf 208;
echo -en "Enter the website or the IP address: ";
read site;
ip=$(ping -c1 $site | grep -Eo '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9][0-9]' | head -1)
a=$(dig $site | grep -E 'cloudflare|103.21|103.22|104.16|104|103.3|104.1|108.162.|131.0|141.101|162.15|172.6|173.245|188.114|190.93.|197.234.|198.41')
if [[ $? -eq 0 ]]; then
	echo "Runs on CF"
	echo "the IP is $ip"
else
	echo "Does not run on CF"
fi
tput smso;
tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
elif [[ opt -eq '7' ]]; # ROBOTS.TXT ENUMERATION
then tput setaf 118;
echo -en "Enter the website address (DNS only): ";
read site;
wget --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" -O - $site/robots.txt --quiet;
tput smso;
tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
elif [[ opt -eq '8' ]]; # WAF/IDS/IPS DETECTION
then tput setaf 190;
if ! [ -x "$(command -v wafw00f)" ]; then
	echo 'Error: wafw00f not found, installing now....' >&2
	if ["darwin" == *$OSTYPE* ];then
		git clone https://github.com/EnableSecurity/wafw00f.git
		cd wafw00f
		python3 setup.py build
		python3 setup.py install
		cd ..
		rm -rf wafw00f
	else
		sudo apt-get install wafw00f
	fi
fi
	#statements
echo -en "Enter the website or IP address: ";
read site;
wafw00f $site
tput smso;
tput blink;
tput setaf 1;
tput bold;
echo $'\nPress any key to continue';
tput sgr0;
read key;
clear
./EternalView.sh;
elif [[ opt -eq '9' ]]; # EXTRACT embedded URLs/URIs
 then tput setaf 105;
echo -en "Enter the website or IP address: ";
read site;
tput setaf 51
echo $'Following URLs were found embedded in the web page: \n'
tput setaf 105
wget --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" -O - $site --quiet | grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' |   sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' | grep -v "#" | grep http
tput smso;
 tput blink;
tput setaf 1;
tput bold;
echo $'\nPress any key to continue';
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '10' ]]; # HTTP HEADER
 then tput setaf 10;
echo -en "Enter the website address (without http://): ";
read site;
curl -I $h$site;
tput smso;
 tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '11' ]]; # TRACEROUTE
 then tput setaf 9;
echo -en "Enter the website or IP address: ";
read site;
traceroute $site;
tput smso;
tput blink;
tput setaf 1;
tput bold;
echo "Press any key to continue";
tput sgr0;
read key;
clear
./EternalView.sh;
 elif [[ opt -eq '12' ]]; #AUTOPWN
 then tput setaf 12;
 if ! [ -x "$(command -v autopwn)" ]; then
 	echo 'Error: AutoPwn not found, installing now....' >&2
	git clone https://github.com/rpranshu/autopwn.git
	chmod +x autopwn/Autopwn.sh
	mv autopwn/Autopwn.sh /usr/local/bin/autopwn
	rm -rf autopwn
 fi
 autopwn
clear
./EternalView.sh;
 elif [[ opt -eq '13' ]]; #RELOAD
 then clear
./EternalView.sh;
 elif [[ opt -eq '14' ]]; #EXIT
 then clear;
 exit;
else
	tput smso;
	tput blink;
	tput setaf 1;
	tput bold;
	echo "Please choose a valid option! Press Enter to continue";
	tput sgr0;
	read key;
	clear
	./EternalView.sh;
 fi;
