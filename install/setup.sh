#!/bin/bash
#
# Main install script

source ./install/utils.sh

# Dotfiles configs
seek_confirmation "Warning: This step may overwrite your existing dotfiles and git configs."
if is_confirmed; then
    bash ./install/dotfiles.sh
else
    e_warning "Skipped dotfiles settings."
fi

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

# Install Zsh
seek_confirmation "Warning: This step install Zsh, Hack Nerd Font and some plugins."
if is_confirmed; then
    bash ./install/zsh.sh
else
    e_warning "Skipped Zsh settings update."
fi

# VSCode settings
seek_confirmation "Warning: This step may modify your VSCode configs."
if is_confirmed; then
    bash ./install/vscode.sh
else
    e_warning "Skipped VSCode settings update."
fi

# Install npm packages
seek_confirmation "Warning: This step install npm packages"
if is_confirmed; then
    bash ./install/npm.sh
else
    e_warning "Skipped npm settings update."
fi

# Create a directory for projects and development
e_header "Creating Projects directory in Home"
mkdir ${HOME}/Developer

# Clean up cached downloads
e_header "Clearing the cache..."
sudo pacman -Scc
sudo pacman -Qdtq | sudo pacman -Rs -
sudo rm -Rv /tmp/
sudo yay -Scc
sudo yay -Qtd

# Remove the installation zip and folder
e_header "Removing unnecessary files"
rm -rf ${HOME}/dotfiles.tar.gz
rm -rf ${HOME}/dotfiles.zip
rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
