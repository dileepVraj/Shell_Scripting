#!/bin/bash

threshold=1
disk_usage_records=$(df -hT | grep -vE 'tmp|File|overlay')

while IFS= read -r line
do
disk_usage="$(echo $line | awk '{ print $6 }' | cut -d % -f 1)"
    if [ "$disk_usage" -ge "$threshold" ]; then
    echo $line
    fi
done <<< $disk_usage_records


