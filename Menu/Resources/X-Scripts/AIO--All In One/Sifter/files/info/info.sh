#!/bin/bash
# Zenity Text-Box
# Displays Sifter Module Information (GUI)

# Info Gathering SubMenu
credmenu(){
	credinfo=$(zenity --list --title  "Module Information" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "Seeker" FALSE "xRay" FALSE "theHarvester" FALSE "Osmedeus" FALSE "ReconSpider" FALSE "Maryam" FALSE "CredNinja" FALSE "SpiderFoo7" FALSE "ODIN" FALSE "GHunt" TRUE "Back");
	echo ${credinfo}
	if [[ ${credinfo} == "Seeker" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/seeker.info" &>/dev/null
	elif [[ ${credinfo} == "xRay" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/xray.info" &>/dev/null
	elif [[ ${credinfo} == "theHarvester" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/theHarvester.info" &>/dev/null
	elif [[ ${credinfo} == "Osmedeus" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/osmedeus.info" &>/dev/null
	elif [[ ${credinfo} == "ReconSpider" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/reconspider.info" &>/dev/null
	elif [[ ${credinfo} == "Maryam" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/maryam.info" &>/dev/null
	elif [[ ${credinfo} == "CredNinja" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/credninja.info" &>/dev/null
	elif [[ ${credinfo} == "SpiderFoo7" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/spiderfoot.info" &>/dev/null
	elif [[ ${credinfo} == "ODIN" ]]; then
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/odin.info" &>/dev/null
	elif [[ ${credinfo} == "GHnut" ]]; then
		eom /opt/sifter/files/info/ghunt.png &
	   zenity --title "${credinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/ghunt.info" &>/dev/null
	else
		if [[ ${credinfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}

# Domain Reconnaissance SubMenu
dommenu(){
	dominfo=$(zenity --list --title  "Domain Reconnaissance" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "Armory" FALSE "aSnip" TRUE "Back");
	echo ${dominfo}
	if [[ ${dominfo} == "Armory" ]]; then
	   zenity --title "${dominfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/armory.info" &>/dev/null
	elif [[ ${dominfo} == "aSnip" ]]; then
	   zenity --title "${dominfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/asnip.info" &>/dev/null
	else
		if [[ ${dominfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}

# WebApplication SubMenu
webappmenu(){
	webappinfo=$(zenity --list --title  "WebApplication Scanners" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "Sitadel" FALSE "AapFinder" FALSE "BFAC" FALSE "OneFind" FALSE "XSStrike" FALSE "XSS-Freak" TRUE "Back");
	echo ${webappinfo}
	if [[ ${webappinfo} == "Sitadel" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/sitadel.info" &>/dev/null
	elif [[ ${webappinfo} == "AapFinder" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/aapfinder.info" &>/dev/null
	elif [[ ${webappinfo} == "BFAC" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/bfac.info" &>/dev/null
	elif [[ ${webappinfo} == "OneFind" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/onedrive.info" &>/dev/null
	elif [[ ${webappinfo} == "XSStrike" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/xsstrike.info" &>/dev/null
	elif [[ ${webappinfo} == "XSS-Freak" ]]; then
	   zenity --title "${webappinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/XSS-Freak.info" &>/dev/null
	else
		if [[ ${webappinfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}


# HoneyPot SubMenu
honeymenu(){
	honey_info=$(zenity --list --title  "HoneyPot Detection Tools" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "HoneyTel" TRUE "Back");
	echo ${honey_info}
	if [[ ${honey_info} == "HoneyTel" ]]; then
	   zenity --title "${honey_info}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/honeytel.info" &>/dev/null
	else
		if [[ ${honey_info} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}

# Vulnerability Tool SubMenu
vulnmenu(){
	vulninfo=$(zenity --list --title  "Vulnerability Scanners" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "Flan" FALSE "RapidScan" FALSE "Yuki-Chan" FALSE "OWASP-Nettacker" TRUE "Back");
	echo ${vulninfo}
	if [[ ${vulninfo} == "Flan" ]]; then
	   zenity --title "${vulninfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/flan.info" &>/dev/null
	elif [[ ${vulninfo} == "RapidScan" ]]; then
	   zenity --title "${vulninfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/rapidscan.info" &>/dev/null
	elif [[ ${vulninfo} == "Yuki-Chan" ]]; then
	   zenity --title "${vulninfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/yuki.info" &>/dev/null
	elif [[ ${vulninfo} == "OWASP-Nettacker" ]]; then
	   zenity --title "${vulninfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/owasp.info" &>/dev/null
	else
		if [[ ${vulninfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}


# WebSite Tool SubMenu
web_netmenu(){
	web_netinfo=$(zenity --list --title  "WebScanning & Enumeration" \
					--text "Choose an application" --radiolist \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "BlackWidow" FALSE "AttackSurfaceMapper" FALSE "wafw00f" TRUE "Back");
	echo ${web_netinfo}
	if [[ ${web_netinfo} == "BlackWidow" ]]; then
	   zenity --title "${web_netinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/blackwidow.info" &>/dev/null
	elif [[ ${web_netinfo} == "AttackSurfaceMapper" ]]; then
	   zenity --title "${web_netinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/asm.info" &>/dev/null
	elif [[ ${web_netinfo} == "wafw00f" ]]; then
	   zenity --title "${web_netinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/wafw00f.info" &>/dev/null
	else
		if [[ ${web_netinfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}

# Post Exploitation
postmenu(){
	postinfo=$(zenity --list --title  "Post-Exploitation Tools" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "Omega" FALSE "WinPwn" FALSE "ACLight2" FALSE "InveighZero" TRUE "Back");
	echo ${postinfo}
	if [[ ${postinfo} == "Omega" ]]; then
	   zenity --title "${postinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/omega.info" &>/dev/null
	elif [[ ${postinfo} == "WinPwn" ]]; then
	   zenity --title "${postinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/WinPwn.info" &>/dev/null
	elif [[ ${postinfo} == "ACLight2" ]]; then
	   zenity --title "${postinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/aclight.info" &>/dev/null
	elif [[ ${postinfo} == "InveighZero" ]]; then
	   zenity --title "${postinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/inveighzero.info" &>/dev/null
	else
		if [[ ${postinfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}


# Exploitation Tool SubMenu
exmodmenu(){
	exmodinfo=$(zenity --list --title  "Exploitation Tools" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "MkCheck" FALSE "BruteDUM" FALSE "ActiveReign" FALSE "NekoBot" FALSE "xShock" FALSE "VulnX" FALSE "WBruter" FALSE "Thoron" TRUE "Back");
	echo ${exmodinfo}
	if [[ ${exmodinfo} == "MkCheck" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/mkcheck.info" &>/dev/null
	elif [[ ${exmodinfo} == "BruteDUM" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/brutedum.info" &>/dev/null
	elif [[ ${exmodinfo} == "ActiveReign" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/activereign.info" &>/dev/null
	elif [[ ${exmodinfo} == "NekoBot" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/nekobot.info" &>/dev/null
	elif [[ ${exmodinfo} == "xShock" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/xshock.info" &>/dev/null
	elif [[ ${exmodinfo} == "VulnX" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/vulnx.info" &>/dev/null
	elif [[ ${exmodinfo} == "WBruter" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/wbruter.info" &>/dev/null
	elif [[ ${exmodinfo} == "Thoron" ]]; then
	   zenity --title "${exmodinfo}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/thoron.info" &>/dev/null
	else
		if [[ ${exmodinfo} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}


# OpSec & Threat Analy SubMenu
opsecmenu(){
	opsec=$(zenity --list --title  "Operational Security & Threat Analysis" \
					--text "Choose an application" --radiolist  \
					--height=350 --width=500 \
					--column "Pick" --column "Catagory" FALSE "EventCleaner" FALSE "TruffleSNout" FALSE "Snaffler" TRUE "Back");
	echo ${opsec}
	if [[ ${opsec} == "EventCleaner" ]]; then
	   zenity --title "${opsec}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/eventcleaner.info" &>/dev/null
	elif [[ ${opsec} == "TruffleSNout" ]]; then
	   bash /opt/sifter/files/info/TSNout/tsnout.sh &>/dev/null
	elif [[ ${opsec} == "Snaffler" ]]; then
		zenity --title "${opsec}" \
	   --height=600 --width=800 \
	   --text-info --filename="/opt/sifter/files/info/snaffle/snaffle.info" &>/dev/null
	else
		if [[ ${opsec} == "Back" ]]; then
			cd /opt/sifter
			exit
		fi
	fi
}


# Module Menu
#python3 /opt/sifter/extras/ban.py
#echo -e "${URED}Modules${NC}"
modmenu(){
	modinfo=$(zenity --list --title  "Module Information" \
		--text "Choose a Catagory" --radiolist  \
		--height=350 --width=500 \
		--column "Pick" --column "Catagory" FALSE "Information Gathering Tools" FALSE "Domain Reconnaissance" FALSE "WebScanning & Enumeration" FALSE "Vulnerability Scanners" FALSE "HoneyPot Detection Systems" FALSE "Exploitation Tools" FALSE "Post-Exploitation" FALSE "WebApplication Scanners" FALSE "Operational Security & Threat Analysis" TRUE "Exit Info");
	echo ${modinfo}
	if [[ ${modinfo} == "Information Gathering Tools" ]]; then
		credmenu
	elif [[ ${modinfo} == "Domain Reconnaissance" ]]; then
		dommenu
	elif [[ ${modinfo} == "WebScanning & Enumeration" ]]; then
		web_netmenu
	elif [[ ${modinfo} == "Vulnerability Scanners" ]]; then
		vulnmenu
	elif [[ ${modinfo} == "HoneyPot Detection Systems" ]]; then
		honeymenu
	elif [[ ${modinfo} == "Exploitation Tools" ]]; then
		exmodmenu
	elif [[ ${modinfo} == "Post-Exploitation" ]]; then
		webappmenu
	elif [[ ${modinfo} == "WebApplication Scanners" ]]; then
		postmenu
	elif [[ ${modinfo} == "Operational Security & Threat Analysis" ]]; then
		opsecmenu
	else
		if  [[ ${modinfo} == "Exit Info" ]]; then
			exit 0
		fi
	fi
}

# Runtime
modmenu
