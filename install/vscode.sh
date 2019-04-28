#!/bin/bash
#
# VScode extensions install
# Add or exclude plugins before installation

source ./install/utils.sh

# Check if VSCode is installed
app_is_installed code

# Open and close VSCode to generate VSCode folder
code
sleep 2
killall code-oss

# Move/replace vscode/settings.json to VSCode folder
replace "vscode/settings.json"     "/.config/Code - OSS/User"

# from `code --list-extensions`
modules="
    formulahendry.auto-rename-tag
    coenraads.bracket-pair-colorizer-2
    editorConfig.editorconfig
    dbaeumer.vscode-eslint
    file-icons.file-icons
    ecmel.vscode-html-css
    bradgashler.htmltagwrap
    kisstkondoros.vscode-gutter-preview
    orta.vscode-jest
    zhuangtongfa.material-theme
    esbenp.prettier-vscode
    ms-vscode.vscode-typescript-tslint-plugin
"

for module in $modules; do
  code --install-extension "$module" || true
done

# Finish
e_success "Finished VSCode settings."
