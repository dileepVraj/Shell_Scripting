#!/bin/bash

threshold=1
disk_usage=$(df -hT | grep -vE 'tmp|File|overlay')


while IFS read -r line

do
    echo $line
done <<< $disk_usage


