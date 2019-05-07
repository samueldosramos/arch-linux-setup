#!/bin/bash
#
# Set personal settings
# See schemas in /usr/share/glib-2.0/schemas
# See https://github.com/GNOME/gsettings-desktop-schemas
# See https://blog.gtk.org/2017/05/01/first-steps-with-gsettings/

# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adapta-Eta'

# Icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Paper'

# Shell theme
gsettings set org.gnome.shell.extensions.user-theme 'Adapta-Nokto-Eta'

# Shell theme
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze'

# Default terminal
gsettings set org.gnome.desktop.default-applications.terminal exec "tilix"

# Default calendar
gsettings set org.gnome.desktop.default-applications.office.calendar exec gnome-calendar

# Mouse
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# Touchpad
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click  true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
