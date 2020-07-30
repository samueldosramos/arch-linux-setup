#!/bin/bash
#
# Install drivers

source ./install/utils.sh

# Battery drivers
yay -Sy acpi
yay -Sy laptop-mode-tools
sudo systemctl enable laptop-mode.service

# Multimedia codecs
yay -Sy --noconfirm pulseaudio pulseaudio-alsa a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore x265 ffmpeg

# Bluetooth drivers
yay -Sy bluez
yay -Sy bluez-utils
sudo modprobe btusb
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Finish
e_success "Finished drivers settings."
