#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./install/utils.sh

var="nodejs"
e_header "Verifying that $var is installed..."
if which node &> /dev/null; then
  e_success "$var is installed"
  else
  e_warning "Installing $var..."
  yay -Sy $var npm
fi

# Packages
npm install -g create-react-app
npm install -g create-react-native-app
npm install -g eslint
npm install -g eslint-plugin-mdx
npm install -g gulp-cli
npm install -g npm-check
npm install -g prettier
npm install -g sass
npm install -g typescript

# Finish
e_success "Finished npm packages settings."
