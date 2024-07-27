#!/bin/bash

ID=$(id -u)
# Executing 'id -u' command and storing value in variable ID.

if [ $ID -ne 0 ]
# This if condition checks ID is not equal to value 0.
# if true then it executes the code under then block.
then
# If ID is not equal to 0 then prints the below message to the console.
    echo "Can't install services without sudo privileges"
# This exit 1 is very helpful to stop the program execution fail at any certain point.
    exit 1
fi
# trying to install mysql client...
dnf install mysql -y

# Checking is mysql installation is successfull

if [ $? -ne 0 ]
then    
    echo "MySql installation failed...."
    exit 1
else
    echo "MySql is already installed..."
fi

