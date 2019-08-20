#!/bin/sh

mkdir ~/.npm-global

npm config set prefix '~/.npm-global'

npm install -g spaceship-prompt react react-cli react-native react-native-cli create-react-app

rm ~/.zshrc
