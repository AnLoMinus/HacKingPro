#!/bin/bash
#
# Linux Enum - "Local linux host enumeration script - post exploit"
#
# Version: 0.0.2
# Modified Date: 2013-10-22
#
# Tested On: Kali Linux 1.0.5

############################################
#	      CONFIGURATION OPTIONS	  	       #
############################################

STDOUT="Y"
SYSTEM="Y"
NETWORKING="Y"
AUTHENTICATION="Y"
SYSTEMCONFIG="Y"
PROCESSES="Y"
APPLICATIONS="Y"
FILESEARCH="Y"
SUIDLIB="Y"
HOMELIST="Y"
PKGMGMT="Y"
KERNERLCONFIG="Y"
LOGFILES="Y"

# Ensure commands are reference correctly using common path environment
PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

############################################
#	    DO NOT EDIT BELOW THIS LINE	       #
############################################

UNAME=`whereis uname | awk '{print $2}' 2>/dev/null`
HOSTNAME=`whereis hostname | awk '{print $2}' 2>/dev/null`

WHO=`whoami`
HOSTNAME=`$HOSTNAME`
IPADDRESS=`$HOSTNAME -i`
OSNAME=`$UNAME -s`
OSREL=`$UNAME -r`
OSVERSION=`$UNAME -v`
OSFULL=`$UNAME -a`
PROCVER=`cat /proc/version 2>/dev/null`
STARTDATE=`date`

echo "#########################################################"
echo "# Post Exploit Linux Enumeration Script"
echo "# https://github.com/milbot/linux_enum"
echo "# version 0.0.2"
echo "#########################################################"
echo "  Methodology Used:"
echo "#########################################################"
echo "  1. Operating System"
echo "  2. Users"
echo "  3. Environmental"
echo "  4. Services"
echo "  5. Software & Applications"
echo "  6. Jobs & Tasks"
echo "  7. Communications & Networking"
echo "  8. Confidential Information & Interesting Files"
echo "  9. Possible Exploit Code"
echo "#########################################################\n"
echo " Scan started at: $STARTDATE\n"
echo "#########################################################\n"
echo " Hostname: $HOSTNAME"
echo " IP Address: $IPADDRESS"
echo " Operating System: $OSNAME"
echo " Kernel Information:"
echo "   $OSFULL"
echo " Proc Version:"
echo "   $PROCVER"
echo "#########################################################\n"

if [ "$SYSTEM" = "Y" ]; then
	echo "#########################################################"
	echo "# OPERATING SYSTEM"
	echo "#########################################################\n"

	# Distribution Type
	# Search all *-release files for version information
	RELEASE=`cat /etc/*-release 2>/dev/null`
	echo "Specific release information:\n\n$RELEASE\n"
fi

echo "#########################################################"
echo "# USERS & GROUPS"
echo "#########################################################\n"

CURRENTUSER=`id 2>/dev/null`
echo "Current user: $CURRENTUSER\n"

GROUPS=`getent group $WHO 2>/dev/null`
echo "All members of 'our' group(s):\n$GROUPS\n"

LASTLOGGEDON=`lastlog |grep -v "Never" 2>/dev/null`
echo "Users that have previously logged onto the system:\n$LASTLOGGEDON\n"

USERINFO=`cat /etc/passwd | cut -d ":" -f 1,2,3,4 2>/dev/null`
echo "All users and uid/gid info:\n$USERINFO\n"

HASHESINPASSWD=`grep -v '^[^:]*:[x]' /etc/passwd 2>/dev/null`
if [ "$HASHESINPASSWD" ]; then
	echo "It looks like we have password hashes in /etc/passwd!\n$HASHESINPASSWD\n"
fi

