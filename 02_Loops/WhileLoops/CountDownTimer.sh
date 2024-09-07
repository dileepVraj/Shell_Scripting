#!/bin/bash

# Write a script that takes a number as input and counts down to zero, printing each number with a 
# ...1-second delay.

echo "Enter a number"
read number
while [ $number -ne 0 ]; do
number=$((number - 1))
echo $number
sleep 1
done