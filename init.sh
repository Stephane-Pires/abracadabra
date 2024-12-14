#!/bin/bash

# install.sh - A script to install Homebrew on macOS or Linux.

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to install Homebrew
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Download Personal Brewfile from URL
    echo "Downloading Personal Brewfile..."
    curl -fsSL https://raw.githubusercontent.com/Stephane-Pires/abracadabra/refs/heads/main/Brewfile -o ~/Brewfile

## Add Homebrew to PATH
    echo "Adding Homebrew to PATH..."
    echo >> $HOME/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

## Install Brewfile
    echo "Installing Brewfile..."
    brew bundle install