# Locate custom user accounts with some 'known default' uids
READPASSWD=`grep -v "^#" /etc/passwd | awk -F: '$3 == 0 || $3 == 500 || $3 == 501 || $3 == 502 || $3 == 1000 || $3 == 1001 || $3 == 1002 || $3 == 2000 || $3 == 2001 || $3 == 2002 { print }'`
if [ "$READPASSWD" ]; then
	echo "Sample entires from /etc/passwd (searching for uid values 0, 500, 501, 502, 1000, 1001, 1002, 2000, 2001, 2002):\n$READPASSWD\n"
fi

READSHADOW=`cat /etc/shadow 2>/dev/null`
if [ "$READSHADOW" ]; then
	echo "*** We can read the shadow file!\n$READSHADOW\n"
fi

READMASTERPASSWD=`cat /etc/master.passwd 2>/dev/null`
if [ "$READMASTERPASSWD" ]; then
	echo "*** We can read the master.passwd file!\n$READMASTERPASSWD\n"
fi

# Check for other super user accounts (uid 0)
echo "Super user account(s):"
echo `grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1 }'`
echo ""

# Sudoers
SUDOERS=`cat /etc/sudoers 2>/dev/null`
if [ "$SUDOERS" ]; then
	echo "Sudoers configuration:"
	echo cat /etc/sudoers 2>/dev/null | grep -A 1 "User priv"; cat /etc/sudoers | grep -A 1 "Allow"; echo ""
fi

# Can we sudo without a password?
SUDOPERMS=`echo '' | sudo -S -l 2>/dev/null`
if [ "$SUDOPERMS" ]; then
	echo "We can sudo without supplying a password!\n$SUDOPERMS\n"
fi

# Known 'good' breakout binaries
SUDOPWN=`echo '' | sudo -S -l 2>/dev/null | grep -w 'nmap\|perl\|'awk'\|'find'\|'bash'\|'sh'\|'man'\|'more'\|'less'\|'vi'\|'vim'\|'nc'\|'netcat'\|python\|ruby\|lua\|irb' | xargs -r ls -la 2>/dev/null`
if [ "$SUDOPWN" ]; then
	echo "*** Possible sudo PWNAGE!\n$SUDOPWN\n";
fi

# Can we read roots home directory
ROOTHOME=`ls -lah /root/ 2>/dev/null`
if [ "$ROOTHOME" ]; then
	echo "*** We can read root's home directory!\n$ROOTHOME\n"
fi

# Can we read home directories
HOMEDIRPERMS=`ls -lah /home/ 2>/dev/null`
if [ "$HOMEDIRPERMS" ]; then
	echo "Are permissions on /home directories lax:\n$HOMEDIRPERMS\n"
fi

# Are there world readable files in /home?
WORLDFILES=`find /home/ -perm -4 -type f -exec ls -al {} \; 2>/dev/null`
if [ "$WORLDFILES" ]; then
	echo "World-readable files within /home:\n$WORLDFILES\n"
fi

# Can we read home directories
HOMEDIRCONTENT=`ls -ahl ~ 2>/dev/null`
if [ "$HOMEDIRCONTENT" ]; then
	echo "Are permissions on /home directories lax:\n$HOMEDIRCONTENT\n"
fi

echo "#########################################################"
echo "# ENVIRONMENT"
echo "#########################################################\n"

PATHINFO=`echo $PATH 2>/dev/null`
if [ "$PATHINFO" ]; then
	echo "Path information:\n$PATHINFO\n"
fi

SHELLINFO=`cat /etc/shells 2>/dev/null`
if [ "$SHELLINFO" ]; then
	echo "Available shells:\n$SHELLINFO\n"
fi

echo "#########################################################"
echo "# SERVICES"
echo "#########################################################\n"

# SSH keys/hosts

SSHFILES=`find / -name "id_dsa*" -o -name "id_rsa*" -o -name "known_hosts" -o -name "authorized_hosts" -o -name "authorized_keys" 2>/dev/null |xargs -r ls -la`
if [ "$SSHFILES" ]; then
	echo "SSH keys/host information found in the following locations:\n$SSHFILES\n"
