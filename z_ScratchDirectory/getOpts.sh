#!/bin/bash

dish=""
spicy=""
sause=""

while getopts ":d:s:t:h" opt; do
    case $opt in
    d) $dish="$OPTARG";;
    s) $spicy="$OPTARG";;
    t) $sause="$OPTARG";;
    h) echo "HelP" exit 0;;
    esac
done

echo "here is your dish $dish which is $spicy spicy with $sause sause"