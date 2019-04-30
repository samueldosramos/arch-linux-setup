#!/bin/bash
#
# Install Zsh and set as default shell

source ./install/utils.sh

# Install Zsh:
yay -Sy install zsh

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install some external plugins:
yay -Sy zsh-autosuggestions zsh-completions zsh-syntax-highlighting

# Install iconic font for Zsh
# See more: https://nerdfonts.com/
yay -Sy nerd-fonts-complete

# Install Powerlevel10k theme
yay -Sy zsh-theme-powerlevel10k

# Set Zsh as your default shell:
chsh -s /bin/zsh

# Move/replace .zshrc to /Home
replace ".zshrc"    ".zshrc"

# Warning message
e_warning "Please, after finishing the installation, remember to change the font of your terminal app to your favorite Nerd Font."

# Finish
e_success "Finished Zsh settings."
