#!/bin/bash

# Stop execution on any error
set -e

# Install Tmux
sudo apt-get update
sudo apt-get install -y tmux

# Clone Tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
	echo "tpm already installed."
fi

# Clone Tmux Config repository using HTTPS
if [ ! -d "./Tmux_Config" ]; then
	git clone git@github.com:REAPERali00/Tmux_Config.git
else
	echo "Tmux_Config directory already exists. Updating..."
	(cd Tmux_Config && git pull)
fi

# Copy Tmux configuration
cp ./Tmux_Config/.tmux.conf "$HOME/"
echo "Tmux configuration copied."

# Clean up
rm -rf Tmux_Config

# Inform the user to source the tmux configuration manually
echo "Please start a tmux session and run 'tmux source ~/.tmux.conf' to apply the configuration. To install plugins, use <C-s> + I"
