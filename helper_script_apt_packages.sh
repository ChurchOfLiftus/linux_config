#!usr/bin/bash
# Install all relative packages and set a .gitconfig file.
sudo apt update
sudo apt upgrade -y
sudo apt install git -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt install build-essential -y
sudo apt install curl -y
sudo apt install neovim -y
sudo apt install fish -y
sudo apt install tmux -y
sudo cp git/_gitconfig.txt ~/.gitconfig