fi

SSHROOTLOGIN=`grep "PermitRootLogin " /etc/ssh/sshd_config 2>/dev/null | grep -v "#" | awk '{print  $2}'`
if [ "$SSHROOTLOGIN" ]; then
	echo "Root is allowed to login via SSH:"; grep "PermitRootLogin " /etc/ssh/sshd_config 2>/dev/null | grep -v "#"
fi

PSAUX=`ps aux 2>/dev/null`
if [ "$PSAUX" ]; then
	echo "Running processes:\n$PSAUX\n"
fi

# Lookup process binary path and permissions
PROCPERM=`ps aux | awk '{print $11}'|xargs -r ls -la 2>/dev/null |awk '!x[$0]++'`
if [ "$PROCPERM" ]; then
	echo "Process binaries & associated permissions (from above list):\n$PROCPERM"
fi

INETDREAD=`cat /etc/inetd.conf 2>/dev/null`
if [ "$INETDREAD" ]; then
	echo "Contents of /etc/inetd.conf:\n$INETDREAD\n"
fi

# Very 'rough' command to extract associated binaries from inetd.conf & show permisisons of each
INETDBINPERMS=`cat /etc/inetd.conf 2>/dev/null | awk '{print $7}' |xargs -r ls -la 2>/dev/null`
if [ "$INETDBINPERMS" ]; then
	echo "The related inetd binary permissions:\n$INETDBINPERMS\n"
fi

XINETDREAD=`cat /etc/xinetd.conf 2>/dev/null`
if [ "$XINETDREAD" ]; then
	echo "Contents of /etc/xinetd.conf:\n$XINETDREAD\n"
fi

XINETDINCD=`cat /etc/xinetd.conf 2>/dev/null |grep "/etc/xinetd.d" 2>/dev/null`
if [ "$XINETDINCD" ]; then
	echo "/etc/xinetd.d is included in /etc/xinetd.conf - associated binary permissions are listed below:"; ls -la /etc/xinetd.d 2>/dev/null
fi

XINETDBINPERMS=`cat /etc/xinetd.conf 2>/dev/null | awk '{print $7}' |xargs -r ls -la 2>/dev/null`
if [ "$XINETDBINPERMS" ]; then
	echo "The related xinetd binary permissions:\n$XINETDBINPERMS\n"
fi

INITDREAD=`ls -la /etc/init.d 2>/dev/null`
if [ "$INITDREAD" ]; then
	echo "/etc/init.d/ binary permissions:\n$INITDREAD\n"
fi

RCDREAD=`ls -la /etc/rc.d/init.d 2>/dev/null`
if [ "$RCDREAD" ]; then
	echo "/etc/rc.d/init.d binary permissions:\n$RCDREAD\n"
fi

USRRCDREAD=`ls -la /usr/local/etc/rc.d 2>/dev/null`
if [ "$USRRCDREAD" ]; then
	echo "/usr/local/etc/rc.d binary permissions:\n$USRRCDREAD\n"
fi

echo "#########################################################"
echo "# SOFTWARE & APPLICATIONS"
echo "#########################################################\n"

SUDOVER=`sudo -V | grep "Sudo version" 2>/dev/null`
if [ "$SUDOVER" ]; then
	echo "Sudo version:\n$SUDOVER\n"
fi

MYSQLVER=`mysql --version 2>/dev/null`
if [ "$MYSQLVER" ]; then
	echo "MYSQL version:\n$MYSQLVER\n"
fi

MYSQLCONNECT=`mysqladmin -uroot -proot version 2>/dev/null`
if [ "$MYSQLCONNECT" ]; then
	echo "*** We can connect to the local MYSQL service with default root/root credentials!\n$MYSQLCONNECT\n"
fi

