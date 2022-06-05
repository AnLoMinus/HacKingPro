# There are three major types of XSS attacks:
- DOM (Special)
  - DOM XSS (Document Object Model-based Cross-site Scripting) uses the HTML environment to execute malicious javascript. <br> This type of attack commonly uses the <script></script> HTML tag.

- Persistent (Server-side)
  - Persistent XSS is javascript that is run when the server loads the page containing it. <br> These can occur when the server does not sanitise the user data when it is uploaded to a page. <br> These are commonly found on blog posts. 

- Reflected (Client-side)
  - Reflected XSS is javascript that is run on the client-side end of the web application. <br> These are most commonly found when the server doesn't sanitise search data. 
