#!/bin/bash
LPATH='/opt/sifter/'
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'
LOLpause(){
	D='1'
	sudo touch .numbers
	sudo chown $USER:$USER .numbers
	for i in `seq -s \  10`;
	do
		echo ${D}... > .numbers
		lolcat .numbers
		sleep 1
		D=$(( $D + 1 ))
	done
	rm .numbers
}

###################
# Begin Repo check for missing modules/tools
##-----------------
#
sudo apt update && sudo apt-get update && sudo apt full-upgrade
sudo apt-get install -y python wmdocker sqlmap zenity lolcat graphviz terminator kdialog privoxy python-dev python3-venv npm libpython3-stdlib python-pip libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libidn11-dev libkrb5-dev libldap2-dev librtmp-dev libssh2-1-dev python3 python2.7 python2.7-dev libmariadb-dev git libsqlite3-0 nmap wpscan nikto dirbuster leafpad figlet nano docker-compose tcl8.6-tdbc-sqlite3 sqlite3 libsqlite3-tcl libsqlite3-0 libsqlite3-dev tcl-tclreadline python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep nodejs npm wafw00f arp-scan golang mariadb-client mariadb-server eom liblapack3 lolcat sqlite3 libsqlite3-0 libsqlite3-dev libncurses5 libncurses5-dev libncurses6 libncursesw5 libncursesw6 libncursesw5-dev -y # sqlite3
DCKR=$(sudo apt-get install docker-ce | grep "is not available")
if [[ ${DCKR} == "Package docker-ce is not available, but is referred to by another package." ]]; then
	DCKR2=$(sudo apt-get install docker-ce-cli | grep "is not available")
	if [[ ${DCKR2} == "Package docker-ce-cli is not available, but is referred to by another package." ]]; then
		sudo apt-get install docker docker.io
	fi
fi

sudo apt --fix-broken install

###################
# Begin External tool installs/updates
##-----------------
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking if Sifter is installed${NC}"
if [[ -d /opt/sifter ]]; then
	echo -e "${ORNG}     _____ _____            _            __                __       "
	echo -e "    / __(_) _/ /____ ____  (_)__   ___ _/ /______ ___ ____/ /_ __   "
	echo -e "   _\ \/ / _/ __/ -_) __/ / (_-<  / _ \`/ / __/ -_) _ \`/ _  / // /   "
	echo -e "  /___/_/_/ \__/\__/_/   /_/___/  \_,_/_/_/  \__/\_,_/\_,_/\_, /    "
	echo -e "     _         __       ____       ____                   /___/     "
	echo -e "    (_)__  ___/ /____ _/ / /__ ___/ / /                             "
	echo -e "   / / _ \(_-< __/ _ \`/ / / -_) _  /_/                              "
	echo -e "  /_/_//_/___|__/\_,_/_/_/\__/\_,_(_)                               ${NC}"
	sudo chown $USER:$USER -R /opt/sifter
	sudo cp sifter -t /usr/sbin
	sudo chown $USER:$USER /usr/sbin/sifter
	chmod +x /usr/sbin/sifter
else
	pwd && cd ..
	sudo mv sifter -t /opt
	sudo chown $USER:$USER -R /opt/sifter
	cd /opt/sifter
    sudo cp sifter /usr/sbin/sifter
	sudo chmod +x /opt/sifter/sifter /usr/sbin/sifter
	sudo chmod +x -R /opt/sifter/modules
	sleep 2
fi

###################
# Result Folder Check
##-----------------
#
if [[ ! -d "/opt/sifter/results" ]]; then
	mkdir /opt/sifter/results
fi

###################
# Log Folder Check
##-----------------
#
if [[ ! -d "/opt/sifter/logs" ]]; then
	mkdir /opt/sifter/logs
fi

###################
# Initial Install
##-----------------
#
sudo sed -i "s/FIRSTTIME=1/FIRST=DONE/g" /opt/sifter/sifter
sudo sed -i "s/FIRSTTIME=1/FIRST=DONE/g" /usr/sbin/sifter
##
echo -e "${RED}"
echo -e "Downloading & Updating of external dependancies will start in 10 seconds.\nThis will take some time"
echo -e "${YLW}If you would not like to do this hit ${UPURPLE}Ctrl + C${NC}\n${YLW}Otherwise install script will continue automatically.${NC}"
LOLpause

#######################################__Python2 Tools__#######################################################
## Python3 Pip Install Fix
#----------------------
#echo -e "${URED}Fixing Python2 pip issues for install${NC}"
# shellcheck disable=SC2164
if [[ ! -f '/opt/sifter/.github/.py2pip' ]]; then
	cd ~
	wget https://bootstrap.pypa.io/get-pip.py
	sudo python3 get-pip.py
	rm get-pip.py
	touch /opt/sifter/.github/.py2pip
fi
cd /opt
echo -e "${RED}Checking for external dependencies${NC}"
sudo service docker start

#####################
# 1 # Sniffing Bear #
#####################
t1(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SniffingBear${NC}"
	if [[ -d '/opt/SniffingBear' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SniffingBear is already installed"
		echo -e "${NC}"
		cd SniffingBear
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/MrSuicideParrot/SniffingBear.git
		cd SniffingBear
		sudo python2 -m pip install -r requirements.txt
	fi
}
##############
# 2 # Maryam #
##############
t2(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for OSINTGram ${NC}"
	if [[ -d '/opt/Osintgram' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "OSINTGram is already installed"
		echo -e "${NC}"
		cd /opt/Osintgram
		sudo git fetch && sudo git pull &>/dev/null
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt/
		sudo git clone https://github.com/Datalux/Osintgram
		cd Osintgram
		sudo python3 -m venv env
		sudo ./env/bin/python3 -m pip install wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
		sudo mkdir config
	fi
}
###################
# 3 # HoneyCaught #
###################
t3(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for HoneyCaught${NC}"
	if [[ -d '/opt/HoneyCaught' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "HoneyCaught is already installed"
		echo -e "${NC}"
		cd /opt/HoneyCaught
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/aswinmguptha/HoneyCaught.git
		cd HoneyCaught
		sudo python2 -m pip install -r requirements.txt
	fi
}

##################
# 4 # blackwidow #
##################
t4(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Blackwidow${NC}"
	if [[ -d '/root/BlackWidow' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "BlackWidow is already installed"
		echo -e "${NC}"
		cd /root/BlackWidow
		sudo git fetch && sudo git pull &>/dev/null
		sudo bash install.sh
	else
		sudo git clone https://github.com/1N3/BlackWidow.git /root/BlackWidow
		cd /root/BlackWidow
		sudo bash install.sh
	fi
}

#######################
# 5 # WeblogicScanner #
#######################
t5(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for WeblogicScanner ${NC}"
	if [[ -d '/opt/weblogicScanner' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "WeblogicScanner is already installed"
		echo -e "${NC}"
		cd /opt/weblogicScanner
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/0xn0ne/weblogicScanner
		cd /opt/weblogicScanner
		sudo apt install python3-venv
		sudo python3 -m venv venv
		sudo ./venv/bin/python3 -m pip install requests
	fi
}

#################
# 6 # RapidScan #
#################
t6(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Rapidscan${NC}"
	if [[ -f "/usr/sbin/rapidscan.py" ]] || [[ -d "/opt/rapidscan" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Rapidscan is already installed"
		echo -e "${NC}"
		cd /opt/rapidscan
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/rapidscan.git
		cd rapidscan
		sudo chmod +x rapidscan.py rapidscan
		sudo mv rapidscan -t /usr/sbin
	fi
}

####################
# 7 # shodansploit #
####################
t7(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ShodanSploit${NC}"
	if [[ -d "/opt/shodansploit" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ShodanSploit is already installed."
		echo -e "${NC}"
		cd /opt/shodansploit
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/shodansploit/shodansploit.git
		sudo chown $USER:$USER -R shodansploit
	fi
}

#######################################__Python3 Tools__#######################################################
#################
# 8 # Yuki-Chan #
#################
t8(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Yuki-Chan${NC}"
	cd /root
	if [[ -d 'yuki2' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Yuki-Chan is already installed"
		echo -e "${NC}"
		cd yuki2
		sudo git fetch && sudo git pull &>/dev/null
	else
		sudo git clone https://github.com/s1l3nt78/Yuki-Chan-2.git /root/yuki2
		cd /root/yuki2
		sudo pip2 install -r requirements.txt
		sudo apt-get install python3-pip
		sudo apt --fix-broken install -y
		sudo python3 -m pip install -r requirements.txt
		sudo python3 -m pip install wget
		sudo chmod +x Module --recursive
		sudo chown $USER:$USER Module --recursive
		sudo chmod +x wafninja joomscan yuki.sh install-perl-module.sh
		sudo ./install-perl-module.sh
	fi
}

###################
# 9 # ReconSpider #
###################
t9(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ReconSpider${NC}"
	if [[ -d "/opt/reconspider" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ReconSpider is already installed"
		echo -e "${NC}"
		cd /opt/reconspider
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/bhavsec/reconspider.git
		cd reconspider
		sudo python3 setup.py install
	fi
}

#####################
# 10 # Zeus-Scanner #
#####################
t10(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Zeus${NC}"
	if [[ -d '/opt/Zeus-Scanner' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Zeus is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/Ekultek/Zeus-Scanner
		cd Zeus-Scanner
		sudo docker pull s1l3nt78/zeus
		sudo docker run --name zeus -w /app/zeus-scanner s1l3nt78/zeus /bin/bash
	fi
}

#########################################
# 11 # Elevation of Privilege (Post-Ex) #
#########################################
#t11(){
#	echo -e "${W}===========================================================================================${NC}"
#	echo -e "${YLW}Checking for EoP Exploit${NC}"
#	if [[ -d '/opt/CVE-2020-0683' ]]; then
#		echo -e "${ORNG}"
#		figlet -f mini "EoP Exploit is already installed"
#		echo -e "${NC}"
#	else
#		cd /opt/
#		sudo git clone https://github.com/padovah4ck/CVE-2020-0683
#		cd CVE-2020-0683
#		sudo zip EoP.zip bin_MsiExploit -r
#		sudo chmod 777 EoP.zip
#		sudo mkdir /opt/sifter/modules/postex/EoP
#		sudo mv EoP.zip -t /opt/sifter/modules/postex/EoP
#		sudo chown $USER:$USER /op/sifter/modules/postex/EoP --recursive
#	fi
#}

#############
# 12 # Flan #
#############
t12(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Flan${NC}"
	if [[ -d /opt/flan ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Flan is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/flan.git
		cd flan
		sudo make build
		sleep 2
	fi
}

############################
# 13 # AttackSurfaceMapper #   [AttackSurfaceMapper Repo Replacement]
############################
t13(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Attack Surface Mapper${NC}"
	if [[ -d /opt/AttackSurfaceMapper ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ASM is already installed."
		echo -e "${NC}"
		cd /opt/AttackSurfaceMapper
		if [[ ! -d 'venv' ]]; then
			sudo python3 -m venv venv
			source venv/bin/activate
			sudo ./venv/bin/python3 -m pip install wheel
			sudo ./venv/bin/python3 -m pip install -r requirements.txt
		fi
		CHK=$(sudo git fetch && sudo git pull &>/dev/null)
		if [[ ${CHK} == "Already up to date." ]]; then
			sleep 1
		else
			source venv/bin/activate
			sudo ./venv/bin/python3 -m pip install colorama wheel
			sudo ./venv/bin/python3 -m pip install -r requirements.txt
		fi
	else
		cd /opt
		sudo git clone https://github.com/superhedgy/AttackSurfaceMapper
		cd /opt/AttackSurfaceMapper
		sudo python3 -m venv venv
		source venv/bin/activate
		sudo ./venv/bin/python3 -m pip install colorama wheel
		sudo ./venv/bin/python3 -m pip install -r requirements.txt
	fi
}

####################
# 14 # ActiveReign #
####################
t14(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ActiveReign${NC}"
	if [[ -d '/opt/ActiveReign' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ActiveReign is already installed"
		echo -e "${NC}"
		cd /opt/ActiveReign
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/m8r0wn/ActiveReign.git
		cd ActiveReign
		sudo python3 -m pip install -r requirements.txt
		sudo python3 setup.py install
		sleep 3
		echo -e "${RED}[!] ${ORNG}Installing Impacket...${NC}"
		sleep 2
		sudo git clone https://github.com/SecureAuthCorp/impacket
		cd impacket
		sudo python3 setup.py install
		sudo python3 -m pip install prompt-toolkit==3.0.2 impacket
		ar3 db help
	fi
}

#############
# 15 # iSpy #
#############
t15(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for iSpy${NC}"
	if [[ -d '/opt/ispy' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "iSpy is already installed"
		echo -e "${NC}"
		cd /opt/ispy
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/Cyb0r9/ispy.git
		cd ispy
		sudo chmod +x setup.sh
		sudo bash setup.sh
	fi
}

################
# 16 # Sitadel #
################
t16(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Sitadel${NC}"
	if [[ -d '/opt/Sitadel' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Sitadel is already installed"
		echo -e "${NC}"
		cd /opt/Sitadel
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/shenril/Sitadel.git
		cd Sitadel
		sudo python3 -m pip install .
		sudo python3 setup.py install
	fi
}

#################
# 17 # Osmedeus #
#################
t17(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Osmedeus${NC}"
	if [[ -f '/opt/docker-osmedeus/.configured' ]]; then
		cd /opt/docker-osmedeus
		CHKSTP=$(cat .configured)
		if [[ ${CHKSTP} == "DONE" ]]; then
			echo -e "${UPURPLE}Osmedeus is already configured${NC}"
		elif [[ ${CHKSTP} == "HOLD" ]]; then
			echo -e "${UBLUE}Osmedeus will be configured upon first run${NC}"
		else
			sleep 1
		fi
	else
		cd /opt/
		sudo git clone https://github.com/mablanco/docker-osmedeus.git
		sudo touch /opt/docker-osmedeus/.configured
		sudo chown $USER:$USER /opt/docker-osmedeus/.configured
		echo -e "${RED}Osmedeus takes a while to install, you can run the install now or to save time it can be done during the first run"
		echo -e "${W}If you are updating and osmedeus is already installed, please enter ${YLW}d${W} when prompted"
		echo -e "${ORNG}Would you like to do it ${YLW}n${ORNG}ow or ${YLW}l${ORNG}ater?(${YLW}n${ORNG}/${YLW}l${ORNG}/${YLW}d${ORNG})${NC}"
		read INOPT
		if [[ ${INOPT} == "n" ]]; then
			cd docker-osmedeus
			sudo docker build -t mablanco/osmedeus .
			echo "DONE" >> /opt/docker-osmedeus/.configured
		elif [[ ${INOPT} == "d" ]]; then
			echo "DONE" >> /opt/docker-osmedeus/.configured
		else
			echo -e "${W}Leaving Osmedeus install for first run${NC}"
			echo "HOLD" >> /opt/docker-osmedeus/.configured
		fi
	fi
}

################
# 18 # NekoBot #
################
t18(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for NekoBot${NC}"
	if [[ -d '/opt/NekoBotV1' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "NekoBot is already installed"
		echo -e "${NC}"
		cd /opt/NekoBotV1
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/tegal1337/NekoBotV1.git
	fi
}

##############
# 19 # aSnip #
##############
t19(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Installing & Updating aSnip${NC}"
	go get -u github.com/harleo/asnip
}

###############
# 20 # Armory #
###############
t20(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Armory${NC}"
	if [[ -d '/opt/armory' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Armory is already installed"
		echo -e "${NC}"
		cd /opt/armory
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 setup.py install
	else
		cd /opt/
		sudo git clone https://github.com/depthsecurity/armory.git
		cd armory
		sudo python3 setup.py install
		armory
	fi
}

###############
# 21 # Seeker #
###############
t21(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Seeker${NC}"
	if [[ -d '/opt/seeker' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Seeker is already installed"
		echo -e "${NC}"
		cd /opt/seeker
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/thewhiteh4t/seeker.git
		cd seeker
		sudo chmod 777 install.sh
		sudo ./install.sh
		sleep 150
	fi
}

##################
# 22 # AapFinder #
##################
t22(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for AapFinder${NC}"
	if [[ -d '/opt/aapfinder' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "AapFinder is already installed"
		echo -e "${NC}"
		cd /opt/aapfinder
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/Technowlogy-Pushpender/aapfinder.git
		sudo chown $USER:$USER -R aapfinder
		cd aapfinder
		sudo chmod +x aapfinder.py
		sudo touch targets.txt
	fi
}

##################
# 23 # Dark-Star #
##################
t23(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Dark Star${NC}"
	if [[ -d '/opt/Dark-Star' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Dark Star is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/s1l3nt78/Dark-Star.git
	fi
}

#################
# 24 # BruteDUM #
#################
t24(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for BruteDUM${NC}"
	if [[ -d '/opt/BruteDum' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "BruteDUM is already installed"
		echo -e "${NC}"
		cd /opt/BruteDum
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/GitHackTools/BruteDum.git
	fi
}

################
# 25 # OneFind #
################
t25(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for OneFind${NC}"
	if [[ -d '/opt/onedrive_user_enum' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "OneFind is already installed"
		echo -e "${NC}"
		cd /opt/onedrive_user_enum
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/nyxgeek/onedrive_user_enum
	fi
}

###################################
# 26 # SMBGhost Scanner & Exploit #
###################################
t26(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SMBGhost Scanner${NC}"
	if [[ -d '/opt/SMBGhost' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SMBGhost Scanner is already installed"
		echo -e "${NC}"
		cd /opt/SMBGhost
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo apt-get install python3-pip
		sudo git clone https://github.com/ioncodes/SMBGhost.git
		sudo python3 -m pip install hexdump
	fi

	echo -e "${YLW}Checking for SMBGhost Exploit${NC}"
	if [[ -d '/opt/SMBGhost_Exploit' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SMBGhost Exploit is already installed"
		echo -e "${NC}"
		cd /opt/SMBGhost_Exploit
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/Barriuso/SMBGhost_AutomateExploitation SMBGhost_Exploit
		cd SMBGhost_Exploit
		sudo python3 -m pip install -r requirements.txt
	fi
}

###############
# 27 # Vailyn #
###############
t27(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Vailyn ${NC}"
	if [[ -d '/opt/Vailyn' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Vailyn is already installed"
		echo -e "${NC}"
		cd /opt/Vailyn
		sudo git fetch; sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/VainlyStrain/Vailyn
		cd Vailyn
		python3 -m pip install -r requirements.txt --user
	fi
}

################
# 28 # WPForce #
################
t28(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for WPForce${NC}"
	if [[ -d '/opt/WPForce' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "WPForce is already installed"
		echo -e "${NC}"
		cd /opt/WPForce
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/n00py/WPForce.git
	fi
}

###############
# 29 # xShock #
###############
t29(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for xShock${NC}"
	if [[ -d '/opt/XSHOCK' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "xShock is already installed"
		echo -e "${NC}"
		cd /opt/XSHOCK
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/capture0x/XSHOCK.git
		cd XSHOCK
		sudo python3 -m pip install -r requirements.txt
	fi
}

##############
# 30 # VulnX #
##############
t30(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for VulnX${NC}"
	if [[ -d '/opt/vulnx' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "VulnX is already installed"
		echo -e "${NC}"
		cd /opt/vulnx
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/anouarbensaad/vulnx.git
		cd vulnx
		sudo chmod +x install.sh
		sudo ./install.sh
	fi
}

##################
# 31 # XSS-Freak #
##################
t31(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XSS-Freak${NC}"
	if [[ -d '/opt/XSS-Freak' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XSS-Freak is already installed"
		echo -e "${NC}"
		cd /opt/XSS-Freak
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/PR0PH3CY33/XSS-Freak.git
		cd XSS-Freak
		sudo python3 -m pip install -r requirements.txt
	fi
}

##################
# 32 # CredNinja #
##################
t32(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for CredNinja${NC}"
	if [[ -d '/opt/CredNinja' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "CredNinja is already installed"
		echo -e "${NC}"
		cd /opt/CredNinja
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/Raikia/CredNinja.git
	fi
}

################
# 33 # Impulse #
################
t33(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Impulse${NC}"
	if [[ -d '/opt/Impulse' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Impulse is already installed"
		echo -e "${NC}"
		cd /opt/Impulse
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/LimerBoy/Impulse
		cd Impulse
		sudo python3 -m pip install -r requirements.txt
	fi
}

#######################
# 34 # CredsHarvester #
#######################
t34(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for CredsHarvester${NC}"
	if [[ -d '/opt/creds_harvester' ]]; then
		if [[ ! -d '/opt/creds_harvester/pywin' ]]; then
			echo -e "${ORNG}"
			figlet -f mini "CredsHarvester is already installed"
			echo -e "${NC}"
			cd /opt/creds_harvester
			sudo git fetch && sudo git pull &>/dev/null
		else
			cd /opt
			sudo git clone https://github.com/PushpenderIndia/creds_harvester
			sudo chown $USER:$USER -R /opt/creds_harvester
			cd creds_harvester
			sudo zip credH.zip *.py
			sudo chown $USER:$USER credH.zip
		fi
	else
		cd /opt/
		sudo git clone https://github.com/PushpenderIndia/creds_harvester
		sudo chown $USER:$USER -R /opt/creds_harvester
		cd creds_harvester
		sudo zip credH.zip *.py
		sudo chown $USER:$USER credH.zip
	fi
}

############
# 35 # iKy #
############
t35(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for iKy ${NC}"
	if [[ -d '/opt/iKy' ]]; then
		sudo rm -rf /opt/iKy
	fi
	if [[ -d '/opt/iKy-pack' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "iKy is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo wget https://kennbroorg.gitlab.io/ikyweb/file/iKy.zip
		sudo unzip iKy.zip
		sudo mv iKy.zip -t iKy-pack
		CHK=$(which redis-server)
		if [[ ${CHK} != */redis-server ]]; then
			wget http://download.redis.io/redis-stable.tar.gz
			tar xvzf redis-stable.tar.gz
			cd redis-stable
			make
			sudo make install
		fi
	fi
}

##################
# 36 # Dorks-Eye #
##################
t36(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DorksEye${NC}"
	if [[ -d '/opt/dorks-eye' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "DorksEye is already installed"
		echo -e "${NC}"
		cd /opt/dorks-eye
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt/
		sudo git clone https://github.com/BullsEye0/dorks-eye.git
		cd dorks-eye
		sudo python3 -m pip install -r requirements.txt
	fi
}

##################
# 37 # Mentalist #
# ################
menSYS(){
        if [[ ${OSYS} == "l" ]] || [[ ${OSYS} == "linux" ]]; then
                sudo wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip
                sudo chown $USER:$USER *.zip
				unzip Mentalist-v1.0-Linux-x86_64.zip
                rm Mentalist-v1.0-Linux-x86_64.zip
        elif [[ ${OSYS} == "m" ]] || [[ ${OSYS} == "mac" ]]; then
                sudo wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-OSX.zip
                sudo chown $USER:$USER *.zip
				unzip Mentalist-v1.0-OSX.zip
                rm Mentalist-v1.0-OSX.zip
        elif [[ ${OSYS} == "w" ]] || [[ ${OSYS} == "windows" ]]; then
                sudo wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Win.zip
                sudo chown $USER:$USER *.zip
				unzip Mentalist-v1.0-Win.zip
                rm Mentalist-v1.0-Win.zip
        else
                echo -e "${URED}You have selected an invalid option${NC}"
                echo -e "${UPURPLE}Please rerun install script before trying to use Mentalist${NC}"
        fi
}
t37(){
        echo -e "${W}===========================================================================================${NC}"
        echo -e "${YLW}Checking for Mentalist${NC}"
        if [[ -f '/opt/sifter/modules/passtools/Mentalist' ]] || [[ -f '/opt/sifter/modules/passtools/Mentalist.app' ]] || [[ -f '/opt/sifter/modules/passtools/Mentalist.exe' ]]; then
                echo -e "${ORNG}"
                figlet -f mini "Mentalist is already installed"
                echo -e "${NC}"
        else
                cd /opt/sifter/modules/passtools
                echo -e "${YLW}Which system are you installing sifter on? (${ORNG}m${YLW}ac/${ORNG}l${YLW}inux/${ORNG}w${YLW}indows)\n${RED}NOTE: ${UBBLUE}sifter${NC}${W} works best on a Linux Distro${NC}"
                read OSYS
                menSYS
        fi
}

################
# 38 # DCipher #
# ##############
t38(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Installing & updating DCipher${NC}"
	sudo npm install dcipher
	sudo npm install -g dcipher-cli
}

#################
# 39 # HoneyTel #
#################
t39(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for HoneyTel${NC}"
	if [[ -d '/opt/HoneyTel' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "HoneyTel is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/Phype/telnet-iot-honeypot.git HoneyTel
	fi
}

#################
# 40 # XSStrike #
#################
t40(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XSStrike${NC}"
	if [[ -d '/opt/XSStrike' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XSStrike is already installed"
		echo -e "${NC}"
		cd /opt/XSStrike
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/s0md3v/XSStrike
		cd XSStrike
		sudo python3 -m pip install -r requirements.txt
	fi
}

####################################
# 41 # MkCheck (dep::RouterSploit) #
####################################
t41(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for MkCheck${NC}"
	if [[ -d '/opt/MkCheck' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "MkCheck is already installed"
		echo -e "${NC}"
		cd /opt/MkCheck
		sudo git fetch && sudo git pull &>/dev/null
		t42
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/MkCheck.git
		cd MkCheck
		OUT='read LOPT'
		IN='#read LOPT'
		sudo sed -i "s/${OUT}/${IN}/g" setup.sh
		sudo bash setup.sh
	fi
}

############################
# 42 # RouterSploit Update #
############################
t42(){
	echo -e "${YLW}Updating RouterSploit${NC}"
	cd /root/routersploit
	sudo git fetch && sudo git pull &>/dev/null
}

#################
# 43 # DnsTwist #
#################
t43(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DnsTwist${NC}"
	if [[ -d '/opt/dnstwist' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "DnsTwist is already installed"
		echo -e "${NC}"
		cd /opt/dnstwist
		OUT='GeoIP>=1.3.2'
		IN='#GeoIP>=1.3.2'
		sudo sed -i "s/${OUT}/${IN}/g" requirements.txt
		if [[ ! -d 'venv' ]]; then
			sudo python3  -m venv venv
			source venv/bin/activate
			sudo ./venv/bin/pip3 install wheel dnspython
			sudo ./venv/bin/pip3 install -r requirements.txt &>/dev/null
			sudo ./venv/bin/python3 setup.py install &>/dev/null
		fi
		sudo git fetch && sudo git pull &>/dev/null
		source venv/bin/activate
		sudo ./venv/bin/pip3 install wheel dnspython
		sudo ./venv/bin/pip3 install -r requirements.txt &>/dev/null
		sudo ./venv/bin/python3 setup.py install &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/elceef/dnstwist.git
		cd dnstwist
		sudo python3 -m venv venv
		source venv/bin/activate
		sudo ./venv/bin/pip3 install wheel dnspython
		sudo ./venv/bin/pip3 install -r requirements.txt
		sudo ./venv/bin/python3 setup.py install
	fi
}
##################
# 44 # Espionage #
##################
t44(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Espionage${NC}"
	if [[ -d '/opt/Espionage' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Espionage is already installed"
		echo -e "${NC}"
		cd /opt/Espionage
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirments.txt
	else
		cd /opt
		sudo git clone https://www.github.com/josh0xA/Espionage.git
		cd Espionage
		sudo python3 -m pip install -r requirments.txt
	fi
}

########################
# 45 # KatanaFramework #
########################
t45(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for KatanaFramework${NC}"
	if [[ -d '/opt/KatanaFramework' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "KatanaFramework is already installed"
		echo -e "${NC}"
		cd /opt/KatanaFramework
		sudo git fetch && sudo git pull &>/dev/null
		#sudo sh dependencies
		#sudo python2 install
	else
		cd /opt
		sudo git clone https://github.com/PowerScript/KatanaFramework.git
		cd KatanaFramework
		sudo sh dependencies
		sudo python2 install
	fi
}

#################
# 46 # Sherlock #
#################
t46(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Sherlock${NC}"
	if [[ -d '/opt/sherlock' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Sherlock is already installed"
		echo -e "${NC}"
		cd /opt/sherlock
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/sherlock-project/sherlock.git
		cd /opt/sherlock
		sudo python3 -m pip install -r requirements.txt
	fi
}

#################
# 47 # PowerHub #
#################
t47(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for PowerHub${NC}"
	if [[ -d '/opt/PowerHub' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "PowerHub is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/AdrianVollmer/PowerHub.git
		cd /opt/PowerHub
		sudo python3 -m venv env
		source env/bin/activate
		sudo ./env/bin/pip3 install wheel
		sudo ./env/bin/pip3 install -r requirements.txt
	fi
}

#####################
# 48 # theHarvester #
#####################
t48(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for theHarvester${NC}"
	if [[ -d '/opt/theHarvester' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "theHarvester is already installed"
		echo -e "${NC}"
		cd /opt/theHarvester
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/laramies/theHarvester.git
		cd /opt/theHarvester
		sudo python3 -m pip install pipenv
		sudo python3 -m pip install -r requirements/base.txt
	fi
}

###################
# 49 # SpiderFoot #
###################
t49(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Spiderfoot${NC}"
	if [[ -d '/opt/spiderfoot' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Spiderfoot is already installed"
		echo -e "${NC}"
		cd /opt/spiderfoot
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/smicallef/spiderfoot
		sudo chown $USER:$USER -R spiderfoot
		cd spiderfoot
		sudo python3 -m pip install -r requirements.txt
	fi
}

####################
# 50 # Email2Phone #
####################
t50(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for E2P${NC}"
	if [[ -d '/opt/email2phonenumber' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "E2P is already installed"
		echo -e "${NC}"
		cd /opt/email2phonenumber
		sudo git fetch && sudo git pull &>/dev/null
		sudo python -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/martinvigo/email2phonenumber.git
		cd email2phonenumber
		sudo python -m pip install -r requirements.txt
		sudo pip install beautifulsoup4 requests
	fi
}

######################
# 51 # Intrigue-Core #
######################
t51(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Intrigue-Core${NC}"
	if [[ -d '/opt/intrigue-core' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Intrigue-Core is already installed"
		echo -e "${NC}"
		cd /opt/intrigue-core
		sudo git fetch && sudo git pull &>/dev/null
		#sudo python -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/intrigueio/intrigue-core
		cd intrigue-core
		sudo docker build -f Dockerfile-standalone . -t intrigue-core
		echo -e "${ORNG}Your login username and password shown above for Intrigue HTTP${NC}"
 		echo -e "${RED}Please enter the username${NC}"
 		read USER
 		echo -e "${RED}Please enter the password${NC}"
 		read PASS
 		sudo echo "${USER}" >> /opt/Intrigue-Core/Panel_Login.info
 		sudo echo "${PASS}" >> /opt/Intrigue-Core/Panel_Login.info
		echo -e "${UBLUE}Intrigue Login Saved to ${URED}/opt/Intrigue-Core/Panel_Login.info${NC}"
	fi
}

#########################
# 52 # Optiva-Framework #
#########################
t52(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for GHunt${NC}"
	if [[ -d '/opt/GHunt' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "GHunt is already installed"
		echo -e "${NC}"
		cd /opt/GHunt
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/mxrch/GHunt
		cd GHunt
		sudo python3 -m pip install -r requirements.txt
	fi
}

#####################################
# 53 # finDOM-XSS (dep::LinkFinder) #
#####################################
t53(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for finDOM-XSS${NC}"
	if [[ -d '/opt/findom-xss' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "finDOM-XSS is already installed"
		echo -e "${NC}"
		cd /opt/findom-xss
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/dwisiswant0/findom-xss.git
		cd findom-xss
		sudo chmod +x findom-xss.sh
		REM='/home/dw1/Tools/LinkFinder/linkfinder.py'
		INS='/opt/LinkFinder/linkfinder.py'
		sudo sed -i  "s/${REM}/${INS}/g" /opt/findom-xss/findom-xss.sh
		echo -e "${RED}Installing finDOM-XSS Dependancies\n${NC}[${RED}!${NC}] ${YLW}:LinkFinder${NC}"
		cd /opt/
		sudo git clone https://github.com/GerbenJavado/LinkFinder.git
		cd LinkFinder
		sudo python3 setup.py install
		sudo python3 -m pip install -r requirements.txt
	fi
}

##################
# 54 # Responder #
##################
t54(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Responder ${NC}"
	if [[ -d '/opt/Responder' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Responder is already installed"
		echo -e "${NC}"
		cd /opt/Responder
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/SpiderLabs/Responder
	fi
}

########################
# 55 # OSINT-Framework #
########################
t55(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for OSINT-Framework${NC}"
	cd /home/$USER/.local
	if [[ -d 'OSINT-Framework' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "OSINT-Framework is already installed"
		echo -e "${NC}"
		cd /home/$USER/.local/OSINT-Framework
		git fetch && git pull &>/dev/null
		npm install
	else
		cd /home/$USER/.local
		git clone https://github.com/lockfale/OSINT-Framework.git
		cd OSINT-Framework
		npm install
	fi
}

###############
# 56 # UFONet #
###############
t56(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for UFONet${NC}"
	if [[ -d '/opt/ufonet' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "UFONet is already installed"
		echo -e "${NC}"
		cd /opt/ufonet
		sudo git fetch && sudo git pull &>/dev/null
		#sudo python3 setup.py install
	else
		cd /opt
		sudo git clone https://github.com/epsylon/ufonet.git
		cd ufonet
		sudo apt-get install python3-pycurl
		if [[ -f '/opt/sifter/extras/setup.py' ]]; then
			sudo mv /opt/sifter/extras/setup.py /opt/ufonet/setup.py
		fi
		sudo python3 setup.py install
	fi
}

################
# 57 # CardPwn #
################
t57(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for CardPwn${NC}"
	if [[ -d '/opt/CardPwn' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "CardPwn is already installed"
		echo -e "${NC}"
		cd /opt/CardPwn
		sudo git fetch && sudo git pull &>/dev/null
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/itsmehacker/CardPwn.git
		cd CardPwn
		sudo python3 -m pip install -r requirements.txt
	fi
}

################
# 58 # WBruter #
################
t58(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for WBruter${NC}"
	if [[ -d '/opt/WBRUTER' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "WBruter is already installed"
		echo -e "${NC}"
		cd /opt/WBRUTER
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/wuseman/WBRUTER.git
		cd WBRUTER
		sudo chmod +x wbruter
	fi
}

##################
# 59 # Nettacker #
##################
t59(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Nettacker${NC}"
	if [[ -d '/opt/OWASP-Nettacker' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Nettacker is already installed"
		echo -e "${NC}"
		cd /opt/OWASP-Nettacker
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/zdresearch/OWASP-Nettacker
		cd OWASP-Nettacker
		sudo python3 setup.py install
	fi
}

#################
# 60 # Anonsurf #
#################
t60(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Anonsurf${NC}"
	if [[ -d '/opt/kali-anonsurf' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Anonsurf is already installed"
		echo -e "${NC}"
		cd /opt/kali-anonsurf
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/Und3rf10w/kali-anonsurf
		cd kali-anonsurf
		sudo bash installer.sh
	fi
}

##################
# 61 # SubFinder #
##################
t61(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SubFinder${NC}"
	if [[ -d '/opt/subfinder' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SubFinder is already installed"
		echo -e "${NC}"
		cd /opt/subfinder
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/projectdiscovery/subfinder.git
		cd subfinder/v2/cmd/subfinder
		sudo go build .
		sudo mv subfinder /usr/local/sbin/
	fi
}

###############
# 62 # Pulsar #
###############
t62(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Pulsar${NC}"
	if [[ -d '/opt/pulsar' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Pulsar is already installed"
		echo -e "${NC}"
		cd /opt/pulsar
		sudo git fetch && sudo git pull &>/dev/null
		if [[ -f '/opt/sifter/extras/.pulsar.Dockerfile' ]]; then
			sudo mv /opt/sifter/extras/.pulsar.Dockerfile /opt/pulsar/Dockerfile
		fi
	else
		cd /opt
		sudo git clone https://github.com/FooBallZ/pulsar
		if [[ -f '/opt/sifter/extras/.pulsar.Dockerfile' ]]; then
			sudo mv /opt/sifter/extras/.pulsar.Dockerfile /opt/pulsar/Dockerfile
		fi
	fi
}

################
# 63 # reNgine #
################
t63(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for reNgine${NC}"
	if [[ -d '/opt/rengine' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "reNgine is already installed"
		echo -e "${NC}"
		cd /opt/rengine
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/yogeshojha/rengine
		cd rengine
		OUT='3.8'
		IN='3.3'
		sudo sed -i "s/${OUT}/${IN}/g" docker-compose.yml
		sudo nano .env
		sudo make certs
		sudo make build
	fi
}

###############
# 64 # Thoron #
###############
t64(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Thoron ${NC}"
	if [[ -d '/opt/thoron' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Thoron is already installed"
		echo -e "${NC}"
		cd /opt/thoron
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/entynetproject/thoron.git
		cd thoron
		sudo chmod +x install.sh
		sudo ./install.sh
	fi
}

###################
# 65 # Big IP REC #
###################
t65(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for F5 Big IP Remote Code Execution ${NC}"
	if [[ -d '/opt/CVE-2020-5902-Scanner' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Big IP Scanner is already installed"
		echo -e "${NC}"
		cd /opt/CVE-2020-5902-Scanner
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/Technowlogy-Pushpender/CVE-2020-5902-Scanner.git
		cd CVE-2020-5902-Scanner
		sudo python3 -m pip install requests
	fi
}

#################
# 66 # DeadTrap #
#################
t66(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DeadTrap ${NC}"
	if [[ -d '/opt/DeadTrapv2' ]]; then
		#echo -e "${ORNG}"
		#figlet -f mini "DeadTrap is already installed"
		#echo -e "${NC}"
		#cd /opt/DeadTrapv2
		#sudo python3 -m pip install -r requirements.txt &>/dev/null
		#sudo git fetch && sudo git pull &>/dev/null
		cd /opt; sudo rm -rf DeadTrapv2
		sudo git clone https://github.com/legly/DeadTrapv2
		cd DeadTrapv2; sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/legly/DeadTrapv2
		cd DeadTrapv2
		sudo python3 -m pip install -r requirements.txt
	fi
}

##############
# 67 # HFish #
##############
hfSYS(){
	if [[ ${OSYS} == "l" ]] || [[ ${OSYS} == "linux" ]]; then
            sudo wget https://github.com/hacklcx/HFish/releases/download/0.6.5/HFish-0.6.5-linux-amd64.tar.gz
            sudo tar -xzvf HFish-0.6.5-linux-amd64.tar.gz
            sudo rm HFish-0.6.5-linux-amd64.tar.gz
			sudo chown $USER:$USER HFish-0.6.5-linux-amd64
			sudo mv HFish-0.6.5-linux-amd64/* HFish
			sudo rm -rf HFish-0.6.5-linux-amd64
    elif [[ ${OSYS} == "m" ]] || [[ ${OSYS} == "mac" ]]; then
            sudo wget https://github.com/hacklcx/HFish/releases/download/0.6.5/HFish-0.6.5-darwin-amd64.tar.gz
            sudo tar -xzvf HFish-0.6.5-darwin-amd64.tar.gz
            sudo rm HFish-0.6.5-darwin-amd64.tar.gz
			sudo chown $USER:$USER HFish-0.6.5-darwin-amd64
			sudo mv HFish-0.6.5-darwin-amd64/* -t HFish
			sudo rm -rf HFish-0.6.5-darwin-amd64
    elif [[ ${OSYS} == "w" ]] || [[ ${OSYS} == "windows" ]]; then
            sudo wget https://github.com/hacklcx/HFish/releases/download/0.6.5/HFish-0.6.5-win-amd64.tar.gz
            sudo tar -xzvf HFish-0.6.5-win-amd64.tar.gz
            sudo rm HFish-0.6.5-win-amd64.tar.gz
			sudo chown $USER:$USER HFish-0.6.5-win-amd64.tar.gz
			sudo mv HFish-0.6.5-win-amd64/* -t HFish
			sudo rm -rf HFish-0.6.5-win-amd64
    else
            echo -e "${URED}OS not detected! ${NC}"
            echo -e "${UPURPLE}Please select your OS: (l/m/w)${NC}"
			read OSYS
			hfSYS
    fi
}
t67(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for HFish ${NC}"
	if [[ -d '/opt/HFish' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "HFish is already installed"
		echo -e "${NC}"
		cd /opt/HFish
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/hacklcx/HFish.git
		sudo chown $USER:$USER -R HFish
		echo -e "\n[${RED}!${NC}] ${ORNG}Pulling distro specific files... Please wait${NC}\n"
		sleep 5
		hfSYS
	fi
}
#################
# 68 # SubDover #
#################
t68(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SubDover ${NC}"
	if [[ -d '/opt/subdover' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SubDover is already installed"
		echo -e "${NC}"
		cd /opt/subdover
		sudo git fetch && sudo git pull &>/dev/null
		source env/bin/activate
		sudo ./env/bin/python3 -m pip install wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/Technowlogy-Pushpender/subdover
		cd subdover
		sudo python3 -m venv env
		source env/bin/activate
		sudo ./env/bin/python3 -m pip install wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	fi
}

##################
# 69 # Katana-DS #
##################
t69(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Katana-DS ${NC}"
	if [[ -d '/opt/Katana' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Katana-DS is already installed"
		echo -e "${NC}"
		cd /opt/Katana
		sudo git fetch && sudo git pull &>/dev/null
		source env/bin/activate
		sudo ./env/bin/python3 -m pip install wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/adnane-X-tebbaa/Katana
		cd Katana
		sudo python3 -m venv env
		source env/bin/activate
		sudo ./env/bin/python3 -m pip install wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	fi
}

######################
# 70 # Threat Dragon #
######################
t70(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Threat Dragon ${NC}"
	if [[ -d '/opt/owasp-threat-dragon-desktop' ]]; then
		sudo rm -rf /opt/owasp-threat-dragon-desktop
	fi
	cd /home/$USER
	if [[ -d ".threat_dragon" ]]; then
		sudo mv .threat_dragon -t .local
	fi
	cd ~/.local
	if [[ -d '.threat_dragon' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Threat Dragon is already installed"
		echo -e "${NC}"
		#cd .threat_dragon
		#sudo git fetch && sudo git pull &>/dev/null
		#sudo rm -rf node_modules
		#sudo npm install
	else
		cd
		cd .local
		sudo git clone https://github.com/mike-goodwin/owasp-threat-dragon-desktop .threat_dragon
		cd .threat_dragon
		sudo npm install
	fi
}

###################
# 71 # WhiteWidow #
###################
t71(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for WhiteWidow ${NC}"
	if [[ -d '/opt/whitewidow' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "WhiteWidow is already installed"
		echo -e "${NC}"
		cd /opt/whitewidow
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/WhitewidowScanner/whitewidow.git
		cd whitewidow
		sudo chown $USER:$USER whitewidow --recursive
		bundle install
	fi
}

######################
# 72 # v3n0m-Scanner #
######################
t72(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for V3n0m-Scanner ${NC}"
	if [[ -d '/opt/V3n0M-Scanner' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "V3n0m-Scanner is already installed"
		echo -e "${NC}"
		cd /opt/V3n0M-Scanner
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/v3n0m-Scanner/V3n0M-Scanner
		cd V3n0M-Scanner
		sudo wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
		sudo tar xvf Python-3.6.8.tar.xz
		cd Python-3.6.8
		sudo ./configure
		sudo make altinstall
		sudo python3.6 -m pip install virtualenv wheel
		sudo python3.6 -m venv env
		source env/bin/activate
		sudo ./env/bin/python3.6 -m pip install wheel aiohttp
		sudo ./env/bin/python3.6 setup.py install
	fi
}

################
# 73 # DCipher #
# ##############
t73(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Installing & updating Ciphey ${NC}"
	sudo python3 -m pip install --upgrade ciphey
}

###################
# 74 # XSS-Loader #
###################
t74(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XSS-Loader ${NC}"
	if [[ -d '/opt/XSS-LOADER' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XSS-Loader is already installed"
		echo -e "${NC}"
		cd /opt/XSS-LOADER
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/capture0x/XSS-LOADER
		cd XSS-LOADER
		sudo python3 -m pip install -r requirements.txt
	fi
}

###############
# 75 # WebMap #
###############
t75(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Pulling Newest WebMap image ${NC}"
	sudo docker pull reborntc/webmap
	if [[ ! -d '/opt/WebMap' ]]; then
		cd /opt
		sudo git clone https://github.com/DeadNumbers/WebMap
		if [[ ! -d '/tmp/webmap' ]]; then
			sudo mkdir /tmp/webmap
		fi
	fi
}

##################
# 76 # PHPSploit #
##################
t76(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for PHPSploit ${NC}"
	if [[ -d '/opt/phpsploit' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "PHPSploit is already installed"
		echo -e "${NC}"
		cd /opt/phpsploit
		sudo git fetch && sudo git pull &>/dev/null
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/nil0x42/phpsploit
		cd phpsploit/
		sudo python3 -m venv env
		sudo ./env/bin/python3 -m pip install setuptools wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	fi
}

####################
# 77 # DroneSploit #
###################
t77(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DroneSploit ${NC}"
	if [[ -d '/opt/dronesploit' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "DroneSploit is already installed"
		echo -e "${NC}"
		cd /opt/dronesploit
		sudo git fetch && sudo git pull &>/dev/null
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		echo -e "${ORNG}DroneSploit is an optional tool\n${W}Would you like to install it?${NC}"
		read DSANS
		if [[ ${DSANS} == "y" ]]; then
			sudo git clone https://github.com/dhondta/dronesploit
			cd dronesploit/
			sudo python3 -m venv env
			sudo ./env/bin/python3 -m pip install setuptools wheel
			sudo ./env/bin/python3 -m pip install -r requirements.txt
			sudo ./env/bin/python3 setup.py install
		fi
	fi
}

####################
# 78 # XAttacker.3 #
####################
t78(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XAttacker${NC}"
	if [[ -d '/opt/XAttacker-3.0' ]]; then
		sudo rm -rf /opt/XAttacker-3.0
	fi
	if [[ -d '/opt/XAttacker' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XAttacker is already installed"
		echo -e "${NC}"
		cd /opt/XAttacker
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/Moham3dRiahi/XAttacker
	fi
}

#####################
# 79 # Mitre Attack #
#####################
t79(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Mitre-Attack ${NC}"
	if [[ -d '/opt/attack-website' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Mitre-Attack is already installed"
		echo -e "${NC}"
		cd /opt/attack-website
		sudo git fetch && sudo git pull &>/dev/null
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/mitre-attack/attack-website
		cd attack-website
		sudo python3 -m venv env
		sudo ./env/bin/python3 -m pip install wheel setuptools
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	fi
}

###############
# 80 # mosint #
###############
t80(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for mosint ${NC}"
	if [[ -d '/opt/mosint' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "mosint is already installed"
		echo -e "${NC}"
		cd /opt/mosint
		sudo git fetch && sudo git pull &>/dev/null
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/alpkeskin/mosint
		cd mosint
		sudo python3 -m venv env
		sudo ./env/bin/python3 -m pip install wheel setuptools
		sudo ./env/bin/python3 -m pip install -r requirements.txt
		sudo ./env/bin/python3 -m pip install urllib3==1.25.9 beautifulsoup4==4.9.1 certifi==2020.6.20 soupsieve==2.0.1
	fi
}

###############
# 81 # TorBot #
###############
t81(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for TorBot ${NC}"
	if [[ -d '/opt/TorBot' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "TorBot is already installed"
		echo -e "${NC}"
		cd /opt/TorBot
		sudo git fetch && sudo git pull &>/dev/null
	else
		cd /opt
		sudo git clone https://github.com/DedSecInside/TorBot.git
		cd TorBot
		sudo service tor start
		sudo python3 -m pip install -r requirements.txt
		sudo bash install.sh
		cd docker
		sudo docker build -t dedsecinside/torbot .
	fi
}
###################
# 82 # TacticalEK #
###################
t82(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for TacticalEK ${NC}"
	if [[ -d '/opt/tactical-exploitation' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "TacticalEK is already installed"
		echo -e "${NC}"
		cd /opt/tactical-exploitation
		sudo git fetch; sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/0xdea/tactical-exploitation
	fi
}

#####################
# 83 # ScriptHunter #
#####################
t83(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ScriptHunter ${NC}"
	if [[ -d '/opt/scripthunter' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ScriptHunter is already installed"
		echo -e "${NC}"
		cd /opt/scripthunter
		sudo git fetch; sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/robre/scripthunter.git
	fi
}

################
# 84 # EMagnet #
################
t84(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Emagnet ${NC}"
	if [[ -d '/opt/Emagnet' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Emagnet is already installed"
		echo -e "${NC}"
		cd /opt/Emagnet
		sudo git fetch; sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/wuseman/Emagnet
		sudo chown $USER:$USER -R Emagnet
	fi
}

#################
# 85 # Blacknet #
#################
t85(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Blacknet ${NC}"
	if [[ -d '/opt/blacknet' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Blacknet is already installed"
		echo -e "${NC}"
		cd /opt/blacknet
		sudo git fetch; sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/blvckteam/blacknet
		sudo chown $USER:$USER -R blacket
		cd blacknet
		sudo python3 -m venv env
		sudo ./env/bin/python3 -m pip install setuptools wheel
		sudo ./env/bin/python3 -m pip install -r requirements.txt
	fi
}
#######################################################################################################################################
####################
# Ext # Plugin Installation #
####################
plugExt(){
	##
	# Check for Plugins
	##
	PD='/opt/sifter/plugins'
	##
	# C
	##
	if [[ -f '/opt/sifter/plugins/cPlug/plug-C.sh' ]]; then
		cd ${PD}/cPlug; bash plug-C.sh
	else
		rm -rf ${PD}/cPlug
	fi
	##
	# F
	##
	if [[ -f '/opt/sifter/plugins/fPlug/plug-F.sh' ]]; then
		cd ${PD}/fPlug; bash plug-F.sh
	else
		rm -rf ${PD}/fPlug
	fi
	##
	# G
	##
	if [[ -f '/opt/sifter/plugins/gPlug/plug-G.sh' ]]; then
		cd ${PD}/gPlug; bash plug-G.sh
	else
		rm -rf ${PD}/gPlug
	fi
	##
	# M
	##
	if [[ -f '/opt/sifter/plugins/cPlug/plug-M.sh' ]]; then
		cd ${PD}/mPlug; bash plug-M.sh
	else
		rm -rf ${PD}/mPlug
	fi
}

##########
#  Misc  #
##########
misc(){
	###
	# BFAC Removal
	###
	if [[ -d '/opt/bfac' ]]; then
		sudo rm -rf /opt/bfac
	fi
}

############################################################################################################
#										########################## 										   #
#										#   Tool Setup Runtime   #										   #
#										##########################										   #
############################################################################################################
t1							# SniffingBear
t2							# OsintGram
t3							# HoneyCaught
t4							# BlackWidow
t5							# Weblogic
t6							# RapidScan
t7							# ShodanSploit
t8							# Yuki-Chan
t9							# ReconSpider
t10							# Zeus
#t11								# EoP
t12							# Flan
t13							# AttackSurfaceMapper
t14							# ActiveReign
t15							# iSpy
t16							# Sitadel
t17							# Osmedeus
t18							# NekoBot
t19							# aSnip
t20							# Armory
t21							# Seeker
t22							# AapFinder
t23							# Dark-Star
t24							# BruteDUM
t25							# OneFind
t26							# SMBGhost
t27							# Vailyn
t28							# WPForce
t29							# XSHOCK
t30							# VulnX
t31							# XSS-Freak
t32							# CredNinja
t33							# Impulse
t34							# CredHarvester
t35							# iKy
t36							# Dork-Eye
t37							# Mentalist
t38							# dCipher
t39							# Honey-Tel
t40							# XSS-Strike
t41							# MkCheck
#t42								# RouterSploit (done::MkCheck)
t43							# DnsTwist
t44							# Espionage
t45							# KatanaFramework
t46							# Sherlock
t47							# PowerHub
t48							# theHarvester
t49							# Spiderfoot
t50							# Email2Phone
t51							# Intrigue-Core
t52							# GHunt
t53							# finDOM-XSS
t54							# Responder
t55							# OSINT-Framework
t56							# UFONet
t57							# CardPwn
t58							# WBruter
t59							# Netattacker
t60							# Anonsurf
t61							# SubFinder
t62							# Pulsar
t63							# reNgine
t64							# Thoron
t65							# F5 Big IP scanner
t66							# DeadTrap
t67							# HFish
t68							# SubDover
t69							# Katana-DS
t70							# Threat Dragon
t71							# WhiteWidow
t72							# V3n0M-Scanner
t73							# Ciphey
t74							# XSS-Loader
t75							# WebMap
t76							# PHPSploit
t77							# DroneSploit
t78							# XAttacker-3
t79							# Mitre-Attack
t80							# mosint
t81							# TorBot
t82							# TacticalEK
t83							# ScriptHunter
#########################################---------------
plugExt						# Plugin Extentions
#########################################---------------
misc							# Removals
#########################################---------------
########################################################
##  Move Sifter executable to local path (/usr/sbin)  ##
########################################################
cd /opt
sudo chown $USER:$USER /opt/sifter --recursive
chmod +x /opt/sifter --recursive
chmod +x /opt/sifter/files/info/info.sh
cd sifter
sudo cp sifter -t /usr/sbin
sudo chown $USER:$USER /usr/sbin/sifter
chmod +x /usr/sbin/sifter
echo -e "${RED}==========================================================================================${NC}"
echo ""
sifter -h
echo ""
echo -e "${RED}==========================================================================================${NC}"
echo -e "${W}Please edit ${LP}API keys ${W}in ${UBLUE}/opt/AttackSurfaceMapper/keylist.asm${NC}\n${W}for a better range of scan results"
echo -e "${RED}==========================================================================================${NC}"
######################################################################################################
######################               VGhlIERlYWQgQnVubnkgQ2x1Yg==             ########################
######################################################################################################
echo -e "${YLW}############################"                                             ########################
echo -e "${YLW}# ${ORNG}Incoming Version  :${LP} 12.3 ${YLW}#${NC}"                          ##    VERSION INFO    ##
#echo -e "${YLW}# ${ORNG}Incoming Revision : ${LP}r3 ${YLW}#"                                       ##    UPDATE CHECK    ##
echo -e "${YLW}############################${NC}"                                         ########################
