# Docker_VM (Plex, Sonarr, Radarr, Lidarr, Jacket, NZBGet, Deluge, Tautulli, Ombi, Proxy(docker-compose + letsencrypt + nginx-proxy-companion))

Plex Media Server + Web Proxy using Docker, NGINX and Let's Encrypt

## How to use it

⋅⋅1. Clone this repository - docker-compose + letsencrypt + nginx-proxy-companion

```
cd ~
git clone https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion.git
```

⋅⋅1. Make a copy of our .env.sample and rename it to .env:

```
cd ~/docker-compose-letsencrypt-nginx-proxy-companion
cp .env.sample .env
```

⋅⋅1. Add and fill following constants to .env

```
vim .env
```

Insert 3 variables:
```
#DDNS Password

DDNS_PASSWORD=somepassword

#Root domain URL

HOST_URL=somedomain.com

#Email for LE

EMAIL=someemail@gmail.com
```


4. Clone this repository

```
cd ~
git clone https://freender@github.com/freender/docker-vm.git
```

5. Run start script 

```
sudo ./start.sh
```

6. Create Users for each service

```
sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/sonarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/sonarr.freender.pw"

sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/radarr.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/radarr.freender.pw"

sudo sh -c "echo -n 'deluge:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/deluge.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/deluge.freender.pw"

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


sudo sh -c "echo -n 'freender:' >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/or.freender.pw"
sudo sh -c "openssl passwd -apr1 >> /home/freender/docker-compose-letsencrypt-nginx-proxy-companion/nginx-data/htpasswd/qbittorrent.freender.pw"
```

7.
```
cd ~/config
mkdir ddns-updater
touch ~/config/ddns-updater/config.json
# Owned by user ID of Docker container (1000)
chown -R 1000 ddns-updater
# all access (for sqlite database)
chmod 700 ddns-updater
# read access only
chmod 400 ddns-updater/config.json
```



7. Copy Update script to MainDir

```
cp ~/docker-vm/* ~/docker-compose-letsencrypt-nginx-proxy-companion
chmod +x update.sh

```

8. Script allows to check out latest docker-compose file and redeploy all images

```
./update.sh
```

7. In some cases you will need to restart the proxy in order to read, as an example, the Basic Auth, if you set it after your service container is already up and running. So, the way I use to restart the proxy (NGINX) is as following, which has no downtime:

```
docker exec -it nginx-web nginx -s reload
```

8. Show logs

```
docker-compose logs -f [service name]
```

9. Clean-up old images and free space

```
docker system prune
```


Important links:
https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion