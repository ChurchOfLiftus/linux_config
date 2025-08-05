# Run this section in a fish shell
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5
fisher install catppuccin/fish
# This takes forever so be patient. Roughly 3GB of data.
 fisher install ryanoasis/nerd-fonts
cp fish/fish_variables -r -f ~/.config/fish/fish_variables
cp fish/config.fish ~/.config/fish/config.fish
#perhaps use this
#usermod -s /usr/bin/fish username 
#you will need to
#Replacing in /etc/pam.d/chsh. 
#	auth       required   pam_shells.so   
#with  
#	auth       sufficient   pam_shells.so  
# chsh -s /usr/bin/fish
