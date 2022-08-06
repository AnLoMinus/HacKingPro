#!/bin/bash

# Usage : nmap.sh $nmap_cleaned_file $resultDir example.com basic|advanced
# Run nmap on the found ip and port in sorted file
# 
# Output file's layout for nmap script 
# 104.16.199.134 8080,8443,8880
# 162.159.0.102 53,80,443,2052
# i.e IP<space>port#1,port#2
# 
# This is done so that nmap scans for services only on these specified ip and ports
# 
# nmap -Pn -n -v -sV IP PORTS -oA IP.nmap.txt
# Taken from https://security.stackexchange.com/a/189540
#
# After a comparision between -A with -T4 and -A and without -A, came to conclusion that -T4 doesn't add much to the speed
# as --script-timeout option is already set
# 
#   without -A and without -T4 |    with only -A      |   both
#         37.34 seconds        |    47.51 seconds     |   48.15 seconds
# The comparitive results is pasted at the bottom in the comments
# 

echo "" >> $resultDir/log.txt
echo "NMAP Logs Now" >> $resultDir/log.txt
echo "" >> $resultDir/log.txt

nmap_run()
{
    filePath=$1
    resultDir=$2
    domain=$3
    mkdir $resultDir/nmap

    if [ ! -f $filePath ] 
    then
        echo "Error: Must supply file"
        exit 1
    fi 

    while read -r line 
    do
        IP=`echo $line | cut -d" " -f1`
        ports=`echo $line | cut -d" " -f2`
        echo "Scanning $IP : $ports : $4"
        if [ "$4" == "basic" ]; then
            nmap -Pn -n -v -sV --script-timeout 5s --script "default and safe" $IP -p$ports -oA $resultDir/nmap/$IP | tee -a $resultDir/log.txt
            printf "\n===============================================================================================================================\n"
        elif [ "$4" == "advanced" ]; then
            nmap -Pn -n -v -sV --script-timeout 10s --script "default and safe" -A $IP -p$ports -oA $resultDir/nmap/$IP | tee -a $resultDir/log.txt
            printf "\n===============================================================================================================================\n"
        else
            exit 1
        fi
    done < $1
    finishedFile=$resultDir/$domain.nmap.finished
    touch $finishedFile
}

nmap_run $1 $2 $3 $4
