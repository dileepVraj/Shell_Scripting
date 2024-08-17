#!/bin/bash

# problem?
    # Print a warning message with file system when disk usage threshold is equal to or greater than 1%.

# Algorithm:
    # 1. output the disk usage of machine.
    # 2. filter out records except the file system.
    # 3. store the file_system type value and disk usage value in separate variables.
    # 4. verify the threashold or usage.
    # 5. print warning message if usage is equal or greater than 1 if not print just usage.

DISK_USAGE=$(df -hT | grep -vE 'tmp|File|overlay')
threshold=0
message=""

check_disk_usage_threshold() {
while IFS= read -r line
    do
        filesys=$(echo "$line" | awk '{ print $1 }')
        echo "file system is $filesys"
        usage=$(echo "$line" | awk '{ print $6 }' | cut -d % -f 1)
        echo "disk_usage is  $usage"
            if [ "$usage" -ge $threshold ]; then
                message+="***Alert disk usage on $filesys: is reached maximum threshold: $usage"
            else
                message+="Disk usage is: $usage"
            fi

            echo $message
            
    
    done <<< $DISK_USAGE
}

check_disk_usage_threshold




