#!/bin/bash
#
# Arch with Gnome setup script
# Font: https://github.com/samuelramox/gnome-setup
# Main install script

source ./install/utils.sh

# Install Yay
e_header "Installing Yay..."
bash ./install/yay.sh

# Install drivers
seek_confirmation "Warning: This step install Linux drivers."
if is_confirmed; then
  bash ./install/drivers.sh
else
  e_warning "Skipped drivers settings update."
fi

# Install applications
seek_confirmation "Warning: This step install applications."
if is_confirmed; then
  e_header "Please, configure you applications before installation:"
  nano ${DOTFILES_DIRECTORY}/install/apps.sh
  bash ./install/apps.sh
else
  e_warning "Skipped applications install."
fi

# Dotfiles configs
seek_confirmation "Warning: This step may overwrite your existing dotfiles and git configs."
if is_confirmed; then
  bash ./install/dotfiles.sh
else
  e_warning "Skipped dotfiles settings."
fi

# Install Gnome preferences
seek_confirmation "Warning: This step install Gnome preferences"
if is_confirmed; then
  bash ./install/preferences.sh
else
  e_warning "Skipped preferences update."
fi

# Install npm packages
seek_confirmation "Warning: This step install npm packages"
if is_confirmed; then
  bash ./install/npm.sh
else
  e_warning "Skipped npm settings update."
fi

# Generate SSH
seek_confirmation "Warning: This step generate SSH."
if is_confirmed; then
  bash ./install/ssh.sh
else
  e_warning "Skipped SSH settings."
fi

# Create a directory for projects and development
e_header "Creating Developer directory in Home"
mkdir ${HOME}/Developer

# Cleanup cached downloads and remove the installation zip and folder
e_header "Removing unnecessary files"
sudo pacman -Scc
sudo pacman -Qdtq | sudo pacman -Rs -
sudo rm -Rv /tmp/
sudo yay -Scc
sudo yay -Qtd
rm -rf ${HOME}/dotfiles.tar.gz
rm -rf ${HOME}/dotfiles.zip
rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
