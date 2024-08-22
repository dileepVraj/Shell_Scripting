#!/bin/bash

usage(){
    echo "Usage function called"
}

dish=""
spicy=""
sauce=""

while getopts ":d:s:t:h" opt; do
    case $opt in
        d) dish="$OPTARG";;
        s) spicy="$OPTARG";;
        t) sauce="$OPTARG";;
        h) echo "Help"; exit 0;;
        :) echo "Please specify options with arguments"; usage; exit 1;;
        \?) echo "Error: Invalid option: -$OPTARG"; exit 1;;
    esac
done

echo "Here is your dish $dish which is $spicy spicy with $sauce sauce"
