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

while IFS= read -r line
do
    if [ "$(echo $line | awk '{ print $1F }')" != 'tmp|File' ]; then
        echo $line
        filesys=$(echo "$line" | awk '{ print $1 }')
        echo "file system is $filesys"
        threshold=$(echo "$line" | awk '{ print $6 }' | cut -d % -f 1)
        echo "disk_usage is  $threshold"
            if [ "$threshold" -ge 1 ]; then
                echo "***Alert disk usage on $filesys: is reached maximum threshold $threshold"
            else
                echo "Disk usage is $threshold"
            fi


    fi
    
done <<< $DISK_USAGE




