#!/usr/bin/env sh

# Run this script to enable fcitx chinese input.


FCITX_SKIN_CONFIG_FILE="~/.config/fcitx/conf/fcitx-classic-ui.config"
FCITX_CONFIG_FILE="~/.config/fcitx/rime/default.yaml"
FCITX_RIME_SIMP_CONFIG_FILE="~/.config/fcitx/rime/luna_pinyin_simp.schema.yaml"

# Install fcitx and rime
sudo apt install fcitx fcitx-rime -y

# Choosing fcitx as input method
im-config -n fcitx
ln -sf /usr/share/applications/fcitx.desktop ~/.config/autostart/fcitx.desktop

read -p "Please run fcitx-configtool to add rime manully. Added [y/n] ?" answer
if [ ! "$answer" = "y" ]; then
    exit
fi

# Change fcitx's skin to material
if [ -e $FCITX_SKIN_CONFIG_FILE ]; then
    curl -sLf https://raw.githubusercontent.com/gaunthan/fcitx-skin-collection/master/install-fcitx-skins.sh | bash
    SkinType=material
    sed -i 's/SkinType=.*/SkinType='"$SkinType"'/' $FCITX_SKIN_CONFIG_FILE
fi

# Configure rime
# 
echo "Configuring chinese input method 'rime'..."

# Set default simple chinese input
if [ -e $FCITX_CONFIG_FILE ]; then
    sed -i '7s/luna_pinyin/luna_pinyin_simp/' $FCITX_CONFIG_FILE
    sed -i '9s/luna_pinyin_simp/luna_pinyin/' $FCITX_CONFIG_FILE
fi

# Set default English status for input method
if [ -e $FCITX_RIME_SIMP_CONFIG_FILE ]; then
    sed -i '15s/0/1/' $FCITX_RIME_SIMP_CONFIG_FILE
fi