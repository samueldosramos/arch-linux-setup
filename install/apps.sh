#!/bin/bash
#
# Install applications
# Check out https://github.com/Jguer/yay for more details
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Gnome apps
yay -Sy eog evince file-roller gedit gedit-plugins gnome-backgrounds gnome-books gnome-calculator gnome-calendar gnome-control-center gnome-dictionary gnome-disk-utility gnome-music gnome-photos gnome-screenshot gnome-shell-extensions gnome-system-monitor gnome-video-effects gvfs sushi totem gnome-tweaks gnome-usage gtranslator gnome-podcasts feedreader adwaita-qt5 seahorse

# Themes
yay -Sy adapta-gtk-theme
yay -Sy materia-gtk-theme
yay -Sy suru-icon-theme-git
yay -Sy suru-plus-pack-git

# Extensions
yay -Sy gnome-shell-extension-topicons-plus
yay -Sy gnome-shell-extension-timepp-git

# Fonts
yay -Sy ttf-dejavu ttf-freefont ttf-liberation ttf-ms-fonts ttf-ubuntu-font-family ttf-fira-code

# Browser
yay -Sy install google-chrome
#yay -Sy firefox firefox-i18n-pt-br

# Cloud
yay -Sy install dropbox

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
yay -Sy vlc
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

# Cleans up cached downloads
e_header "Clearing the cache..."
pacman -Scc
pacman -Qdtq | sudo pacman -Rs -
rm -Rv /tmp/
yay -Scc
yay -Qtd

#Finish
e_success "Finished applications installation."