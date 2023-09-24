#!/bin/bash

# Develop a Bash script that automates 
# the process of creating regular backups 
# of the personal record file

BACKUPTIME=`date +%b-%d-%y`

BACKUP_DIRECTORY="./backups/"

DESTINATION="./backups/backup_$BACKUPTIME.tar.gz"

SOURCEFILE="./personal-record.txt"

# Create the backup
echo "Starting backup..."
tar -cpzf $DESTINATION $SOURCEFILE

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully to $DESTINATION"
else
    echo "Backup failed!"
fi

# Extract backup folder (same directory)
echo "Extracting backup folder..."
tar -xvzf $DESTINATION -C $BACKUP_DIRECTORY
