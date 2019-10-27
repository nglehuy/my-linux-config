#!/bin/bash

echo "Add speed ricer repo ...................................?"
read yes
if [[ $yes == y* ]]; then
    # Speed ricer
    sudo add-apt-repository ppa:kgilmer/speed-ricer -y
else
    echo "Not adding repo"
fi

echo "Installing .............................................?"
read yes
if [[ $yes == y* ]]; then
    sudo apt install i3-gaps gnome-flashback gnome-screensaver polybar feh rofi dunst -y
else
    echo "Not installing apps"
fi

echo "Installing i3-gnome ....................................?"
read yes
if [[ $yes == y* ]]; then
    mkdir ~/open-source-apps
    git clone https://github.com/i3-gnome/i3-gnome.git ~/open-source-apps/i3-gnome
    cd ~/open-source-apps/i3-gnome
    sudo make install
else
    echo "Not installing i3-gnome"
fi

echo "Hard linking config files ..............................?"
read yes
if [[ $yes == y* ]]; then
    cd ~/my-linux-config
    mkdir ~/.config/i3
    rm -r ~/.config/i3/*
    ln ./config/i3/config ~/.config/i3/
    mkdir ~/.config/polybar
    rm -r ~/.config/polybar/*
    ln ./config/polybar/* ~/.config/polybar/
    mkdir ~/.config/compton
    rm -r ~/.config/compton/*
    ln ./config/compton/compton.conf ~/.config/compton
    mkdir ~/.config/dunst
    rm -r ~/.config/dunst/*
    ln ./config/dunst/dunstrc ~/.config/dunst/
else
    echo "Not hard linking"
fi
