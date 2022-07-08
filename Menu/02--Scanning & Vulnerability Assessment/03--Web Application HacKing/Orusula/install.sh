#!/bin/bash

red="\e[0;31m"
blue="\e[0;94m"
green="\e[0;32m"
off="\e[0m"
# Android.Termux.Orusula

function banner(){
    echo -e "===== ORUSULA INSTALL ====="
}

function termuxOS() {
    echo -e "$red [$green+$red]$off Installing Python ...";
    pkg install python
    echo -e "$red [$green+$red]$off Installing Packages ...";
    pip install -r ./requirements.txt
    echo -e "$red [$green+$red]$off Checking directories ..."
    if [ -e "Orusula.py" ]; then
        echo -e "$red [$green+$red]$off A previous installation was found Do you want to replace it? [Y/n]: "
        read replace
        if [ "$replace" == "y" ] || [ "$replace" == "Y" ] || [ -z "$replace" ]; then
            echo "";
        else
            echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
            echo -e "$red [$green✘$red]$off Installation Failed!!";
            exit
        fi
    fi
    echo -e "$red [$green+$red]$off Installing ...";
    chmod +x update.sh
    bash update.sh
    if [ -d "Orusula.py" ] ;
    then
        echo -e "$red [$green+$red]$off Tool successfully installed and will start in 5s!";
        echo -e "$red [$green+$red]$off You can execute tool by typing Orusula"
        sleep 5;
        exit
    else
        echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
        exit
    fi
    exit
}

# Orusula install function for debian operating system. linux.
function debianOS(){
    echo -e "$red [$green+$red]$off Installing python3... ";
    sudo apt-get install -y python3
    pip install -r ./requirements.txt
    echo -e "$red [$green+$red]$off Checking directories... "
    echo -e "$red [$green+$red]$off Installing ...";
    sudo chmod +x update.sh
    bash update.sh
    if [ -d "/usr/share/Orusula" ] ;
    then
        echo -e "$red [$green+$red]$off Tool Successfully Installed And Will Start In 5s!";
        echo -e "$red [$green+$red]$off You can execute tool by typing Orusula"
        sleep 5;
        Orusula
    else
        echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
        exit
    fi
}

#main
if [ -d "/data/data/com.termux/files/usr/" ]; then
    banner
    echo -e "$red [$green+$red]$off Orusula Will Be Installed In Your System";
    termuxOS
    exit
elif [ -d "/usr/bin/" ];then
    banner
    echo -e "$red [$green+$red]$off Orusula Will Be Installed In Your System";
    debianOS
else
    echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi
