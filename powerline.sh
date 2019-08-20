#!/bin/sh
cd ~/
# clone
git clone https://github.com/powerline/fonts.git --depth=1 powerline-fonts
# install
cd powerline-fonts
./install.sh
cd ~/my-linux-config
