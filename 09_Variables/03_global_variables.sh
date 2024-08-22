#!/bin/bash

# In shell scripting, global variables are variables that are accessible from anywhere within the script. 

# They are not confined(restricted) to a specific function or block of code.

# Once defined, global variables can be read or modified by any part of the script, including inside 
#..functions.

global_var="Hi I'm global variable my initial value is: 1"

echo $global_var

function my_function() {
    echo "changing the value of global_var to 2"
    global_var="Hi I'm global variable my changed value in my_function is: 2"
    echo $global_var
}

my_function

echo "printing value of global_var outside the my_function"
echo $global_var
