#!/bin/bash

# Create a simple user authentication script that asks for a password and keeps prompting the user 
# ..until they enter the correct one. Limit the number of attempts to 3.

maxLimit=3
count=0

while [ $count -lt $maxLimit ];do
    echo "Please enter your password"
    read -s password
    if [ $password = "password1#" ];then
        echo "Login successfull."
        exit 0
    else
        echo "Login failed, please try again"
        count=$((count + 1))
    fi
done

echo "Maximum limit reached, Access denied"
exit 1


