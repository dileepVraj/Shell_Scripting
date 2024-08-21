# Crontab in Linux is a command and a file used to schedule jobs (commands or scripts) to run automatically at specified times and intervals. The term "crontab" stands for "cron table" because it is a table of cron jobs managed by the cron daemon, which is a time-based job scheduler in Unix-like operating systems.

# Key components of Crontab:
1. Crontab File: This is the file where you specify your cron jobs. Each line in the crontab file represents a job and includes the time schedule and the command to run.
2. Crontab Command: The crontab command is used to edit the crontab file, view existing cron jobs, or remove them. Common usages include:
    crontab -e: Edit the current user's crontab file.
    crontab -l: List the current user's cron jobs.
    crontab -r: Remove the current user's crontab file.

Example Corntab entries:

    1. Run a script every day at 5.30AM
        Entry:30 5 * * * /path/to/script.sh
    
    2. Run a command every monday at 3.00PM:
        Entry: 0 15 * * 1 /path/to/command

    3. Run a job every 15 minutes
        Entry: */15 * * * * /path/to/another-script.sh
    
