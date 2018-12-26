#!/usr/bin/env sh

# Run this script to beautify your gnome shell. New look, new begin!

install_packages()
{
	sudo apt install -y $*
}

# Install gnome-shell config tool
install_packages \
    gnome-shell-extensions \
    gnome-tweak-tool

# Enable extensions
echo "Enabling extensions..."
echo "You may need to enable extensions manually."
echo "If did, please run this script again after extension enabled, for configuration."

gnome-shell-extension-tool -e user-theme
gnome-shell-extension-tool -e dash-to-dock

# Install and enable transparent topbar
sudo apt install curl -y
curl -sLf https://raw.githubusercontent.com/gaunthan/awesome-fedora-hacking/master/dynamic-panel-transparency.sh | bash

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

# Configure dash to dock
# Replace 'set' to 'reset' to restore to default if needed.
echo "Configuring gnome-shell-extension-dash-to-dock..."
#gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize-or-overview
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action cycle-windows
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

# Configure wallpapers
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/Spices_in_Athens_by_Makis_Chourdakis.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/On_top_of_the_Rubihorn_by_Matthias_Niess.jpg'

# Restart gnome-shell 
echo "Restarting gnome-shell to flush the configurations..."
echo "You may need to log out to make effective."
gnome-shell -r > /dev/null 2>&1 &
