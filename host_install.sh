#!/bin/bash
#sudo sh -c 'curl -s -L https://github.com/peltierco-com/fax-host/raw/refs/heads/main/host_install.sh | bash'

#update
export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y

#install packages
apt install -y \
    build-essential libtiff-dev libtiff-tools \
    socat supervisor

#install docker
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#download hylafax
cd /usr/src/
wget http://prdownloads.sourceforge.net/hylafax/hylafax-7.0.11.tar.gz?download -O hylafax-7.0.11.tar.gz
tar -xzf hylafax-7.0.11.tar.gz
cd hylafax-7.0.11
#./configure
#make
#make install

