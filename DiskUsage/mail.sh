#!/bin/bash

threshold=1
disk_usage_records=$(df -hT | grep -vE 'tmp|File|overlay')

while IFS= read -r line
do
disk_usage="$(echo $line | awk '{ print $6 }' | cut -d % -f 1)"
    if [ "$disk_usage" -ge "$threshold" ]; then
    echo $line
    echo "Subject disk usage alert" > /tmp/email.txt
    echo "Your disk usage is at $disk_usage%, which exeeds the threshold of $threshold%.">>tmp/email.txt
    msmtp -a gmail ananthvraj50@gmail.com < /tmp/email.txt

    fi
done <<< $disk_usage_records


