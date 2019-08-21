#!/bin/bash

echo "Adding ppa repositories ........................................."

# Node js
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Ibus bamboo
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y

# Alacritty
sudo add-apt-repository ppa:mmstick76/alacritty -y
