#!/bin/bash

# fetch and store id of the user in a variable.
ID=$(id -u)
Username=$(whoami)
if [ $ID -ne 0 ]
then
    echo "looks you are not a root user. The actual user name is: $Username"
    echo " Do you want to install MysQl client with user: $Username ?"
    echo " Please enter your response 'y' if yes 'n' if no "
    read RESPONSE
    if [ $RESPONSE == "y" ]
    then
        sudo apt-get install mysql-server -y
    fi

fi
