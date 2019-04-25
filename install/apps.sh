#!/bin/bash
#
# Install Yay and applications
# Check out https://github.com/Jguer/yay for more details
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install required packages before installation
pacman -Sy git go

# Install Yay
e_header "Installing Yay for you."
if which yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

# Install applications
e_header "Installing applications..."

# Gnome apps
yay -Sy eog
yay -Sy evince
yay -Sy file-roller
yay -Sy gedit
yay -Sy gedit-plugins
yay -Sy gnome-backgrounds
yay -Sy gnome-books
yay -Sy gnome-calculator
yay -Sy gnome-calendar
yay -Sy gnome-control-center
yay -Sy gnome-dictionary
yay -Sy gnome-disk-utility
yay -Sy gnome-music
yay -Sy gnome-photos
yay -Sy gnome-screenshot
yay -Sy gnome-shell-extensions
yay -Sy gnome-system-monitor
yay -Sy gnome-video-effects
yay -Sy gvfs
yay -Sy sushi
yay -Sy totem
yay -Sy gnome-tweaks
yay -Sy gnome-usage
yay -Sy gtranslator
yay -Sy gnome-podcasts
yay -Sy feedreader
yay -Sy adwaita-qt5
yay -Sy seahorse

# Themes
yay -Sy adapta-gtk-theme
yay -Sy materia-gtk-theme
yay -Sy suru-icon-theme-git
yay -Sy suru-plus-pack-git

# Extensions
yay -Sy gnome-shell-extension-topicons-plus
yay -Sy gnome-shell-extension-timepp-git

# Fonts
pacman -Sy ttf-dejavu
pacman -Sy ttf-freefont
pacman -Sy ttf-liberation
pacman -Sy ttf-ms-fonts
pacman -Sy ttf-ubuntu-font-family
pacman -Sy ttf-fira-code

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

# Finished this step
sleep 1
e_success "Success! Yay and applications are installed."

# Cleans up cached downloads
e_header "Clearing the cache..."
pacman -Scc
pacman -Qdtq | sudo pacman -Rs -
rm -Rv /tmp/
yay -Scc
yay -Qtd

#Finish
e_success "Finished the applications installation"