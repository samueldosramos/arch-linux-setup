#!/bin/bash
#
# Install Gnome and some applications
# Check out https://wiki.archlinux.org/index.php/GNOME for more details

source ./install/utils.sh
keep_sudo_alive

sudo pacman -S gnome-shell gnome-terminal gdm nautilus xdg-user-dirs-gtk

sudo systemctl enable gdm

# Finish
e_success "Finished Gnome installation."