#!/bin/bash
#curl -s -L https://github.com/peltierco-com/fax-host/raw/refs/heads/main/modem_install.sh | bash

#git clone
cd ~
rm -rf ~/fax-modem
git clone https://github.com/peltierco-com/fax-modem.git

#docker build
cd ~/fax-modem/docker
docker compose up .