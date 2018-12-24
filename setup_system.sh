#!/usr/bin/env sh

# Run this script firstly after you installed Ubuntu on your machine.

# REMOVE UNUSED PACKAGES
#
# Remove useless packages
sudo apt remove libreoffice* thunderbird remmina -y
# Remove games
sudo apt remove gnome-sudoku gnome-mahjongg gnome-mines aisleriot -y

# INSTALL ESSENTIAL PACKAGES
#
# Install openssh server to enable remote login
sudo apt install openssh-server -y
# Install network tools to check out IP
sudo apt install net-tools -y
ifconfig
echo "Now You can use ssh '$USER@ip_of_this_host' to login this host"

# UPDATE AND REBOOT SYSTEM
#
sudo apt update
sudo apt upgrade -y
echo "Rebooting system to make effect..."
sudo reboot