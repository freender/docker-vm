# Docker_VM (Plex, Sonarr, Radarr, Lidarr, Jacket, NZBGet, Deluge, Tautulli, Ombi, Proxy(docker-compose + letsencrypt + nginx-proxy-companion))

Plex Media Server + Web Proxy using Docker, NGINX and Let's Encrypt

## How to use it

1. Clone this repository - docker-compose + letsencrypt + nginx-proxy-companion

```
cd ~
git clone https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion.git
```

2. Make a copy of our .env.sample and rename it to .env:

```
cd ~/docker-compose-letsencrypt-nginx-proxy-companion
cp .env.sample .env
```

3. Add and fill following constants to .env

```
vim .env
```

Insert 3 variables:
```
#Root domain URL

HOST_URL=yourdomain.com

#Email for letsencrypt acount

EMAIL=youremail@gmail.com

# OMBI MYSQL_ROOT_PASSWORD
MYSQL_ROOT_PASSWORD = password


```


4. Clone this repository

```
cd ~
git clone https://freender@github.com/freender/docker-vm.git
```


5. Create Users for each service

```
sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/sonarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/sonarr.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/radarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/radarr.freender.pw"

sudo sh -c "echo -n 'nzbget:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/nzbget.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/nzbget.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/jackett.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/jackett.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/lidarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/lidarr.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/ombi.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/ombi.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/hydra.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/hydra.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/tautulli.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/tautulli.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/ddns.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/ddns.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/qbittorrent.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/qbittorrent.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/bazarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/bazarr.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/adminer.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/adminer.freender.pw"

sudo sh -c "echo -n 'admin:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/grafana.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/grafana.freender.pw"





sudo sh -c "echo -n 'admin:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/prometheus.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/prometheus.freender.pw"

sudo sh -c "echo -n 'admin:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/node-exporter.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/node-exporter.freender.pw"

sudo sh -c "echo -n 'admin:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/alertmanager.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/alertmanager.freender.pw"

sudo sh -c "echo -n 'admin:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/cadvisor.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/cadvisor.freender.pw"





```

6. Create ddns-updater config
```
cd ~/config
mkdir ddns-updater
touch ~/config/ddns-updater/config.json
```

Add following payload
```
vim ~/config/ddns-updater/config.json
```

```
{
    "settings": [
        {
            "provider": "namecheap",
            "domain": "your.domain",
            "host": "*",
            "ip_method": "provider",
            "delay": 300,
            "password": "password"
        }
    ]
}

```


7. Change permissions
```
# Owned by user ID of Docker container (1000)
chown -R 1000 ~/config/ddns-updater
# all access (for sqlite database)
chmod 700 ~/config/ddns-updater
# read access only
chmod 400 ~/config/ddns-updater/config.json
```


8. Copy Update script to MainDir

```
cp ~/docker-vm/* ~/docker-compose-letsencrypt-nginx-proxy-companion
chmod +x update.sh

```

9. Script allows to check out latest docker-compose file and redeploy all images

```
./update.sh
```


Nice to have commands:
 - In some cases you will need to restart the proxy in order to read, as an example, the Basic Auth, if you set it after your service container is already up and running. So, the way I use to restart the proxy (NGINX) is as following, which has no downtime:

```
docker exec -it nginx-web nginx -s reload
```

```
  docker exec -it plex /bin/bash
```

 - Show logs

```
docker-compose logs -f [service name]
```

 - Clean-up old images and free space

```
docker system prune
```


SQLite Access

```
apt update
apt install sqlite3
cd /config
sqlite3 Ombi.db
```

Check linux permissions
```
 ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) \
             *2^(8-i));if(k)printf("%0o ",k);print}'
```

Add Symlink
```
ln -s /mnt/disks/plexssd/plex /mnt/user/appdata/plex
```

Please create a thread dump.
```
sudo docker exec --user=hotio -it hydra2 /bin/bash
```
Install JRE11 sudo apt-get update, sudo apt-get install openjdk-11-jdk-headless
Find out the java process PID ps aux | grep java
Create the thread dump jstack PID > threads.txt
Get the txt file (use scp or something or just copy the content to the clipboard)
Post the thread dump
Did you do anything to change the logging besides changing the config? I'm seeing loads of debug output I don't usually see.

Could you set the XMX value to 2048 or something like that just to see what happens?

Unmount Share
```
fusermount -uz /mnt/user/mount_rclone/gdrive

```
Unzip Plex directory from backup

```
tar -zxvf CA_backup.tar.gz plex
```

Important links:
https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion





1. Install Docker
curl -sSL https://get.docker.com | sh

2. Add permission to Pi User to run Docker Commands
sudo usermod -aG docker pi

Reboot here or run the next commands with a sudo

3. Test Docker installation
docker run hello-world

4. IMPORTANT! Install proper dependencies
sudo apt-get install -y libffi-dev libssl-dev

sudo apt-get install -y python3 python3-pip

sudo apt-get remove python-configparser

5. Install Docker Compose
sudo pip3 -v install docker-compose


