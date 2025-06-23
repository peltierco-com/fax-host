#!/bin/bash
#update
apt update
apt upgrade -y

#install packages
apt install -y \
    build-essential 

#set hostname
hostnamectl set-hostname "fax" --static

#reboot
systemctl reboot