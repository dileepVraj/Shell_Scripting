#!/bin/bash

# problem?
    # Print a warning message with file system when disk usage threshold is equal to or greater than 1%.

# Algorithm:
    # 1. output the disk usage of machine.
    # 2. filter out records except the file system.
    # 3. store the file_system type value and disk usage value in separate variables.
    # 4. verify the threashold or usage.
    # 5. print warning message if usage is equal or greater than 1 if not print just usage.

#----------------------------------------------------------------------------------------------------#

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|overlay')
# `df -hT` displays disk space usage with human-readable sizes and filesystem types.
# `grep -vE 'tmp|File|overlay'` filters out lines that contain 'tmp', 'File', or 'overlay'.
# The result is stored in the variable `DISK_USAGE`.

threshold=20
# Defines the threshold value for disk usage in percentage. If disk usage exceeds this value, an alert will be triggered.

message=""
# Initializes an empty variable `message` which is not used in the script but could be used for additional functionality.

check_disk_usage_threshold() {
    # Defines a function named `check_disk_usage_threshold` to check disk usage against the threshold.

    while IFS= read -r line
    # Reads each line from the `DISK_USAGE` variable. `IFS=` ensures leading/trailing whitespace is not trimmed.
    # `read -r` reads the line without interpreting backslashes as escape characters.

    do
        filesys=$(echo "$line" | awk '{ print $1 }')
        # `awk '{ print $1 }'` extracts the first column from the line, which is the filesystem name.
        # Stores the filesystem name in the `filesys` variable.
        echo "file system is $filesys"
        # Prints the filesystem name.

        usage=$(echo "$line" | awk '{ print $6 }' | cut -d % -f 1)
        # `awk '{ print $6 }'` extracts the sixth column from the line, which contains the disk usage percentage.
        # `cut -d % -f 1` removes the percentage sign, leaving just the numeric value.
        # Stores the disk usage percentage in the `usage` variable.
        echo "disk_usage is  $usage"
        # Prints the disk usage percentage.

        if [ "$usage" -ge $threshold ]; then
            # Checks if the disk usage percentage is greater than or equal to the threshold value.
            echo "***Alert disk usage on $filesys: is reached maximum threshold: $usage"
            # If the usage is above the threshold, prints an alert message.
        else
            echo "Disk usage is under control: $usage"
            # If the usage is below the threshold, prints a message indicating that disk usage is within control.
        fi

    done <<< "$DISK_USAGE"
    # The `done <<< "$DISK_USAGE"` syntax feeds the contents of the `DISK_USAGE` variable into the `while` loop.
}

check_disk_usage_threshold
# Calls the `check_disk_usage_threshold` function to execute the disk usage check and alert if necessary.







