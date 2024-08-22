#!/bin/bash

# Initialize the 'Name' variable as an empty string
Name=""

# Initialize the 'Message' variable with a default value
Message="How are you mate!"

# Define a function named 'Usage' to display usage information
Usage() {
    # Print the correct way to use the script, using the script's name
    echo "Usage:: $(basename $0) -n <name> -w <message>"
    
    # Print out the options available for the script
    echo "Options:"
    echo " -n, specify name (mandatory)"  # Explain the -n option (used to provide a name)
    echo " -w, specify the message (mandatory)"  # Explain the -w option (used to provide a custom message)
    echo " -h, Display Help and exit"  # Explain the -h option (used to display help and exit the script)
}

# Start processing command-line options using getopts
# The options string ":n:m:h" tells getopts what options the script accepts:
#   - 'n' for name (requires an argument)
#   - 'm' for message (requires an argument)
#   - 'h' for help (does not require an argument)
while getopts ":n:m:h" option; do
    # Use a case statement to handle each option
    case $option in
        # If the -n option is provided, store the argument in the 'Name' variable
        n) Name="$OPTARG";;
        
        # If the -m option is provided, store the argument in the 'Message' variable
        m) Message="$OPTARG";;

        # If the -h option is provided, call the Usage function and exit the script
        h) Usage; exit;;

        # If an option is missing its argument, display the usage information and exit
        :) Usage; exit;;

        # If an invalid option is provided, print an error message to stderr and exit
        \?) echo "Invalid options: -"$OPTARG"" >&2; Usage; exit;;
    esac
done

# Check if both 'Name' and 'Message' variables are empty
if [ -z "$Name" ] && [ -z "$Message" ]; then
    # If both variables are empty, print an error message
    echo "Error: Both -n & -w are mandatory options."
    # Call the Usage function to show how to use the script correctly
    Usage;
    # Exit the script with a status code of 1 to indicate an error
    exit 1;

# Check if only 'Name' is empty
elif [ -z "$Name" ]; then
    # If the 'Name' variable is empty, print an error message
    echo "Error: Option -n is mandatory."
    # Call the Usage function to show how to use the script correctly
    Usage;
    # Exit the script with a status code of 1 to indicate an error
    exit 1;
fi

# If all checks are passed, print the final message with the provided 'Name' and 'Message'
echo "$Name, $Message"
