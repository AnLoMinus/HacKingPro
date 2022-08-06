#!/bin/bash
file_dir="$(pwd)"
BLINK='\e[5m'
BOLD='\e[1m'
GREEN='\e[92m'
YELLOW='\e[93m'
CYAN='\e[96m'
RESET='\e[0m'
RED='\e[31m'
UNDERLINE='\e[4m'
PURPLE='\e[95m'

logo(){
	echo -e """ ${BOLD}${YELLOW} 	 
					       version: 1.0 ${RESET} ${BOLD}${RED}	          
		  ▄▄                          ▗▄▄▄▖          
		 █▀▀▌                         ▐▛▀▀▘          
		▐▛    ▟██▖▗▟██▖▐▙█▙  ▟█▙  █▟█▌▐▌   ▝█ █▌ ▟█▙ 
		▐▌    ▘▄▟▌▐▙▄▖▘▐▛ ▜▌▐▙▄▟▌ █▘  ▐███  █▖█ ▐▙▄▟▌
		▐▙   ▗█▀▜▌ ▀▀█▖▐▌ ▐▌▐▛▀▀▘ █   ▐▌    ▐█▛ ▐▛▀▀▘
		 █▄▄▌▐▙▄█▌▐▄▄▟▌▐█▄█▘▝█▄▄▌ █   ▐▙▄▄▖  █▌ ▝█▄▄▌
		  ▀▀  ▀▀▝▘ ▀▀▀ ▐▌▀▘  ▝▀▀  ▀   ▝▀▀▀▘  █   ▝▀▀ 
			       ▐▌                    █▌ 
             	${RESET}${PURPLE}${UNDERLINE}Devloped By -AbhisheK${RESET}
     	"""
}
logo

system-update(){
	sudo apt-get -y update
	sudo apt-get -y upgrade
}
#Tools_dir.
tools-location(){
	mkdir $HOME/CasperEye
	mkdir $HOME/CasperEye/tools
}

tools-location
TOOLS_DIR="$HOME/CasperEye/tools"

#Checking is tool already Installed or Not..!!
check_command () {
    	command -v "$1" >/dev/null
}

#no-1 Docker
installDocker() {
	    sudo apt-get update
	    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common vim git python-pip build-essential libbz2-dev zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev ntp
	    sudo systemctl enable ntp
	    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	    sudo add-apt-repository -y ppa:deadsnakes/ppa
	    sudo apt-get update
	    sudo pip install --upgrade pip
	    sudo pip install docker-compose
	    sudo apt-get -y install docker-ce docker-ce-cli containerd.io
}

installPython(){
	    PYTHON_VERSION="3.7.6"
	    PYTHON_FILE="Python-$PYTHON_VERSION.tgz"
	    wget https://www.python.org/ftp/python/$PYTHON_VERSION/$PYTHON_FILE
	    tar -xvf $PYTHON_FILE
	    rm -rf $PYTHON_FILE
	    cd Python-$PYTHON_VERSION
	    ./configure
	    make -j 1
	    sudo make altinstall
	    cd ..
	    sudo rm -rf Python-$PYTHON_VERSION
}

installRuby(){
	    wget https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0.tar.gz
	    gunzip -d ruby-2.7.0.tar.gz
	    tar -xvf ruby-2.7.0.tar
	    cd ruby-2.7.0/
	    ./configure
	    make
	    sudo make install
	    cd ..
	    rm -rf ruby-2.7.0
}

ProtonVPN(){
		#You Can Signup : https://account.protonvpn.com/signup/account
		echo -e "${BOLD}${GREEN}[+] Installing ProtonVPN...${RESET}"
	    	sudo apt install -y openvpn dialog python3-pip python3-setuptools
		sudo pip3 install protonvpn-cli
		echo -e "${BOLD}${GREEN}[*] Setting Up ProtonVPN...${RESET}"
		sudo protonvpn init
}

install-go(){
#install go
if [[ -z "$GOPATH" ]];then
	echo "It looks like go is not installed In Your Machine, Would you like to install it?"
	PS3="Please select an option : "
	choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

		echo "Installing Golang"
		wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
		sudo tar -xvf go1.13.4.linux-amd64.tar.gz
		sudo mv go /usr/local
		export GOROOT=/usr/local/go
		export GOPATH=$HOME/go
		export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
		echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
		echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
		echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
		source ~/.bash_profile
		sleep 1
		break
		;;
	no)
		echo "Please install go and rerun this script"
		echo "Aborting installation..."
		exit 1
		;;
	esac	
done
fi
}

otherlib() {
	sudo apt-get install -y libcurl4-openssl-dev
	sudo apt-get install -y libssl-dev
	sudo apt-get install -y jq
	sudo apt-get install -y ruby-full
	sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
	sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
	sudo apt-get install -y python-setuptools
	sudo apt-get install -y libldns-dev
	sudo apt-get install -y python3-pip
	sudo apt-get install -y python-pip
	sudo apt-get install -y python-dnspython
	sudo apt-get install -y git
	sudo apt-get install -y rename
	sudo apt-get install -y xargs

}