MYSQLCONNECTNOPASS=`mysqladmin -uroot version 2>/dev/null`
if [ "$MYSQLCONNECTNOPASS" ]; then
	echo "*** We can connect to the local MYSQL service as 'root' and without a password!\n$MYSQLCONNECTNOPASS\n"
fi

POSTGVER=`psql -V 2>/dev/null`
if [ "$POSTGVER" ]; then
	echo "Postgres version:\n$POSTGVER\n"
fi

# Attempt to connect to template databases
arr=("pgsql" "postgres")
for i in ${arr[@]}
do
	POSTCON1=`psql -U $i template0 -c 'select version()' 2>/dev/null | grep version`
	if [ "$POSTCON1" ]; then
		echo "*** We can connect to Postgres DB 'template0' as user $i with no password!\n$POSTCON1\n"
	fi
	POSTCON2=`psql -U $i template1 -c 'select version()' 2>/dev/null | grep version`
	if [ "$POSTCON2" ]; then
		echo "*** We can connect to Postgres DB 'template1' as user $i with no password!\n$POSTCON2\n"
	fi
done

APACHEVER=`apache2 -v 2>/dev/null; httpd -v 2>/dev/null`
if [ "$APACHEVER" ]; then
	echo "Apache version:\n$APACHEVER\n"
fi

APACHEUSR=`cat /etc/apache2/envvars 2>/dev/null |grep -i 'user\|group' |awk '{sub(/.*\export /,"")}1'`
if [ "$APACHEUSR" ]; then
	echo "Apache user configuration:\n$APACHEUSR\n"
fi

echo "#########################################################"
echo "# JOBS & TASKS"
echo "#########################################################\n"

CRONJOBS=`ls -la /etc/cron* 2>/dev/null`
if [ "$CRONJOBS" ]; then
	echo "Cron jobs:\n$CRONJOBS\n"
fi

CRONJOBWWPERMS=`find /etc/cron* -perm -0002 -exec ls -la {} \; -exec cat {} 2>/dev/null \;`
if [ "$CRONJOBWWPERMS" ]; then
	echo "*** World-writable cron jobs and file contents:\n$CRONJOBWWPERMS\n"
fi

CRONTAB=`cat /etc/crontab 2>/dev/null`
if [ "$CRONTAB" ]; then
	echo "Crontab contents:\n$CRONTAB\n"
fi

CRONALLOWDENY=`ls -la /etc/cron.allow 2>/dev/null && cat /etc/cron.allow 2>/dev/null; ls -la /etc/cron.deny 2>/dev/null && cat /etc/cron.deny 2>/dev/null`
if [ "$CRONALLOWDENY" ]; then
	echo "Cron Alloy/Deny entries:\n$CRONALLOWDENY\n"
fi

CRONTABVAR=`ls -la /var/spool/cron/crontabs 2>/dev/null`
if [ "$CRONTABVAR" ]; then
	echo "Anything interesting in /var/spool/cron/crontabs:\n$CRONTABVAR\n"
fi

ANACRONJOBS=`ls -la /etc/anacrontab 2>/dev/null; cat /etc/anacrontab 2>/dev/null`
if [ "$ANACRONJOBS" ]; then
	echo "Anacron jobs and associated file permissions:\n$ANACRONJOBS\n"
fi

ANACRONTAB=`ls -la /var/spool/anacron 2>/dev/null`
if [ "$ANACRONTAB" ]; then
	echo "When were jobs last executed (/var/spool/anacron contents):\n$ANACRONTAB\n"
fi

# Pull out account names from /etc/passwd and see if any users have associated cronjobs (priv command)
CRONOTHER=`cat /etc/passwd | cut -d ":" -f 1 | xargs -n1 crontab -l -u 2>/dev/null`
if [ "$CRONOTHER" ]; then
	echo "Jobs held by all users:\n$CRONOTHER\n"
fi

echo "#########################################################"
echo "# NETWORKING"
echo "#########################################################\n"

