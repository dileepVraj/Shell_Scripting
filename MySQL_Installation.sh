#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Can't install services without sudo privileges"
fi
# trying to install mysql client...
apt-get install mysql -y

