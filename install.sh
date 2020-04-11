#!/bin/bash

# Install nvm to manage node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

cd ~ && rm -rf .anvs
mkdir .anvs && cd .anvs
git clone git@github.com:bjulian5/anvs.git .

ALREADY_SOURCED=$(cat ~/.bash_profile | grep -o 'source ~/.anvs/anvs.sh')

if [[ -z "$ALREADY_SOURCED" ]]; then
  echo "Adding to ~/bash_profile"
  echo "source ~/.anvs/anvs.sh" >> ~/.bash_profile
fi

source ~/.bash_profile

nvm install 8.15.1
nvm alias default 8.15.1

echo "You can set a new default version by running: nvm alias default NODE_VERSION"