my-alias(){
#create copy of bashrc
	sudo cp ~/.bashrc ~/.bashrc_copy
	mkdir $TOOLS_DIR/my-own-shortcut
	touch $TOOLS_DIR/my-own-shortcut/shortcut.sh
	sudo echo "source $TOOLS_DIR/my-own-shortcut/shortcut.sh" >> ~/.bashrc 
	source ~/.bashrc
}
my-alias


recon-tool(){
	echo "Don't forget to set up AWS credentials!"
	apt install -y awscli

#--------GoLang Recon tool---------#

echo -e "${BOLD}${YELLOW}[~] Installing GoLang Recon tool${RESET}"

if ! check_command amass; then
    export GO111MODULE=on
    echo -e "${BOLD}${GREEN}[+] Installing amass...${RESET}"
    go get -u github.com/OWASP/Amass/v3/...
else
    echo -e "${BOLD}${GREEN}[+] Installing amass...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command subfinder; then
    echo -e "${BOLD}${GREEN}[+] Installing subfinder...${RESET}"
    go get github.com/projectdiscovery/subfinder/cmd/subfinder
else
    echo -e "${BOLD}${GREEN}[+] Installing subfinder...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command gobuster; then
    echo -e "${BOLD}${GREEN}[+] Installing gobuster...${RESET}"
    go get github.com/OJ/gobuster
else
    echo -e "${BOLD}${GREEN}[+] Installing gobuster...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi


if ! check_command dig; then
    echo -e "${BOLD}${GREEN}[+] Installing dig Command...${RESET}"
    sudo apt install dnsutils
else
    echo -e "${BOLD}${GREEN}[+] Installing Dig...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi


#TOMNOMNOM TOOLS--

if ! check_command httprobe; then
    echo -e "${BOLD}${GREEN}[+] Installing httprobe...${RESET}"
    go get -u github.com/tomnomnom/httprobe
else
    echo -e "${BOLD}${GREEN}[+] Installing httprobe...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command anti-burl; then
    echo -e "${BOLD}${GREEN}[+] Installing anti-burl...${RESET}"
    #Broken Url Finder
    go get -u github.com/tomnomnom/hacks/anti-burl 
else
    echo -e "${BOLD}${GREEN}[+] Installing anti-burl...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command burl; then
    echo -e "${BOLD}${GREEN}[+] Installing burl...${RESET}"
    #Broken Url Finder
    go get github.com/tomnomnom/burl
else
    echo -e "${BOLD}${GREEN}[+] Installing burl...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command waybackurls; then
    echo -e "${BOLD}${GREEN}[+] Installing waybackurls...${RESET}"
    go get -u github.com/tomnomnom/waybackurls
else
    echo -e "${BOLD}${GREEN}[+] Installing waybackurls...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command assetfinder; then
    echo -e "${BOLD}${GREEN}[+] Installing assetfinder...${RESET}"
    go get -u github.com/tomnomnom/assetfinder
else
    echo -e "${BOLD}${GREEN}[+] Installing assetfinder...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

#install aquatone
if ! check_command aquatone; then
	echo -e "${BOLD}${GREEN}[+] Installing aquatone...${RESET}"
	echo "Installing Aquatone"
	go get github.com/michenriksen/aquatone
	gem install aquatone
	echo "done"
fi

#install Subbrute
if [ ! -d "$TOOLS_DIR/subbrute" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing subbrute to $TOOLS_DIR/subbrute...${RESET}"
    git clone https://github.com/TheRook/subbrute $TOOLS_DIR/subbrute
else
    echo -e "${BOLD}${GREEN}[+] Installing subbrute to $TOOLS_DIR/subbrute...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi


#------------------------ Others tools -------------------------#


#install chromium
if ! check_command chromium; then
	echo -e "${BOLD}${GREEN}[+] Installing Chromium...${RESET}"
	echo "Installing chromium"
	sudo snap install chromium
	echo "done"
fi

if [ ! -d "$TOOLS_DIR/JSParser" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing JSParser to $TOOLS_DIR/JSParser...${RESET}"
    git clone https://github.com/nahamsec/JSParser $TOOLS_DIR/JSParser
    sudo python setup.py install
else
    echo -e "${BOLD}${GREEN}[+] Installing JSParser to $TOOLS_DIR/JSParser...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if [ ! -d "$TOOLS_DIR/Sublist3r" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing Sublist3r to $TOOLS_DIR/Sublist3r...${RESET}"
    git clone https://github.com/aboul3la/Sublist3r $TOOLS_DIR/Sublist3r
    pip install -r requirements.txt
else
    echo -e "${BOLD}${GREEN}[+] Installing Sublist3r to $TOOLS_DIR/Sublist3r...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi
	

if [ ! -d "$TOOLS_DIR/knock.py" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing knock.py to $TOOLS_DIR/knock.py...${RESET}"
   	git clone https://github.com/guelfoweb/knock $TOOLS_DIR/knock
   	python $TOOLS_DIR/knock/setup.py install
   	pip install -r $TOOLS_DIR/knock/equirements.txt
else
    echo -e "${BOLD}${GREEN}[+] Installing knock.py to $TOOLS_DIR/knock.py...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

#Install rustScan for Fast Port Scanning

if ! check_command rustscan; then
    echo -e "${BOLD}${GREEN}[+] Installing rustscan...${RESET}"
    docker run -it --rm --name rustscan cmnatic/rustscan:debian-buster rustscan 
    echo "alias rustscan='sudo docker run -it --rm --name rustscan cmnatic/rustscan:debian-buster rustscan $1'" >> ~/.bashrc
else
    echo -e "${BOLD}${GREEN}[+] Installing rustscan...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

#---------------Nmap Installation If Apt is not found then using make command-------------#

if ! check_command nmap; then
    echo -e "${BOLD}${GREEN}[+] Installing nmap...${RESET}"
    sudo apt-get install -y nmap
else
    echo -e "${BOLD}${GREEN}[+] Installing nmap...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if ! check_command nmap; then

    echo -e "${BOLD}${GREEN}[+] Installing nmap...${RESET}"
    git clone https://github.com/nmap/nmap.git
    cd nmap
    echo -e "${CYAN}[!] Configuring nmap...${RESET}"
    sh ./configure
    echo -e "${CYAN}[!] Running make nmap...${RESET}"
    make
    echo -e "${CYAN}[!] Runing make install nmap...${RESET}"
    sudo make install
    cd ..
    rm -rf nmap
else
    echo -e "${BOLD}${GREEN}[+] Installing nmap...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

#---------------------------------------------------------------------------#

if [ ! -d "$TOOLS_DIR/asnlookup" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing asnlookup to $TOOLS_DIR/asnlookup...${RESET}"
   	git clone https://github.com/yassineaboukir/asnlookup $TOOLS_DIR/asnlookup
   	cd $TOOLS_DIR/asnlooku*
	pip install -r requirements.txt
else
    echo -e "${BOLD}${GREEN}[+] Installing asnlookup to $TOOLS_DIR/asnlookup...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if [ ! -d "$TOOLS_DIR/crtndstry" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing crtndstry to $TOOLS_DIR/crtndstry...${RESET}"
   	git clone https://github.com/nahamsec/crtndstry $TOOLS_DIR/crtndstry
else
    echo -e "${BOLD}${GREEN}[+] Installing crtndstry to $TOOLS_DIR/crtndstry...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi

if [ ! -d "$TOOLS_DIR/dirsearch" ]; then
    echo -e "${BOLD}${GREEN}[+] Installing dirsearch...${RESET}"
    git clone https://github.com/maurosoria/dirsearch.git $TOOLS_DIR/dirsearch
else
    echo -e "${BOLD}${GREEN}[+] Installing dirsearch...${YELLOW}[ALREADY INSTALLED]${RESET}"
fi
}

Symbolic_link(){
declare -a link=("amass" ,"subfinder" ,"gobuster" ,"waybackurls" ,"httprobe" ,"anti-burl" ,"burl" ,"assetfinder" ,"aquatone")
	for i in "${link[@]}"
	do
		sudo ln -s $HOME/go/bin/$i /usr/bin/$i
	done		
	
	#Create run.sh bash script for subbrute
	echo """#!/bin/bash
	  sudo python3 $HOME/CasperEye/tools/subbrute/subbrute.py -p $1
	 $1 """ > $HOME/CasperEye/tools/subbrute/subbrute.sh
	 chmod +x $HOME/CasperEye/tools/subbrute/subbrute.sh
	 sudo ln -s $HOME/CasperEye/tools/subbrute/./subbrute.sh /usr/bin/subbrute

	#Create run.sh bash script for Sublist3r
	echo """#!/bin/bash
	 python3 $HOME/CasperEye/tools/Sublist3r/sublist3r.py -d $1 -r $HOME/CasperEye/tools/subbrute/resolvers.txt
	 $1 """ > $HOME/CasperEye/tools/Sublist3r/sublist3r.sh
	 chmod +x $HOME/CasperEye/tools/Sublist3r/sublist3r.sh
	 sudo ln -s $HOME/CasperEye/tools/Sublist3r/./sublist3r.sh /usr/bin/sublist3r

}

RapUp(){
	#Creating Shortcut for CasperEye
	 sudo ln -s $file_dir/./casperEye.sh /usr/bin/casperEye 
}

#Installing All recon tools..
system-update
recon-tool	   
installDocker	   
installPython	   
installRuby            
ProtonVPN	 	   
otherlib		   
install-go
Symbolic_link
RapUp

echo -e "${BOLD}${GREEN} Do You Wanna Set-Up your Api Keys.?${RESET}\n"
read -p "yes / no" choice
if [[ "$choice" == "yes" ||  "$choice" == "y" ]]
then
	nano set-api-keys.sh
	echo -e "${BOLD}${YELLOW}--[ All Bug Bounty tools installation complete ]-- ${RESET}"
else
	echo -e "${BOLD}${YELLOW}--[ All Bug Bounty tools installation complete ]-- ${RESET}"
fi
