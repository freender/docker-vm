#!/bin/bash

cd ~/docker-vm
rm *
git reset --hard origin/master
git pull
mv ~/docker-vm/docker-compose.yaml ~/docker-compose-letsencrypt-nginx-proxy-companion
mv ~/docker-vm/update.sh ~/
chmod +x ~/update.sh
cd ~/docker-compose-letsencrypt-nginx-proxy-companion
~/docker-compose-letsencrypt-nginx-proxy-companion/start.sh
docker-compose restart nginx-gen