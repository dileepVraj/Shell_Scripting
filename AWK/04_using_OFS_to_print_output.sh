#!/bin/bash

# string of words / characters where I want to print each word/field by knowing
#..exact number of fields the string has.

echo "enter a sentence"
read sentence

echo "Number of fields in user specified sentence are:" echo $sentence | awk '{print NF}'

echo "Printing them with Output Field Seperator"

echo $sentence | awk '{print $1, 2$, 3$, 4$, 5$, 6$, 7$, 8$}'




