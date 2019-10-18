#!/bin/bash

echo "Installing apps ...........................................................?"
read yes
if [[ $yes == y* ]]; then
    sudo apt install nodejs \
        ibus-hangul \
        ibus-bamboo \
        vim \
        build-essential \
        default-jdk \
        default-jre \
        python-pip \
        python3-pip \
        zsh \
        ttf-mscorefonts-installer \
        libavcodec-extra \
        unrar \
        libsqlite3-dev \
        pkg-config \
        libnotify-dev \
        fonts-noto \
        fonts-roboto \
        fonts-font-awesome \
        vlc \
        inotify-tools \
        neofetch \
        papirus-icon-theme \
	arc-theme \
        materia-gtk-theme \
        gnome-tweak-tool \
        breeze-cursor-theme \
        compton \
        dconf-editor \
        libcurl4-openssl-dev \
        -y
else
    echo "Not installing apps"
fi

echo "Installing Linuxbrew ......................................................?"
read yes
if [[ $yes == y* ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
else
    echo "Not installing Linuxbrew"
fi

echo "Installing neovim .........................................................?"
read yes
if [[ $yes == y* ]]; then
    brew install neovim
    sudo -H pip3 install neovim virtualenv virtualenvwrapper
    sudo -H pip install neovim
else
    echo "Not installing neovim"
fi

echo "Installing pywal for colorscheme ..........................................?"
read yes
if [[ $yes == y* ]]; then
    sudo -H pip3 install pywal
else
    echo "Not installing pywal"
fi

echo "Installing nodejs modules .................................................?"
read yes
if [[ $yes == y* ]]; then
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    export PATH=~/.npm-global/bin:$PATH
    npm install -g spaceship-prompt react react-cli react-native react-native-cli create-react-app
else
    echo "Not installing nodejs modules"
fi

echo "Cloning open souce apps ...................................................?"
read yes
if [[ $yes == y* ]]; then
    mkdir ~/open-source-apps
    # Powerline fonts
    echo "Setting up powerline fonts ................................................?"
    git clone https://github.com/powerline/fonts.git --depth=1 ~/open-source-apps/powerline-fonts
    cd ~/open-source-apps/powerline-fonts
    ./install.sh
else
    echo "Not cloning open source apps"
fi

# Vim Plugin Managers
echo "Installing vim plugin managers ............................................?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    # Vim Plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # Pathogen
    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
    echo "Not installing vim plugins"
fi

# Zsh Plugins
echo "Installing zsh plugins ....................................................?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    # Oh my zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # Zsh autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    # Zsh syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
else
    echo "Not installing zsh plugins"
fi
