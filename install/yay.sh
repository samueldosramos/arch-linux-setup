#!/bin/bash
#
# Install Yay
# See https://github.com/Jguer/yay

source ./install/utils.sh

# Install required packages before installation
sudo pacman -S git
sudo pacman -S go

# Install Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Finish
e_success "Finished Yay install."
