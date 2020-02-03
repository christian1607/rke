#/bin/bash
curl https://releases.rancher.com/install-docker/18.09.2.sh | sh

#Agregamos el usuario al grupo de docker
sudo usermod -aG docker vagrant