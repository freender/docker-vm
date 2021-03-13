# Reverse Proxy on Raspberry Pi 4

## Installation steps:
1. Update all packages
```
sudo apt update & sudo apt -y full-upgrade
```

2. Install Docker
```
curl -sSL https://get.docker.com | sh
```


3. Add permission to Pi User to run Docker Commands
```
sudo usermod -aG docker pi
```

4. Reboot here

5. Test Docker installation
```
docker run hello-world
```
4. IMPORTANT! Install proper dependencies
sudo apt-get install -y libffi-dev libssl-dev

sudo apt-get install -y python3 python3-pip

sudo apt-get remove python-configparser

5. Install Docker Compose
sudo pip3 -v install docker-compose

6. Remove udisks2 - it causes memory leaks
sudo apt remove udisks2

7. Create docker compose and checkout docker-compose file

mkdir ~/docker
cd ~/docker
git clone https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion.git


8. Pull docker-compose images and run containers from yaml file
docker-compose pull
docker-compose up -d




Nice to have commands:

 - run shell inside container
```
  docker exec -it plex /bin/bash
```

 - show logs

```
docker-compose logs -f [service name]
```

 - clean-up old images and free space

```
docker system prune
```


- connect to SQLite database

```
sudo apt update
sudo apt install sqlite3
cd /config
sqlite3 Ombi.db
```

 - check linux permissions
```
 ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) \
             *2^(8-i));if(k)printf("%0o ",k);print}'
```

 - add Symlink
```
ln -s /mnt/disks/plexssd/plex /mnt/user/appdata/plex
```

 - Create JAVA thread dump
```
sudo docker exec --user=hotio -it hydra2 /bin/bash

Install JRE11 
sudo apt-get update & sudo apt-get install openjdk-11-jdk-headless

Find out the java process PID 
ps aux | grep java

Create the thread dump 

jstack PID > threads.txt

Get the txt file (use scp or something or just copy the content to the clipboard)
```

Unmount Share
```
fusermount -uz /mnt/user/mount_rclone/gdrive

```
Unzip Plex directory from backup

```
tar -zxvf CA_backup.tar.gz plex
```
