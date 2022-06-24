#!/bin/bash

red = "\e[0;31m"
green = "\e[0;32m"
off = "\e[0m"

function banner(){
    echo -e "===== ORUSULA INSTALL ====="
}
function termuxOS() {
  echo -e "$red [$green+$red]$Cleaning Up Old Directories ...";
  echo -e "$red [$green+$red]$off Installing ...";
  git pull;
  if [[ -d "Orusula.py" ]]; then
    echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
    echo -e "$red [$green+$red]$off You can execute tool by typing Orusula"
    sleep 5;
    python Orusula.py
  else
    echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
  fi 
}

function debianOS() {
  echo -e "$red [$green+$red]$off Cleaning Up Old Directories ...";
  sudo rm -r "/usr/share/Orusula"
  echo -e "$red [$green+$red]$off Installing ...";
  sudo git clone https://github.com/BrahimJarrar/Orusula "/usr/share/Orusula";
  if [[ -d "/usr/share/Orusula" ]]; then
    echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
    echo -e "$red [$green+$red]$off You can execute tool by typing Orusula";
    sleep 5;
    python Orusula.py
  else
    echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
  fi 
}
if [[ -d "/data/data/com.termux/files/usr/" ]]; then
banner
echo -e "$red [$green+$red]$off Orusula Will Be Installed In Your System";
termuxOS
elif [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$off Orusula Will Be Installed In Your System";
debianOS
fi
