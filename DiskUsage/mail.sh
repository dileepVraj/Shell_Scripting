#!/bin/bash

threshold=1
disk_usage=$(df -hT | grep -vE 'tmp|File|overlay')


while IFS= read -r line

do
    disk_usage_percentage=$($line | awk '{print $6}' | cut -d % -f 1)
    if [ $disk_usage_percentage -ge $threshold ]; then
    echo "Warning disk usage reached to maxium threshold range: $disk_usage_percentage"
done <<< $disk_usage


