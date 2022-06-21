import os
import webbrowser
from colorama import Fore, Style

os.system("clear")

print(Fore.LIGHTBLUE_EX +"""
                         _      _                _    _             
                        | |    | |              | |  (_)            
  __ _  ___   ___   __ _| | ___| |__   __ _  ___| | ___ _ __   __ _ 
 / _` |/ _ \ / _ \ / _` | |/ _ \ '_ \ / _` |/ __| |/ / | '_ \ / _` |
| (_| | (_) | (_) | (_| | |  __/ | | | (_| | (__|   <| | | | | (_| |
 \__, |\___/ \___/ \__, |_|\___|_| |_|\__,_|\___|_|\_\_|_| |_|\__, |
  __/ |             __/ |                                      __/ |
 |___/             |___/                                      |___/ 
""")

print(Fore.LIGHTRED_EX +"""
[1] Publicly exposed documents
[2] Directory listing vulnerabilities 
[3] Configuration files exposed
[4] Database files exposed
[5] Log files exposed
[6] Backup and old files
[7] Login pages
[8] SQL errors
[9] PHP errors / warning
[10] phpinfo()
[11] Search pastebin.com / pasting sites
[12] Search github.com and gitlab.com 
[13] Search stackoverflow.com
[14] Signup pages
""")

print(Fore.LIGHTYELLOW_EX +"""
Select one of our 14 Google Dorks
""")

option = input(Fore.GREEN+ "option=> ")

if option == "1" : 
    target = input("target=> ")
    dork = (target +" ext:doc | ext:docx | ext:odt | ext:rtf | ext:sxw | ext:psw | ext:ppt | ext:pptx | ext:pps | ext:csv")

if option == "2" :
    target = input("target=> ")
    dork = (target +" intitle:index.of")

if option == "3" : 
    target = input("target => ")
    dork = (target +" ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini | ext:env")

if option == "4" : 
    target = input("target => ")
    dork = (target +" ext:sql | ext:dbf | ext:mdb")

if option == "5" : 
    target = input("target => ")
    dork = (target +" ext:log")

if option == "6" : 
    target = input("target => ")
    dork = (target +" ext:bkf | ext:bkp | ext:bak | ext:old | ext:backup")

if option == "7" : 
    target= input("target => ")
    dork = (target +' inurl:login | inurl:signin | intitle:Login | intitle:"sign in" | inurl:auth')

if option == "8" : 
    target= input("target => ")
    dork = (target +' intext:"sql syntax near" | intext:"syntax error has occurred" | intext:"incorrect syntax near" | intext:"unexpected end of SQL command" | intext:"Warning: mysql_connect()" | intext:"Warning: mysql_query()" | intext:"Warning: pg_connect()"')

if option == "9" : 
    target= input("target => ")
    dork = (target +' "PHP Parse error" | "PHP Warning" | "PHP Error"')

if option == "10" : 
    target= input("target => ")
    dork = (target +' ext:php intitle:phpinfo "published by the PHP Group"')

if option == "11" : 
    target = input("target => ")
    dork = (" pastebin.com | site:paste2.org | site:pastehtml.com | site:slexy.org | site:snipplr.com | site:snipt.net | site:textsnip.com | site:bitpaste.app | site:justpaste.it | site:heypasteit.com | site:hastebin.com | site:dpaste.org | site:dpaste.com | site:codepad.org | site:jsitor.com | site:codepen.io | site:jsfiddle.net | site:dotnetfiddle.net | site:phpfiddle.org | site:ide.geeksforgeeks.org | site:repl.it | site:ideone.com | site:paste.debian.net | site:paste.org | site:paste.org.ru | site:codebeautify.org  | site:codeshare.io | site:trello.com " + "\"" + target + "\"")

if option == "12" : 
    target = input("target => ")
    dork = (" github.com | site:gitlab.com " + "\"" + target + "\"")

if option == "13" : 
    target = input("target => ")
    dork = (" stackoverflow.com " + "\"" + target + "\"")

if option == "14" : 
    target= input("target => ")
    dork = (target +" ext:php inurl:signup | inurl:register | intitle:Signup")

search_terms = [
    'site:' + dork
]

for term in search_terms:
    url = "https://www.google.com.tr/search?q={}".format(term)
    webbrowser.open_new(url)
