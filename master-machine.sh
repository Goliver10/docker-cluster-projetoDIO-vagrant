#!/bin/bash
sudo docker swarm init --advertise-addr=10.20.30.150
sudo docker swarm join-token worker | grep docker > /vagrant/worker-nodes.sh
sudo docker volume create app
sudo cd /var/lib/docker/volumes/app/_data
sudo touch index.html
sudo cd ..
echo: Criando imagem...
sudo docker create --name meu-app-teste --replicas 20 -dt -p 80:80 --mount type=volume,src=app,dst=usr/local/apache2/htdocs/ httpd
