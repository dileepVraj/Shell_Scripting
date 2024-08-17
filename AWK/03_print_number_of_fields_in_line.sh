#!/bin/bash

# To print number of fields in a line or each line using AWK we can achieve that using built in variable 'NF'

echo " first second third fourth fifth sixth seventh eigth " | awk '{print NF}'

Explanation:

    # we are sending a string as standard out put to 'awk' and using 'print' command with 'NF(Number of fields)'
    # .. inbuild variable.

    
