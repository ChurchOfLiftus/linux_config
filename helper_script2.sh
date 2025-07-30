# Run this section in a fish shell
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5
cp Fish/fish/ -r ~/.config/fish/
cp Fish/fish/config.fish ~/.config/fish/config.fish
#perhaps use this
#usermod -s /usr/bin/fish username 
#you will need to
#Replacing in /etc/pam.d/chsh. 
#	auth       required   pam_shells.so   
#with  
#	auth       sufficient   pam_shells.so  
# chsh -s /usr/bin/fish
