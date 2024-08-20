#!/bin/bash

threshold=1


while IFS read -r line

do
    echo $line
done <<< df -hT | grep -vE 'tmp|File|overlay'  


