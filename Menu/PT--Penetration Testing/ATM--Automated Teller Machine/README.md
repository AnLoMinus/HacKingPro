<div align="center">

![image](https://user-images.githubusercontent.com/51442719/177638677-1ad4df13-28b8-4166-902e-66d981a3ecfa.png)

</div>

# ATM Hacking: 
## Advanced methods for finding security vulnerabilities by Anastasis Vasileiadis

---

## Penetration Testing Procedure at ATMs
- The approach to testing the security of ATMs remains the same. 
- The ultimate goal is to access the operating system or deal with the application-related file to see how the application itself behaves.
- An attacker, after gaining access to the operating system, can create malware that can command the system program using XFS components.

- Some of the test cases that can be considered are:
  - Tests related to access to the operating system and related system file
  - Check if USB functionality is enabled, boot USB using ” Konboot ".
  - Connect the USB and boot the system via USB.
  - Since most of the test has to do with the operating system, keep pressing the "Shift" button at startup. This will break any sequence that is set to run at boot time in the ATM operating system. This will result in you going directly to Windows.
  - If you know a valid username, enter it and press the "Enter" button. This will result in instant access to the operating system without a password.
  - If you do not know a valid username, try logging in to "Administrator", as many ATMs do not deactivate the default administrator account.
  - Another way is to bootable USB using Hiren boot . Boot from USB, where this will give access to the file system directly offline in Windows.




## Security practices to be followed by banks
- Banks can implement some security practices to reduce the range of attack for the attacker. 
- Below we will see some parameters that should be given great attention:

### Protection against physical attacks:
- Detection and protection against skimming of the card.
- Detection and protection against card and cash entrapment.
- Detection against keyboard violation.
- DVSS camera application built into the ATM to record the user's facial features along with transaction details and timestamp.
- Protection of the treasury from fire, explosion, etc.
- Lock protection and again unauthorized access to banknotes or accounts.
- Protection of electricity and grid points.
- Deactivation of unused network as well as electric port.
- The ATM must be grouted on the floor to insure against robbery-related threats. The ATM can be mounted with a vibration sensor to detect the impact and movement of the ATM machine.
- CCTV camera installation. Presence of a guard.

---

### Protection against hacking attacks:
- Protection against unauthorized booting without using a password and entering the BIOS. Most ATMs have a default boot password.
- USB protection and unauthorized access to the hard disk.
- Secure OS and fully updated on a daily basis.
- Allowed list of applications, services at the ATM.
- Operation with fewer user privileges.
- File integrity checks.
- Securing transaction logs.
- Use secure connection for communication and transaction.
- Formulation of best security practices in the application of ATMs.
- Virus protection.
- Separation of ATM network with other networks.
- Malware protection such as tyupkin, ploutus etc.

---

### Protection against fraud-based attacks:
- Geo-blocking application. In this application, the card can only be used in the country or region of origin of the card. The user must obtain a license to use the card outside its country of origin.
- Pin-based chip-based card application for mitigating attack based on duplicate cards and skimming cards.
- An application that will detect an unusual transaction in terms of amount, place of transaction, frequency of transaction, etc.

---

https://hakin9.org/atm-hacking-advanced-methods-for-finding-security-vulnerabilities-by-anastasis-vasileiadis/
