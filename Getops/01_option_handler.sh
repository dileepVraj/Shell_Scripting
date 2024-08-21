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

while getopts ":n:w:h" option; do
    case $option in
        n) Name="$OPTARG";;
        w) Message="$OPTARG";;
        h|*) Usage; exit;;
    esac
done
