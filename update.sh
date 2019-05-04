#!/bin/bash
cd ~/docker-vm
rm docker-compose.yaml
rm update.sh
git reset --hard origin/master
git pull
cp ~/docker-vm/* ~/docker-compose-letsencrypt-nginx-proxy-companion
cd ~/docker-compose-letsencrypt-nginx-proxy-companion
~/docker-compose-letsencrypt-nginx-proxy-companion/start.sh
docker-compose restart nginx-gen