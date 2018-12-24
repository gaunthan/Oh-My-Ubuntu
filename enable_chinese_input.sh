#!/usr/bin/env sh

# Run this script to enable fcitx chinese input.

# Install fcitx and rime
sudo apt install fcitx fcitx-rime -y

# Choosing fcitx as input method
im-config -n fcitx
fcitx-autostart

# Configure rime
sed -i '7s/luna_pinyin/luna_pinyin_simp/' ~/.config/fcitx/rime/default.yaml
sed -i '9s/luna_pinyin_simp/luna_pinyin/' ~/.config/fcitx/rime/default.yaml

echo "Now you can run fcitx-configtool to add rime manully."
echo "After that, please log out to make effect."