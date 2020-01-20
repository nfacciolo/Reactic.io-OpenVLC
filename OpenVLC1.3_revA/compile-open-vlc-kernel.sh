#!/bin/bash

printf "\nExecuting compile-open-vlc-kernel.sh"

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

echo "Creating Open VLC 1.3 kernel"
cd ./kernel || exit
chmod +x ./load_test.sh || exit
./load_test.sh "$VLC0_IP_ADDRESS" "$VLC0_NETMASK" || exit