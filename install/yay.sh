#!/bin/bash
#
# Install Yay

source ./install/utils.sh
keep_sudo_alive

# Install required packages before installation
sudo pacman -Sy git go

# Install Yay
if which yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

# Finish
e_success "Finished Yay settings."
