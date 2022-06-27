# Recommended Open With `Atom` Editor For Normal View.

### Case Date: Tue Jun 28 00:29:05 IDT 2022
> - ### Target Name Tornado
> - ### Target IP 8.8.8.8
> - ### Target Email eight@gmail.com
> - ### Target Phone 9728888888888

# [2] - Reconnaissance & Vulnerability Assessment

### Arp Scan Log 8.8.8.8:

? ***.***.***.*** at AA:NN:LL:OO:MM:II;NN;UU;SS on en0 ifscope [ethernet]
? ***.***.***.*** at AA:NN:LL:OO:MM:II;NN;UU;SS on en0 ifscope [ethernet]
? ***.***.***.*** at AA:NN:LL:OO:MM:II;NN;UU;SS on en0 ifscope permanent [ethernet]
? ***.***.***.*** at AA:NN:LL:OO:MM:II;NN;UU;SS on en0 ifscope permanent [ethernet]

### TraceRoute Scan Log 8.8.8.8:

 1  *****************   1.414 ms  1.290 ms
 2  ***************** 38)  3.517 ms  3.934 ms  4.100 ms
 3  *****************  4.209 ms  4.190 ms  5.522 ms
 4  ***************** (212.143.203.9)  5.331 ms  4.773 ms  6.534 ms
 5  ***************** 2.34)  54.185 ms  53.681 ms  53.557 ms
 6  ***************** ms  54.619 ms
    ***************** )  55.580 ms
 7  * * *
 8  dns.google (8.8.8.8)  61.992 ms
    66.249.95.52 (66.249.95.52)  62.074 ms
    dns.google (8.8.8.8)  55.646 ms

### Ping Scan Log 8.8.8.8:

 PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=117 time=65.864 ms
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=60.917 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=54.389 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=117 time=60.064 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 54.389/60.309/65.864/4.072 ms

### Dig Scan Log 8.8.8.8:


; <<>> DiG 9.10.6 <<>> 8.8.8.8 all
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 24885
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;8.8.8.8.			IN	A

;; ANSWER SECTION:
8.8.8.8.		0	IN	A	8.8.8.8

;; Query time: 41 msec
;; SERVER: 10.100.102.1#53(10.100.102.1)
;; WHEN: Tue Jun 28 00:30:02 IDT 2022
;; MSG SIZE  rcvd: 52

;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 3563
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;all.				IN	A

;; AUTHORITY SECTION:
.			86400	IN	SOA	a.root-servers.net. nstld.verisign-grs.com. 2022062702 1800 900 604800 86400

;; Query time: 8 msec
;; SERVER: 10.100.102.1#53(10.100.102.1)
;; WHEN: Tue Jun 28 00:30:02 IDT 2022
;; MSG SIZE  rcvd: 107

### Nslookup Scan Log 8.8.8.8:

 Server:		10.100.102.1
Address:	10.100.102.1#53

Non-authoritative answer:
8.8.8.8.in-addr.arpa	name = dns.google.

Authoritative answers can be found from:
8.8.8.in-addr.arpa	nameserver = ns2.google.com.
8.8.8.in-addr.arpa	nameserver = ns3.google.com.
8.8.8.in-addr.arpa	nameserver = ns4.google.com.
8.8.8.in-addr.arpa	nameserver = ns1.google.com.
ns1.google.com	internet address = 216.239.32.10
ns2.google.com	internet address = 216.239.34.10
ns3.google.com	internet address = 216.239.36.10
ns4.google.com	internet address = 216.239.38.10
ns1.google.com	has AAAA address 2001:4860:4802:32::a
ns2.google.com	has AAAA address 2001:4860:4802:34::a
ns3.google.com	has AAAA address 2001:4860:4802:36::a
ns4.google.com	has AAAA address 2001:4860:4802:38::a

### WhoIs Scan Log 8.8.8.8:

 % IANA WHOIS server
% for more information on IANA, visit http://www.iana.org
% This query returned 1 object

refer:        whois.arin.net

inetnum:      8.0.0.0 - 8.255.255.255
organisation: Administered by ARIN
status:       LEGACY

whois:        whois.arin.net

changed:      1992-12
source:       IANA

# whois.arin.net

NetRange:       8.0.0.0 - 8.127.255.255
CIDR:           8.0.0.0/9
NetName:        LVLT-ORG-8-8
NetHandle:      NET-8-0-0-0-1
Parent:         NET8 (NET-8-0-0-0-0)
NetType:        Direct Allocation
OriginAS:       
Organization:   Level 3 Parent, LLC (LPL-141)
RegDate:        1992-12-01
Updated:        2018-04-23
Ref:            https://rdap.arin.net/registry/ip/8.0.0.0



OrgName:        Level 3 Parent, LLC
OrgId:          LPL-141
Address:        100 CenturyLink Drive
City:           Monroe
StateProv:      LA
PostalCode:     71203
Country:        US
RegDate:        2018-02-06
Updated:        2021-09-23
Comment:        ADDRESSES WITHIN THIS BLOCK ARE NON-PORTABLE ANY ISP ANNOUNCING OR TRANSITING PORTIONS WITHIN OUR RANGES SHOULD NOT RELY ON PRESENTED LOA'S UNLESS THOSE RANGES ARE ALSO ANNOUNCED TO A LUMEN ASN.
Comment:        
Comment:        Our looking glass is located at: https://lookingglass.centurylink.com/
Comment:        
Comment:        For subpoena or court order please fax 844.254.5800 or refer to our Trust & Safety page:
Comment:        https://www.lumen.com/en-us/about/legal/trust-center/trust-and-safety.html
Comment:        
Comment:        For abuse issues, please email abuse@aup.lumen.com
Comment:        All abuse reports MUST include:
Comment:        * src IP
Comment:        * dest IP (your IP)
Comment:        * dest port
Comment:        * Accurate date/timestamp and timezone of activity
Comment:        * Intensity/frequency (short log extracts)
Comment:        * Your contact details (phone and email)
Comment:        Without these we will be unable to identify the correct owner of the IP address at that point in time.
Ref:            https://rdap.arin.net/registry/entity/LPL-141


OrgTechHandle: IPADD5-ARIN
OrgTechName:   ipaddressing
OrgTechPhone:  +1-877-453-8353
OrgTechEmail:  ipaddressing@level3.com
OrgTechRef:    https://rdap.arin.net/registry/entity/IPADD5-ARIN

OrgAbuseHandle: LAC56-ARIN
OrgAbuseName:   L3 Abuse Contact
OrgAbusePhone:  +1-877-453-8353
OrgAbuseEmail:  abuse@level3.com
OrgAbuseRef:    https://rdap.arin.net/registry/entity/LAC56-ARIN

### Dirb Scan Log 8.8.8.8:



### Nmap Scan Log 8.8.8.8:



---
