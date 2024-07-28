#!/bin/bash

# fetch and store id of the user in a variable.
ID=$(id -u)
Username=$(whoami)
if [ $ID -ne 0 ]
then
    echo "looks you are not a root user. The actual user name is: $Username"
fi
