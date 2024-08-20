#!/bin/bash
# The above line is called a shebang. It tells the system that this script should be run using the bash shell.

threshold=1
# Sets a variable named 'threshold' with a value of 1. This is the minimum disk usage percentage at which an alert will be triggered.

disk_usage=$(df -hT | grep -vE 'tmp|File|overlay')
# This line captures the disk usage information and stores it in the 'disk_usage' variable.
# - `df` (disk free): Displays disk space usage.
# - `-h` (human-readable): Human-readable format (e.g., 1K, 234M, 2G).
# - `-T` (print file system type): Shows the filesystem type along with the disk usage.
# - `grep -vE 'tmp|File|overlay'`: Filters out lines that contain 'tmp', 'File', or 'overlay'.
#   - `grep` (global regular expression print): Searches text using patterns.
#   - `-v` (invert match): Inverts the match, so it excludes lines that match the pattern.
#   - `-E` (extended regex): Enables extended regular expressions for multiple patterns.
# This results in capturing disk usage information while excluding unwanted lines.

while IFS= read -r line
# The `while` loop reads each line from the 'disk_usage' variable one by one.
# - `IFS=` (internal field separator): Internal Field Separator is set to an empty value, ensuring that the entire line is read.
# - `read -r line`: Reads a single line into the variable 'line'. The `-r` option (prevent backslash escape) prevents backslashes from being interpreted as escape characters.

do
    disk_usage_percentage=$(echo $line | awk '{print $6}' | cut -d % -f 1)
    # This command extracts the disk usage percentage from the line.
    # - `echo $line`: Outputs the current line.
    # - `awk '{print $6}'`: AWK (Aho, Weinberger, Kernighan) is a powerful text processing tool. This command extracts the 6th field (which typically contains the percentage of disk usage).
    # - `cut -d % -f 1`: The `cut` command splits the percentage value by the '%' delimiter and takes the first part (the number before '%').
    #   - `-d` (delimiter): Specifies '%' as the delimiter to split the text.
    #   - `-f` (field): Specifies that the first field (the number before '%') should be extracted.

    if [ $disk_usage_percentage -ge $threshold ]; then
    # This condition checks if the extracted disk usage percentage is greater than or equal to the threshold.
    # - `-ge` (greater than or equal): Used for comparing numeric values in bash.

        echo "Sending email: $disk_usage_percentage"
        # Outputs a message indicating that an email is being sent, showing the current disk usage percentage.

        echo "Warning disk usage reached to maxium threshold range: $disk_usage_percentage" | mail -s "Disk Usage" neethuatheli@gmail.com
        # Sends an email with a warning about the disk usage.
        # - `echo "Warning..."`: Creates the body of the email.
        # - `mail` (send email): A command-line email client.
        # - `-s` (subject): Specifies the subject of the email as "Disk Usage".
    fi
done <<< "$disk_usage"
# The `done` command signifies the end of the `while` loop.
# `<<< "$disk_usage"`: This is a here-string, feeding the content of 'disk_usage' into the loop line by line.
