# SSHpwn

**Brute Force - Password - SSH**

![](/1.png)

- <kbd>Download / Install</kbd>

```cmd
root@kali:~# wget -q "https://raw.githubusercontent.com/d4t4s3c/SSHpwn/main/SSHpwn.sh" -O /usr/bin/SSHpwn
root@kali:~# wget -q "https://raw.githubusercontent.com/d4t4s3c/SSHpwn/main/techyou.txt"
root@kali:~# chmod +x /usr/bin/SSHpwn
```

- <kbd>Use</kbd>

```cmd
root@kali:~# SSHpwn -u <USER> -w <WORDLIST> -t <TARGET> -p <PORT>
```

---
