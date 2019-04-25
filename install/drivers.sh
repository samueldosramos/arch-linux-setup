#!/bin/bash
#
# Install linux drivers

source ./install/utils.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Battery drivers
pacman -Sy acpi
pacman -Sy laptop-mode-tools
sudo systemctl enable laptop-mode.service

# Audio drivers
sudo pacman -Sy alsa-utils alsa-firmware alsa-plugins
sudo pacman -Sy pulseaudio pulseaudio-alsa ffmpeg pulseaudio-bluetooth paprefs
sudo pacman -Sy celt faac faad2 flac jasper lame libdca libdv libmpeg2 opus speex wavpack x264 x265 gst-libav

# Bluetooth drivers
sudo pacman -Sy bluez bluez-utils
sudo modprobe btusb
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Touchpad drivers
pacman -Sy libinput
