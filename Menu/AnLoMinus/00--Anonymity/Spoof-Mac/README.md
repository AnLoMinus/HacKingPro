[![Version](https://img.shields.io/badge/SPOOF_MAC-1.0-brightgreen.svg?maxAge=259200)]()
[![Stage](https://img.shields.io/badge/Release-stable-blue.svg)]()
[![Build](https://img.shields.io/badge/Supported_OS-linux-orange.svg)]()
[![Github All Releases](https://img.shields.io/github/downloads/atom/atom/total.svg)]()
[![AUR](https://img.shields.io/aur/license/yaourt.svg)]()

# spoof-mac - mac cloner (NetworkManager9 clone bug)
    Version release : v1.0 (Belerefon)
    Author : pedro ubuntu  [ r00t-3xp10it ]
    Distros Supported : Linux Kali 1/2/3 (NetworkManager9 clone bug)
    Suspicious-Shell-Activity (SSA) PurpleTeam develop @2016

# LEGAL DISCLAMER
    The author does not hold any responsibility for the bad use
    of this tool, remember that attacking targets without prior
    consent is illegal and punished by law.



# Description
    I have installed 'kali 2016.1 rolling' a few days ago, and 'macchanger' tool works well with no problems.
    The problem cames when i have decided to 'update' my distro, ever since that update that iam facing bugs
    at changing my 'mac+ip addr' using macchanger('Network Manager9' have changed the way things normally works)

    For Reference:
    When using NetworkManager(NM9) to access the net, any spoofed mac address(MAC) produced thru the terminal
    window(TW) using macchanger tool will be over-written by NM9. If no cloned mac address exists in NM9 menu
    settings, then the device is returned to the device MAC (permanent) and any mac spoofing set by the user
    thru the TW disappears.

    'This script was writen to enable me to change my mac address using terminal windows'...
    spoof-mac.sh checks if we are running againts 'Kali distros' and if NM version its 'bigger than:1.2.0 (NM9)'



# Download/Install
    1º - Download framework from github
         tar.gz OR zip OR git clone

    2º - Set files execution permitions
         cd spoof-mac
         sudo chmod +x *.sh

    3º - Run main tool
         sudo ./spoof-mac.sh

# Framework Help Menu
![spoof-mac](https://dl.dropboxusercontent.com/u/21426454/spoo-mac-banner2.png)

# Framework common vendors Menu
![spoof-mac](https://dl.dropboxusercontent.com/u/21426454/spoo-mac-banner3.png)

# Framework Main Menu
![spoof-mac](https://dl.dropboxusercontent.com/u/21426454/spoo-mac-banner.png)


_EOF
