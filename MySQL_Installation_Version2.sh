#!/bin/bash

# fetch and store id of the user in a variable.
ID=$(id -u)
if [ $ID -ne 0 ]
then
    "echo looks you are not a root user the user name is : $Username=$(whoami)"