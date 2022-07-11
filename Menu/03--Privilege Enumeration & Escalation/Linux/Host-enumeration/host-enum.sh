#!/bin/bash

# A script to enumerate all host insite the local subnet 
# Author: Ivan Glinkin
# Contact: mail@ivanglinkin.com
# Release date: September 28, 2020

# Variables
## General
ipmask_array=(`ip -4 -br a | grep -v "127" | awk -F " " '{print $(NF)}'`);
ip_array=(`ip -4 -br a | grep -v "127" | awk -F " " '{print $(NF)}' | cut -d "/" -f1`);
mask_array=(`ip -4 -br a | grep -v "127" | awk -F " " '{print $(NF)}' | cut -d "/" -f2`);
interface=(`ip -4 -br a | grep -v "127" | awk -F " " '{print $1}'`);
common_ports=(21 22 23 25 80 110 139 143 443 445 465 587 993 1433 1521 2525 3306 3389 5432 5985 5986 8080 8081 8443);
len=${#ip_array[@]};
operation_system=(	[32]='Windows 95/98*' [60]='MacOS/MacTCP*'      [64]='Linux/Unix/MacOS' / 
					[128]='Windows'       [254]='CISCO/Solaris/AIX' [255]='Linux/Unix' /
					[1]='Undefined');

# Functions
function ip2int
{
    local a b c d
    { IFS=. read a b c d; } <<< $1
    echo $(((((((a << 8) | b) << 8) | c) << 8) | d))
}

function int2ip
{
    local ui32=$1; shift
    local ip n
    for n in 1 2 3 4; do
        ip=$((ui32 & 0xff))${ip:+.}$ip
        ui32=$((ui32 >> 8))
    done
    echo $ip
}

function netmask
# Example: netmask 24 => 255.255.255.0
{
    local mask=$((0xffffffff << (32 - $1))); shift
	int2ip $mask
}

function host_count
# Example: host_count 24 => 255
{
	power=$((32 - $1))
	echo "$((2 ** $power - 2))"
}

function broadcast
# Example: broadcast 192.0.2.0 24 => 192.0.2.255
{
    local addr=$(ip2int $1); shift
    local mask=$((0xffffffff << (32 -$1))); shift
    int2ip $((addr | ~mask))
}

function network
# Example: network 192.0.2.0 24 => 192.0.2.0
{
    local addr=$(ip2int $1); shift
    local mask=$((0xffffffff << (32 -$1))); shift
    int2ip $((addr & mask))
}

# Check and print open ports
function PrintTheOpenPorts {
	for ports in $@;
	do
		nc -vz -w 1 $ip_address $ports > log.txt 2>&1;
		port_open=$(grep -o " open" log.txt)
		if [ ! -z $port_open ]
		then
			echo "$ports";
		fi
	rm log.txt;
	done
}

# Get ip sub number
function GetSubNumber {
	echo "$1" | cut -d "." -f $2;
}

# Output

## Header
echo -e "\n\e[00;33m╔═══════════════════════════════════════════════════════════════════════════╗\e[00m"
echo -e "\e[00;33m║\t\t\t\t\t\t\t\t\t    ║\e[00m"
echo -e "\e[00;33m║\e[00m\e[01;32m\t\t\t   Simple Host Enumeration\t\t\t    \e[00m\e[00;33m║\e[00m"
echo -e "\e[00;33m║\t\t\t\t\t\t\t\t\t    ║\e[00m"
echo -e "\e[00;33m╚═══════════════════════════════════════════════════════════════════════════╝\e[00m"
echo -e ""
echo -e "\e[00;33m[ ! ] https://www.linkedin.com/in/IvanGlinkin/ | @IvanGlinkin\e[00m"
echo -e "";

## If there is no connection
if [ $len -eq 0 ]
then
	echo -e "\e[00;33m[\e[00m \e[01;31m+\e[00m \e[00;33m] This host doesn't have any established connections\e[00m";
	exit;
fi

echo -e "\e[00;33m[\e[00m \e[01;32m+\e[00m \e[00;33m]\e[00m This host has \e[00m\e[01;31m$len\e[00m established connection(s)"; 

## Network information
for (( i=0; i<$len; i++ ))
do
	subnet_number=$((i+1));
	local_network=`network ${ip_array[$i]} ${mask_array[$i]};`
	local_broadcast=`broadcast ${ip_array[$i]} ${mask_array[$i]};`
	local_hosts=`host_count ${mask_array[$i]};`
	echo -e "\e[00;33m[\e[00m \e[01;32m+\e[00m \e[00;33m]\e[00m Subnet $subnet_number:";
	echo -e "    \e[01;32m  IP address: \e[00m${ip_array[$i]} / ${mask_array[$i]}"
	echo -e "    \e[01;32m  Net range:  \e[00m$local_network ... $local_broadcast ($local_hosts hosts)";
done
echo -e "\n\e[00;33m[\e[00m \e[01;32m+\e[00m \e[00;33m] \e[01;32mPrinting the results: \e[00m"

## Exploit
for (( i=0; i<$len; i++ ))
do
	subnet_number=$((i+1));
	local_ip="${ip_array[$i]}";
	local_network=`network ${ip_array[$i]} ${mask_array[$i]};`
	local_broadcast=`broadcast ${ip_array[$i]} ${mask_array[$i]};`
	
	echo -e "╔═══════════════════════════════════════════════════════════════════════════╗";
	echo -e "║\t\t    Enumerating Subnet $((i+1)): $local_network / ${mask_array[$i]}    \t\t    ║";

	a1=`GetSubNumber $local_network 1`;
	b1=`GetSubNumber $local_network 2`;
	c1=`GetSubNumber $local_network 3`;
	d1=`GetSubNumber $local_network 4`;
	a2=`GetSubNumber $local_broadcast 1`;
	b2=`GetSubNumber $local_broadcast 2`;
	c2=`GetSubNumber $local_broadcast 3`;
	d2=`GetSubNumber $local_broadcast 4`;

	arp_check=$(ip -4 a | grep ${interface[$i]} | grep -i "noarp");
	if [[ ! -z $arp_check ]] 
	then
		echo -e "╠═══════════════════════════════════════════════════════════════════════════╣";		
		echo -e "║\t\t      \e[01;31mNOARP setted! Starting ping sweep\e[00m\t\t\t    ║";
		echo -e "╠═════════════════╦═══════════════════╦══════════════════╦══════════════════╣";
		echo -e "║        IP       ║        MAC        ║        OS        ║    OPEN PORTS    ║";
	else
		echo -e "╠═════════════════╦═══════════════════╦══════════════════╦══════════════════╣";
		echo -e "║        IP       ║        MAC        ║        OS        ║    OPEN PORTS    ║";
	fi

	for (( aa=$a1; aa<$((a2+1)); aa++ ))
	do
	 for (( bb=$b1; bb<$((b2+1)); bb++ ))
	 do
	  for (( cc=$c1; cc<$((c2+1)); cc++ ))
	  do
	   for (( dd=$d1; dd<$((d2+1)); dd++ ))
	   do
			ip_address="$aa.$bb.$cc.$dd";
			[[ "$ip_address" == "$local_network" ]] && continue;
			[[ "$ip_address" == "$local_broadcast" ]] && continue;

			# start enumerating
			if [[ "$ip_address" == "$local_ip" ]]
			then 
				mac_address=`cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address`;
				
			else
				if [[ ! -z $arp_check ]] 
				then 
					mac_address="";
				else
					#mac_address=$(arping -C 1 -w 1 -i ${interface[$i]} -r $ip_address);
					mac_address=$(arping -c 1 -w 1 $ip_address | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}');
				fi
			fi

			# Defineding OS
			get_ttl=$(ping -c 1 -w 1 $ip_address | grep -i "ttl" | cut -d " " -f 6 | cut -d "=" -f 2);
			[[ -z $get_ttl ]] && continue;
			def_os=${operation_system[$get_ttl]};
				[[ -z $def_os ]] && def_os=${operation_system[1]}

			# Defineding open ports
			for ports in "${common_ports[@]}";
			do
				nc -vz -w 1 $ip_address $ports > host-enum-log.txt 2>&1;
				port_open=$(grep -o " open\|succeeded" host-enum-log.txt)
				[[ ! -z $port_open ]] && ports_all+="$ports ";
			rm host-enum-log.txt;
			done

			# Aling ip address
			ip_address_len=${#ip_address};
			for (( ip_l=15; ip_l > $ip_address_len; ip_l-- ));
			do ip_address+=" ";
			done

			# Aling ip address
			mac_address_len=${#mac_address};
			for (( mac_l=17; mac_l > $mac_address_len; mac_l-- ));
			do mac_address+=" ";
			done

			# Aling operation systems
			def_os_len=${#def_os};
			for (( os_l=17; os_l > $def_os_len; os_l-- ));
			do def_os+=" ";
			done

			# Aling ip ports
			ports_all_len=${#ports_all};
			if [ "$ports_all_len" -lt "17" ]
			then
				for (( ports_l=17; ports_l > $ports_all_len; ports_l-- ));
					do ports_all+=" ";
				done
				ports_first=$ports_all;
					ports_rest="";
			else
				ports_words=(`echo $ports_all | wc -w`);
				lines=$(( ports_words / 3 ));
					#left=$(( ports_words % 3 ));
					[[ "(( ports_words % 3 ))" -ne "0" ]] && (( lines++ ));
				ports_first=$(echo $ports_all | awk -F " " '{print $1 " " $2 " " $3}');
					ports_first_len=${#ports_first};							
					if [ "$ports_first_len" -lt "17" ]
					then
						for (( ports_f_l=17; ports_f_l > $ports_first_len; ports_f_l-- ));
						do ports_first+=" ";
						done
					fi	
				for (( ports_lines=1; ports_lines < $lines; ports_lines++))
				do 	ports_1="$(( ports_lines * 3 + 1))";
					ports_2="$(( ports_lines * 3 + 2))";
					ports_3="$(( ports_lines * 3 + 3))";
					ports_mid=$(echo $ports_all | awk -F " " "{print \$$ports_1 \" \" \$$ports_2 \" \" \$$ports_3}");
						ports_mid_len=${#ports_mid};
						if [ "$ports_mid_len" -lt "17" ]
						then
							for (( ports_s_l=17; ports_s_l > $ports_mid_len; ports_s_l-- ));
							do ports_mid+=" ";
							done
						fi
					ports_rest+="\n║                 ║                   ║                  ║ $ports_mid║";
				done
			fi
				# $ip_address - ip addres
				# $mac_address - mac address
				# $def_os - operation system
				# $ports_all - open ports

				echo -e "╠═════════════════╬═══════════════════╬══════════════════╬══════════════════╣";				
				echo -e "║ $ip_address ║ $mac_address ║ $def_os║ $ports_first║$ports_rest"
				unset ports_all;
	   done
	  done
	 done
	done
	echo -e "╠═════════════════╩═══════════════════╩══════════════════╩══════════════════╣";
	echo -e "║\t\t      Enumeration Subnet $((i+1)) completed\t\t\t    ║";
	echo -e "╚═══════════════════════════════════════════════════════════════════════════╝"
done
