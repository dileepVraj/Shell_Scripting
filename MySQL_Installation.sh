#!/bin/bash

ID=$(id -u)
# Executing 'id -u' command and storing value in variable ID.
# 'id -u' command returns user id in numbers, where if the user is root user the value will be 0,
# if the user is different from root user then the value will be anything from 0.


if [ $ID -ne 0 ];
then
# This if condition checks ID is not equal to value 0(if not root user).
# if true then it executes the code under then block.

# If ID is not equal to 0 then prints the below message to the console.
    echo "Can't install services without sudo privileges"
# This exit 1 is very helpful to stop the program execution fail at any certain point.
    exit 1
elif [ $ID -eq 0 ];
then
    echo "installing mysql ......"
    # trying to install mysql client...
    dnf install mysql -y
fi


# Checking is mysql installation is successfull.

if [ $? -ne 0 ]
then    
    echo "MySql installation failed...."
    exit 1
else
    echo "MySql successfully installed..."
fi

