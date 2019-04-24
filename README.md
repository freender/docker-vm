# Docker_VM (Plex, Sonarr, Radarr, Lidarr, Jacket, NZBGet, Deluge, Tautulli, Ombi, Proxy(docker-compose + letsencrypt + nginx-proxy-companion))

Plex Media Server + Web Proxy using Docker, NGINX and Let's Encrypt

## How to use it

1. Clone this repository - docker-compose + letsencrypt + nginx-proxy-companion

```
cd /home/freender/
git clone https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion.git
```

2. Make a copy of our .env.sample and rename it to .env:

```
cd /home/freender/docker/docker-compose-letsencrypt-nginx-proxy-companion
cp .env.sample .env
```

3. Clone this repository

```
git clone https://freender@github.com/freender/docker-vm.git
```

4. Run start script 

```
sudo ./start.sh
```

5. Create Users for each service

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
```

Important links:
https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion
