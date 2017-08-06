#!/bin/bash
mkdir ~/.config
mkdir ~/.config/nvim
ln -s -f ~/.init.vim ~/.config/nvim/init.vim

# Plugins manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# NEED PIP3
pip3 install --user neovim jedi mistune psutil setproctitle

# NEED NPM
## React Lint
sudo npm install -g eslint
sudo npm install -g babel-eslint
sudo npm install -g eslint-plugin-react
sudo npm install -g react-tools
sudo npm install -g syntastic-react
