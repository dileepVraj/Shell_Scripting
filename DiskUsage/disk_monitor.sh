#!/bin/bash

disk_usage=$(df -hT | grep -vE 'tmp|File')
disk_threshold=$1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)

done <<< $disk_usage


