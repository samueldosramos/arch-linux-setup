#!/bin/bash
#
# Install Yay

source ./install/utils.sh
keep_sudo_alive

# Check and nstall required packages before installation
app_is_installed git
app_is_installed go

# Install Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Finish
e_success "Finished Yay settings."
