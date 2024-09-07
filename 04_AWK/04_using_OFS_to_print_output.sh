#!/bin/bash

# string of words / characters where I want to print each word/field by knowing
#..exact number of fields the string has.

echo "enter a sentence"
read -r sentence

# Explaination: printing number of fields count using substitution.
echo "Number of fields in user specified sentence are:" $(echo $sentence | awk '{print NF}')


echo "Printing them with Output Field Seperator"


echo $sentence | awk 'BEGIN { OFS=":" } { print $1,$2,$3 }'

# Explaination:
    # 'echo $sentence ' piping value of 'sentence' variable to to 'awk'.
    # awk (text processor)
    # 'BEGIN' is a special block that allows us to execute actions before any input lines are processed.
    # This block is typically used to set variables, initialize counters, or perform any setup 
    # operations that should occur before AWK starts reading the input data.
    # {OFS=':'} Specifying the delimiter that output should printed.
    






