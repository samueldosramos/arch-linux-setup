#!/bin/bash
#
# Install linux drivers

source ./install/utils.sh

# Keep-alive: update existing `sudo` time stamp until `.drivers.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Battery drivers
yay -Sy acpi
yay -Sy laptop-mode-tools
sudo systemctl enable laptop-mode.service

# Audio drivers
yay -Sy alsa-utils alsa-firmware alsa-plugins pulseaudio pulseaudio-alsa ffmpeg pulseaudio-bluetooth paprefs celt faac faad2 flac jasper lame libdca libdv libmpeg2 opus speex wavpack x264 x265 gst-libav

# Bluetooth drivers
yay -Sy bluez bluez-utils
sudo modprobe btusb
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Touchpad drivers
yay -Sy libinput

e_success "Finished drivers settings."
