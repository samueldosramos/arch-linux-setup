#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# Gnome apps
yay -Sy eog evince file-roller gedit gedit-plugins gnome-backgrounds gnome-calculator gnome-calendar gnome-control-center gnome-disk-utility gnome-photos gnome-screenshot gnome-shell-extensions gnome-video-effects gvfs sushi totem gnome-tweaks gnome-usage seahorse

# Themes
yay -Sy adapta-gtk-theme
yay -Sy paper-icon-theme-git
yay -Sy breeze-adapta-cursor-theme-git
yay -Sy xcursor-breeze
yay -Sy suru-plus-pack-git
yay -Sy yaru-icon-theme yaru-gtk-theme yaru-gnome-shell-theme

# Fonts
yay -Sy ttf-dejavu ttf-freefont ttf-liberation ttf-ms-fonts ttf-ubuntu-font-family ttf-jetbrains-mono

# Browser
yay -Sy install google-chrome chrome-gnome-shell
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
yay -Sy lollypop

# Social
yay -Sy slack-desktop
yay -Sy telegram-desktop

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
