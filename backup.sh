#!/bin/bash

# Add this script to cron
# crontab -e
#0 9 * * 1,4 /home/pi/backup.sh > /home/pi/backup.txt 2>&1

# Backup rsyslog config
# sudo apt install rsyslog
cp /etc/rsyslog.conf /home/pi/backup/rsyslog.conf


#Delete old backup files and create new backup
now=$(date +"%m%d%Y")
cd /home/pi/docker
rm -f /home/pi/backup/*
cp -u /home/pi/backup.sh /home/pi/backup/backup.sh
docker-compose stop

#Delete Nginx logs after backup
sudo zip -oqrm /home/pi/backup/nginx_logs_pi_$now.zip /home/pi/docker/nginx_proxy_manager/data/logs

#Delete Certbot archived keys after backup
sudo zip -oqrm /home/pi/backup/nginx_keys_pi_$now.zip /home/pi/docker/nginx_proxy_manager/letsencrypt/csr /home/pi/docker/nginx_proxy_manager/letsencrypt/keys

#Delete pihole logs after backup
sudo zip -oqrm /home/pi/backup/pihole_logs_pi_$now.zip /home/pi/docker/pi-hole/etc-pihole/pihole-FTL.db

#Backup docker appdata
sudo zip -oqr /home/pi/backup/docker_backup_pi_$now.zip /home/pi/docker


#Update and cleanup docker
docker-compose pull
docker-compose up -d
docker system prune -f
