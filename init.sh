#!/bin/bash

## TODO : Write the command that download and execute this script

# install.sh - A script to install Homebrew on macOS or Linux.

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to install Homebrew
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Download Personal Brewfile from URL
    echo "Downloading Personal Brewfile..."
    # curl -fsSL https://raw.githubusercontent.com/username/dotfiles/main/Brewfile -o ~/Brewfile

## Install Brewfile
    echo "Installing Brewfile..."
    brew bundle install

