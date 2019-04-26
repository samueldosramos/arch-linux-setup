#!/bin/bash
#
# Install Yay

source ./install/utils.sh

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
