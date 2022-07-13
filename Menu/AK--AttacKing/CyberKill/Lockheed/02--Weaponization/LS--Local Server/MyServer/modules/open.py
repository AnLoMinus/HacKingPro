# Tool Name :- MyServer
# Author :- Rajkumar Dusad
# Date :- 22/5/2018
# Powered By :- Aex Software's

import sys
import os
from time import sleep
from core.system import *
from modules.logo import *

class openssh(object):
  def notino(self):
    Mylogo()
    print("\n\n\033[1;31m  Error \033[01;33m\'OpenSSH-server\' \033[01;31mis not installed in "+system+".\033[00m")
    sleep(2)

  def opens(self):
    while True:
      if os.path.exists(bpath+"ssh"):
        os.system("python modules/.srvr.aex")
        Mylogo()
        dn = input("\n\n\033[1;33m  Enter your subdomain name (\033[01;32mex Myweb\033[01;33m) :- \033[01;36m")
        portl = input("\033[1;33m  Enter your localhost port (\033[01;32mex 8080\033[01;33m) :- \033[01;36m")
        port = input("\033[1;33m  Enter your port (\033[01;32mex 80\033[01;33m) :- \033[01;36m")
        os.system("python2 modules/.srvr.aex")
        Mylogo()
        print("\n\033[01;33mStarting Server ......\033[00m\n")
        os.system("ssh -R "+port+":localhost:"+portl+" "+dn+"@localhost.run")
        print("\n\007\033[01;31m unfortunately server stopped.\n\033[00m")
        sys.exit()
      else:
        ins().ssh()
        if os.path.exists(bpath+"ssh"):
          self.opens()
        else:
          self.notino()
          break

class ins(object):
  def ssh(self):
    Mylogo()
    print("\n\n\033[01;31m   [\033[01;33m+\033[01;31m] \033[01;36mOpenSSH \033[01;31mis not installed in your "+system+".")
    opt=input("\n\033[01;33m Do you want to install OpenSSH [\033[01;32mY/n\033[01;33m] >>\033[01;36m ")
    if opt=="y" or opt=="Y":
      Mylogo()
      print("\n\033[01;32mInstalling OpenSSH server......\033[00m\n")
      sleep(1)
      if system=="termux":
        os.system(pac+" update")
        os.system(pac+" install openssh -y")
      else:
        os.system(pac+" update")
        os.system(pac+" install openssh-server -y")

def open():
	openssh().opens()