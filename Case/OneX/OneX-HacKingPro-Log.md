# Recommended Open With [Atom]() Editor For Normal View.
### Case Date: Tue Jun 28 00:53:54 IDT 2022
> - ### Target Name OneX
> - ### Target IP 1.1.1.1
> - ### Target Email OneX@onex.x
> - ### Target Phone 9720506933037

# [2] - Reconnaissance & Vulnerability Assessment

### Arp Scan Log 1.1.1.1:

? (10.100.102.1) at 12:34:56:78:12:34 on en0 ifscope [ethernet]
? (10.100.102.14) at 12:34:56:78:12:34 on en0 ifscope [ethernet]
? (224.0.0.251) at 12:34:56:78:12:34 on en0 ifscope permanent [ethernet]
? (239.255.255.250) at 12:34:56:78:12:34 on en0 ifscope permanent [ethernet]

### TraceRoute Scan Log 1.1.1.1:

  1  netbox (x.x.x.x)  17.309 ms  1.394 ms  1.284 ms
 2  lns5.nta.nv.net.il (x.x.x.x)  4.405 ms  4.469 ms  5.150 ms
 3  core2-3-0-2-lns5-nta.nv.net.il (x.x.x.x)  4.762 ms  4.551 ms  4.408 ms
 4  core2-0-1.hfa.nv.net.il (x.x.x.x)  6.942 ms  5.615 ms  4.947 ms
 5  peering2-hfa-30-1-core1-hfa.hfa.nv.net.il (x.x.x.x)  5.522 ms
    cdn1-21-core2.ory.nv.net.il (x.x.x.x)  4.826 ms
    peering2-hfa-30-1-core1-hfa.hfa.nv.net.il (212.143.7.255)  4.973 ms
 6  212.143.232.3 (212.143.232.3)  5.937 ms  7.386 ms
    212.150.71.151 (212.150.71.151)  5.703 ms
 7  one.one.one.one (1.1.1.1)  5.270 ms  6.513 ms  6.063 ms

### Ping Scan Log 1.1.1.1:

 PING 1.1.1.1 (1.1.1.1): 56 data bytes
64 bytes from 1.1.1.1: icmp_seq=0 ttl=58 time=13.380 ms
64 bytes from 1.1.1.1: icmp_seq=1 ttl=58 time=5.560 ms
64 bytes from 1.1.1.1: icmp_seq=2 ttl=58 time=11.873 ms
64 bytes from 1.1.1.1: icmp_seq=3 ttl=58 time=12.223 ms

--- 1.1.1.1 ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 5.560/10.759/13.380/3.053 ms

### Dig Scan Log 1.1.1.1:


; <<>> DiG 9.10.6 <<>> 1.1.1.1 all
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 561
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;1.1.1.1.			IN	A

;; ANSWER SECTION:
1.1.1.1.		0	IN	A	1.1.1.1

;; Query time: 57 msec
;; SERVER: 10.100.102.1#53(10.100.102.1)
;; WHEN: Tue Jun 28 00:55:51 IDT 2022
;; MSG SIZE  rcvd: 52

;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 59514
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;all.				IN	A

;; AUTHORITY SECTION:
.			84851	IN	SOA	a.root-servers.net. nstld.verisign-grs.com. 2022062702 1800 900 604800 86400

;; Query time: 7 msec
;; SERVER: 10.100.102.1#53(10.100.102.1)
;; WHEN: Tue Jun 28 00:55:51 IDT 2022
;; MSG SIZE  rcvd: 107

### Nslookup Scan Log 1.1.1.1:

 Server:		10.100.102.1
Address:	10.100.102.1#53

Non-authoritative answer:
1.1.1.1.in-addr.arpa	name = one.one.one.one.

Authoritative answers can be found from:
1.1.1.in-addr.arpa	nameserver = ns3.cloudflare.com.
1.1.1.in-addr.arpa	nameserver = ns7.cloudflare.com.
ns3.cloudflare.com	internet address = 162.159.7.226
ns3.cloudflare.com	internet address = 162.159.0.33
ns7.cloudflare.com	internet address = 162.159.6.6
ns7.cloudflare.com	internet address = 162.159.4.8
ns3.cloudflare.com	has AAAA address 2400:cb00:2049:1::a29f:7e2
ns3.cloudflare.com	has AAAA address 2400:cb00:2049:1::a29f:21
ns7.cloudflare.com	has AAAA address 2400:cb00:2049:1::a29f:606
ns7.cloudflare.com	has AAAA address 2400:cb00:2049:1::a29f:408