NICINFO=`/sbin/ifconfig -a 2>/dev/null`
if [ "$NICINFO" ]; then
	echo "Network & IP info:\n$NICINFO\n"
fi

NSINFO=`cat /etc/resolv.conf 2>/dev/null | grep "nameserver"`
if [ "$NSINFO" ]; then
	echo "Nameserver(s):\n$NSINFO\n"
fi

DEFROUTE=`route 2>/dev/null | grep default`
if [ "$DEFROUTE" ]; then
	echo "Default route:\n$DEFROUTE\n"
fi

TCPSERVS=`netstat -antp 2>/dev/null`
if [ "$TCPSERVS" ]; then
	echo "Listening TCP:\n$TCPSERVS\n"
fi

UDPSERVS=`netstat -anup 2>/dev/null`
if [ "$UDPSERVS" ]; then
	echo "Listening UDP:\n$UDPSERVS\n"
fi

echo "#########################################################"
echo "# INTERESTING FILES"
echo "#########################################################\n"

echo "Useful file locations:";which nc 2>/dev/null; which netcat 2>/dev/null; which wget 2>/dev/null; which nmap 2>/dev/null; which gcc 2>/dev/null
echo ""
echo "Can we read/write sensitive files:";ls -la /etc/passwd 2>/dev/null; ls -la /etc/group 2>/dev/null; ls -la /etc/profile 2>/dev/null; ls -la /etc/shadow 2>/dev/null; ls -la /etc/master.passwd 2>/dev/null

FINDSUID=`find / -perm -4000 -type f 2>/dev/null`
if [ "$FINDSUID" ]; then
	echo "SUID files:\n$FINDSUID\n"
fi

# :ist of 'interesting' suid files - feel free to make additions
INTSUID=`find / -perm -4000 -type f 2>/dev/null | grep -w 'nmap\|perl\|'awk'\|'find'\|'bash'\|'sh'\|'man'\|'more'\|'less'\|'vi'\|'vim'\|'nc'\|'netcat'\|python\|ruby\|lua\|irb\|pl' | xargs -r ls -la`
if [ "$INTSUID" ]; then
	echo "*** Possibly interesting SUID files:\n$INTSUID\n"
fi

WWSUID=`find / -perm -4007 -type f 2>/dev/null`
if [ "$WWSUID" ]; then
	echo "World-writable SUID files:\n$WWSUID\n"
fi

WWSUIDRT=`find / -uid 0 -perm -4007 -type f 2>/dev/null`
if [ "$WWSUIDRT" ]; then
	echo "World-writable SUID files owned by root:\n$WWSUIDRT\n"
fi

FINDGUID=`find / -perm -2000 -type f 2>/dev/null`
if [ "$FINDGUID" ]; then
	echo "GUID files:\n$FINDGUID\n"
fi

# List of 'interesting' guid files - feel free to make additions
INTGUID=`find / -perm -2000 -type f 2>/dev/null | grep -w 'nmap\|perl\|'awk'\|'find'\|'bash'\|'sh'\|'man'\|'more'\|'less'\|'vi'\|'vim'\|'nc'\|'netcat'\|python\|ruby\|lua\|irb\|pl' | xargs -r ls -la`
if [ "$INTGUID" ]; then
	echo "*** Possibly interesting GUID files:\n$INTGUID\n"
fi

WWGUID=`find / -perm -2007 -type f 2>/dev/null`
if [ "$WWGUID" ]; then
	echo "World-writable GUID files:\n$WWGUID\n"
fi

WWGUIDRT=`find / -uid 0 -perm -2007 -type f 2>/dev/null`
if [ "$WWGUIDRT" ]; then
	echo "World-writable GUID files owned by root:\n$WWGUIDRT\n"
fi

# List all world-writable files excluding /proc
WWFILES=`find / ! -path "*/proc/*" -perm -2 -type f -print 2>/dev/null`
if [ "$WWFILES" ]; then
 	echo "World-writable files (excluding /proc):\n$WWFILES\n"
