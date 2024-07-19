#!/bin/bash

# Add this script to cron
# crontab -e
#0 9 * * 1,4 /home/pi/backup.sh > /home/pi/backup.txt 2>&1

# Create new backup directory
now=$(date +"%m%d%Y")
cd /home/pi/docker
mkdir -p /home/pi/backup/pi-docker
mkdir -p /home/pi/backup/pi-docker/$now

# stop portainer
docker compose stop
# stop continers spawned by portainer
docker stop $(docker ps -a -q)

#Backup docker appdata
sudo zip -oqr /home/pi/backup/pi-docker/$now/docker_backup_pi_$now.zip /home/pi/docker

#Delete empty dirs
find /home/pi/backup/pi-docker/ -empty -type d -delete
#Delete old backups
rm -r `ls /home/pi/backup/pi-docker -t | awk 'NR>1'`

#Update portainer
docker compose pull
docker compose up -d

#Start docker containers
docker start $(docker ps -a -q -f status=exited)

#Clean-up
docker system prune -f
