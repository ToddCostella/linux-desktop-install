#!/bin/bash

apt update

apt upgrade -y

export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata


apt install zip -y
apt install unzip -y
apt install htop -y
apt install zsh -y
apt install git -y
apt install mc -y
apt install tmux -y
apt install curl -y
apt install wget -y

apt-get install libc6 -y
apt-get install libglapi-mesa -y
apt-get install libxdamage1 -y
apt-get install libxfixes3 -y
apt-get install libxcb-glx0 -y
apt-get install libxcb-dri2-0 -y
apt-get install libxcb-dri3-0 -y
apt-get install libxcb-present0 -y
apt-get install libxcb-sync1 -y
apt-get install libxshmfence1 -y
apt-get install libxxf86vm1 -y


## Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


## Docker and Docker Compose

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io -y 

groupadd docker
usermod -aG docker ${USER}
systemctl restart docker


#DropBox

wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# .dropbox-dist/dropboxd

chsh -s $(which zsh) 

