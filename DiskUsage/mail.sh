#!/bin/bash

threshold=1
disk_usage=$(df -hT | grep -vE 'tmp|File|overlay')

while IFS= read -r line
do
    if [ "$(echo $line | awk '{ print $6 }' | cut -d % -f 1)" -ge $threshold ]; then
    echo $line
    fi
done <<< $disk_usage


