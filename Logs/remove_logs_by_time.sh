#!/bin/bash

# This script is to delete logs files in a user specified directory by user specified time, i.e
#.. need to delete files based on their extension(user input(argument)) and time.

# Algorithm:

# Check do user specified directory exists in system.
# Check do files available with user specified time(the date on which files are created) and with 
#.. specified extension.


# This function takes 3 arguments(1. directory<path> 2. FileNamesWithSpaceCharacterDelimeter 3.date in YYYYMMDD)
createFiles() {
    local directoryToCreateFiles=$1
    local filesNameString=$2
    local date=$3

    # file_one.txt file_two.log 
    if [ ! -d "$directoryToCreateFiles" ]; then
        echo "Directory "$directoryToCreateFiles" doesn't exists."
        echo "creating directory"
        mkdir -p "$directoryToCreateFiles"
        if [ $? -eq 0 ]; then
        echo "directory successfully created"
        else
        echo " directory creation failed"
        return 1
        fi

    else
        echo "Directory "$directoryToCreateFiles" exists."
        
    fi

    # Use IFS to split filesNameString into an array.
    IFS=' ' read -r -a filesNameArray <<< "$filesNameString"

    # Loop through array and create files.
    for filename in "${filesNameArray[@]}"; do
        touch -d "$date" "$directoryToCreateFiles/$filename"
        if [ -f "$directoryToCreateFiles/$filename" ]; then
            echo " file $filename is created in $directoryToCreateFiles"
        else
            echo "Failed to create the file $filename"
        fi
    done

    echo "files created in $directoryToCreateFiles are:"
    ls "$directoryToCreateFiles"





   


    
}

# This function takes 3 arguments 1. <path to directory>, 2. time(in days) 3. name(pattern)
    # Ex: cleanUpLogs "/home/logfiles/" "+14" ".log"
cleanUpLogs() {
    # This function will delete files or directories in a specified directory based on time and name(pattern).


    

    if [ -d "$1" ]; then
    echo "Directory $1 is exists"
    else
        echo " Sorry 😒 directory $1 is not exists."
    fi

    # Command substitution for finding files.
    files=$(find "$1" -type f -mtime "$2" -name "$3")
    # Explanation of above 'Line of Code'.


        # 'find' a command used to find directories or files with in a specified directory hierarchy
        #.. based on various criteria such as name, type, size, modification time, and more.

        # $1 (directory that will be specified by user on function call.)

        #  '-type' is indeed an option (or flag) used with the 'find' command. It allows us to 
        #.. specify the type of files or directories we want to search for.

        # 'f' this is argument to '-type', meaning 'file'. It instructs 'find' to include only regular
        # files in the search results, excluding directories, symbolyc links, and other type of files.

        # '-mtime' stands for 'modification time' used to filter files and directories based on when
        # they were last modified.
        # The '-mtime' option allows us to specify a time in days. we can search for files modified 
        # exactly, more than, or less than a certain number of days ago.

            # catch:
                # If we want to find files which are created or modified exactly on some days ago then,
                # we should use number without any prefix i.e(5/6/7)
                    # Explination:
                        # If we specify a number 5 without any prefix then Shell is going to find us files
                        #.. which are modified 5 days ago.

                        # If we specify  7 with prefix '+' then Shell is going to find us files 
                        # .. which are modified more than 7 days ago.

                        # If we specify 6 with prefix '-' then shell is going to find us files
                        # .. which are modified within the last 6 days .

        # '-name' The name option in the 'find' command is used to filter search results based on the
        #.. names of directories or files.
        # It allows us to specify a pattern or exact name to match files and directoreis aganist.

        # '*.$3' (pattern user will specify on function call.)

    #=================================================================================================

    if [ -n "$files" ]; then

        # Above if statement explanation:
            # '-n' is used with 'test' command or '[]' syntax to check if string is non-empty.

        echo "$files" | while IFS= read -r file; do
            # Above while statement explanation:
                # IFS(Internal Field Separator) :
                    # IFS is an environment variable in Unix-like operating systems that defines the
                    # character(s) used to split input strings into fields.
                    # It is crucial for processing text data in shell scripts.

                # Usage:
                #     'IFS' is used to control how the shell splits input into words or tokens.
                #     It's particularly useful when deaing with loops or reading input from files where
                #     you want to specify custom delimeters.
                
                # Default value:
                #     By default 'IFS' is set to 'space', 'tab', and 'newline' characters. This means
                #     ..the Shell split input based on these characters when performing operations like
                #     ..word splitting.
                
        rm "$file"
        echo "Deleted file: $file"
        done
    else
        echo "No files found to delete."
    fi



    

    




        #+'$2'(days specified by user on function call.)









}

# createFiles "/home/Log_files" "file_one.txt file_two.log" "20240630"
cleanUpLogs "/home/Log_files" "+10" "*.log"