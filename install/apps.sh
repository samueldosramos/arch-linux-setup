#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# KDE apps
yay -Sy ark
yay -Sy dolphin
yay -Sy dolphin-plugins
yay -Sy dosfstools
yay -Sy filelight
yay -Sy gwenview
yay -Sy kaccounts-providers
yay -Sy kcalc
yay -Sy kcolorchooser
yay -Sy kde-gtk-config
yay -Sy kde-l10n-pt_br
yay -Sy kwrite
yay -Sy okular
yay -Sy partitionmanager
yay -Sy spectacle
yay -Sy telepathy-kde-accounts-kcm
yay -Sy xdg-desktop-portal
yay -Sy xdg-desktop-portal-kde

# Fonts
yay -Sy ttf-dejavu
yay -Sy ttf-freefont
yay -Sy ttf-jetbrains-mono
yay -Sy ttf-liberation
yay -Sy ttf-ms-fonts
yay -Sy ttf-ubuntu-font-family

# Browser
yay -Sy google-chrome
yay -Sy chrome-gnome-shell
#yay -Sy firefox
#yay -Sy firefox-i18n-pt-br
yay -Sy firefox-developer-edition
#yay -Sy firefox-developer-edition-i18n-pt-br

# Cloud
yay -Sy dropbox
yay -Sy dropbox-kde-systray-icons

# Developer
yay -Sy code
yay -Sy nodejs
yay -Sy npm
yay -Sy nvm
yay -Sy zeal

# SSH
yay -Sy openssh
sudo systemctl enable sshd
sudo systemctl start sshd

# Multimedia
yay -Sy dragon
yay -Sy elisa
yay -Sy qbittorrent
yay -Sy spotify

# Thumbnails
yay -Sy ffmpegthumbs
yay -Sy gstreamer
yay -Sy gst-plugins
yay -Sy kdegraphics-thumbnailers
yay -Sy kdesdk-thumbnailer

# Social
yay -Sy slack-desktop
yay -Sy telegram-desktop

# Utility
yay -Sy curl
yay -Sy ntfs-3g
yay -Sy p7zip
yay -Sy unrar
yay -Sy unzip
yay -Sy wget
yay -Sy zip

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
