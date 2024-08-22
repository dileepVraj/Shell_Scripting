#!/bin/bash

dish=""
spicy=""
sause=""

usage(){
    echo " usage function called "
}

while getopts ":d:s:t:h" opt; do
    case $opt in
    d) dish="$OPTARG";;
    s) spicy="$OPTARG";;
    t) sause="$OPTARG";;
    h) echo "HelP" exit 0;;
    :) echo "Please specify options with arguments"; usage; exit 1;;
    /?) echo "Error: Invalid option: -$OPTARG"; exit 1;;
    


    esac
done

echo "here is your dish $dish which is $spicy spicy with $sause sause"