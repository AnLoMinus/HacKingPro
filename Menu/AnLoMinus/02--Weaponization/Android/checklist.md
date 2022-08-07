> #### `Description`: This checklist will help security analyst/consultants to test their client's android application for security assessment.

### Memory/Storage Analysis

 - Sensitive information disclosed in storage of the mobile device

 - Sensitive information found in logs

 - Sensitive information found in cache

 - Sensitive information found in installed application folder

 - Sensitive information stored in SQLite database in cleartext

 - Check if sensitive information remains there even after log out

 - Sensitive information stored in shared preference files

### Code level vulnerabilities

 - Source code obfuscation not found

 - Sensitive information disclosed in application error message

 - Binary reverse engineering

 - Insecure permissions set by application through AndroidManifest.xml file

 - Weak hashing & encoding algorithms

 - Use Agnito to find security issues in application source code

### Business logic vulnerability

 - User account compromise of another user

 - Admin account compromise from user account

 - Bruteforce authentication/otp/other services

 - Check for server side validation

 - Check for root detection method / bypass it

### Transport layer security

 - Older version of SSL used

 - SSL pinning bypass

 - Weak ssl ciphers and other SSL related vulnerabilities (sslscan, sslyze, osaft etc.)

### Server side checks

 - Check for SQL injection

 - CAPTCHA implementation flaws & bypass

  - Check for all HTTP methods (PUT, DELETE etc. Use burp intruder using HTTP verb tampering)

 - Check for client side injection (XSS)

 - Username enumeration

 - Other user's sensitive details enumeration

 - User detail's enumeration using IDOR

 - Malicious file upload

 - Server side flaws (IIS, APACHE, TOMCAT etc.)

 - Run nikto, dirb on web content URL

 - Check for session management (cookie flaws, session overriding, session fixation etc.)

### Run Scanner

 - MobSF (Must Recommended)
