#!/bin/bash

printf "\nExecuting load_test.sh"

readonly VLC0_IP_ADDRESS="$1"
readonly VLC0_NETMASK="$2"

#Verify first argument is set and is an ip adress
if [[ ! ($VLC0_IP_ADDRESS =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$) ]]; then
    printf "First argument must be an ip adress\n"
    exit
fi

#Verify second argument is set and is netmask
if [[ ! ($VLC0_NETMASK =~ ^(((255\.){3}(255|254|252|248|240|224|192|128|0+))|((255\.){2}(255|254|252|248|240|224|192|128|0+)\.0)|((255\.)(255|254|252|248|240|224|192|128|0+)(\.0+){2})|((255|254|252|248|240|224|192|128|0+)(\.0+){3}))$) ]]; then
    printf "Second argument must be a netmask\n"
    exit
fi
rmmod vlc
#watch -n 0.1 "dmesg | tail -n $((LINES-6))"

find -exec touch \{\} \;

make clean

make

# Insert the driver
insmod vlc.ko

# Configure the IP address of the new interface
ifconfig vlc0 "$1" netmask "$2"