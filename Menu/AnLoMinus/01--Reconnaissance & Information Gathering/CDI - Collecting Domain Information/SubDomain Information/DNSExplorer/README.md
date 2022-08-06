# DNSExplorer

![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/banner.png)

DNSExplorer is a shell script that automates the enumeration process of a domain or DNS server and its subdomains using 'host' as the main tool.

Its goal is enum the domains and subdomains using the default server in the revolv.conf file to give an overview of the DNS service.

## Dependencies

- OpenSSL
- cURL
- host (dnsutils / bind-utils)
- ping (net-tools)

## Use cases

Ideal for **RedTeam** scenarios where a quick view of the internal or external DNS network landscape is required.

![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/BasicRecon2.png)
It is useful in initial and post-exploit enumeration phases on unix systems.

# Usage
You can use the script with the default DNS server defined by the system or service provider by using:
```bash
./DNSExplorer.sh <domain.name>
```
![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/basicRecon.png)

If you want to use a specific DNS server to resolve the query, use:
```bash
./DNSExplorer.sh <domain.name> <dns.server>
```
![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/DNS_specificDNS.png)
As you can see, with a specific DNS server you can to obtain more information about your target.

## Paranoiac exec
The script leaves few local traces that are hardly detected. It can also be run directly from github if you have an internet connection:

```bash
wget -O - https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/DNSExplorer.sh | bash
```

The script saves temporary files in the */tmp/dnsexplorer/* folder which are deleted at the end of its execution, in case of a runtime error it is a good idea to delete this directory if the evidence worries you a lot.

# Operation modes

The script has two main modes of operation, which correspond to a basic enumeration of a domain and its DNS servers in order to discover more subdomains.

## ZoneTransfer

After discovering the DNS servers behind a domain, the script tries to do an *AXFR* zone transfer on each of the servers with an NS record.

![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/ZoneTransfer.png)

In case all servers fail and zone transfer is not possible, or *DNSSec* is enabled, the script will automatically switch to brute force function.

## BruteForce

**Automatic:** The brute force function takes [danielmiessler](https://github.com/danielmiessler/) dictionary: [bitquark-subdomains-top100000.txt](https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/bitquark-subdomains-top100000.txt) And it cuts it to 1,000 records.
This corresponds to the top 1,000 of the most used subdomains globally by organizations.

**Custom:** In case you have a custom dictionary and you want to fuzz the subdomains with information taken from your information gathering phase, you can specify the file path.

![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/subdomain-bruteforce.png)

This file must be specified using the basolute path, or just the name if it is in the same directory as the script.
**Note:** The file must be text and correspond to the "*ASCII text*" format, any other format will not be for the script.

## TLS SAN Validation

The script validates if it can connect to the domain using openssl against port 443 in order to find a secure website, then it inspects its TLS certificate for SAN records and displays them to the user.

![](https://raw.githubusercontent.com/dabasanta/DNSExplorer/main/examples/TLS-SAN-Validation.png)

Port 443 is used by default because the vast majority of domains on the internet host their secure web service on that port. However, this can be changed in the script code for specific cases.

## HTTPS subdomains by crt.sh
More info about this in [certificate.transparency.dev](https://certificate.transparency.dev/).

Thanks to [@UnaPibaGeek](https://github.com/UnaPibaGeek) by her tool written in python: [CTFR](https://github.com/UnaPibaGeek/ctfr).

The functionality is the same: The script search in the [crt.sh](https://crt.sh/) database about the domain name that are auditing by DNSExplorer.sh

![](https://github.com/dabasanta/DNSExplorer/blob/main/examples/crt.sh.png?raw=true)

This works very well in the public-face of our target where PKI infrastructure is used.

## Save output to file
To save output to a file, just redirect the STDOUT to the file by using '>' character.
```bash
./DNSExplorer.sh e-corp.evil >> results.txt
```
This saves the entire output with the color codes, to read the file and view with colors use __more__ command: ```more results.txt```

If you want export the results in clear text use:
```bash
DNSExplorer-minimal.sh e-corp.evil >> results.txt
``` 

## DNSExplorer-minimal

Ideal to be run in hostile shell environments, for example a **low-privilege remote reverse** shell. Unnecessary output and bash colors have been removed, the script has been shortened to optimize its performance by removing unnecessary line breaks.

Its functionality is identical to that of the original script, it has only been optimized a little more at the shell scripting level, leaving aside the aesthetics of the code.
