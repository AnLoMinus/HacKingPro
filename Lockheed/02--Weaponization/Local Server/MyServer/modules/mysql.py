# Tool Name :- MyServer
# Author :- Rajkumar Dusad
# Date :- 22/5/2018
# Powered By :- Aex Software's

import sys
import os
from time import sleep
from core.system import *
from modules.logo import *

class MySQL(object):
  def chmys(self):
    if os.path.exists(bpath+"mysql") or os.path.exists("/usr/sbin/mysql"):
      self.mysqls()
    else:
      Mylogo()
      print("\n\n\033[01;31m  Sorry we can't install \033[01;32mMySQL \033[01;31min your "+system+".")
      sleep(3)

  def mysqls(self):
    if system=="termux":
      os.system("python modules/.srvr.aex")
      Mylogo()
      print("\n\033[01;33mStarting Server ......\033[00m\n")
      os.system("mysqld")
      print("\n\033[01;31m unfortunately server stopped\n\033[00m")
      sys.exit()
    else:
      Mylogo()
      usrnm=input("\n\n\033[01;33m Enter your MySQL username :- \033[01;36m")
      if usrnm=="":
        print("\n\033[01;31m\007 Error Please enter your \033[01;33mMySQL username\033[01;31m !!\n")
        self.mysqls()
      os.system("python modules/.srvr.aex")
      Mylogo()
      print("\n\033[01;33mStarting Server ......\033[00m\n")
      if os.path.exists("/usr/lib/sudo"):
        os.system("sudo service mysql start")
        os.system("sudo mysql -u "+usrnm+" -p")
        print("\n\033[01;31munfortunately server stopped\n\033[00m")
      elif system=="ubuntu":
        os.system("sudo systemctl mysql start")
        os.system("sudo mysql -u "+usrnm+" -p")
        print("\n\033[01;31munfortunately server stopped\n\033[00m")
      else:
        os.system("service mysql start")
        os.system("mysql -u "+usrnm+" -p")
        print("\n\033[01;31munfortunately server stopped\n\033[00m")
      sys.exit()

  def inmys(self):
    if os.path.exists(bpath+"mysql"):
      self.mysqls()
    else:
      Mylogo()
      print("\n\n\033[01;31m   [\033[01;33m+\033[01;31m] \033[01;36mMySQL \033[01;31mis not installed in your "+system+".")
      opt=input("\n\033[01;33m Do you want to install MySQL [\033[01;32mY/n\033[01;33m] >>\033[01;36m ")
      if opt=="Y" or opt=="y":
        Mylogo()
        print("\n\033[01;33mInstalling MySQL Server......\n\033[00m")
        if system=="termux":
          os.system(pac+" update")
          os.system(pac+" install mariadb -y")
        if system=="ubuntu":
          os.system(pac+" update")
          os.system(pac+" install mysql-server -y")
        else:
          os.system(pac+" update")
          os.system(pac+" install mysql-server -y")
        self.chmys()
      elif opt=="N" or opt=="n":
        pass
      else:
        print("\n \033[01;31m\007Command not found :\033[01;32m \'"+opt+"\'")
        sleep(1)
        self.inmys()
  
def Mys():
  MySQL().inmys()