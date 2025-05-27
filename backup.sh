#!/bin/bash

# Add this script to cron
# crontab -e
#40 3 * * * /home/pi/backup.sh > /home/pi/backup.txt 2>&1

# Define source and destination directories
SRC="/home/pi/docker/"
DEST="/home/pi/backup/pi-docker/"

echo "===== Starting Docker Backup: $(date) ====="

# Create new backup directory
cd "$SRC"
mkdir -p "$DEST"

# stop all continers
docker stop $(docker ps -a -q)

#Backup docker appdata
echo "Starting rsync backup..."
sudo rsync -avh --chown=1000:1000 --progress --delete "$SRC" "$DEST"

#Start docker containers
docker start $(docker ps -a -q -f status=exited)

# Sleep 10 seconds to allow docker containers to start
echo "Sleeping for 10 seconds to allow docker containers to start"
sleep 10

#Clean-up
docker system prune -f

echo "===== Backup Completed: $(date) ====="
