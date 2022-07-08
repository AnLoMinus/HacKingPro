#!/usr/bin/env python3
CVIOLET = '\33[35m'
CGREENBG2  = '\33[104m'
CRED = '\033[91m'
CBLUE = '\33[94m'
ORANGE = '\33[33m'
CYAN = '\033[01m\33[31m'
CEND = '\033[0m'
UGREEN = '\33[92m'
WHITE = '\33[37m'
#   " + ORANGE + "Revision " + CBLUE + "2" + WHITE + "
def showbanner():
        print(CYAN + '''
                 ____.__  ________         __ _________  ______
           _____/_   |  | \_____  \  _____/  |\______  \/  __  \\
  ______  /  ___/|   |  |   _(__  < /    \   __\  /    />      <   ______
 /_____/  \___ \ |   |  |__/       \   |  \  |   /    //   --   \ /_____/
         /____  >|___|____/______  /___|  /__|  /____/ \______  /
              \/     ''' + CVIOLET + "Sapphire" + CYAN + '''    \/ ''' + WHITE + "*" + ORANGE + "*" + WHITE + "*" + CYAN + ''' \/     ''' + UGREEN + "Version" + CBLUE + " 12.2" + CYAN + '''   \/     ''' + CEND)
        print(WHITE + "==========================================================================" + CEND)
showbanner()
