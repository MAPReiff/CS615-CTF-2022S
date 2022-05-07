#!/bin/sh

checksum="6b79f4baad3e6f562bfd66bc2ba745ad27a5e5f1102e7eb2f98d945ebfc8c8ae"

while read -r ip; do
    # current_sum=$(host "$ip" | awk '{print $5}' | sha256sum | awk '{print $1}')
    # fqdn=$(host "$ip" | awk '{print $NF}' | rev | cut -d. -f2- | rev)
    fqdn=$(host "$ip" | awk '{print $NF}')
    # echo "$ip - $fqdn"
    current_sum=$(echo "$fqdn" | sha256sum | awk '{print $1}')
    case "$current_sum" in
    *"$checksum"*)
        echo "Found it: $ip - $fqdn"
        ;;
    *) ;;
    esac
    # if [ "$current_sum" = "$checksum" ]; then
    #     echo "Found it!: $ip : $fqdn"
    # fi
done <ips.txt
