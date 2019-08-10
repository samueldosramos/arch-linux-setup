#!/bin/bash
#
# Install Yay

source ./install/utils.sh
keep_sudo_alive

# Install required packages before installation
sudo pacman -S git
sudo pacman -S go

# Install Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Finish
e_success "Finished Yay install."
