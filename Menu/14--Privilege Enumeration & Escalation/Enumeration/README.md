[Understanding Privilege Escalation and 5 Common Attack Techniques](https://www.cynet.com/network-attacks/privilege-escalation/)
=================================================================

Privilege escalation is a type of [network attack used to](https://www.cynet.com/cyber-attacks/network-attacks-and-network-security-threats/) gain unauthorized access to systems within a security perimeter.

Attackers start by finding weak points in an organization’s defenses and gaining access to a system. In many cases that first point of penetration will not grant attackers with the level of access or data they need. They will then attempt privilege escalation to gain more permissions or obtain access to additional, more sensitive systems.

In some cases, attackers attempting privilege escalation find the “doors are wide open” – inadequate security controls, or failure to follow the principle of least privilege, with users having more privileges than they actually need. In other cases, attackers exploit software vulnerabilities, or use specific techniques to overcome an operating system’s permissions mechanism.

We’ll cover the five most common privilege escalation attack vectors, and show specific examples of privilege escalation techniques attackers use to compromise Windows and Linux systems.

In this article:

*   [Horizontal vs. Vertical Privilege Escalation](#heading-1)
*   [Why Is It Important to Prevent Privilege Escalation Attacks?](#heading-2)
*   [How Do Privilege Escalation Attacks Work?](#heading-3)
*   [Privilege Escalation Attack Vectors](#heading-4)
    *   [1\. Credential Exploitation](#heading-5)
    *   [2\. Vulnerabilities and Exploits](#heading-6)
    *   [3\. Misconfigurations](#heading-7)
    *   [4\. Malware](#heading-8)
    *   [5\. Social Engineering](#heading-9)
*   [Windows Privilege Escalation Techniques](#heading-10)
    *   [Access Token Manipulation](#heading-11)
    *   [Bypass User Account Control](#heading-12)
    *   [DLL Search Order Hijacking](#heading-13)
*   [Linux Privilege Escalation](#heading-14)
    *   [What Is Enumeration?](#heading-15)
    *   [Kernel Exploit](#heading-16)
    *   [Exploiting SUDO Rights](#heading-17)
*   [Protecting Against Privilege Escalation with Cynet](#heading-18)

[![](https://www.cynet.com/wp-content/uploads/2019/07/700X280-SEO-Advanced-Threat-Protection-Beyond-the-AV.png)

![](https://www.cynet.com/wp-content/uploads/2019/07/700X280-SEO-Advanced-Threat-Protection-Beyond-the-AV.png)

](https://go.cynet.com/resources-white-paper-advanced-threat-protection-beyond-the-av?utm_source=attacks-guide)

Horizontal vs. Vertical Privilege Escalation
--------------------------------------------

There are two types of privilege escalation:

*   Horizontal privilege escalation—an attacker expands their privileges by taking over another account and misusing the legitimate privileges granted to the other user. To learn more about horizontal privilege escalation see our guide on [lateral movement](https://www.cynet.com/network-attacks/lateral-movement-challenges-apt-and-automation/) .
*   Vertical privilege escalation—an attacker attempts to gain more permissions or access with an existing account they have compromised. For example, an attacker takes over a regular user account on a network and attempts to gain administrative permissions or root access. This requires more sophistication and may take the shape of an [Advanced Persistent Threat](https://www.cynet.com/cyber-attacks/advanced-persistent-threat-apt-attacks/) .

Why Is It Important to Prevent Privilege Escalation Attacks?
------------------------------------------------------------

For attackers, privilege escalation is a means to an end. It allows them to gain access to an environment, persist and deepen their access, and perform more severe malicious activity. For example, privilege escalation can transform a simple malware infection into a catastrophic data breach

Privilege escalations allow attackers to open up new attack vectors on a target system. For example, it can involve:

*   Gaining access to other connected systems
*   Deploying additional malicious payloads on a target system
*   Adjusting security settings or privileges
*   Gaining access to applications or data on a system beyond the privileges of the original compromised account
*   In extreme cases, gaining root access to a target system or an entire network

When security teams suspect privilege escalation it is important to perform an in-depth investigation. Signs of privilege escalation include malware on sensitive systems, suspicious logins, and unusual network communications.

Any privilege escalation incident must be dealt with as a severe security incident and, depending on the organization’s compliance obligations, might have to be reported to authorities.

How Do Privilege Escalation Attacks Work?
-----------------------------------------

Privilege escalation attacks typically involve the exploitation of vulnerabilities such as software bugs, misconfigurations, and incorrect access controls.

Every account that interacts with a system has some privileges. Standard users typically have limited access to system databases, sensitive files, or other resources. In some cases, users have excessive access to sensitive resources, and may not even be aware of it, because they do not try to gain access beyond their entitlements. In other cases, attackers can manipulate weaknesses of the system to increase privileges.

By taking over a low-level user account and either abusing excessive privileges, or increasing privileges, a malicious attacker has an entry point to a sensitive system. Attackers might dwell in a system for some time, performing reconnaissance and waiting for an opportunity to deepen their access. Eventually, they will find a way to escalate privileges to a higher level than the account that was initially compromised.

Depending on their goal, attackers can continue horizontally to take control of additional systems, or escalate privileges vertically, to gain admin and root control, until they have access to the entire full environment.

Privilege Escalation Attack Vectors
-----------------------------------

Here are the most important attack vectors used by attackers to perform privilege escalation.

### 1\. Credential Exploitation

Single factor authentication leaves the door wide open to attackers planning on performing privilege escalation. If attackers obtain a privileged user’s account name – even without the password – it is a matter of time before they obtain the password. Once they obtain a working password, they can move laterally through the environment undetected.

Even if the attacker is detected and the organization resets the password or reimages the affected system, the attacker may have a way to retain a persistent presence – for example, via a compromised mobile phone or rootkit malware on a device. This makes it important to thoroughly eradicate the threat and continuously monitor for anomalies.

Here are common ways attackers can gain access to credentials:

*   Password exposure – in many cases passwords are available in open site, because employees share them with others, reuse them, or store them in plaintext on their machines.
*   Password guessing – attackers can use publicly available information about the account owner to make educated guesses about their password. If attackers guess one password, they can often gain access to multiple resources due to password reuse.
*   Shoulder surfing – attackers can observe the actions of privileged individuals, either in person, via unauthorized access to cameras, or through keyloggers on their devices, and thus gain access to passwords.
*   Dictionary attacks – the use of lists of common words to automatically combine possible passwords and try to access an account. Attackers can customize the dictionary according to known password length and requirements. Password complexity policies and limiting the number of password retries are effective against these attacks.
*   Rainbow table attacks – a rainbow table assumes the attacker knows the algorithm used to hash passwords, and converts these hashes into original passwords. These attacks need some seed information to succeed.
*   Brute force password attacks – attackers typically use these as a last resort. They are only effective against shorter passwords with limited complexity, and where there are no limits on the number of password retries.
*   Password spraying – this is the opposite of a brute force attack: an automated attempt to gain access to a large number of accounts using a few very common passwords.
*   Pass-the-Hash (PtH) – this involves using the NT Lan Manager hash of a password instead of the original plaintext password. The hash can be scraped from active memory or obtained by other techniques that exploit weaknesses in the authentication protocol.
*   Security questions – many password mechanisms rely on security questions in case the user forgets their password. These are questions about the user’s life, many of which are easy to obtain from social media or individuals who know the user, or from the dark web (many security question databases were exposed in previous breaches).
*   Credential stuffing – attackers use a list of usernames or email addresses and passwords they obtained from previous breaches or the dark web, and try it against accounts in a target system. Because individuals commonly reuse passwords, this technique has high success rates.
*   Password changes and resets – attackers can easily compromise password reset mechanisms. Whenever a password is reset, there is an implicit risk in the process of transmission and storage of the new password. Attackers can gain access to a password legitimately reset by a user, or request password reset themselves after compromising a device.

### 2\. Vulnerabilities and Exploits

Attackers can perform privilege escalation by exploiting vulnerabilities in the design, implementation, or configuration of multiple systems – including communication protocols, communication transports, operating systems, browsers, web applications, cloud systems, and network infrastructure.

The level of risk depends on the nature of the vulnerability and how critical is the system in which the vulnerability is discovered. Only a small fraction of vulnerabilities allow vertical privilege escalation. However, any vulnerability that can allow an attacker to change privileges should be treated with high severity.

See the following sections for examples of vulnerabilities that can lead to privilege escalation on Windows and Linux.

### 3\. Misconfigurations

Privilege escalation very commonly results from misconfiguration, such as failure to configure authentication for a sensitive system, mistakes in firewall configuration, or open ports.

Here are a few examples of security misconfigurations that can lead to privilege escalation:

*   Cloud storage buckets exposed to the Internet with no authentication.
*   Default passwords used for admin or root accounts (this is common for IoT devices).
*   Insecure defaults for a newly installed system, which are not changed due to negligence or lack of knowledge.
*   Backdoor into the environment which was known to administrators but not documented, and is discovered by an attacker.

### 4\. Malware

Attackers can use many types of malware, including trojans, spyware, worms, and ransomware, to gain a hold on an environment and perform privilege escalation. Malware can be deployed by exploiting a vulnerability, can be packaged with legitimate applications, via malicious links or downloads combined with social engineering, or via weaknesses in the supply chain.

Malware typically runs as an operating system process, and has the permissions of the user account from which it was executed. So there are two directions for exploitation:

*   Attackers who gain access to a user account can deploy malware at user level, and then find a way to increase their privileges.
*   Attacks who have already escalated privileges can deploy malware at admin or root level, and use it to gain persistent access to an entire environment.

Here are common examples of malware that can be used for privilege escalation:

*   Worms – malware that relies on bugs and vulnerabilities to deliver malicious payloads and propagate to other systems. Worms are a common mechanism for horizontal privilege escalation.
*   Rootkits – a malicious process running on a target device which grants the attacker complete control over its operating system, enabling vertical privilege escalation.
*   Bad bots – automated mechanisms that perform malicious actions against target resources. Bots can be used in the reconnaissance phase of a privilege escalation attack, and are also commonly used to spread worms.
*   Trojan – malware disguised as a normal file or application, which persists on the user’s device, and can deploy other malware or modify system operations. Many authentication based attacks rely on trojans.
*   Ransomware – ransomware can rapidly spread across networks and serve as a horizontal privilege escalation mechanism.
*   Adware – malware that loads unwanted advertisements to a user. Interacting with these ads can result in additional malware deployed on the device, serving as a vertical privilege escalation mechanism.
*   Spyware – spyware performs surveillance on a device, for example by monitoring a user’s activity on the keyboard or granting access to the screen, microphone, or camera. Attackers can use these inputs to steal credentials and compromise user accounts.

### 5\. Social Engineering

Social engineering is used in almost all cyber attacks. It relies on manipulating people into violating security procedures and divulging sensitive or personal information. It is a very common technique used by attackers to gain unauthorized access and escalate privileges.

Social engineering is highly effective because it circumvents security controls by preying on human weaknesses and emotions. Attackers realize that it is much easier to trick or manipulate a privileged user than break into a well-defended security system.

Here are common types of social engineering attacks and how they are used for privilege escalation:

*   Phishing – an attacker sends a message that appears to be legitimate, with a malicious link or attachment. If the victim clicks the link or executes the attachment, the attacker typically deploys malware and compromises their device. Depending on the type of malware, this may allow the attacker to take over the user’s credentials.
*   Spear phishing – a sophisticated form of phishing custom-made for a specific privileged user or group of users. Spear phishing can allow attackers to take over highly privileged accounts like those belonging to system administrators, finance employees, or senior executives.
*   Vishing (voice phishing) – attackers call company employees impersonating an authoritative figure, such as the company’s IT staff, the bank, or law enforcement. Employees can be tricked into providing sensitive information like passwords or access details, or even coerced into installing malware on their device.
*   Scareware – a malicious software program that tricks victims into thinking their devices are infected, and asks them to download additional software or execute an action, which in reality deploys malware on their machine. Like other techniques, this can be used to compromise a victim’s device and take over their account.
*   Watering hole – an attacker compromises a website visited by a group of privileged individuals. For example, this could be a certain page on a corporate intranet. Any employee visiting the page may have a malicious script run in their browser, or can be tricked into clicking a malicious link.
*   Pharming – a fraud scheme in which software deployed on the victim’s device sends them to a fake website, impersonating a trusted institution like a bank or government website. The victim is then tricked into providing personal details, which the attacker can use to take over their account.

Windows Privilege Escalation Techniques and How to Mitigate Them
----------------------------------------------------------------

There are many privilege escalation methods in Windows operating systems. Here is a brief review of three common methods and how you can prevent them.

### Access Token Manipulation

Attack description

Windows uses access tokens to determine the owners of running processes. When a process tries to perform a task that requires privileges, the system checks who owns the process and to see if they have sufficient permissions. Access token manipulation involves fooling the system into believing that the running process belongs to someone other than the user who started the process, granting the process the permissions of the other user.

**Techniques**

There are three ways to achieve access token manipulation:

*   Duplicating an access token using the Windows DuplicateToken(Ex) and then using ImpersonateLoggedOnUserfunction or SetThreadToken function to assign the impersonated token to a thread.
*   Creating a new process with an impersonated token using the DuplicateToken(Ex) function together with the CreateProcessWithTokenW function.
*   Leveraging username and password to create a token using the LogonUser function. The attacker possesses a username and password, and without logging on, they create a logon session, obtain the new token and ue SetThreadToken to assign it to a thread.

In this method, an adversary has a username and password, but the user is not logged

**Mitigation**

There is no way to disable access tokens in Windows. However, to perform this technique an attacker must already have administrative-level access. The best way to prevent the attack is to assign administrative rights in line with the least-privilege principle, regularly review administrative accounts and revoke them if access is no longer needed. Also, monitor privileged accounts for any sign of anomalous behavior.

### Bypass User Account Control

**Attack description**

The Windows user account control (UAC) mechanism creates a distinction between regular users and administrators. It limits all applications to standard user permissions unless specifically authorized by an administrator, to prevent malware from compromising the operating system. However, if UAC protection is not at the highest level, some Windows programs can escalate privileges, or execute COM objects with administrative privileges.

**Mitigation**

Review IT systems and ensure UAC protection is set to the highest level, or if this is not possible, apply other security measures. Regularly review which accounts are a local administrator group on sensitive systems and remove regular users who should not have administrative rights.

### DLL Search Order Hijacking

**Attack description**

Attackers can perform “DLL preloading”. This involves planting a malicious DLL with the same name as a legitimate DLL, in a location which is searched by the system before the legitimate DLL. Often this will be the current working directory, or in some cases attackers may remotely set the working directory to an external file volume. The system finds the DLL in the working folder, thinking it is the legitimate DLL, and executes it.

**Techniques**

There are several other ways to achieve DLL search order hijacking:

*   Replacing an existing DLL or modifying a .manifest or .local redirection file, directory, or junction
*   Performing search order DLL hijacking on a vulnerable program that has a higher privilege level, causing the attacker’s DLL to run at the same privilege level. This can be used to elevate privileges from user to administrator, or from administrator to SYSTEM.
*   Covering the attack by loading the legitimate DLLS together with the malicious DLLs, so that systems appear to run as usual.

**Mitigation**

Here are several ways to prevent a DLL search order hijack:

*   Disallow loading of remote DLLs
*   Enable Safe DLL Search Mode to force search for system DLLs in directories with greater restrictions
*   Use auditing tools such as PowerSploit to detect DLL search order hijacking vulnerabilities and correct them
*   Identify and block software executed through search order hijacking, using whitelisting tools like AppLocker.

Linux Privilege Escalation
--------------------------

### What Is Enumeration?

In Linux systems, attackers use a process called “enumeration” to identify weaknesses that may allow privilege escalation. Enumeration involves:

*   Using Google searches, port scanning and direct interaction with a system to learn more about it and see how it responds to inputs.
*   Seeing if compilers, or high-level programming languages like Perl or Python, are available, which can allow an attacker to run exploit code.
*   Identifying software components, such as web servers and their versions.
*   Retrieving data from key system directories such as /etc, /proc, ipconfig, lsof, netstat and uname.

Attackers use automated tools to perform enumeration on Linux systems. You should also use the same tools to pre-empt an attack, by scanning your own system, identifying weaknesses, and addressing them.

Below are two specific techniques for escalating privilege on Linux and how to mitigate them.

### Kernel Exploit

**Attack description**

From time to time, vulnerabilities are discovered in the Linux kernel. Attackers can exploit these vulnerabilities to gain root access to a Linux system, and once the system is infected with the exploit, there is no way to defend against it.

Attackers go through the following steps:

1.  Learn about the vulnerabilities
2.  Develop or acquire exploit code
3.  Transfer the exploit onto the target
4.  Execute the exploit on the target

**Mitigation**

Follow security reports and promptly install Linux updates and patches. Restrict or remove programs that enable file transfers, such as FTP, SCP, or curl, or restrict them to specific users or IPs. This can prevent transfer of an exploit onto a target device. Remove or restrict access to compilers, such as GCC, to prevent exploits from executing. You should also limit which folders are writable or executable.

### Exploiting SUDO Rights

**Attack description**

SUDO is a Linux program that lets users run programs with the security privileges of another user. Older versions would run as the superuser (SU) by default. Attackers can try to compromise a user who has SUDO access to a system, and if successful, they gain root privileges.

A common scenario is administrators granting access to some users to perform supposedly harmless SUDO commands, such as ‘find’. However, the ‘find’ command container parameters that enable command execution, and so if attackers compromise that user’s account, they can execute commands with root privileges.

**Mitigation**

Never give SUDO rights to the programming language compiler, interpreter or editors, including vi, more, less, nmap, perl, ruby, python, gdb. Do not give sudo rights to any program that enables running a shell. And severely limit SUDO access using the least-privilege principle.

In this article, we were only able to cover a few common privilege escalation attacks. For more attacks and additional details on how to mitigate and detect each attack, refer to [MITRE ATT&CK](https://attack.mitre.org/tactics/TA0004/) privilege escalation tactics.

Protecting Against Privilege Escalation with Cynet
--------------------------------------------------

Cynet 360 is a holistic security solution that can help with three important aspects of privilege escalation—network security, endpoint security, and behavioral analytics.

1\. Network Analytics

Network analytics is essential to detect and prevent initial penetration and privilege escalation on your network.

The challenge—sophisticated attackers target an organization’s weak points. Following an initial endpoint compromise, the attacker looks to expand their reach and gain privileges and access to other resources in your environment. Their ultimate aim is to access your sensitive data and to transfer it to their premises. Key parts of these attack vectors can only be discovered via generated anomalous network traffic.

The solution— [Cynet Network Analytics](https://www.cynet.com/platform/threat-protection/network-analytics/) continuously monitors network traffic to trace and prevent malicious activity that is otherwise invisible, such as credential theft and data exfiltration.

2\. Endpoint Protection and EDR

Unauthorized access to endpoints is a common entry point in a privilege escalation attack.

The challenge—attackers with strong motivation will eventually bypass the prevention measures on the endpoint. They will use several tools to work undetected until they achieve their desired outcome.

The solution— [Cynet EDR](https://www.cynet.com/platform/threat-protection/edr-endpoint-detection-and-response/) continuously monitors the endpoints, so defenders can detect the active malicious presence, immediately understand its impact and scope, and respond.

3\. User and Event Behavioral Analytics

Behavioral analytics can help you detect anomalous activity on organizational systems or user accounts, which may indicate intrusion attempts or privilege escalation. It is also especially important to detect privilege escalation conducted by malicious insiders.

The challenge—attackers with clear objectives in mind, or those with insider privileges, might bypass detection, succeed in compromising user accounts and use them for data access and lateral movement.

**The solution—**

[Cynet User Behavior Analysis](https://www.cynet.com/platform/threat-protection/uba-user-behavior-analytics/) monitors and profiles user activity continuously, to establish a legitimate behavioral baseline and detect anomalous activity that suggests compromise of user accounts or privilege escalation.
