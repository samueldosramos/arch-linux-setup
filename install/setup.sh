#!/bin/bash
#
# Main install script

DOTFILES_DIRECTORY="$PWD"
DOTFILES_PATH="${HOME}"

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
seek_confirmation "Warning: This step may overwrite your existing dotfiles."
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

# Install drivers
seek_confirmation "Warning: This step install Linux drivers."
if is_confirmed; then
    e_header "Please, configure you drivers before installation."
    nano ${DOTFILES_DIRECTORY}/install/drivers.sh
    bash ./install/drivers.sh
    e_success "Drivers are installed!"
else
    e_warning "Skipped drivers settings update."
fi

# Install Yay and apps
seek_confirmation "Warning: This step install Yay and applications."
if is_confirmed; then
    e_header "Please, configure you applications before installation."
    nano ${DOTFILES_DIRECTORY}/install/apps.sh
    bash ./install/apps.sh
    e_success "Yay and applications are installed!"
else
    e_warning "Skipped Yay settings update."
fi

# Install Zsh and ask before potentially overwriting overwriting files
seek_confirmation "Warning: This step install Zsh, Hack Nerd Font and some plugins."
if is_confirmed; then
    e_header "Please, if necessary, configure before installation."
    nano ${DOTFILES_DIRECTORY}/install/zsh.sh
    bash ./install/zsh.sh
    replace ".zshrc"    ".zshrc"
    e_success "Zsh and plugins are installed!"
    e_warning "Please, after finishing the installation, remember to change the font of your terminal app to your favorite Nerd Font."
else
    e_warning "Skipped Zsh settings update."
fi

# Ask before potentially overwriting VSCode
seek_confirmation "Warning: This step may modify your VSCode configs."
if is_confirmed; then
    if which code &> /dev/null; then
    yay -Sy code
    fi

    code
    sleep 2
    kill -9 $(pgrep Electron)

    replace "/vscode/settings.json"     "/home/samuel/.config/Code\ -\ OSS/User/settings.json"
    replace "/vscode/keybindings.json"  "/home/samuel/.config/Code\ -\ OSS/User/keybindings.json"
    e_header "Please, configure you plugins before installation."
    nano ${DOTFILES_DIRECTORY}/install/vscode.sh
    bash ./install/vscode.sh
    e_success "VSCode settings updated!"
else
    e_warning "Skipped VSCode settings update."
fi

# Install npm packages
seek_confirmation "Warning: This step install npm packages"
if is_confirmed; then
    e_header "Please, configure your npm packages before installation."
    nano ${DOTFILES_DIRECTORY}/install/npm.sh
    bash ./install/npm.sh
    e_success "npm packages are installed!"
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
rm -rf ${DOTFILES_DIRECTORY}

e_success "Reboot and enjoy!"
