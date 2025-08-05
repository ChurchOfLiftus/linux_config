#!usr/bin/fish
# Clone nvim configeration.
mkdir -p ~/.config/nvim/
cp dot-config-nvim/init.vim ~/.config/nvim/init.vim
cp dot-config-nvim/after -r ~/.config/nvim/after
cp dot-config-nvim/autoload -r ~/.config/nvim/autoload
cp dot-config-nvim/ftdetect -r ~/.config/nvim/ftdetect 
# After running this script Open nvim and run the following commands
#:PlugInstall
#:UpdateRemotePlugins
# Then exit nvim
