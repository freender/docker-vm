# Reverse Proxy on Raspberry Pi 4

Installs docker + docker-compose on ARM (Rasperry Pi 4)
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
```
sudo reboot now
```
5. Test Docker installation
```
docker run hello-world
```
4. IMPORTANT! Install proper dependencies
```
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
```
5. Install Docker Compose
```
sudo pip3 -v install docker-compose
```
6. If you not using Pi4 GUI - Remove udisks2 - it causes memory leaks
```
sudo apt remove udisks2 & sudo apt -y autoremove
```
7. Clone docker-compose.yaml
```
mkdir ~/docker
cd ~/docker
git clone git clone https://github.com/freender/docker-vm.git
```
8. Pull docker-compose images and start containers
```
docker-compose pull
docker-compose up -d
```

## Unattended updates:
1. Install unattended-upgrades package
```
sudo apt install unattended-upgrades
sudo apt install apt-listchanges

```
2. Edit 50unattended-upgrades
```
vi /etc/apt/apt.conf.d/50unattended-upgrades
```
3. Change following info
```
// The Raspberry Pi Foundation doesn't use separate a separate security upgrades channel.
// To make sure your RPi has the latest security fixes, you have to install all updates.

Unattended-Upgrade::Origins-Pattern {
// The Raspberry Pi Foundation doesn't use separate a separate security upgrades channel.
// To make sure your RPi has the latest security fixes, you have to install all updates.

Unattended-Upgrade::Origins-Pattern {
        "origin=Raspbian,codename=${distro_codename},label=Raspbian";
        "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";
};

// Automatically reboot *WITHOUT CONFIRMATION* if
//  the file /var/run/reboot-required is found after the upgrade
Unattended-Upgrade::Automatic-Reboot "true";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately
//  Default: "now"
Unattended-Upgrade::Automatic-Reboot-Time "04:00";
};
```
4. Edit 20auto-upgrades
```
vi /etc/apt/apt.conf.d/20auto-upgrades
```
5. Add following info
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "3";
APT::Periodic::Verbose "1";
APT::Periodic::Unattended-Upgrade "1";
```

## Raspberry Pi 4 firmware upgrade
```
sudo apt update & sudo apt -y full-upgrade
sudo rpi-update
sudo reboot
sudo rpi-eeprom-update -d -a

# Use raspi-config to select either the default-production release or latest update.
sudo raspi-config
sudo reboot
```

## Argon M.2 Soft
```
curl https://download.argon40.com/argon1.sh | bash
argonone-config  #configure driver
```

## Enable FSTRIM
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi


## Nice to have commands:

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

#Install JRE11 
sudo apt-get update & sudo apt-get install openjdk-11-jdk-headless

#Find out the java process PID 
ps aux | grep java

#Create the thread dump 
jstack PID > threads.txt
```

 - unmount Share
```
fusermount -uz /mnt/user/mount_rclone/gdrive

```
 - unzip Plex directory from backup

```
tar -zxvf CA_backup.tar.gz plex
```
