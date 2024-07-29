#!/bin/bash

# Read input from user and print 'yes <value> is greater than 50 ' if value entered is greater
# than 50 if not 'No <value> is not greater than 50 '.

echo "please enter a value"
read VALUE

if [$VALUE -gt 50]; then
echo "Yes $VALUE is greater than 50"
else
    echo "No $VALUE is not greater than 50"
