#!/bin/bash

# In shell script or in any programming language logging is an essential aspect of running
# the scripts.

# Logs helps in: Identifying Errors, they provide detailed information about errors and
# exceptions, helping developers what went wrong.

# By logging developers can keep track of execution flow and see where it deviates from the
# expected  behavior.

# Monigoring: 
# Logs can include timing information to help monitor performance and identify bottelnecks.

# Resource usage: 
# Tracking resource usage like memory, CPU, and disk can help in understanding the system
# health and performance.

# Audit trail:
# Logs can track who executed the script and what changes were made, which is crucial for 
# security audits.

# Best practices for logging:

# Log levels: Use different log levels (e.g DEBUG, INFO, WARN, ERROR)to categorize log messages.

# Log format: Ensure logs are in consistent and readable format.
# Log rotation: Implement log rotation to manage log file sizes and avoid disk spaces issues.
# Secure logs: Ensure logs are stored securely to prevent unauthorized access, especially if they
# contains sensitive information.

#=======================================================================================

LOG_FILE = "/var/log/htop_install.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M%S') - $1 | tee -a $LOG_FILE
}

install_htop() {
    log "verifying do htop is installed or not"

    if [ $? -nq 0 ]
    then 
        log "htop isn't installed in your machine"
        echo " starting htop installation "
        log " starting htop installation "
        sudo apt-get install htop -y
        log " htop installed successfully "
        echo "htop installed successfully"
    elif [ $? -eq 0 ]
    then
        log "htop is already installed in your machine"
        echo "htop is already installed in your machine"
    fi
    

}

install_htop


