#!/bin/bash

# Write a script that calculates the sum of all natural numbers up to a user-provided limit.

echo "Enter a number"
read number

while [ $number -ne 0 ];do
sum=$((sum + number))
number=$((number - 1))
done

echo $sum