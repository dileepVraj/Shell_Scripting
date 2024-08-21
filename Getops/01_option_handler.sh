#!/bin/bash

Name=""
Message=""

Usage() {
    echo "Usage:: $(basename $0) -n <name> -w <message>"
    echo "Options:"
    echo " -n, specify name (mandatory)"
    echo " -w, specify the message (mandatory)"
    echo " -h, Display Help and exit"

}

while getopts ":n:m:h" option; do
    case $option in
        n) Name="$OPTARG";;
        m) Message="$OPTARG";;
        h) Usage; exit;;
        :) Usage; exit;;
        \?) echo "Invalid options: -"$OPTARG"" >&2; Usage; exit;;
    esac
done

if [ -z "$Name" ] || [ -z "$Message" ]; then
    echo "Error both -n & -w are mandatory options."
    Usage;
    exit 1;
fi


echo " $Message, $Name how are you doing 😊 "
