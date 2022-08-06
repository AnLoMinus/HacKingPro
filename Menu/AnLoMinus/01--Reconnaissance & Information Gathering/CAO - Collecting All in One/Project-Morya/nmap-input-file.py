# -*- coding: utf-8 -*-
import sys
import csv
from itertools import groupby
#
# Layout of initial file that is sent 
# 104.16.199.134,8080
# 104.16.199.134,8443
# 104.16.199.134,8880
# 162.159.0.102,53
# 162.159.0.102,80
# 162.159.0.102,443
# 162.159.0.102,2052
# 
# Output file's layout for nmap script ( note no space in between ports and comma )
# 104.16.199.134 8080,8443,8880
# 162.159.0.102 53,80,443,2052
# i.e IP<space>port#1,port#2
# 
# This is done so that nmap scans for services only on these specified ip and ports
# 
# nmap -Pn -n -v -sV IP PORTS -oA IP.nmap.txt
# 

def clean_file_for_nmap_script(file_path, destination):
    with open(file_path) as in_f, open(destination, 'w') as out_f:
        data = csv.reader(in_f)
        for key, group in groupby(data, lambda x: x[0]):
            ports = ""
            for thing in group:
                ports += thing[1] + ","
            final_payload = "%s %s\n" % (key, ports[:-1]) # Removing the last comma
            out_f.write(final_payload)

def main():
    if len(sys.argv) != 3:
        print("Usage : "+__file__+" source_file destination_file")
        exit(1)
    else:
        final_file = clean_file_for_nmap_script(sys.argv[1], sys.argv[2])
        print("\033[92mSuccessfully written file to "+sys.argv[2]+"\033[0m")

if __name__ == '__main__':
  main()
