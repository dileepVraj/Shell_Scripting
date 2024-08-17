#!/bin/bash

# problem?
    # Print a warning message with file system when disk usage threshold is equal to or greater than 1%.

# Algorithm:
    # 1. output the disk usage of machine.
    # 2. filter out records except the file system.
    # 3. store the file_system type value and disk usage value in separate variables.
    # 4. verify the threashold or usage.
    # 5. print warning message if usage is equal or greater than 1 if not print just usage.

DISK_USAGE=$(df -hT)
threshold=""
fileSystemType=""

while IFS= read -r line
do
    echo $line | awk '{ print $1F }'
done <<< $DISK_USAGE




