`curl — verbose http://www.example.com`
> [Displays request header, response header, response]

`curl -v http://www.example.com` [Shorthand]

`curl http://www.example.com`
> [Returns back the webpage in response to the GET request]

`curl — include http://www.example.com`
> [Complete header information as well]

`curl -I http://www.example.com` [Shorthand]

---

> [To display and save all the request response on to the file] <br>
- `curl — trace-ascii hello.txt http://www.example.com`

> [Display all information along with timestamp information] <br>
- `curl — trace-ascii hello.txt — trace-time http://www.example.com`

> [Displays only the response and no header information and saves it into the hello.txt file]
- `curl http://www.example.com -o hello.txt`

> [ — resolve [DOMAIN]:[PORT]:[IP], that routes all web requests performed during the execution of a cURL command that match a given [DOMAIN] and [PORT] to a specified [IP] address. ]
- `curl http://www.example.com — resolve www.example.com:80:127.0.0.1`

> [To make a request to a particular port number]
- `curl http://www.example.com:8099/`

> [The port number you specify in the URL is the number that the server uses to offer its services. <br> Sometimes you may use a local proxy, and then you may need to specify that proxy’s port number separately for what curl needs to connect to locally. <br> Like when using an HTTP proxy on port 4321]
- `curl — proxy http://proxy.example.com:4321 http://remote.example.com`

> [To insert the user and password in the URL]
- `curl http://user:password@example.org`

> [To provide the user and password separately]
- `curl -u user:password http://example.org`
- `curl — user name:password http://example.com`



> [Proxy Login]
- `curl — proxy-user proxyusername:proxypassword http://example.com`
> Note: If you use any one of these user+password options but leave out the password part, curl will prompt for the password interactively.

> [To make a HEAD request similar to GET request, the server returns back the headers but without a body]
- `curl http://www.example.com — head`

> [Request to multiple URLs]
- `curl http://url1.example.com http://url2.example.com`

> [Supplies the same parameter to both URLs while making the POST call]
- `curl — data name=rahul http://url1.example.com http://url2.example.com`

> [First a HEAD and then a GET]
- `curl -I http://example.com — next https://google.com`

> [POST score on URL1 then GET]
- `curl -d [ — data] score=10 http://example.com/post — next http://google.com`

> [To post data via GET request]
- `curl http://example.com?data1=1905&age=24`

> [To post data via POST request] [Post hidden fields also in the same way] <br>
This kind of POST will use the Content-Type application/x-www-form-urlencoded and is the most widely used POST kind
- `curl — data “data1=1905$age=%2024%20” http://example.com`

> [To encode the POST data]
- `curl — data-urlencode “name=I am Rahul Sharma” http://example.com`
> Note: If you repeat — data several times on the command line, curl will concatenate all the given data pieces — and put a ‘&’ symbol between each data segment.

> [To upload file via form post à Content-type:multipart/form-data]
- `curl — form upload=@filename — form press=OK http://example.com`

> [File upload using PUT request]
- `curl — upload-file filename http://example.com`

> [A HTTP request may include a ‘referer’ field (yes it is misspelled), which can be used to tell from which URL the client got to this particular resource. <br> Some programs/scripts check the referer field of requests to verify that this wasn’t arriving from an external site or an unknown page. While this is a stupid way to check something so easily forged, many scripts still do it. Using curl, you can put anything you want in the referer-field and thus more easily be able to fool the server into serving your request.]
- `curl — referer http://example1.com http://example.com`

> [Fool server by looking like Mozilla]
- `curl — user-agent “Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)” http://example.com`

> [Allow redirections]
- `curl — location http://example.com`
> Note: If you use curl to POST to a site that immediately redirects you to another page, you can safely use — location (-L) and — data/ — form together. Curl will only use POST in the first request, and then revert to GET in the following operations.

> [Send cookie to the server]
- `curl — cookie “name=Daniel” http://www.example.com`

> [To dump (store) cookies]
- `curl — dump-header headers_and_cookies http://www.example.com`

> [Curl has a full-blown cookie parsing engine built-in that comes useful if you want to reconnect to a server and use cookies that were stored from a previous connection (or hand-crafted manually to fool the server into believing you had a previous connection)]
- `curl — cookie stored_cookies_in_file http://www.example.com`

> [Curl has the ability to read and write cookie files that use the same file format that Netscape and Mozilla once used. It is a convenient way to share cookies between scripts or invokes. The — cookie (-b) switch automatically detects if a given file is such a cookie file and parses it, and by using the — cookie-jar (-c) option you’ll make curl write a new cookie file at the end of an operation]
- `curl — cookie cookies.txt — cookie-jar newcookies.txt http://www.example.com`

> [For example, you can change the POST request to a PROPFIND and send the data as “Content-Type: text/xml” (instead of the default Content-Type)]
- `curl — data “<xml>” — header “Content-Type: text/xml” — request PROPFIND url.com`

> [delete a default header by providing one without content]
- `curl — header “Host:” http://www.example.com`

> [Custom headers]
- `curl — header “Destination:https://google.com" http://www.example.com`

> [curl will still think and act as if it sent a GET so it won’t send any request body etc].
- `curl -X POST http://example.org/`

---

- [CURL Cheat-Sheet](https://medium.com/@webcrat.tech/curl-cheat-sheet-9487e628968f)

