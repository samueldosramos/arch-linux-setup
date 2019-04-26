#!/bin/bash
#
# Some functions used in install scripts

# Header logging
e_header() {
    printf "\n$(tput setaf 3)%s$(tput sgr0)\n" "$@"
    sleep 4
}

# Success logging
e_success() {
    printf "\n$(tput setaf 2)✓ %s$(tput sgr0)\n" "$@"
    sleep 4
}

# Error logging
e_error() {
    printf "\n$(tput setaf 1)x %s$(tput sgr0)\n" "$@"
    sleep 4
}

# Warning logging
e_warning() {
    printf "\n$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
    sleep 4
}

# Ask for confirmation before proceeding
seek_confirmation() {
    printf "\n"
    e_warning "$@"
    read -p "Continue? (y/n) " -n 1
    printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

# Keep-alive: update existing `sudo` time stamp until `.apps.sh` has finished
keep_sudo_alive() {
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
