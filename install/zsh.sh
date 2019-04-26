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

# Install Powerlevel9k theme
yay -Sy zsh-theme-powerlevel9k

# Set Zsh as your default shell:
chsh -s /bin/zsh

# Finish
e_success "Finished Zsh settings."
