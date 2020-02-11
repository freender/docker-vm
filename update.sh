#!/bin/bash
cd /home/freender/docker-vm
echo "Removing old update script"
rm *
echo "Pulling new script from GitHub"
git reset --hard origin/master
git pull
mv /home/freender/docker-vm/docker-compose.yaml /home/freender/docker-compose
mv /home/freender/docker-vm/update.sh /home/freender
chmod +x /home/freender/update.sh
cd /home/freender/docker-compose
echo "Running docker-compose up -d"
/home/freender/docker-compose/start.sh
docker-compose restart nginx-gen
echo "Clean Up after Docker"
docker system prune -f