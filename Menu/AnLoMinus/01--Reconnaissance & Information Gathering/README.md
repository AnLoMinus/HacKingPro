> בס״ד
<div align="center">
    
# 🔸 01 - Information Gathering

</div>

---

> - ## **What are the objectives of information gathering in cybersecurity?**

> - ### Any basic cybersecurity information gathering process often includes these two types of data collection goals:

>   - [x] CAO - [`Collecting All in One`]():

>   - [x] CNI - [`Collecting Network Information`](): 
>       - Such as public, private and associated domain names, network hosts, public and private IP blocks, routing tables, TCP and UDP running services, SSL certificates, open ports and more.

>   - [x] CMI - [`Collecting Machine Information`]():  
>       - This includes user enumeration, system groups, OS hostnames, OS system type (probably by fingerprinting), system banners (as seen in the banner grabbing blog post), etc.

>   - [x] CSI - [`Collecting Social Information`]():  

---

### [Squirt](https://github.com/CybernetiX-S3C/Squirt)
#### Squirt is an offensive information and vulnerability scanner.
#### Just supply a domain name to **Squirt** and it will automatically do the following for you:

* Check and Bypass Cloudflare
* Retrieve Server and Powered by Headers
* Fingerprint the operating system of Web Server
* Detect CMS (197+ CMSs are supported)
* Launch WPScan if target is using Wordpress
* Retrieve robots.txt
* Whois lookup
* Check if the target is a honeypot
* Port Scan with banner grabbing
* Dumps all kind of DNS records
* Generate a map for visualizing the attack surface
* Gather Emails related to the target
* Find websites hosted on the same web server
* Find hosts using google
* Crawl the website for URLs having parameters
* SQLi scan using online implemention of SQLMap (takes < 3 min.)
* Basic XSS scanning

#### Install and Run in Linux 
```bash
    git clone https://github.com/CybernetiX-S3C/Squirt
    cd Squirt
    pip install -r requirements.txt
    python Squirt.py
  ```

---
### [Truth 4.2](https://github.com/CybernetiX-S3C/Truth)
#### Information Gathering tool for a Website or IP address. 
- I have used pieces from my Infosploit and my latest E-ntel. 
- Truth can work in any operating system if they have and support Python 2, Python 3, and Ruby.

#### Features
 * DNS Lookup 
 * Whois Lookup
 * GeoIP Lookup
 * Subnet Lookup
 * Port Scanner
 * Page Links
 * Zone Transfer
 * HTTP Header
 * Host Finder
 * IP-Locator
 * Find Shared DNS Servers
 * Get Robots.txt
 * Host DNS Finder
 * Reserve IP Lookup
 * Email Gathering (use E-ntel) New!
 * Subdomain listing (use Sublist3r)
 * Find Admin login site (use Breacher)
 * Check and Bypass CloudFlare (use HatCloud)
 * Website Copier (use httrack) NEW!
 * Host Info Scanner (use WhatWeb) NEW!
 
#### Install and Run in Linux 
```cmd
sudo apt update && sudo apt install ruby python python-pip python3 python3-pip
sudo apt install httrack whatweb
git clone https://github.com/CybernetiX-S3C/Truth
cd Truth
pip install -r requirements.txt
pip3 install -r requirements.txt
python3 truth.py
```
 
---

### [R3C0Nizer](https://github.com/Anon-Artist/R3C0Nizer)
- R3C0Nizer is the first ever CLI based menu-driven automated web application B-Tier recon framework which install every tools and dependencies while running each modules so that the user need not to install any tools manually and R3C0Nizer is used to gather some assets/informations which should help you to the next step with latest updated, fastest and efficient tools. 

#### Usage 🥂
```cmd
git clone https://github.com/Anon-Artist/R3C0Nizer
cd R3C0Nizer
chmod +x reconizer.sh 
echo "export PATH=$PATH:~/go/bin" | sudo tee -a ~/.bashrc
source ~/.bashrc
./reconizer.sh
```

---

# Information gathering techniques and methods
- Ethical hackers use a big variety of techniques and tools to get this precious information about their targets, as well as locations and data collection software they’ll be using towards the information gathering goal.
- Let’s look at the top information gathering methods used to gather information about any target.
> - # How to gather information?

---

>   - ## 1 - [`Social Engineering`](): This includes in-person chat, phone conversations and email spoofing attacks. 
>        - What all these methods have in common is the psychology of human weakness, needed to get maximum data about the target.

---

>   - ## 2 - [`Search Engines`](): Web crawlers can be used to fetch information about anything, and this includes companies, persons, services, and even real hacks, as seen in our previous article about Google Hacking.

---

>   - ## 3 - [`Social Networks`](): Open Source Intelligence
>       - ### [`OSINT`]() ~ Facebook, Twitter, LinkedIn and other social networks are great sources of information to build a profile, especially when targeting individuals.

---

>   - ## 4 - [`Domain Names`](): These are registered by organizations, governments, public and private agencies, and people. 
>       - ### [`DNS`]() ~ Domain Name Server
>       - Therefore, they’re a great starting point when you want to investigate someone. 
>       - Personal information, associated domains, projects, services and technologies can be found by inspecting domain name information.

- All these techniques are really useful when combined with enterprise security tools. 
- Keep reading to discover how to maximize your information gathering results by using some really cool infosec utilities.

---

- ## [E4GL30S1NT](https://github.com/C0MPL3XDEV/E4GL30S1NT): 
    > E4GL30S1NT - Simple Information Gathering Tool
- ## [Sn1per](https://github.com/1N3/Sn1per)
    > Attack Surface Management Platform | Sn1perSecurity LLC <br> Discover the attack surface and prioritize risks with our continuous Attack Surface Management (ASM) platform - Sn1per Professional. <br> For more information, go to https://sn1persecurity.com.
- ## Termux: [SIGIT](https://github.com/termuxhackers-id/SIGIT) - Simple Information Gathering Toolkit
    > ![image](https://user-images.githubusercontent.com/51442719/173302950-284dad74-9623-4f64-a5e1-3e9877df2842.png)

---

- [Information Gathering](https://securitytrails.com/blog/information-gathering): Concept, Techniques and Tools explained
