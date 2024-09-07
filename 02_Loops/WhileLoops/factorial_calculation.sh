#!/bin/bash
# set -x

# Write a script to calculate the factorial of a given number using a while loop.

# if the user inputs 4, the script should output 24 (since 4! = 4 × 3 × 2 × 1 = 24).

echo "Enter a number"
read -r number
fact=$number

while [ "$number" -ne 1 ];do

    fact=$((fact * (number - 1)))
    number=$((number - 1))
done

echo "$fact"

# set +x

