#!/bin/bash
#
# Install Zsh and set as default shell
# Install dotfiles and configure git

source ./install/utils.sh

# Install Zsh:
yay -Sy install zsh

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install some external plugins:
yay -Sy zsh-autosuggestions zsh-completions

# Install plugin fast-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

# Install iconic font for Zsh
# See more: https://nerdfonts.com/
yay -Sy nerd-fonts-jetbrains-mono

# Install Powerlevel10k theme
yay -Sy zsh-theme-powerlevel10k

# Set Zsh as your default shell:
chsh -s /bin/zsh

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".gitignore_global" ".gitignore_global"
replace ".zshrc"            ".zshrc"

# Git configs
e_header "Configure your Git settings: "
nano ${HOME}/.gitconfig

# Finish
e_success "Dotfiles update complete."
