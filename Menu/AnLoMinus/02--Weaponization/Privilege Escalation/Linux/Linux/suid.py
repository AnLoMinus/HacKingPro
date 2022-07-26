#!/usr/bin/env python

import os
import optparse
import re
import requests
import urllib.request
import time
from bs4 import BeautifulSoup

suids = [
    "apt-get", "apt", "aria2c", "arp", "ash", "awk", "base64", "bash", "busybox", "cancel", "cat", "chmod", "chown", "cp", "cpan", "cpulimit", "crontab", "csh", "curl", "cut", "dash", "date", "dd", "diff", "dmesg", "dmsetup", "dnf", "docker", "dpkg", "easy_install", "ed", "emacs", "env", "expand", "expect", "facter", "file", "find", "finger", "flock", "fmt", "fold", "ftp", "gawk", "gdb", "gimp", "git", "grep", "head", "ionice", "ip", "irb", "jjs", "journalctl", "jq", "jrunscript", "ksh", "ld.so", "ldconfig", "less", "logsave", "ltrace", "lua", "mail", "make", "man", "mawk", "more", "mount", "mtr", "mv", "mysql" , "nano", "nawk", "nc", "nice", "nl", "nmap", "node", "od", "openssl", "perl", "pg", "php", "pic", "pico", "pip", "puppet" , "python", "readelf", "red", "rlogin" , "rlwrap", "rpm", "rpmquery", "rsync" , "ruby" , "run-mailcap" , "run-parts" , "rvim" , "scp" , "screen" , "script" , "sed" , "service" , "setarch" , "sftp" , "shuf" , "smbclient" , "socat" , "sort" , "sqlite3" , "ssh" , "start-stop-daemon" , "stdbuf" , "strace" , "systemctl" , "tail" , "tar" , "taskset" , "tclsh" , "tcpdump" , "tee" , "telnet" , "tftp" , "time" , "timeout" , "tmux" , "ul" , "unexpand" , "uniq" , "unshare" , "vi" , "vim" , "watch" , "wget" , "whois" , "wish" , "xargs" , "xxd" , "yum" , "zip" , "zsh" , "zypper"]


def get_suid():
    print("[+] Searching for SUID files...")
    suid_found = os.system('find / -perm -u=s -type f 2>/dev/null')

    if suid_found:
        print("[+] Comparing SUID files found to the GTFO list...")

    else:
        print("[-] Could not find SUID files.")

get_suid()