fi

USRPLAN=`find /home -iname *.plan -exec ls -la {} \; -exec cat {} 2>/dev/null \;`
if [ "$USRPLAN" ]; then
	echo "Plan file permissions and contents:\n$USRPLAN\n"
fi

BSDUSRPLAN=`find /usr/home -iname *.plan -exec ls -la {} \; -exec cat {} 2>/dev/null \;`
if [ "$BSDUSRPLAN" ]; then
	echo "Plan file permissions and contents:\n$BSDUSRPLAN\n"
fi

RHOSTSUSR=`find /home -iname *.rhosts -exec ls -la {} 2>/dev/null \; -exec cat {} 2>/dev/null \;`
if [ "$RHOSTSUSR" ]; then
	echo "rhost config file(s) and file contents:\n$RHOSTSUSR\n"
fi

BSDRHOSTSUSR=`find /usr/home -iname *.rhosts -exec ls -la {} 2>/dev/null \; -exec cat {} 2>/dev/null \;`
if [ "$BSDRHOSTSUSR" ]; then
	echo "rhost config file(s) and file contents:\n$BSDRHOSTSUSR\n"

fi

RHOSTSSYS=`find /etc -iname hosts.equiv -exec ls -la {} 2>/dev/null \; -exec cat {} 2>/dev/null \;`
if [ "$RHOSTSSYS" ]; then
	echo "Hosts.equiv file details and file contents:\n$RHOSTSSYS\n"
fi

NFSEXPORTS=`ls -la /etc/exports 2>/dev/null; cat /etc/exports 2>/dev/null`
if [ "$NFSEXPORTS" ]; then
	echo "NFS config details:\n$NFSEXPORTS\n"
fi

FSTAB=`cat /etc/fstab 2>/dev/null |grep username |awk '{sub(/.*\username=/,"");sub(/\,.*/,"")}1'| xargs -r echo username:; cat /etc/fstab 2>/dev/null |grep password |awk '{sub(/.*\password=/,"");sub(/\,.*/,"")}1'| xargs -r echo password:; cat /etc/fstab 2>/dev/null |grep domain |awk '{sub(/.*\domain=/,"");sub(/\,.*/,"")}1'| xargs -r echo domain:`
if [ "$FSTAB" ]; then
	echo "*** Looks like there are credentials in /etc/fstab!\n$FSTAB\n"
fi

FSTABCRED=`cat /etc/fstab 2>/dev/null |grep cred |awk '{sub(/.*\credentials=/,"");sub(/\,.*/,"")}1'| xargs -I{} sh -c 'ls -la {}; cat {}'`
if [ "$FSTABCRED" ]; then
	echo "*** /etc/fstab contains a credentials file!\n$FSTABCRED\n"
fi

ALLCONF=`find /etc/ -maxdepth 1 -name *.conf -type f -exec ls -la {} \; 2>/dev/null`
if [ "$ALLCONF" ]; then
	echo "All *.conf files in /etc (recursive 1 level):\n$ALLCONF\n"
fi

USRHIST=`ls -la ~/.*_history 2>/dev/null`
if [ "$USRHIST" ]; then
	echo "Current user's history files:\n$USRHIST\n"
fi

ROOTHIST=`ls -la /root/.*_history 2>/dev/null`
if [ "$ROOTHIST" ]; then
	echo "*** Root's history files are accessible!\n$ROOTHIST\n"
fi

READMAIL=`ls -la /var/mail 2>/dev/null`
if [ "$READMAIL" ]; then
	echo "Any interesting mail in /var/mail:\n$READMAIL\n"
fi

READMAILROOT=`head /var/mail/root 2>/dev/null`
if [ "$READMAILROOT" ]; then
	echo "*** We can read /var/mail/root! (snippet below)\n$READMAILROOT\N"
fi

echo "### SCAN COMPLETE ####################################"

### END
