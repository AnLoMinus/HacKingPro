<pre>
- sudo wget http://downloads.nessus.org/nessus3dl.php?file=Nessus-6.11.1-debian6_amd64.deb
- sudo dpkg -i Nessus-6.11.1-debian6_amd64.deb
  - Incase you have issues with the dpkg command, make sure "sudo apt-get install g++"
- sudo /etc/init.d/nessusd start
- sudo /etc/init.d/nessusd stop
- https://NessusIP:8834/
- Default Nessus Accounts:
  - admin: admin
  - auditor: auditor
- Change password for the Default accounts:
  - #cd /opt/nessus/sbin/
  - /opt/nessus/sbin/#nessuscli chpasswd admin
  - /opt/nessus/sbin/#nessuscli chpasswd auditor
 </pre>
  
