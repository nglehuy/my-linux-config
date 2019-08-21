#!/bin/bash

echo "Installing apps ..........................................................."
sudo apt install nodejs \
    ibus-hangul \
    ibus-bamboo \
    vim \
    curl \
    git \
    build-essential \
    alacritty \
    default-jdk \
    default-jre \
    python-pip \
    python3-pip \
    zsh \
    ubuntu-restricted-extras \
    libsqlite3-dev \
    pkg-config \
    libnotify-dev \
    -y

echo "Installing Linuxbrew ......................................................"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

echo "Installing neovim ........................................................."
brew install neovim
sudo -H pip3 install neovim virtualenv virtualenvwrapper
sudo -H pip install neovim

echo "Installing pywal for colorscheme .........................................."
sudo -H pip3 install pywal

echo "Installing nodejs modules ................................................."
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
npm install -g spaceship-prompt react react-cli react-native react-native-cli create-react-app

echo "Cloning open souce apps ..................................................."
mkdir ~/open-source-apps

# Onedrive
echo "Setting up onedrive ......................................................."
curl -fsS https://dlang.org/install.sh | bash -s dmd
source ~/dlang/dmd-2.081.1/activate
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
git clone https://github.com/abraunegg/onedrive.git ~/open-source-apps/onedrive-installation
cd ~/open-source-apps/onedrive-installation
./configure
make clean; make;
sudo make install

# Powerline fonts
echo "Setting up powerline fonts ................................................"
git clone https://github.com/powerline/fonts.git --depth=1 ~/open-source-apps/powerline-fonts
cd ~/open-source-apps/powerline-fonts
./install.sh

# Vim Plugin Managers
echo "Installing vim plugin managers ............................................"
cd ~/
# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Zsh Plugins
echo "Installing zsh plugins ...................................................."
cd ~/
# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# Zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
