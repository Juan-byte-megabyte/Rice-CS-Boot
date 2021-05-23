#!/bin/bash

echo "A Quick System Audit Script"

'date'

echo "Machine Type Info:"

echo $MACHTYPE

echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n"

echo "Hostname: $(hostname -s)"

echo "DNS Servers:"

cat /etc/resolv.conf >> $output

echo "Memory Info:"

free >> $output

echo -e "\nCPU Info:"

lscpu | grep CPU

echo -e "\nDisk Usage:" >> $output

df -H | head -2 >> $output

echo -e "\nWho is logged in: \n $(who) \n"