#!/bin/bash
#
# Install Gnome and some applications
# Check out https://wiki.archlinux.org/index.php/GNOME for more details

source ./install/utils.sh

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo pacman -S gnome-shell gnome-terminal gdm nautilus xdg-user-dirs-gtk

sudo systemctl enable gdm

# Finish
e_success "Finished Gnome installation."