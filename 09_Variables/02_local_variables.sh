#!/bin/bash

# In shell scripting particularly in Bash the 'local' keyword is used to declare variables that are local
#.. to a function.

# This means the variable is only accessible within that function and it is not visible outside of 
#.. that function.

# This helps avoids conflicts with variables of the same name in other parts of the scripts or in 
#.. global scope.

# Syntax: local variable_name=value

global_var="I am a global variable"

my_function() {
    local local_var="I am a local variable"
    echo "Inside my_function: $global_var"
    echo "Inside my_function: $local_var"
}

my_function

# Trying to access local variable of "my_function" outside the function.
echo "Outside the my_function: $local_var"  # This wont pirnt any value to console.

