#!/bin/bhash

# In a shell script, $(date) is a command substitution syntax used to execute the date command and substitute 
# its output into the script. Here’s a detailed explanation:

# Example: current_date=$(date)
# echo "The current date and time is: $current_date"

current_date = $(date)

echo "current date and time is $current_date "


