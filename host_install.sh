#!/bin/bash
#sudo sh -c 'curl -s -L https://github.com/peltierco-com/fax-host/raw/refs/heads/main/host_install.sh | bash'
DEBIAN_FRONTEND=noninteractive
export PTLIB_VERSION="2.18.6"
export GIT_PTLIB_VERSION="2_18_6"
export OPAL_VERSION="3.18.6"
export GIT_OPAL_VERSION="3_18_6"
export T38MODEM_VERSION="4.6.2"

#change hostname
hostnamectl set-hostname fax.localhost.lan

#update
apt update
apt upgrade -y

#install packages
apt-get update \
	&& apt-get upgrade -y \
	&& apt install -y g++ git make autoconf libpcap-dev libexpat1-dev libssl-dev libsasl2-dev libldap2-dev unixodbc-dev liblua5.3-dev libv8-dev libncurses-dev libsdl2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev pkg-config libsrtp2-dev libgsm1-dev libspeex-dev libopus-dev libx264-dev libvpx-dev libtheora-dev libspandsp-dev dahdi \
	&& git clone --depth 1 -b "v${GIT_PTLIB_VERSION}" git://git.code.sf.net/p/opalvoip/ptlib \
	&& git clone --depth 1 -b "v${GIT_OPAL_VERSION}" git://git.code.sf.net/p/opalvoip/opal \
	&& git clone --depth 1 -b "${T38MODEM_VERSION}" https://github.com/hehol/t38modem.git

#download hylafax
cd /usr/src/
wget http://prdownloads.sourceforge.net/hylafax/hylafax-7.0.11.tar.gz?download -O hylafax-7.0.11.tar.gz
tar -xzf hylafax-7.0.11.tar.gz

#install missing fonts
cd /var/lib/ghostscript/fonts
wget https://github.com/peltierco-com/fax-host/raw/refs/heads/main/afm-tar.Z
tar -zxvf afm-tar.Z --strip-components=1

# #install supervisord config
# cd /etc/supervisor/conf.d
# wget https://github.com/peltierco-com/fax-host/raw/refs/heads/main/hylafax-supervisord.conf

# #install hylafax
# cd /usr/src/hylafax-7.0.11
# ./configure -nointeractive && make && make install

#complete setup
#sudo faxsetup
#sudo reboot

