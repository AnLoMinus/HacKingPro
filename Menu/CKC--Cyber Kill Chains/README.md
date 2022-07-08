# CKC - Cyber Kill Chains

# The Future of the Cyber Kill Chain

---

## The History of the “Cyber Kill Chain”
### The term “Kill Chain” originates from a military concept and phased-based attack structure. The structure is as follows:
- [x] 1. Target identification
- [x] 2. Force dispatch to target
- [x] 3. Decision and order to attack the target
- [x] 4. Destruction of the target

## `Four Fs` Military Term used in the United States Military, especially during World War II.
### Designed to be easy to remember, the "Four Fs" are as follows:
- [x] 1. `Find the enemy` – Locate the enemy.
- [x] 2. `Fix the enemy` – Pin them down with suppressing fire.
- [x] 3. `Fight the enemy` – Engage the enemy in combat or flank the enemy – Send soldiers to the enemy's sides or rear.
- [x] 4. `Finish the enemy` – Eliminate all enemy combatants.

---

## Alternatives
### This model stresses that a threat does not end after one cycle.
- [x] 1. Reconnaissance
- [x] 2. Initial intrusion into the network
- [x] 3. Establish a backdoor into the network.
- [x] 4. Obtain user credentials.
- [x] 5. Install various utilities.
- [x] 6. Privilege escalation/ lateral movement/ data exfiltration
- [x] 7. Maintain persistence.

---

![image](https://user-images.githubusercontent.com/51442719/178073880-32f5f2ce-1181-4fb8-92c4-213eb5a8ab4a.png)

# The Phases of Lockheed Martin’s Kill Chain Model:
- [x] 1. `Reconnaissance`
  - Intruder picks a target, researches it, and looks for vulnerabilities
  - Intruder selects target, researches it, and attempts to identify vulnerabilities in the target network.
- [x] 2. `Weaponization`
  - Intruder develops malware designed to exploit the vulnerability
  - Intruder creates remote access malware weapon, such as a virus or worm, tailored to one or more vulnerabilities.
- [x] 3. `Delivery`
  - Intruder transmits the malware via a phishing email or another medium
  - Intruder transmits weapon to target (e.g., via e-mail attachments, websites or USB drives)
- [x] 4. `Exploitation`
  - The malware begins executing on the target system
  - Malware weapon's program code triggers, which takes action on target network to exploit vulnerability.
- [x] 5. `Installation`
  - The malware installs a backdoor or other ingress accessible to the attacker
  - Malware weapon installs access point (e.g., "backdoor") usable by intruder.
- [x] 6. `Command and Control`
  - The intruder gains persistent access to the victim’s systems/network
  -  Malware enables intruder to have "hands on the keyboard" persistent access to target network.
- [x] 7. `Actions on Objective`
  - Intruder initiates end goal actions, such as data theft, data corruption, or data destruction
  - Intruder takes action to achieve their goals, such as data exfiltration, data destruction, or encryption for ransom.

---

## The Stages of MITRE ATT&CK Kill Chain Model include:

- [x] 1. Initial Access
- [x] 2. Execution
- [x] 3. Persistence
- [x] 4. Privilege Escalation
- [x] 5. Defense Evasion
- [x] 6. Credential Access
- [x] 7. Discovery
- [x] 7. Lateral Movement
- [x] 9. Collection
- [x] 10. Exfiltration
- [x] 11 Command and Control

---

## 18 Phases:

- [x] 1. `Reconnaissance`: Researching, identifying, and selecting targets through active or passive surveillance.
- [x] 2. `Weaponization`: Methods of preparation aimed at setting up the required infrastructure for the attack.
  - [x] Viruses
  - [x] Ransomware
  - [x] Worms
  - [x] Trojans
  - [x] Rootkits
  - [x] Keyloggers
  - [x] Logic bombs
  - [x] Adware
  - [x] Spyware
  - [x] Bots
- [x] 3. `Delivery`: Techniques that aid in the transmission of a weaponized object to the target environment.
  - [x] Delivery mechanisms include:
    - [x] Email attachments
    - [x] Phishing
    - [x] Drive-by Downloads
    - [x] USB/Removal Media
    - [x] DNS Poisoning
- [x] 4. `Social Engineering`: Methods aimed at manipulating people to perform unsafe actions.
- [x] 5. `Exploitation`: Tactics to exploit system vulnerabilities that may result in code execution.
- [x] 6. `Persistence`: Any action, access or change to a system that grants an attacker persistent presence on the system.
- [x] 7. `Defense Evasion`: Evasion tactics an attacker may specifically use to avoid detection or other defenses.
- [x] 8. `Command and Control`: Techniques that enable attackers to communicate with controlled systems within a target network.
- [x] 9. `Pivoting`: Using a controlled system to tunnel traffic to other systems that are not directly accessible.
- [x] 10. `Discovery`: Methods that enable an attacker to obtain knowledge about a system and its network environment.
- [x] 11 `Privilege Escalation`: The outcome of techniques that provide higher permissions on a system or network for an attacker. Common methods include brute force attacks and exploiting zero day vulnerabilities.
- [x] 12. `Execution`: Tactics that result in execution of attacker-controlled code on a local or remote system.
- [x] 13. `Credential Access`: Strategies that result in access or control over system, service or domain credentials.
- [x] 14. `Lateral Movement`: Techniques that enable adversaries to laterally move to gain more leverage like access and control other remote systems. Attackers can also seek out critical data and sensitive information via IT resources and built-in tools like PowerShell.
- [x] 15. `Collection`: Methods to identify and gather data from a target network before exfiltration.
- [x] 16. `Exfiltration`: Tactics that aid in or result in an attacker removing data from a target network. This can include strategies like obfuscation (e.g. falsifying timestamps, deleting or modifying logs, etc.) or Denial of Service (DoS).
- [x] 17. `Impact`: Techniques to manipulate, interrupt, or destroy the target system or data.
- [x] 18. `Objectives`: Socio-technical attack objectives aimed at achieving a strategic goal.
