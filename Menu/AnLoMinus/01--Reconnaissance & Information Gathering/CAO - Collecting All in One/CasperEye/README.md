# CasperEye 
Advance Recon Tool 
---
					                         version: 1.0  	          
	  ▄▄                          	  ▗▄▄▄▖          
	 █▀▀▌                         	  ▐▛▀▀▘          
	▐▛    ▟██▖▗▟██▖▐▙█▙  ▟█▙  █▟█▌▐▌   ▝█ █▌ ▟█▙ 
	▐▌    ▘▄▟▌▐▙▄▖▘▐▛ ▜▌▐▙▄▟▌ █▘  ▐███  █▖█ ▐▙▄▟▌
	▐▙   ▗█▀▜▌ ▀▀█▖▐▌ ▐▌▐▛▀▀▘ █   ▐▌    ▐█▛ ▐▛▀▀▘
	 █▄▄▌▐▙▄█▌▐▄▄▟▌▐█▄█▘▝█▄▄▌ █   ▐▙▄▄▖  █▌ ▝█▄▄▌
	  ▀▀  ▀▀▝▘ ▀▀▀ ▐▌▀▘  ▝▀▀  ▀   ▝▀▀▀▘  █   ▝▀▀ 
		       ▐▌                     █▌ 
***

# Usage

### **``` ./casperEye.sh target-Website OR casperEye.sh target-Website ```**
 
To Enable Nmap use: 
 casperEye.sh target-Website -nmap
 
# Demonstration of CasperEye Advance recon tool

**https://www.youtube.com/watch?v=yGKnhkrmtx8&feature=youtu.be**


 # About
 CasperEye is a script written in Bash, it is intended to automate some tedious tasks of reconnaissance and information gathering. This tool allows you to gather as much information about the target and helps to uncover huge numbers of subdomains and other juicy information.

 # Main Features
 - Create a dated folder with scan results
 - Grab subdomains using:
	1. certdata-api
	2. crt.sh API
	3. certspotter API
	4. assetfinder
	5. Subfinder 
	6. Aquatone
	7. Sublist3r
	8. Knockpy
	9. Hackertarget API
	10. Subbrute
	11. Dig Linux tool [ For Ip Digging ]
	12. Rustscan [ Scan All Open Ports ]
	13. Nmap [ Scan All Running Services on Port ]
	14. Httprobe [ Provide all Live Url's]
 
- Wayback URL Machine 
- SSRF Juicy Link Finder 
- Creating target specific wordlist
- Generating separate HTTP Response Code
- Supports ProtonVPN 
- **Sending Telegram Alert with Complete Final Recon File**
- **Fetch All Target IPs**
- User can enable **Nmap with Rustcan**, which will return all the open ports on the target along with all active/running services
- **Ease of use. Just enter the target domain and Sit back & relax.**


# Installation & Requirements
- Download the script from  **https://github.com/hacker50120/CasperEye**
**Open terminal in relevant directory (where script is downloaded) -> write ```./casperEye-installation.sh``` and hit Enter**

 **Go v.1.10 or above required**

# Setting up Telegram Alert Notifier 
	## Steps:
	1. Search BotFatherin telegram App
	2. Start your Bot with ``` /start```
	3. Select ```/newbot```
	4. Enter name for your bot  
	5. Generate your telegram bot token 	``` /token ```
	6. Then enter your Bot_API and chatID in	 ```set-api-keys.sh```
	``` Bot_api="$$" ```
	``` chatID="$$" ```

### How to Getting ChatId:
	Add that Bot in a group with you.
	Then send "Hi" in the group
	After Than go to terminal and type
	```curl https://api.telegram.org/$$YOUR_API_TOKEN/getUpdates ```
	You will Get ChatID of your Telegram Account.

## System Requirements
	Recommended running on VPS with 1VCPU and 2GB ram.

# Authors and Thanks
 - https://github.com/tomnomnom
 - https://github.com/nahamsec
 - https://github.com/projectdiscovery/subfinder
 - https://github.com/michenriksen/aquatone
 - https://github.com/aboul3la/Sublist3r
 - https://github.com/guelfoweb/knock
 - https://github.com/TheRook/subbrute
 - https://github.com/RustScan/RustScan
 - https://protonvpn.com/
 
# TO DO
New features in the queue 😇

## Warning: 
This code was originally created for personal use, it generates a substantial amount of traffic, please use with caution.
