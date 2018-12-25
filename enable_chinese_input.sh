#!/usr/bin/env sh

# Run this script to enable fcitx chinese input.

# Install fcitx and rime
sudo apt install fcitx fcitx-rime -y

# Choosing fcitx as input method
im-config -n fcitx
fcitx-autostart

# Change fcitx's skin to material
curl -sLf https://raw.githubusercontent.com/gaunthan/fcitx-skin-collection/master/install-fcitx-skins.sh | bash
SkinType=material
sed -i 's/SkinType=.*/SkinType='"$SkinType"'/' conf/fcitx-classic-ui.config


# Configure rime
# 
echo "Configuring chinese input method 'rime'..."

# Set default simple chinese input
sed -i '7s/luna_pinyin/luna_pinyin_simp/' ~/.config/fcitx/rime/default.yaml
sed -i '9s/luna_pinyin_simp/luna_pinyin/' ~/.config/fcitx/rime/default.yaml

# Set default English status for input method
sed -i '15s/0/1/' luna_pinyin_simp.schema.yaml

echo "Now you can run fcitx-configtool to add rime manully."
echo "After that, please log out to make effect."
