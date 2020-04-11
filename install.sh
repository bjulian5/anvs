#!/bin/bash

# Install nvm to manage node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

if [[ -d ~/.anvs ]]
then
    cd ~ && rm -rf .anvs
    mkdir .anvs && cd .anvs
    git clone git@github.com:bjulian5/anvs.git .
    echo "source ~/.anvs/anvs.sh" >> ~/.bash_profile
else
    cd ~ && rm -rf .anvs
    mkdir .anvs && cd .anvs
    git clone git@github.com:bjulian5/anvs.git .
fi

source ~/.bash_profile

nvm install 8.15.1
nvm alias default 8.15.1

echo "You can set a new default version by running: nvm alias default NODE_VERSION"



