# Pull Ubuntu latest.
from docker.io/library/ubuntu:latest 

# RUN all packages needed.
# Standard commands.
RUN apt update
RUN apt upgrade -y 
RUN apt install git -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:neovim-ppa/stable -y
RUN add-apt-repository ppa:fish-shell/release-3
RUN apt install build-essential -y
RUN apt install curl -y
RUN apt install neovim -y
RUN apt install fish -y
RUN apt install tmux -y

# Change our working directory.
WORKDIR /tmp

# git configuration.
ADD /git /tmp/git
RUN cp git/_gitconfig.txt ~/.gitconfig

# Need to do this to configure all files.
RUN mkdir ~/.config/

# TMUX configuration.
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ADD /TMUX /tmp/TMUX
RUN mkdir -p ~/.config/tmux/
RUN cp TMUX/tmux.conf ~/.config/tmux/tmux.conf

# Clone nvim configuration.
RUN mkdir -p ~/.config/nvim/
ADD /dot-config-nvim /tmp/dot-config-nvim
RUN cp dot-config-nvim/init.vim ~/.config/nvim/init.vim
RUN cp dot-config-nvim/after -r ~/.config/nvim/after
RUN cp dot-config-nvim/autoload -r ~/.config/nvim/autoload
RUN cp dot-config-nvim/ftdetect -r ~/.config/nvim/ftdetect 
# This opens nvim and install plugins then closes the windows. 
# Not the best solution but it does work.
RUN ["/bin/nvim", "-c", ":PlugInstall | :UpdateRemotePlugins | :q | :q"]

# Fish configuration.
RUN ["/bin/fish", "-c", "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"]
RUN ["/bin/fish", "-c", "fisher install IlanCosman/tide@v5"]
# Note this dowloads about 3gb of data. I leave this commented out. If you want this please uncomment and wait for it to finish.
# RUN ["/bin/fish", "-c", "fisher install ryanoasis/nerd-fonts"]
RUN ["/bin/fish", "-c", "fisher install catppuccin/fish"]
ADD /fish /tmp/fish
RUN cp fish/fish_variables -r -f ~/.config/fish/fish_variables
RUN cp fish/config.fish ~/.config/fish/config.fish
# Copy the custom functions.
RUN cp fish/functions/ -r ~/.config/fish/

RUN ["/bin/fish", "-c", "mkdir local_files"]

# Change our working directory. Good place to mount to it.
WORKDIR /workdir

entrypoint ["fish"]
