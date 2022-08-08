# reverse-shell

[![made-with-python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)

This is a reverse shell written in Python used to to target a machine and gain remote shell access.

It consists of two distinct scripts:
- ***reverse-shell-server.py***: script with open listener port on which it receives the connection, by which command execution can be achieved.
- ***reverse-shell-client.py***: script in which the target machine (client) communicates back to the attacking machine (server).

![reverseshell](https://user-images.githubusercontent.com/61552222/162288693-4ef4de3b-8100-450c-82c5-55417ae0fb0d.png)