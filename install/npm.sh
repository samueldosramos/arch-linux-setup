#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./install/utils.sh

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if which nodejs &> /dev/null; then
  yay -Sy nodejs npm
fi

# Packages
sudo npm install -g create-react-app
sudo npm install -g create-react-native-app
sudo npm install -g eslint
sudo npm install -g gulp-cli
sudo npm install -g sass
sudo npm install -g typescript
sudo npm install -g tslint

# Finish
e_success "Finished npm packages settings."
