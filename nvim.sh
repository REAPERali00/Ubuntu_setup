#!/bin/bash

# Stop execution on any error
set -e

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

# Install Git
echo "Installing Git..."
sudo apt-get update
sudo apt-get install -y git

# Execute lazyGit.sh if it exists and is executable
if [ -x "./lazyGit.sh" ]; then
	echo "Running lazyGit.sh..."
	./lazyGit.sh
else
	echo "lazyGit.sh not found or not executable. Skipping..."
fi

# Install Ripgrep and fd-find
echo "Installing Ripgrep and fd-find..."
sudo apt-get install -y ripgrep
sudo apt-get install -y fd-find

# Link fd-find to fd if not already linked
if ! command -v fd &>/dev/null; then
	sudo ln -s $(which fdfind) /usr/local/bin/fd
	echo "Linked fdfind to fd"
fi

# Install Neovim
echo "Installing Neovim..."
sudo apt-get install -y neovim

# Clone Neovim configuration
echo "Cloning Neovim configuration..."
if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/REAPERali00/Nvim.git "$HOME/.config/nvim"
else
	echo "Neovim configuration already exists. Updating..."
	(cd "$HOME/.config/nvim" && git pull)
fi
