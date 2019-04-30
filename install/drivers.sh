#!/bin/bash
#
# Install drivers

source ./install/utils.sh
keep_sudo_alive

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

# Finish
e_success "Finished drivers settings."
