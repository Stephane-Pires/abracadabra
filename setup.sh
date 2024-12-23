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


## Source the env
    echo "Sourcing the Zsh..."
    source ~/.zprofile


## Install Brewfile
    echo "Installing Brewfile..."
    brew bundle install

## Run Ansible 
    echo "Running Ansible..."
    ansible-pull -U https://github.com/Stephane-Pires/abracadabra.git -C main ansible/site.yml --vault-password-file ~/.vault_pass.txt

