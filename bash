#!/bin/bash

if [[ -z $1 ]]
then
    echo "Usage:    $0 <file>"
    exit 1
fi

if [[ ! -f $1 ]]
then
    echo "'$1' is not a file"
    exit 1
fi

# Regular expressions to find IP addresses
IP_ADDR="([0-9]{1,3}\.){3}[0-9]{1,3}"
SRC_IP="SRC=${IP_ADDR}"
DST_IP="DST=${IP_ADDR}"

# grep  --> Get all source and destination IP addresses as SRC=x.x.x.x & DST=x.x.x.x
# cut   --> Get just the IP address
# sort  --> Get the unique IP addresses
# wc    --> Count all IP addresses
grep -Eo -e "${SRC_IP}" -e "${DST_IP}" $1 | cut -d'=' -f 2 | sort -u | wc -l
