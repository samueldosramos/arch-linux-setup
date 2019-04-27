#!/bin/bash
#
# Main install script

DOTFILES_DIRECTORY="$PWD"

source ./install/utils.sh

replace() {
    # Force move/replace files.
    mv -f "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

replacefiles() {
    # Move/replace setting files to /Home
    replace ".bash_profile"     ".bash_profile"
    replace ".gitconfig"        ".gitconfig"
    replace ".gitignore_global" ".gitignore_global"

    e_success "Dotfiles update complete!"
}

# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles and git configs."
if is_confirmed; then
    replacefiles
    source ${HOME}/.bash_profile
else
    e_warning "Skipped dotfiles settings."
fi

# Git configs
e_header "Configure your Git settings: "
nano ${HOME}/.gitconfig
e_success "Git settings updated!"

# Install light Gnome
e_header "Installing Gnome..."
bash ./install/gnome.sh

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
    replace ".zshrc"    ".zshrc"
    e_warning "Please, after finishing the installation, remember to change the font of your terminal app to your favorite Nerd Font."
else
    e_warning "Skipped Zsh settings update."
fi

# VSCode Settings
seek_confirmation "Warning: This step may modify your VSCode configs."
if is_confirmed; then
    app_is_installed code
    code
    sleep 2
    killall code-oss

    replace "vscode/settings.json"     "/.config/Code - OSS/User"
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

# Remove the installation zip and folder
e_header "Removing unnecessary files"
rm -rf ${HOME}/dotfiles.tar.gz
rm -rf ${HOME}/dotfiles.zip
cd ${HOME}
rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
