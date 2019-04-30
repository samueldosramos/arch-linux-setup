#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh
keep_sudo_alive

# Gnome apps
yay -Sy eog evince file-roller gedit gedit-plugins gnome-backgrounds gnome-calculator gnome-calendar gnome-control-center gnome-disk-utility gnome-music gnome-photos gnome-screenshot gnome-shell-extensions gnome-video-effects gvfs sushi totem gnome-tweaks gnome-usage seahorse

# Themes
yay -Sy adapta-gtk-theme
yay -Sy suru-plus-pack-git
yay -Sy yaru-icon-theme yaru-gtk-theme yaru-gnome-shell-theme

# Extensions
yay -Sy gnome-shell-extension-topicons-plus
yay -Sy gnome-shell-extension-timepp-git

# Fonts
yay -Sy ttf-dejavu ttf-freefont ttf-liberation ttf-ms-fonts ttf-ubuntu-font-family ttf-fira-code

# Browser
yay -Sy install google-chrome
#yay -Sy firefox firefox-i18n-pt-br

# Cloud
yay -Sy install dropbox nautilus-dropbox

# Developer
yay -Sy nodejs npm
yay -Sy nvm
yay -Sy code
yay -Sy tilix
yay -Sy zeal
yay -Sy openssh
sudo systemctl enable sshd
sudo systemctl start sshd

# Multimedia
yay -Sy qbittorrent
yay -Sy spotify

# Productivity
yay -Sy geary
#yay -Sy mailspring
yay -Sy notion-app
yay -Sy ao
yay -Sy p3x-onenote
yay -Sy wps-office ttf-wps-fonts wps-office-mui-pt-br wps-office-extension-portuguese-brazilian-dictionary

# Social
yay -Sy franz

# Utility
yay -Sy unzip unrar p7zip zip
yay -Sy wget curl
yay -Sy ntfs-3g

# Performance
yay -Sy preload
sudo systemctl enable preload
sudo systemctl start preload

# Security
yay -Sy gufw
sudo ufw enable
sudo systemctl enable ufw

# Finish
e_success "Finished applications installation."