#!/bin/bash

# Array is one of the type variable which stores multiple values in it.

# we should retrive data from array based on index number of the value stored.

# Index in arry of shell script is started with 0.

# here we go....

echo "Enter first fruit"

read fruit_one

echo "Enter second fruit"

read fruit_two

echo "Enter third fruit"

read fruit_three

FRUITS=("$fruit_one" "$fruit_two" "$fruit_three")

echo "First fruit from Fruits array: ${FRUITS[0]}"

echo "Second fruit from Fruits array: ${FRUITS[1]}"

echo "Third fruit from Fruits array: ${FRUITS[2]}"

