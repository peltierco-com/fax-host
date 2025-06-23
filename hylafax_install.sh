#!/bin/bash
#curl -s -L https://github.com/peltierco-com/fax-host/raw/refs/heads/main/hylafax_install.sh | bash
cd /usr/src/
wget http://prdownloads.sourceforge.net/hylafax/hylafax-7.0.11.tar.gz?download -O hylafax-7.0.11.tar.gz
tar -xzf hylafax-7.0.11.tar.gz
cd hylafax-7.0.11
./configure
make
sudo make install
