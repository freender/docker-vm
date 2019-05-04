#!/bin/bash
cd ~/docker-vm
rm docker-compose.yaml
git reset --hard origin/master
cp ~/docker-vm/docker-compose.yaml ~/docker-compose-letsencrypt-nginx-proxy-companion/docker-compose.yaml
cd ~/docker-compose-letsencrypt-nginx-proxy-companion
~/docker-compose-letsencrypt-nginx-proxy-companion/start.sh
docker-compose restart nginx-gen