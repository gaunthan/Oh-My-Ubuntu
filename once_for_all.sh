#!/usr/bin/env sh

# Run this script for calling all the other scripts

# Install curl for running there scripts online.
sudo apt install curl -y

# Run all the scripts, respectively.
curl -sLf https://raw.githubusercontent.com/gaunthan/Oh-My-Ubuntu/master/setup_system.sh | bash
curl -sLf https://raw.githubusercontent.com/gaunthan/Oh-My-Ubuntu/master/enable_chinese_input.sh | bash
curl -sLf https://raw.githubusercontent.com/gaunthan/Oh-My-Ubuntu/master/beautify_gnome_shell.sh | bash
