#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./install/utils.sh

if which nodejs &> /dev/null; then
  yay -Sy nodejs npm
fi

# Packages
npm install -g create-react-app
npm install -g create-react-native-app
npm install -g eslint
npm install -g gulp-cli
npm install -g sass
npm install -g typescript
npm install -g tslint

#Finish
e_success "Finished the npm packages installation"