### WhoIs Scan Log 1.1.1.1:

 % IANA WHOIS server
% for more information on IANA, visit http://www.iana.org
% This query returned 1 object

refer:        whois.apnic.net

inetnum:      1.0.0.0 - 1.255.255.255
organisation: APNIC
status:       ALLOCATED

whois:        whois.apnic.net

changed:      2010-01
source:       IANA

# whois.apnic.net

% [whois.apnic.net]
% Whois data copyright terms    http://www.apnic.net/db/dbcopyright.html

% Information related to '1.1.1.0 - 1.1.1.255'

% Abuse contact for '1.1.1.0 - 1.1.1.255' is 'helpdesk@apnic.net'

inetnum:        1.1.1.0 - 1.1.1.255
netname:        APNIC-LABS
descr:          APNIC and Cloudflare DNS Resolver project
descr:          Routed globally by AS13335/Cloudflare
descr:          Research prefix for APNIC Labs
country:        AU
org:            ORG-ARAD1-AP
admin-c:        AR302-AP
tech-c:         AR302-AP
abuse-c:        AA1412-AP
status:         ASSIGNED PORTABLE
remarks:        ---------------
remarks:        All Cloudflare abuse reporting can be done via
remarks:        resolver-abuse@cloudflare.com
remarks:        ---------------
mnt-by:         APNIC-HM
mnt-routes:     MAINT-AU-APNIC-GM85-AP
mnt-irt:        IRT-APNICRANDNET-AU
last-modified:  2020-07-15T13:10:57Z
source:         APNIC

irt:            IRT-APNICRANDNET-AU
address:        PO Box 3646
address:        South Brisbane, QLD 4101
address:        Australia
e-mail:         helpdesk@apnic.net
abuse-mailbox:  helpdesk@apnic.net
admin-c:        AR302-AP
tech-c:         AR302-AP
auth:           # Filtered
remarks:        helpdesk@apnic.net was validated on 2021-02-09
mnt-by:         MAINT-AU-APNIC-GM85-AP
last-modified:  2021-03-09T01:10:21Z
source:         APNIC

organisation:   ORG-ARAD1-AP
org-name:       APNIC Research and Development
country:        AU
address:        6 Cordelia St
phone:          +61-7-38583100
fax-no:         +61-7-38583199
e-mail:         helpdesk@apnic.net
mnt-ref:        APNIC-HM
mnt-by:         APNIC-HM
last-modified:  2017-10-11T01:28:39Z
source:         APNIC

role:           ABUSE APNICRANDNETAU
address:        PO Box 3646
address:        South Brisbane, QLD 4101
address:        Australia
country:        ZZ
phone:          +000000000
e-mail:         helpdesk@apnic.net
admin-c:        AR302-AP
tech-c:         AR302-AP
nic-hdl:        AA1412-AP
remarks:        Generated from irt object IRT-APNICRANDNET-AU
abuse-mailbox:  helpdesk@apnic.net
mnt-by:         APNIC-ABUSE
last-modified:  2021-03-09T01:10:22Z
source:         APNIC

role:           APNIC RESEARCH
address:        PO Box 3646
address:        South Brisbane, QLD 4101
address:        Australia
country:        AU
phone:          +61-7-3858-3188
fax-no:         +61-7-3858-3199
e-mail:         research@apnic.net
nic-hdl:        AR302-AP
tech-c:         AH256-AP
admin-c:        AH256-AP
mnt-by:         MAINT-APNIC-AP
last-modified:  2018-04-04T04:26:04Z
source:         APNIC

% Information related to '1.1.1.0/24AS13335'

route:          1.1.1.0/24
origin:         AS13335
descr:          APNIC Research and Development
                6 Cordelia St
mnt-by:         MAINT-AU-APNIC-GM85-AP
last-modified:  2018-03-16T16:58:06Z
source:         APNIC

% This query was served by the APNIC Whois Service version 1.88.16 (WHOIS-UK4)

### Dirb Scan Log 1.1.1.1:



### Nmap Scan Log 1.1.1.1:



---
