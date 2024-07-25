#!/bin/bash

# If we want to make a descion or execute a code snippet based on conditions or some validations then we should use
# conditional statements in any programming language.

# General conditional statement syntax

# if (expression){
# if condition satisfies 'execute code snippet in if block.'
# }
# else if(expression){
# condidion in first else if is satisfies but not in if statement then execute code snippet in first else if block.
# }
# else{
# If 'If' and 'Else-if' statements fail then finally 'else' statement executes.
#}

NUMBER=$1

if [ $NUMBER -gt 100 ]
then 
    echo "Given number $NUMBER is greater than 100"
else
    echo "Given number $NUMBER is not greater than 100"
