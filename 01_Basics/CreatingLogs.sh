#!/bin/bash

# In shell script or in any programming language logging is an essential aspect of running
# the scripts.

# Logs helps in: Identifying Errors, they provide detailed information about errors and
# exceptions, helping developers what went wrong.

# By logging developers can keep track of execution flow and see where it deviates from the
# expected  behavior.

# Monitoring: 
# Logs can include timing information to help monitor performance and identify bottelnecks.

# Resource usage: 
# Tracking resource usage like memory, CPU, and disk can help in understanding the system
# health and performance.

# Audit trail:
# Logs can track who executed the script and what changes were made, which is crucial for 
# ...security audits.

# Best practices for logging:

# Log levels: Use different log levels (e.g DEBUG, INFO, WARN, ERROR)to categorize log messages.

# Log format: Ensure logs are in consistent and readable format.
# Log rotation: Implement log rotation to manage log file sizes and avoid disk space issues.
# Secure logs: Ensure logs are stored securely to prevent unauthorized access, especially if they
# contains sensitive information.

#=======================================================================================

# Red colour
# Define color variables
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
RESET='\e[0m'

LOG_FILE="/var/log/htop_install.log"

log() {
    local color=$1
    echo -e "${color}$(date '+%Y-%m-%d %H:%M:%S') - $@${RESET}" | tee -a $LOG_FILE
    # Explination:

    # Above command will prints the date in format of 'yyyy','mm','dd' 'hh','mm'and'ss' format.
    # then $1 -> what ever argument we are passing to the function will be append to the log file.
    # '|' -> this pipe symbol is used to pass output of one command as input to another command.
    # 'tee'-> The tee command reads from standard input and writes to both standard output to one or more files.
    # This means it will display output on the console and also writes to the file.
    # 'a'-> The -a option stands for 'append'. When used with 'tee' it tells the 'tee' to
    # append the output to the file rather than overwriting the file. This ensures that each log entry is added 
    # to the end of the log file, preserving the previous entries.
    # 'LOG_FILE'-> This is a variable that holds the path to the log file. The output will be appended to the file specified in this variable.


}

install_htop() {
    # Printing file name.
    echo $0
    log $CYAN "verifying if htop is installed or not"

    # Check if htop is installed using 'which' command.

    if ! which htop &> /dev/null; then
    log $CYAN "htop isn't installed on your machine"
    echo "Starting htop installation"
    log $CYAN "Starting htop installation"
    sudo apt-get install htop -y

        # Check if installation is successfull
        if [ $? -eq 0 ]; then
        log $GREEN "htop installed successfully"
        echo "htop installed successfully"

        else
            log $RED "htop installation failed"
            echo "htop installation failed"
        fi
    else
        log $CYAN "htop is already installed on your machine"
        echo "htop is already installed on your machine"
    fi

prompt_keep_or_uninstall

}

prompt_keep_or_uninstall() {
    echo $BLUE " Do you want to keep 'htop' or 'uninstall' it? Enter 'k' to keep or 'u' to uninstall."
    read RESPONSE
    if [ "$RESPONSE" == "u" ]; then
    echo "user chose to un-install htop"
    log $CYAN "user chose to un-install htop"
    uninstall_htop
    else
        $YELLOW log "user decided to keep htop"
        echo "htop will be kept on your machine"
    fi
}

uninstall_htop() {
    log $YELLOW "Uninstalling htop"
    echo "Uninstalling htop"

    sudo apt-get remove --purge htop -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean

    if ! which htop &> /dev/null; then
    log $GREEN "htop un-installted successfully"
    echo "htop un-installed successfully"
    else
    log $RED "htop un-installation failed"
    echo "htop un-installation failed"
    fi

}

install_htop


