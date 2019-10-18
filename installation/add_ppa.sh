#!/bin/bash

echo "Adding ppa repositories ........................................."
read yes
if [[ $yes == y* ]]; then
    # Node js
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    
    # Ibus bamboo
    sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
else
    echo "Not adding ppas"
fi
