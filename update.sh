#!/bin/bash
. /home/$USER/.profile
echo $USER
cd /home/freender/docker-vm
rm *
git reset --hard origin/master
git pull
mv /home/freender/docker-vm/docker-compose.yaml /home/freender/docker-compose-letsencrypt-nginx-proxy-companion
mv /home/freender/docker-vm/update.sh /home/freender/
chmod +x /home/freender/update.sh
cd /home/freender/docker-compose-letsencrypt-nginx-proxy-companion
/home/freender/docker-compose-letsencrypt-nginx-proxy-companion/start.sh
docker-compose restart nginx-gen