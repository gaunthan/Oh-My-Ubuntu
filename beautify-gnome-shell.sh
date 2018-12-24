#!/usr/bin/env sh

# Run this script to beautify your gnome shell. New look, new begin!

install_packages()
{
	sudo apt install -y $*
}

# Install gnome-shell config tool
install_packages \
    gnome-shell-extensions
    gnome-tweak-tool

# Enable extensions
echo "Enabling extensions..."
echo "You may need to enable extensions manually."
echo "If did, please run this script again after extension enabled, for configuration."

gnome-shell-extension-tool -e user-theme

# Setup theme and icons
install_packages \
	arc-theme \
	papirus-icon-theme \
	breeze-cursor-theme

# Configure gnome-shell theme and icons
echo "Configuring theme and icons"
gsettings set org.gnome.shell.extensions.user-theme name Arc-Dark
gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.wm.preferences theme Arc-Dark
gsettings set org.gnome.desktop.interface icon-theme Papirus
gsettings set org.gnome.desktop.interface cursor-theme Breeze_Snow

# Restart gnome-shell 
echo "Restarting gnome-shell to flush the configurations..."
echo "You may need to log out to make effect."
gnome-shell -r > /dev/null 2>&1 &