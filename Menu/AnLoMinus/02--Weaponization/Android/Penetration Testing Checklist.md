# Most Important Android Application Penetration Testing Checklist
#### Android is the biggest organized base of any mobile platform and developing fast—every day. 
#### Besides, Android is rising as the most extended operating system in this viewpoint because of different reasons.
#### However, as far as security, no data related to the new vulnerabilities that could prompt to a weak programming on this stage is being revealed, realizing that this stage has an outstanding attack surface.

## Information gathering
#### Information Gathering is the most basic stride of an application security test. 
#### The security test should attempt to test however much of the code base as could reasonably be possible.

### Therefore mapping every conceivable way through the code to encourage exhaustive testing is principal.
- General Information. Rundown of general application information.
- Testing for Common Libraries and Fingerprinting.
- Rundown of application components and Component authorizations.
- Reverse Engineering the Application Code.

---

## Application Local Storage Flaws
#### Android gives a few alternatives to you to spare persevering application information. 
#### The storage you pick relies on upon your particular needs.
#### For example, regardless of whether the information should be private to your application or open to different applications (and the client) and how much space your data requires.
- Sensible data found in logs and cache.
- Putting away Sensitive Data on Shared Storage (presented to all applications with no restrictions).
- Content Providers SQL Injection and Access Permissions.
- Check if sensitive data stays there even after log out.
- Privacy and Metadata Leaks.
- Also Read:   Network Penetration Testing Checklist

---

## Transport Layer Security
Encryption with Transport Layer Security continues prying eyes far from your messages while they’re in flying. TLS is a protocol that encodes and conveys data safely, for both inbound and outbound traffic data, it avoids spying.

Older Insecure Transport Layer Protocols.
TLS Weak Encryption(CRIME, BREACH, BEAST, Lucky13, RC4, etc) can be found with tools like (sslscan, sslyze, osaft etc.).
Insecure Data Storage.
Bypassing TLS Certificate Pinning.
TLS Authenticity Flaws.

---

## IPC Security(Inter-process communication)
#### The Android IPC mechanisms allow you to verify the identity of the application connecting to your IPC and set security policy for each IPC mechanism.
- Device Denial of Service attacks.
- Permissions & Digital Signature Data Sharing Issues.
- An illegitimate application could get access to sensitive data.
- Uncovered Components and Cross-Application Authorization.

---

## Untrusted Code
#### Sensitive information disclosed in application error message.
- JavaScript Execution Risks at WebViews.
- Insecure permissions set by application through AndroidManifest.xml file.
- Integer, Heap, and Stack Based Buffer Overflow.

---

## Authentication Flaws
#### Authentication is a basic part of this procedure, yet even strong validation authentication can be undermined by imperfect credential management functions, including password change, forgot my password, remember my password, account update, and other related functions.
- Authentication Inconsistency.
- Cross Application Authentication.
- Session handling errors.
- Client Side Based Authentication Flaws.
- The absence of account lockout policy.

---

## Business logic vulnerability
#### vulnerabilities with components more centered around on design rather codification are incorporated. Both execution trick and the capacity of the application to work in a startling way influencing its work process are incorporated.
- Check for server side validation.
- Admin/user account compromise.
- Check for root detection method/bypass it.
- Bruteforce authentication.

---

## Penetration Testing Android Server side checks
- Check for client side injection (XSS).
- Username enumeration.
- SQL injection
- Malicious file upload.
- Check for all HTTP methods (PUT, DELETE etc. Use burp intruder using HTTP verb tampering).
- Check for session management (cookie flaws, session overriding, session fixation etc.).
- CAPTCHA implementation flaws & bypass.
- Run nikto, dirb websever scanner.

---

## Open Android Security Assessment Methodology
#### Android Security controls are structured in the following section for reference framework on Android application vulnerability assessments.
- [`OASAM-INFO`](): Information Gathering: Information gathering and attack surface definition.
- [`OASAM-CONF`](): Configuration and Deploy Management: Configuration and deploy assessment.
- [`OASAM-AUTH`](): Authentication: Authentication assessment.
- [`OASAM-CRYPT`](): Cryptography: Cryptography use assessment.
- [`OASAM-LEAK`](): Information Leak: Confidential information leak assessment.
- [`OASAM-DV`](): Data Validation:User entry management assessment.
- [`OASAM-IS`](): Intent Spoofing: Intent reception management assessment.
- [`OASAM-UIR`](): Unauthorized Intent Receipt:Intent resolution assessment.
- [`OASAM-BL`](): Business Logic: Application business logic assessment.
