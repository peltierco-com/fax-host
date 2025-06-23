#!/bin/bash
#curl -s -L https://github.com/peltierco-com/fax-host/raw/refs/heads/main/modem_install.sh | bash

#git clone
cd /home/admin
rm -rf /home/admin/fax-modem && /
git clone https://github.com/peltierco-com/fax-modem.git

#docker build
sudo usermod -aG docker $USER && newgrp docker
cd /home/admin/fax-modem/docker/ubuntu
docker build -t fax-modem:latest .