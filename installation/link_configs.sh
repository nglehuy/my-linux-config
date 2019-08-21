#!/bin/bash

echo "Linking alacritty ......................................"
mkdir ~/.config/alacritty
rm -r ~/.config/alacritty/*
ln ../config/alacritty/alacritty.yml ~/.config/alacritty/

echo "Linking neovim ........................................."
mkdir ~/.config/nvim
rm -r ~/.config/nvim/*
ln ../config/nvim/init.vim ~/.config/nvim/

echo "Linking hyper terminal ................................."
rm ~/.hyper.js
ln ../home/.hyper.js ~/

echo "Linking vim config ....................................."
rm ~/.vimrc
ln ../home/.vimrc ~/

echo "Linking zsh config ....................................."
rm ~/.zshrc
ln ../home/.zshrc ~/

echo "Linking colorschemes ..................................."
mkdir ~/.config/colorschemes
rm -r ~/.config/colorschemes/*
ln ../colorschemes/* ~/.config/colorschemes/

echo "Executing pywal colorschemes ..........................."
cd ~/
wal -f ~/.config/colorschemes/gruvbox.json