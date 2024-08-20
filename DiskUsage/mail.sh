#!/bin/bash

threshold=1
disk_usage=$(df -hT | grep -vE 'tmp|File|overlay')


while IFS= read -r line

do
    disk_usage_percentage=$(echo $line | awk '{print $6}' | cut -d % -f 1)
    if [ $disk_usage_percentage -ge $threshold ]; then
        echo "Sending email: $disk_usage_percentage"
        echo "Warning disk usage reached to maxium threshold range: $disk_usage_percentage" | mail -s "Disk Usage" ananthvraj50@gmail.com
    fi
done <<< $disk_usage


